#!/bin/bash
dir="$1"
malicious_dir="$2"
if [ "$#" -ne 2 ]; then
    echo "invalid arguments enter correct number of arg"
    exit 1
fi

if [ ! -d "$dir" ]; then
echo "$dir is not there" 
exit 1 
fi

while true; do
files=( "$malicious_dir"/* )
if [ -z "$( ls -A "$malicious_dir")" ] ; then 
echo "No malicious files to review."
exit 0
fi
for i in "${!files[@]}"; do
echo "$((i+1)): ${files[$i]}"
done
read -p "pick a number: " choice
if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#files[@]}" ]; then
index=$((choice - 1 ))
file="${files[index]}"
echo "1) Restore   2) Delete   3) Leave"
read -p "Action: " action
case "$action" in
1) mv -t "$dir" "$file"; echo "Restored $(basename "$file") to $dir."
echo "$(basename "$file")">>whitelist.txt ;;
2) rm "$file" ; echo "$(basename "$file") permanently deleted." ;;
3) ;;
*) echo "invalid choice" ;;
esac
else 
echo "invalid choice"
fi
done
