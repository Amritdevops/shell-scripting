#!/bin/bash

student_name="Doad"

echo student_name = $student_name

echo student_name = ${student_name}

date=2022-02-22

echo today date is $date

# variable date-- command substitution

date=$(date +%F)
echo good morning today is $date

# arithmatic subsitution
exp1=$((2+2-5/2*3))
echo expression output is $exp1


