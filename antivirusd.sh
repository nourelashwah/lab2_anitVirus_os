#!/bin/bash
is_malicious(){
case "$1" in
*.exe|*.bat|*.vbs|*.scr|*.ps1)return 0;;
esac
if grep -iqE "virus|trojan|ransomware|worm|malware" "$1"; then
return 0
fi
return 1
}
for f in testdir/*; do
    if is_malicious "$f"; then
        echo "$f is malicious"
    else
        echo "$f is clean"
    fi
done
