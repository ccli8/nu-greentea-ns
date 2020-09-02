#!/bin/sh

TEST_LIST="\
mbed-os-drivers-device_key-tests*,\
mbed-os-drivers-tests*,\
mbed-os-events-tests*,\
mbed-os-features-device_key*,\
mbed-os-features-frameworks-utest*,\
mbed-os-features-storage-nvstore*,\
mbed-os-features-storage-tests*,\
mbed-os-features-tests*,\
mbed-os-hal-tests*,\
mbed-os-platform-tests*,\
mbed-os-rtos-tests*,\
mbed-os-storage*,\
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
mbed test -m NU_PFM_M2351_NPSA_NS -t ARMC6 \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa_armc6-s_armc6-ns_prebuild.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t GCC_ARM \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa_armc6-s_gcc-ns_prebuild.log

# Secure ARMC6/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t IAR \
--app-config mbed_app_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa_armc6-s_iar-ns_prebuild.log
