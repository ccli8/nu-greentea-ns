#!/bin/sh

TEST_LIST="\
mbed-os-tests-mbed_drivers-flashiap*,\
mbed-os-tests-mbed_hal-flash*,\
mbed-os-features-storage-nvstore*,\
mbed-os-features-device_key*\
"

# Secure ARMC6/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/ARMC6-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t ARMC6 -n $TEST_LIST > m2351-nopsa_armc6-s_armc6-ns_flash.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/ARMC6-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t GCC_ARM -n $TEST_LIST > m2351-nopsa_armc6-s_gcc-ns_flash.log

# Secure GCC_ARM/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/GCC_ARM-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t ARMC6 -n $TEST_LIST > m2351-nopsa_gcc-s_armc6-ns_flash.log

# Secure GCC_ARM/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/GCC_ARM-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t GCC_ARM -n $TEST_LIST > m2351-nopsa_gcc-s_gcc-ns_flash.log

# Secure IAR/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/IAR-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t ARMC6 -n $TEST_LIST > m2351-nopsa_iar-s_armc6-ns_flash.log

# Secure IAR/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_NPSA_S/IAR-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t IAR -n $TEST_LIST > m2351-nopsa_iar-s_iar-ns_flash.log
