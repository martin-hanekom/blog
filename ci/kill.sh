echo 'Terminate app.'
set -x
kill $(cat .pidfile)
