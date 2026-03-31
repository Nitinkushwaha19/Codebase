sum=0
for num in $@; do
    ((sum += num ))
done

echo "Sum of all the argument: $sum"
echo "Number of argument: $#"
if [[ $# -eq 0 ]]; then
    echo "Error: division by 0 not possible";
    exit 1
fi
echo "Average of all arguments: $(echo "scale=2; $sum / $#" | bc)"