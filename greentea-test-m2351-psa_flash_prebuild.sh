#!/bin/sh

TEST_LIST="\
mbed-os-tests-mbed_drivers-flashiap*,\
mbed-os-tests-mbed_hal-flash*,\
mbed-os-features-storage-nvstore*,\
mbed-os-features-device_key*,\
mbed-os-features-storage-tests-kvstore*,\
mbed-os-storage*\
"

# Secure ARMC6/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t ARMC6 \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_flash_armc6-s_armc6-ns_prebuild.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t GCC_ARM \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_flash_armc6-s_gcc-ns_prebuild.log

# Secure ARMC6/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t IAR \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_flash_armc6-s_iar-ns_prebuild.log
