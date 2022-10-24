#!/bin/bash

region=us-east-1
ownerAccount=............   # account to donate the hosted vif

# change mtu to 9001 to enable jumbo frames

# us-east-1
aws --region $region \
  directconnect allocate-private-virtual-interface --connection-id dxcon-........ \
  --no-paginate \
  --owner-account $ownerAccount \
  --new-private-virtual-interface-allocation \
  "virtualInterfaceName=mw-sjvif-1,,vlan=320,asn=65110,mtu=1500,authKey=0x......................,amazonAddress=192.168.1.6/30,customerAddress=192.168.1.5/30,addressFamily=ipv4,tags=[{key=Owner,value=m.wiget@f5.com},{key=Tenant,value=playground}]"

#  --generate-cli-skeleton \
