#!/bin/bash
#
# Unit tests for CH server functionality
# Assumes test server is running on https://localhost:9999

# Set up environment
HOSTNAME=`hostname -f`
DATADIR=/usr/share/geni-ch
CHAPIDIR=~/geni-ch
export PYTHONPATH=~/geni-tools/src:$CHAPIDIR

#    Make a first user, priv
PRIV_EPPN=priv@geni.net
python client.py --method create_member --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem --cert /usr/share/geni-ch/ma/ma-cert.pem --string_arg=$PRIV_EPPN --raw_output > /tmp/priv-raw.json
PRIV_URN=`python json_extractor.py value,name=urn,value /tmp/priv-raw.json`

python client.py --method create_certificate --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem  --cert /usr/share/geni-ch/ma/ma-cert.pem --urn $PRIV_URN

printf "{\"match\" : {\"_GENI_MEMBER_EPPN\" : \"%s\"}}\n" $PRIV_EPPN > /tmp/lookup_priv.json

# Grab certs and keys
python client.py --method lookup_login_info --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.python client.py --method lookup_login_info --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem  --cert /usr/share/geni-ch/ma/ma-cert.pem --options_file /tmp/lookup_priv.json --raw_output > /tmp/priv.json

python json_extractor.py   value,urn:$PRIV_URN,_GENI_MEMBER_SSL_PRIVATE_KEY  /tmp/priv.json > /tmp/priv-key.pem

python json_extractor.py   value,urn:$PRIV_URN,_GENI_MEMBER_SSL_CERTIFICATE  /tmp/priv.json > /tmp/priv-cert.pem

# Make a second user, unpriv
UNPRIV_EPPN=unpriv3@geni.net
python client.py --method create_member --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem --cert /usr/share/geni-ch/ma/ma-cert.pem --string_arg=$UNPRIV_EPPN --raw_output > /tmp/unpriv-raw.json
UNPRIV_URN=`python json_extractor.py value,name=urn,value /tmp/unpriv-raw.json`

python client.py --method create_certificate --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem  --cert /usr/share/geni-ch/ma/ma-cert.pem --urn $UNPRIV_URN

printf "{\"match\" : {\"_GENI_MEMBER_EPPN\" : \"%s\"}}\n" $UNPRIV_EPPN > /tmp/lookup_unpriv.json

# Grab certs and keys
python client.py --method lookup_login_info --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.python client.py --method lookup_login_info --url https://localhost:9999/MA --key /usr/share/geni-ch/ma/ma-key.pem  --cert /usr/share/geni-ch/ma/ma-cert.pem --options_file /tmp/lookup_unpriv.json --raw_output > /tmp/unpriv.json

python json_extractor.py   value,$UNPRIV_URN,_GENI_MEMBER_SSL_PRIVATE_KEY  /tmp/unpriv.json > /tmp/unpriv-key.pem

python json_extractor.py   value,$UNPRIV_URN,_GENI_MEMBER_SSL_CERTIFICATE  /tmp/unpriv.json > /tmp/unpriv-cert.pem



#    Set up test scripts, run each and compare with expected output


#  At the end, kill the server
killall test_server.py

