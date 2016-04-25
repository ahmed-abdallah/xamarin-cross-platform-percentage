wc -l $(egrep -Rl 'Foundation|UIKit|Android|IOS|Droid' --include \*.cs $1) > stuff

while read lines filename
do
	if [ "$filename" != 'total' ];
		then 
		let math=$((unshared = unshared + lines))
	fi
done < stuff

echo 'Unshared lines: '$unshared


wc -l $(find $1 -name '*.cs') > stuff

while read lines filename
do
	if [ "$filename" != 'total' ];
		then 
		let math=$((total = total + lines))
	fi
done < stuff

echo 'Total lines: '$total


echo "Unshared Percentage: $(echo "100*$unshared/$total" | bc -l)" 