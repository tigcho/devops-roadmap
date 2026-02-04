if [ -z "$1" ]; then
        echo "Usage: $0 <log-file>"
        exit 1
fi

LOG_FILE="$1"

echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 most requested paths:"
awk -F'"' '{split($2,a," "); print a[2]}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 \
  | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 response status codes:"
awk -F'"' '{split($3,a," "); print a[1]}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 \
  | awk '{print $2 " - " $1 " requests"}'
echo

echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 \
  | awk '{c=$1; $1=""; sub(/^ +/,""); print $0 " - " c " requests"}'
echo
