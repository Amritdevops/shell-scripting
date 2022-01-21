#!/bin/bash

echo hello world

# color lines: used to highlight the message

# syntax : echo-e\e[COLORmMESSAGE\[0m

# -e to enable sequence \e

# \e to enable color

# [colorm is color number

#\e[0m to disable the color

echo -e "\e[31mAMRIT\e[32mPAUL\e[33mSINGH\0m"