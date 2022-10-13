PORT=3000
echo 'Deploying app.'
set -x
python3 blog/server.py &
sleep 1
echo $! > .pidfile
set +x
echo "Server running http://localhost:$PORT"
