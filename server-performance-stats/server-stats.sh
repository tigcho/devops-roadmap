echo "====== Server Performance Stats ======"
echo

# total cpu usage with vmstat
echo "---- Total CPU Usage ----"
vmstat 1 5 | tail -1 | awk '{print "User: " $13 "%, System: " $14 "%, Idle: " $15 "%"}'
echo ""

# total memory usage with free
echo "---- Total Memory Usage ----"
free -h | awk 'NR==2{printf "Total: %s, Used: %s, Free: %s, Usage: %.2f%%\n", $2, $3, $4, $3/$2 * 100.0}'
echo

# total disk usage with df
echo "---- Total Disk Usage ----"
df -h / | awk 'NR==2{printf "Total: %s, Used: %s, Free: %s, Usage: %s\n", $2, $3, $4, $5}'
echo

# top 5 processes by cpu usage
echo "---- Top 5 Processes by CPU Usage ----"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo

# top 5 processes by memory usage
echo "---- Top 5 Processes by Memory Usage ----"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo

# additional stats
echo "---- Additional Stats ----"

echo "OS Version: $(lsb_release -d | cut -f2)"

echo "Uptime: $(uptime -p)"

echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"

echo "Logged in Users: $(who | wc -l)"

echo "Failed Login Attempts: $(sudo grep 'Failed password' /var/log/auth.log | wc -l)"
echo
echo "======================================"
