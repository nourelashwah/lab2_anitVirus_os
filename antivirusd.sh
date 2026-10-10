#!/bin/bash
dir="$1"
malicious_dir="$2"
interval="$3"
if [ "$#" -ne 3 ]; then
    echo "invalid arguments enter correct number of arg"
    exit 1
fi
is_malicious(){
if [ -f whitelist.txt ] && grep -qxF "$(basename "$1")"  whitelist.txt; then
    return 1
fi
case "$1" in
*.exe|*.bat|*.vbs|*.scr|*.ps1)return 0;;
esac
if grep -iqE "virus|trojan|ransomware|worm|malware" "$1"; then
return 0
fi
return 1
}
scan(){
mkdir -p "$malicious_dir"
for f in "$dir"/*; do
    if is_malicious "$f"; then
        echo "$f is malicious and it is Deleted"
	cp "$f" "$malicious_dir"
	rm "$f"
    else
        echo "$f is clean"
    fi
done
}
if [ ! -f directory-info.last ]; then
    scan
    ls -l "$dir" > "directory-info.last"
fi
while true; do
    sleep "$interval"
    ls -l "$dir" > directory-info.new
    if ! cmp -s "directory-info.last" "directory-info.new"; then
        scan
        cp "directory-info.new" "directory-info.last"
    fi
done
