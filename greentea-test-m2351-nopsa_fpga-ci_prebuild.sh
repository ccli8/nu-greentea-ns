#!/bin/sh

TEST_LIST="\
mbed-os-tests-mbed_hal_fpga_ci_test_shield*,\
mbed-os-tests-mbed_timing_fpga_ci_test_shield*,\
mbed-os-hal-tests-tests-mbed_hal_fpga_ci_test_shield*\
"

# Secure ARMC6/Non-secure ARMC6 toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t ARMC6 \
--app-config mbed_app_fpga-ci_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa-fpga-ci_armc6-s_armc6-ns_prebuild.log

# Secure ARMC6/Non-secure GCC_ARM toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t GCC_ARM \
--app-config mbed_app_fpga-ci_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa-fpga-ci_armc6-s_gcc-ns_prebuild.log

# Secure ARMC6/Non-secure IAR toolchain
rm -rdf BUILD
rm -rdf SECURE_IMAGE_STAGE
mkdir -p SECURE_IMAGE_STAGE
mbed test -m NU_PFM_M2351_NPSA_NS -t IAR \
--app-config mbed_app_fpga-ci_prebuild.json \
-n $TEST_LIST \
> m2351-nopsa-fpga-ci_armc6-s_iar-ns_prebuild.log
