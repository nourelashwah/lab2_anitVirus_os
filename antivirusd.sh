#!/bin/bash
dir="$1"
malicious_dir="$2"
interval="$3"
is_malicious(){
case "$1" in
*.exe|*.bat|*.vbs|*.scr|*.ps1)return 0;;
esac
if grep -iqE "virus|trojan|ransomware|worm|malware" "$1"; then
return 0
fi
return 1
}
mkdir -p "$malicious_dir"
for f in "$dir"/*; do
    if is_malicious "$f"; then
        echo "$f is malicious and it is deleted"
	cp "$f" "$malicious_dir"
	rm "$f"
    else
        echo "$f is clean"
    fi
done
