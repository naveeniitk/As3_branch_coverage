#!/bin/bash
sed -i 's/\r//' reduce.sh;
echo " give k as input : ";
read k;
# gcov -b -c p.cpp;
# gcov -b -c p.cpp > g_out1;
# python3 branch_coverage.py < g_out1 > g_in1;
gen=$(cat g_in1);
echo "gen : "$gen;
N=$(cat g_in2);
echo " N : " $N;

c=0;
# max_so_far=0;
while [[ $c -le 500 ]]
do
	g++ -Wall -g -fprofile-arcs -ftest-coverage p.cpp -o bin/p;
	gh=0;
	for (( i=1 ;i<=N ;i++));do
		a=$(( RANDOM % 10 ));
		b=$(( RANDOM % 10 ));
		p="t_$i.in";
		# touch S/$p && cat T/$p > S/$p;
		# bin/p < S/$p;
		if [[ gh -gt $k ]];then
			break;
		fi
		if [[ $b -gt $a ]];then
			touch S/$p && cat T/$p > S/$p;
			bin/p < S/$p;
			((gh++));
		fi
	done

	# gcov -b -c p.cpp;
	# gcov -b -c p.cpp > g_out1;
	echo " "
	# python3 branch_coverage.py < g_out1 > g_in1;
	# gcov -b -c p.cpp;
	gcov -b -c p.cpp > g_out2;
	python3 branch_coverage.py < g_out2 > g_in2;
	VARIABLE=$(cat g_in2);

	echo "branch_coverage of generate script   : " $gen;
	echo "branch_coverage of this reduced suit : " $VARIABLE;
	echo " "
	delta=$(($gen-$VARIABLE));

	# if [[ $max_so_far -le $VARIABLE ]];then
	# 	$max_so_far=$VARIABLE;
	# fi

	if [[ $delta -le 13 ]];then
		break;
	else
		rm S/*.in;
	fi
	(( c++ ));
done

# echo $max_so_far;
gcov -b -c p.cpp ;
# > g_out1;
# python3 branch_coverage.py < g_out1 > g_in1;
# # echo $((RANDOM % 61 - 30)) 