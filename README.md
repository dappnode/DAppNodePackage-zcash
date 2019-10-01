# ZCASH DAppNode package

[![DAppNodeStore Available](https://img.shields.io/badge/DAppNodeStore-Available-brightgreen.svg)](http://my.admin.dnp.dappnode.eth/#/installer/zcash.public.dappnode.eth)

[![Website dappnode.io](https://img.shields.io/badge/Website-dappnode.io-brightgreen.svg)](https://dappnode.io/)
[![Documentation Wiki](https://img.shields.io/badge/Documentation-Wiki-brightgreen.svg)](https://github.com/dappnode/DAppNode/wiki)
[![GIVETH Campaign](https://img.shields.io/badge/GIVETH-Campaign-1e083c.svg)](https://beta.giveth.io/campaigns/5b44b198647f33526e67c262)
[![RIOT DAppNode](https://img.shields.io/badge/RIOT-DAppNode-blue.svg)](https://riot.im/app/#/room/#DAppNode:matrix.org)
[![Twitter Follow](https://img.shields.io/twitter/follow/espadrine.svg?style=social&label=Follow)](https://twitter.com/DAppNode?lang=es)


[![Website zcash](https://img.shields.io/badge/Website-zcash-brightgreen.svg)](https://z.cash/)

Zcash is a privacy-protecting, digital currency built on strong science.

DAppNode package responsible for providing the zcashd.

Aragon Package Manager Repo at [zcash.public.dappnode.eth](https://etherscan.io/address/zcash.public.dappnode.eth )


## Connect using Zepio

### Customising zcash.conf

The location of zcash.conf varies by system. It is located in the following location on each platform:

* Windows: %HOMEPATH%\AppData\Roaming\Zcash\zcash.conf
* macOS: ~/Library/Application Support/Zcash/zcash.conf
* Linux: ~/.zcash/zcash.conf

You should edit the zcash.conf with this parameters (rpcuser, rpcpassword and rpcport depend on your dappnode configuration):

```
server=0
rpcconnect=zcash.public.dappnode
rpcuser=dappnode
rpcpassword=dappnode
rpcport=8232
```

## Connect using zecwallet

You should move zcash.conf to zcash.conf.bck file or remove if you prefer it.

Windows: %HOMEPATH%\AppData\Roaming\Zcash\zcash.conf

macOS: ~/Library/Application Support/Zcash/zcash.conf

Linux: ~/.zcash/zcash.conf

After this you should run zecwallet with `--no-embedded` option:

i.e. MacOS:
```
/Applications/ZecWallet.app/Contents/MacOS/zecwallet --no-embedded 
```

And edit the parameters on the preferences view:

```
host: zcash.public.dappnode
rpcuser: dappnode
rpcpasswrod: dappnode
rpcport: 8232
```

(rpcuser, rpcpassword and rpcport depend on your dappnode configuration)


If you have any problem to configure join our [riot](https://riot.im/app/#/room/#DAppNode:matrix.org) channel and do not hesitate to ask us.

## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
