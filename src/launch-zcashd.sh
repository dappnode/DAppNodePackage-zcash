#!/bin/bash

set -euo pipefail

tee -a >${ZCASH_CONF} <<EOF
##
## zcash.conf configuration file. Lines beginning with # are comments.
##

# Network-related settings:

# Run on the test network instead of the real zcash network.
#testnet=0

# Run a regression test network
#regtest=0

# Connect via a SOCKS5 proxy
#proxy=127.0.0.1:9050

# Bind to given address and always listen on it. Use [host]:port notation for IPv6
#bind=<addr>

# Bind to given address and whitelist peers connecting to it. Use [host]:port notation for IPv6
#whitebind=<addr>

##############################################################
##            Quick Primer on addnode vs connect            ##
##  Let's say for instance you use addnode=4.2.2.4          ##
##  addnode will connect you to and tell you about the      ##
##    nodes connected to 4.2.2.4.  In addition it will tell ##
##    the other nodes connected to it that you exist so     ##
##    they can connect to you.                              ##
##  connect will not do the above when you 'connect' to it. ##
##    It will *only* connect you to 4.2.2.4 and no one else.##
##                                                          ##
##  So if you're behind a firewall, or have other problems  ##
##  finding nodes, add some using 'addnode'.                ##
##                                                          ##
##  If you want to stay private, use 'connect' to only      ##
##  connect to "trusted" nodes.                             ##
##                                                          ##
##  If you run multiple nodes on a LAN, there's no need for ##
##  all of them to open lots of connections.  Instead       ##
##  'connect' them all to one node that is port forwarded   ##
##  and has lots of connections.                            ##
##       Thanks goes to [Noodle] on Freenode.               ##
##############################################################

# Use as many addnode= settings as you like to connect to specific peers
#addnode=69.164.218.197
#addnode=10.0.0.2:8233
addnode=mainnet.z.cash

# Alternatively use as many connect= settings as you like to connect ONLY to specific peers
#connect=69.164.218.197
#connect=10.0.0.1:8233

# Listening mode, enabled by default except when 'connect' is being used
#listen=1

# Maximum number of inbound+outbound connections.
#maxconnections=

#
# JSON-RPC options (for controlling a running Zcash/zcashd process)
#

# server=1 tells zcashd to accept JSON-RPC commands (set as default if not specified)
#server=1

# Bind to given address to listen for JSON-RPC connections. Use [host]:port notation for IPv6.
# This option can be specified multiple times (default: bind to all interfaces)
rpcbind=0.0.0.0

# You must set rpcuser and rpcpassword to secure the JSON-RPC api
rpcuser=${ZCASH_RPCUSER:-dappnode}
rpcpassword=${ZCASH_RPCPASSWORD:-dappnode}

# How many seconds zcash will wait for a complete RPC HTTP request.
# after the HTTP connection is established. 
#rpcclienttimeout=30

# By default, only RPC connections from localhost are allowed.
# Specify as many rpcallowip= settings as you like to allow connections from other hosts,
# either as a single IPv4/IPv6 or with a subnet specification.

# NOTE: opening up the RPC port to hosts outside your local trusted network is NOT RECOMMENDED,
# because the rpcpassword is transmitted over the network unencrypted and also because anyone 
# that can authenticate on the RPC port can steal your keys + take over the account running zcashd
# For more information see https://github.com/zcash/zcash/issues/1497

#rpcallowip=10.1.1.34/255.255.255.0
#rpcallowip=1.2.3.4/24
#rpcallowip=2001:db8:85a3:0:0:8a2e:370:7334/96
rpcallowip=${ZCASH_RPCALLOWIP:-172.33.0.0/16}


# Listen for RPC connections on this TCP port:
rpcport=${ZCASH_RPCPORT:-8232}

# You can use Zcash or zcashd to send commands to Zcash/zcashd
# running on another host using this option:
#rpcconnect=127.0.0.1

# Transaction Fee

# Send transactions as zero-fee transactions if possible (default: 0)
#sendfreetransactions=0

# Create transactions that have enough fees (or priority) so they are likely to # begin confirmation within n blocks (default: 1).
# This setting is overridden by the -paytxfee option.
#txconfirmtarget=n

# Miscellaneous options

# Enable attempt to mine zcash.
#gen=0

# Set the number of threads to be used for mining zcash (-1 = all cores).
#genproclimit=1

# Specify a different Equihash solver (e.g. "tromp") to try to mine zcash
# faster when gen=1.
#equihashsolver=default

# Pre-generate this many public/private key pairs, so wallet backups will be valid for
# both prior transactions and several dozen future transactions.
#keypool=100

# Pay an optional transaction fee every time you send zcash.  Transactions with fees
# are more likely than free transactions to be included in generated blocks, so may
# be validated sooner. This setting does not affect private transactions created with 
# 'z_sendmany'.
#paytxfee=0.00

showmetrics=0
EOF

zcash-fetch-params 

if [ $# -eq 0 ]; then
    exec zcashd -port=${P2P_PORT} -printtoconsole
else
    exec "$@"
fi