while : 
do
    echo "Enter the command"
    read cmd
    if [[ $cmd == "hi" ]]; then
        echo Hello $( whoami )
    elif [[ $cmd == "exit" ]]; then
        exit 1;
    else
        ( $cmd )
    fi
done