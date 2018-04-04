#!/bin/bash

rel=$1
# spr dlugosc i czy jest kropka w srodku

cp build_v62 build_v63
mkdir -p definitions/openbsd63
cp -pR definitions/openbsd62/* definitions/openbsd63
sed -i -e 's/62/63/g' -e 's/6\.2/6\.3/g' build_v63 definitions/openbsd63/*

sha=$(curl -s  https://ftp.icm.edu.pl/pub/OpenBSD/6.3/amd64/SHA256|grep install.*iso|cut -f4 -d' ')
if ( [[ -z $sha ]] ); then {
cant get SHA256 fingerprint, exiting
exit 2
}
fi
sed -i ''s/iso_sha256.*$/iso_sha256\ =\>\ \"$sha\",/'' definitions/openbsd63/definition.rb 
