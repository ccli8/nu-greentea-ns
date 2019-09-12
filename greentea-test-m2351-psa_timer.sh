#!/bin/sh

TEST_LIST="\
mbed-os-tests-events-timing,\
mbed-os-tests-mbed_drivers-sleep*,\
mbed-os-tests-mbed_drivers-ti*,\
mbed-os-tests-mbed_drivers-lp*,\
mbed-os-tests-mbed_drivers-us*,\
mbed-os-tests-mbed_drivers-rtc*,\
mbed-os-tests-mbed_hal-sleep*,\
mbed-os-tests-mbed_hal-ti*,\
mbed-os-tests-mbed_hal-lp*,\
mbed-os-tests-mbed_hal-us*,\
mbed-os-tests-mbed_hal-rtc*,\
mbed-os-tests-mbed_hal-common_ticker*,\
mbed-os-tests-mbed_platform-wait_ns,\
mbed-os-tests-mbedmicro-rtos-mbed-basic,\
mbed-os-tests-mbedmicro-rtos-mbed-kernel_tick_count\
"

# Secure ARMC6/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_PSA_S/ARMC6-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_PSA_NS -t ARMC6 -n $TEST_LIST > m2351-psa_armc6-s_armc6-ns_timer.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_PSA_S/ARMC6-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_PSA_NS -t GCC_ARM -n $TEST_LIST > m2351-psa_armc6-s_gcc-ns_timer.log

# Secure GCC_ARM/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_PSA_S/GCC_ARM-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_PSA_NS -t ARMC6 -n $TEST_LIST > m2351-psa_gcc-s_armc6-ns_timer.log

# Secure GCC_ARM/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
cp TARGET_IGNORE/NU_PFM_M2351_PSA_S/GCC_ARM-DEVELOP/tfm/* SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_PSA_NS -t GCC_ARM -n $TEST_LIST > m2351-psa_gcc-s_gcc-ns_timer.log
