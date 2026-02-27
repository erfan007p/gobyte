GoByte Core version 0.16.2.1
==========================

Release is now available from:

  <https://www.gobyte.network/downloads/#wallets>

This is a new minor version release, bringing various bugfixes and improvements.

Please report bugs using the issue tracker at github:

  <https://github.com/gobytecoin/gobyte/issues>


Upgrading and downgrading
=========================

How to Upgrade
--------------

If you are running an older version, shut it down. Wait until it has completely
shut down (which might take a few minutes for older versions), then run the
installer (on Windows) or just copy over /Applications/GoByte-Qt (on Mac) or
gobyted/gobyte-qt (on Linux). If you upgrade after DIP0003 activation and you were
using version < 0.13 you will have to reindex (start with -reindex-chainstate
or -reindex) to make sure your wallet has all the new data synced. Upgrading
from version 0.13 should not require any additional actions.

When upgrading from a version prior to 0.14.0.3, the
first startup of GoByte Core will run a migration process which can take a few
minutes to finish. After the migration, a downgrade to an older version is only
possible with a reindex (or reindex-chainstate).

Downgrade warning
-----------------

### Downgrade to a version < 0.14.0.3

Downgrading to a version older than 0.14.0.3 is no longer supported due to
changes in the "evodb" database format. If you need to use an older version,
you must either reindex or re-sync the whole chain.

### Downgrade of masternodes to < 0.16

Starting with this release, masternodes will verify the protocol version of other
masternodes. This will result in PoSe punishment/banning for outdated masternodes,
so downgrading is not recommended.

Notable changes
===============

Network changes
---------------
InstantSend locks were not relayed correctly when another node was requesting updates via the `mempool`
p2p message. Some other internal optimizations were made to the way object requests are handled.

GUI changes
-----------
Fixes for the following GUI related issues
- The wallet crashed if no valid GUI theme was found in settings.
This happened for users upgrading from versions prior to v0.14.
- There were randomly occurring font size scaling issues.
- Opening or closing the settings while the application was in full-screen/maximized
window mode lead to fragmented GUI layouts.
- There was an unexpected checkmark in the "Encrypt wallet" menu item on Linux and Windows
- Starting GoByte Core compiled without wallet support or with `-disablewallet` command line
parameter lead to an application crash.

RPC changes
-----------
- `getwalletinfo` shows wallet rescan duration and progress now

0.16.2.1 Change log
===================

See detailed [set of changes](https://github.com/gobytecoin/gobyte/compare/v0.16.1.1...v0.16.2.1).

- [`36b1170846`](https://github.com/gobytecoin/gobyte/commit/36b1170846) set CLIENT_VERSION_IS_RELEASE to false
- [`5bed23939f`](https://github.com/gobytecoin/gobyte/commit/5bed23939f) fix MIN_GOVERNANCE_PEER_PROTO_VERSION and GOVERNANCE_POSE_BANNED_VOTE_S_VERSION
- [`155173c9a5`](https://github.com/gobytecoin/gobyte/commit/155173c9a5) bump proto version to 70210
- [`d293a48bdd`](https://github.com/gobytecoin/gobyte/commit/d293a48bdd) bump nMinimumChainWork, defaultAssumeValid, checkpointData for mainnet and testnet
- [`6260176522`](https://github.com/gobytecoin/gobyte/commit/6260176522) contrib|src: Update hard coded seeds
- [`484739d957`](https://github.com/gobytecoin/gobyte/commit/484739d957) rpc: update help message
- [`1957b62677`](https://github.com/gobytecoin/gobyte/commit/1957b62677) bench: update gobyte bench
- [`4357046456`](https://github.com/gobytecoin/gobyte/commit/4357046456) contrib: fix key types
- [`658597d078`](https://github.com/gobytecoin/gobyte/commit/658597d078) qt|test: update qt tests
- [`7f1e6a2265`](https://github.com/gobytecoin/gobyte/commit/7f1e6a2265) disconnect from legacy hosts still running gobyte core 12.x series
- [`f7562299d0`](https://github.com/gobytecoin/gobyte/commit/f7562299d0) test: update test data 
- [`6e8fa157f5`](https://github.com/gobytecoin/gobyte/commit/6e8fa157f5) bump version and set release true 
- [`7b2933d3a3`](https://github.com/gobytecoin/gobyte/commit/7b2933d3a3) Merge pull request #38 from barrystyle/master 
- [`793235a579`](https://github.com/gobytecoin/gobyte/commit/793235a579) Merge branch 'gobytecoin:master' into v0.16.x
- [`48be422b43`](https://github.com/gobytecoin/gobyte/commit/48be422b43) Update manpages
- [`6600d5dc18`](https://github.com/gobytecoin/gobyte/commit/6600d5dc18) Merge pull request #39 from erfan007p/v0.16.x

Credits
=======

Thanks to everyone who directly contributed to this release:

- dustinface (xdustinface)
- Oleg Girko (OlegGirko)
- PastaPastaPasta
- UdjinM6
- barrystyle
- GoByte Core Developers

As well as everyone that submitted issues and reviewed pull requests.

Older releases
==============

GoByte Core tree 0.16.x was a fork of Dash Core tree 0.16.x and Bitcoin Core tree 0.10 - 0.12.x
GoByte Core tree 0.12.x was a fork of Dash Core tree 0.12.x and Bitcoin Core tree 0.12.x

These release are considered obsolete. Old release notes can be found here:

- [v0.16.1.1](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.16.1.1.md) released October/05/2021
- [v0.12.2.4](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.2.4.md) released June/18/2018
- [v0.12.2.3](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.2.3.md) released June/10/2018
- [v0.12.1.3](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.3.md) released November/30/2017
- [v0.12.1.2](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.2.md) released November/21/2017
- [v0.12.1.1](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.1.md) released November/18/2017
