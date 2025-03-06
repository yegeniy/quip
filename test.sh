# Unescaped backticks break JS template literates
grep -nE '[^\\]`' ips/* && exit 1 || exit 0
