#!/bin/bash -ex
git clone https://github.com/tadfisher/pass-otp
cd pass-otp
sudo make install
cd ..
rm -rf pass-otp
