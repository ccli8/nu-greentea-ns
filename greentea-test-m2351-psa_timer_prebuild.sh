#!/bin/sh

TEST_LIST="\
mbed-os-drivers-tests-tests-mbed_drivers-sleep*,\
mbed-os-drivers-tests-tests-mbed_drivers-ti*,\
mbed-os-drivers-tests-tests-mbed_drivers-lp*,\
mbed-os-drivers-tests-tests-mbed_drivers-us*,\
mbed-os-drivers-tests-tests-mbed_hal-sleep*,\
mbed-os-events-tests-tests-events-timing,\
mbed-os-hal-tests-tests-mbed_hal-sleep*,\
mbed-os-hal-tests-tests-mbed_hal-ti*,\
mbed-os-hal-tests-tests-mbed_hal-lp*,\
mbed-os-hal-tests-tests-mbed_hal-us*,\
mbed-os-hal-tests-tests-mbed_hal-rtc*,\
mbed-os-hal-tests-tests-mbed_hal-common_ticker*,\
mbed-os-platform-tests-tests-mbed_platform-wait_ns,\
mbed-os-rtos-tests-tests-mbedmicro-rtos-mbed-basic,\
mbed-os-rtos-tests-tests-mbedmicro-rtos-mbed-kernel_tick_count,\
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
mbed test -m NU_PFM_M2351_NS -t ARMC6 \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_timer_armc6-s_armc6-ns_prebuild.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t GCC_ARM \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_timer_armc6-s_gcc-ns_prebuild.log

# Secure ARMC6/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NS -t IAR \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-psa_timer_armc6-s_iar-ns_prebuild.log
