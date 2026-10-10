#!/bin/bash
base="/home/nour/Desktop/Os/lab2_anitVirus_os"
dir="$1"
malicious_dir="$2"
if [ "$#" -ne 2 ]; then
    echo "invalid arguments enter correct number of arg"
    exit 1
fi
is_malicious(){
if [ -f "$base/whitelist.txt" ] && grep -qxF "$(basename "$1")" "$base/whitelist.txt"; then
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
mkdir -p "$base/$malicious_dir"
for f in "$base/$dir"/*; do
    if is_malicious "$f"; then
        echo "$f is malicious and it is Deleted"
	cp "$f" "$base/$malicious_dir"
	rm "$f"
    else
        echo "$f is clean"
    fi
done
}
if [ ! -f "$base/directory-info.last" ]; then
    scan
    ls -l "$base/$dir" > "$base/directory-info.last"
fi
ls -l $base/$dir > $base/directory-info.new
if ! cmp -s "$base/directory-info.last" "$base/directory-info.new"; then
scan
cp "$base/directory-info.new" "$base/directory-info.last"
fi
