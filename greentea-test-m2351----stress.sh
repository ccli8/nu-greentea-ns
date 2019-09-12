#!/bin/sh

mbed test -m NU_PFM_M2351_NS -t GCC_ARM -n mbed-os-tests-mbed_hal-common_tickers > stress_00.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests > stress_01.log

mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log
mbedhtrun -p COM16:9600 --skip-flashing -e mbed-os/TESTS/host_tests >> stress_01.log

