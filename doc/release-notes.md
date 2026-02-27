GoByte Core version 0.16.2.2
==========================

Release is now available from:

  <https://www.GoByte.org/downloads/#wallets>

This is a new hotfix release.

Please report bugs using the issue tracker at github:

  <https://github.com/GoBytepay/GoByte/issues>


Upgrading and downgrading
=========================

How to Upgrade
--------------

If you are running an older version, shut it down. Wait until it has completely
shut down (which might take a few minutes for older versions), then run the
installer (on Windows) or just copy over /Applications/GoByte-Qt (on Mac) or
GoByted/GoByte-qt (on Linux). If you upgrade after DIP0003 activation and you were
using version < 0.12.2.4 you will have to reindex (start with -reindex-chainstate
or -reindex) to make sure your wallet has all the new data synced. Upgrading
from version 0.12.2.4 should not require any additional actions.

When upgrading from a version prior to 0.14.0.3, the
first startup of GoByte Core will run a migration process which can take a few
minutes to finish. After the migration, a downgrade to an older version is only
possible with a reindex (or reindex-chainstate).

Downgrade warning
-----------------

### Downgrade to a version < 0.16.x

Downgrading to a version older than 0.16.x is no longer supported due to
changes in the "evodb" database format. If you need to use an older version,
you must either reindex or re-sync the whole chain.

### Downgrade of masternodes to < 0.16

Starting with this release, masternodes will verify the protocol version of other
masternodes. This will result in PoSe punishment/banning for outdated masternodes,
so downgrading is not recommended.

Notable changes
===============

There was an unexpected behaviour of the "Encrypt wallet" menu item for unencrypted wallets
which was showing users the "Decrypt wallet" dialog instead. This was a GUI only issue,
internal encryption logic and RPC behaviour were not affected.

0.16.2.2 Change log
===================

See detailed [set of changes](https://github.com/gobytecoin/gobyte/compare/v0.16.2.1...v0.16.2.2).

- [`c02bf3ee1`](https://github.com/gobytecoin/gobyte/commit/c02bf3ee1) contrib|src: Update hard coded seeds
- [`e32878183`](https://github.com/gobytecoin/gobyte/commit/e32878183) bump nMinimumChainWork, defaultAssumeValid, checkpointData for mainnet and testnet
- [`668bca907`](https://github.com/gobytecoin/gobyte/commit/668bca907) Bump PROTOCOL_VERSION to 70211
- [`5a5ef11d3`](https://github.com/gobytecoin/gobyte/commit/5a5ef11d3) set CLIENT_VERSION_IS_RELEASE to fals


Credits
=======

- Dash Core Developers
- GoByte Core Developers

As well as everyone that submitted issues and reviewed pull requests.

Older releases
==============

GoByte Core tree 0.12.x was a fork of Dash Core tree 0.12.x and Bitcoin Core tree 0.12.x

These release are considered obsolete. Old release notes can be found here:

- [v0.16.2.1](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.16.2.1.md) released December/06/2021
- [v0.16.1.1](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.16.1.1.md) released October/05/2021
- [v0.12.2.4](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.2.4.md) released June/18/2018
- [v0.12.2.3](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.2.3.md) released June/10/2018
- [v0.12.1.3](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.3.md) released November/30/2017
- [v0.12.1.2](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.2.md) released November/21/2017
- [v0.12.1.1](https://github.com/gobytecoin/gobyte/blob/master/doc/release-notes/gobyte/release-notes-0.12.1.1.md) released November/18/2017
