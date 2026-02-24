# syntax=docker/dockerfile:1

#######################
# Stage 1: Builder
#######################
FROM --platform=$BUILDPLATFORM debian:bullseye AS builder

ENV DEBIAN_FRONTEND=noninteractive

# 1. Install cross-compile Toolchains
RUN apt-get update && apt-get install -y \
    curl build-essential libtool autotools-dev automake pkg-config \
    bsdmainutils python3 git binutils-gold cmake \
    g++-aarch64-linux-gnu binutils-aarch64-linux-gnu \
    && rm -rf /var/lib/apt/lists/*

#######################
# Build GoByte
#######################
WORKDIR /src
COPY . .

# 2. DEFINE THE TARGET ARCHITECTURE
# Docker Buildx provides these variables automatically
ARG TARGETPLATFORM
ARG BUILDPLATFORM

# 3. BUILD THE DEPENDS
# Logic to map Docker platforms to your project's HOST triplets
RUN case "${TARGETPLATFORM}" in \
    "linux/amd64") \
    T_HOST=x86_64-pc-linux-gnu \
    T_STRIP=strip ;; \
    "linux/arm64") \
    T_HOST=aarch64-linux-gnu \
    T_STRIP=aarch64-linux-gnu-strip ;; \
    *) \
    echo "Unsupported platform: ${TARGETPLATFORM}"; exit 1 ;; \
    esac && \
    # Build the depends SDK
    cd depends && make HOST=$T_HOST NO_QT=1 -j$(nproc) && cd .. && \
    # Configure & Build the binaries
    ./autogen.sh && \
    CONFIG_SITE=`pwd`/depends/$T_HOST/share/config.site ./configure \
    --prefix=`pwd`/depends/$T_HOST \
    --disable-tests \
    --disable-bench \
    --disable-man \
    --without-gui \
    --with-daemon && \
    make -j$(nproc) && \
    # Move binaries to a fixed location for Stage 2
    mkdir -p /src/out && \
    cp src/gobyted src/gobyte-cli src/gobyte-tx /src/out/ && \
    # Use the architecture-specific strip tool
    $T_STRIP /src/out/gobyted /src/out/gobyte-cli /src/out/gobyte-tx

#######################
# Stage 2: Runtime
#######################
FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

#1 Install minimal runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

#2 Create non-root user
RUN groupadd -r gobyte && useradd -r -m -g gobyte gobyte

#3 Copy binaries
COPY --from=builder /src/out/gobyted /usr/local/bin/
COPY --from=builder /src/out/gobyte-cli /usr/local/bin/
COPY --from=builder /src/out/gobyte-tx /usr/local/bin/

#4 Ensure binaries are executable
RUN chmod +x /usr/local/bin/gobyted /usr/local/bin/gobyte-cli /usr/local/bin/gobyte-tx

#5 Data directory
RUN mkdir -p /home/gobyte/.gobytecore && \
    chown -R gobyte:gobyte /home/gobyte/.gobytecore

#VOLUME ["/home/gobyte/.gobytecore"]

#6 Healthcheck
HEALTHCHECK --interval=60s --timeout=10s --start-period=60s --retries=3 \
    CMD /usr/local/bin/gobyte-cli getblockchaininfo || exit 1

USER gobyte
WORKDIR /home/gobyte

# Standard GoByte ports (Mainnet & Testnet)
EXPOSE 12455 12454 13455 13454

ENTRYPOINT ["/usr/local/bin/gobyted"]
CMD ["-printtoconsole", "-datadir=/home/gobyte/.gobytecore"]
