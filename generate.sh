#!/bin/bash
sed -i 's/\r//' generate.sh;
rm T/*.in;rm S/*.in;
g++ -Wall -g -fprofile-arcs -ftest-coverage p.cpp -o bin/p;
echo "running generate.sh script give N as input : ";read N;

echo $N > g_in2;

for(( i=1 ; i<=N ; i++ ));do 
	p="t_$i.in";touch T/$p;
	q=$(( $i%6 ));
	if [[ q -eq 0 ]];then
		a=$((RANDOM % 10-1));b=$((RANDOM % 10 - 1));
		(echo $a $b) | cat > T/$p;
	elif [[ q -eq 1 ]];then 
		a=$((RANDOM % 20 - 10));b=$((RANDOM % 20 - 10));
		(echo $a $b) | cat > T/$p;
	elif [[ q -eq 2 ]];then 
		a=$((RANDOM % 200 - 100));b=$((RANDOM % 200 - 100));
		(echo $a  $b) | cat > T/$p;
	elif [[ q -eq 3 ]];then 
		a=$((RANDOM % 2000 - 1000));b=$((RANDOM % 2000 - 1000));
		(echo $a $b) | cat > T/$p;
	elif [[ q -eq 4 ]];then 
		a=$((RANDOM % 20000 - 10000));b=$((RANDOM % 20000 - 10000));
		(echo $a $b) | cat > T/$p;
	elif [[ q -eq 5 ]];then
		c=$((RANDOM % 1000));
		a=$((RANDOM % 20000 - 10000));b=$((RANDOM % 20000 - 10000));
		if [[ c -gt 0 ]];then
			(echo $a$c  $b$c) | cat > T/$p;
		fi
	fi
	bin/p < T/$p;
done

gcov -b -c p.cpp;
gcov -b -c p.cpp > g_out1;
python3 branch_coverage.py < g_out1 > g_in1;
# export N;
# export $N;
# bgen=$(cat g_in1);
# echo "bgen : "$bgen;
# # echo $((RANDOM % 61 - 30)) 

