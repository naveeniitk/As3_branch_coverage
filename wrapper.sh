#!/bin/bash
sed -i 's/\r//' wrapper.sh;./generate.sh;./reduce.sh;
rm *.gcov *.gcda *.gcno g_in1 g_in2 g_out1 g_out2;