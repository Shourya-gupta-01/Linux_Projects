echo "#######################"
echo "# System Uptime Info #"
echo "######################"

uptime

echo

echo "###################"
echo "# Total CPU Usage #"
echo "###################"

top -bn1 | grep '%Cpu(s):' | cut -d ',' -f 4 | awk '{print "Usage: " 100 - $1 "%"}'

echo

echo "######################"
echo "# Total Memory Usage #"
echo "######################"

free | grep Mem | tr -s ' ' | awk '{print "Total:" $2 / (1024*1024) "GB\n" "Usage: "($3 / $2) * 100 "%\n" "free: " ($7 / $2) * 100 "%"}'

echo

echo "###################################"
echo "# Top 5 Processes By Memory Usage #"
echo "###################################"

ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'

echo

echo "################################"
echo "# Top 5 Processes by CPU Usage #"
echo "################################"

ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
