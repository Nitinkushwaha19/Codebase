echo "Enter the file name"
read file

cat << EOF >> "$file"
An old silent pond...
A frog jumps into the pond,
splash! Silence again.

Autumn moonlight-
a worm digs silently
into the chestnut.

In the twilight rain
these brilliant-hued hibiscus -
A lovely sunset.
EOF

cat < "$file"
echo "Task finished" >&2