helper() {
    echo $(( $1 * $1))
}

operation() {
    arr=($@)
    for ((i=0; i<$#; i++));
    do 
        num=$(helper ${arr[i]})
        echo $((num + 1))
    done
}

operation 5 6 1 3 9

