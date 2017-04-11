ps -aux | grep kafka | grep -v grep | awk '{print $2}' | xargs kill
