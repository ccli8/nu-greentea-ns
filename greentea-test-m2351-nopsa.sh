#!/bin/sh

TEST_LIST="\
mbed-os-features-device_key*,\
mbed-os-features-frameworks-utest*,\
mbed-os-features-storage-nvstore*,\
mbed-os-features-storage-tests*,\
mbed-os-features-tests*,\
mbed-os-tests-events*,\
mbed-os-tests-integration*,\
mbed-os-tests-mbed-crypto*,\
mbed-os-tests-mbed_drivers*,\
mbed-os-tests-mbed_functional*,\
mbed-os-tests-mbed_hal*,\
mbed-os-tests-mbed_platform*,\
mbed-os-tests-mbedmicro-mbed*,\
mbed-os-tests-mbedmicro-rtos-mbed*,\
mbed-os-tests-mbedtls*,\
mbed-os-tests-psa*,\
mbed-os-components-target_psa*
"

# Secure ARMC6/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_S/ARMC6-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t ARMC6 -n $TEST_LIST > m2351-nopsa_armc6-s_armc6-ns.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_S/ARMC6-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t GCC_ARM -n $TEST_LIST > m2351-nopsa_armc6-s_gcc-ns.log

# Secure GCC_ARM/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_S/GCC_ARM-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t ARMC6 -n $TEST_LIST > m2351-nopsa_gcc-s_armc6-ns.log

# Secure GCC_ARM/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_S/GCC_ARM-DEVELOP/NuMaker-mbed-TZ-secure-example/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t GCC_ARM -n $TEST_LIST > m2351-nopsa_gcc-s_gcc-ns.log
