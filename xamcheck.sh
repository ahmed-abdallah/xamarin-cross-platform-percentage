wc -l $(egrep -Rl 'using Foundation|using UIKit|using Android|IOS|Droid' --include \*.cs $1) > platformstuff

while read lines filename
do
	if [[ "$filename" != 'total' && "$filename" != *"Resource.Designer.cs" && "$filename" != *"AssemblyInfo.cs" ]];
		then 
		let math=$((unshared = unshared + lines))
	fi
done < platformstuff

echo 'Unshared lines: '$unshared


wc -l $(find $1 -name '*.cs') > allstuff

while read lines filename
do
	if [ "$filename" != 'total' ];
		then 
		let math=$((total = total + lines))
	fi
done < allstuff

echo 'Total lines: '$total


echo "Unshared Percentage: $(echo "100*$unshared/$total" | bc -l)" 
