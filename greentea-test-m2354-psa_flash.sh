#!/bin/sh

TEST_LIST="\
mbed-os-drivers-device_key-tests*,\
mbed-os-drivers-tests-tests-mbed_drivers-flashiap*,\
mbed-os-hal-tests-tests-mbed_hal-flash*,\
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
cp TARGET_IGNORE/NU_M2354_S/ARMC6-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t ARMC6 -n $TEST_LIST > m2354-psa_armc6-s_armc6-ns_flash.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_M2354_S/ARMC6-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t GCC_ARM -n $TEST_LIST > m2354-psa_armc6-s_gcc-ns_flash.log

# Secure GCC_ARM/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_M2354_S/GCC_ARM-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t ARMC6 -n $TEST_LIST > m2354-psa_gcc-s_armc6-ns_flash.log

# Secure GCC_ARM/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_M2354_S/GCC_ARM-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t GCC_ARM -n $TEST_LIST > m2354-psa_gcc-s_gcc-ns_flash.log

# Secure IAR/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_M2354_S/IAR-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t ARMC6 -n $TEST_LIST > m2354-psa_iar-s_armc6-ns_flash.log

# Secure IAR/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_M2354_S/IAR-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_M2354_NS -t IAR -n $TEST_LIST > m2354-psa_iar-s_iar-ns_flash.log
