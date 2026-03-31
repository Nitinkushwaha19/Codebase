#!/bin/bash

start(){
    echo "Service started";
    sleep 9999 &   
}

stop(){
    kill -9 $(pgrep -f sleep)
    echo "service stopped."
}

case $1 in
    start)
        start
    ;;
    stop)
        stop
    ;;
    restart)
        stop
        start
        echo "Service restarted"
    ;;
    help|*)
        echo "Usage: $0 {start|stop|restart|help}"
    ;;
esac


    