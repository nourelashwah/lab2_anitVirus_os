#!/bin/bash
for f in testdir/*; do
if grep -iqE "virus|trojan|ransomware|worm|malware" "$f"; then
echo "$f has a virus"
else 
echo "$f" "is clean"
fi
done
