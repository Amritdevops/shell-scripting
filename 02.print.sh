#!/bin/bash

echo hello world

# color lines: used to highlight the message

# syntax : echo-e\e[COLORmMESSAGE\[0m

# -e to enable sequence \e

# \e to enable color

# [colorm is color number

#\e[0m to disable the color

echo -e \e[31AMRIT\e[32PAUL\e[33SINGH\0m