# shell-scripting
# 123
#sed with -i   edit the file
# sed without -i print the change in output

#search & replace /substitute

sed -i -e 's/root/ROOT/g' -e 's/admin/ADMIN/g' sample.tx
# sed -i means edit
# s/root/ROOT means subsitute small root with BOLD ROOT
# g means global across the line


# -e is for multiple command in sed command
# -e condition1 -e condition2

# how to delete line
sed -i -e '1d' -e '/root/ d' sample.txt
# 1d means delete first line
# '/root/ d' means search the word root and delete the line that having root

#add lines
sed -i -e ' 1 i hello world' sample.txt
# 1st line add hello world
sed -i -e '/root/ i hello world' sample.txt
#search word root and insert hello world
sed -i -e '1 i hello world' sample.txt
# 1st new line inserted hello world
sed -i -e '1 a hello world' sample.txt
# a means append
sed -i -e '/world/ c universe' sample.txt
#change