
### My basic idea is to make a bash script 
	(i)   generate.sh : to generate N random test cases;
	(ii)  reduce.sh   : to reduce test-suit by reading k as reduced size;
	(iii) wrapper.sh  : to automate everything ;

executing alone ./wrapper.sh and giving inputs to N and k will make a reduced suit;

-----------------------------------------------------------------------------------

changing permisions to execute these scripts.

-----------------------------------------------------------------------------------






-----------------------------------------------------------------------------------
idea:
-----------------------------------------------------------------------------------


# first part : 

 	1. run wrapper.sh script 
 	2. using g++ to compile p.cpp and placing it in bin folder.
 	3. this invokes first generate.sh script 
 		- first clear the directories T and S to avoid duplicates;
 		- in this script first take N as input and place it in a file g_in2 to be used in reduce.sh;
 		- then generate N random test cases with two integer numbers;
 		- both positive and negative;
 	4. while generating the test case executing it using the compiled p.cpp;
 	5. after all these are generated and executed running gcov with flags -b and -c as told in class
 		- (-b ) for branch probabilities and (-c) for branch count;
 	6. againg running gcov and directing output to a file g_out1;
 	   then running a python program to extract the branch_coverage of the test case;
 	7. this python program will place output to a file g_in1;
-----------------------------------------------------------------------------------
# SEcond part:

	(the bracnch coverages extracted as non-negative integers);
	1.  reading k as input ;
	2.  taking gen as a variable and giving it value as branch_coverage of the testcases executed in
	    generate.sh script from the file g_in1;
	3.  reading N from the file g_in2 which was placed when N was read in generate.sh;
	4.  setting counter c=0 to check the counts of while commands upto 500 (can be made more);
	5.  in while loop:
		- resetting gcov by again compiling the same program p.cpp;
		- setting gh=0 ; so that test cases taken is upto k not more than K;
		- then looping from 1 to N and taking only K cases using gh as counter.
		- then placing these cases in S directory and also executing them from the p.cpp file compiled.
		- if gh exceeds k then breaking the loop;

	6.  After coming from the for loop and after executing atmost gh (<=k) testcases from the randomly 
	    generated cases doing a gcov and redirecting the output to file g_out2;
	7.  running a python program to extract the branch_coverage of these executed atmost gh testcases;
	8.  directing this output to g_in2 file;
	9.  taking this value in variable name VARIABLE by reading from file g_in2;
	10. echoing these values to see the values
	11. calculating the difference of these values as a variable delta;
	12. then checking if the delta value is feasible by comparing it with an arbitrary value (say 13).
	13. if the above condition is met and we are able to find such value with (branch_coverage+-delta);
		then breaking the while loop as we found the reduced test suit .
	14. else removing the testcases from the S directory and setting counter by doing ((c++));
	15. again repeating these steps to get reduced tests.

-----------------------------------------------------------------------------------
# third part:

	1. then in wrapper.sh doing gcov to get the details of the last branch_coverage of the reduced-test suits
	2. able to see test case for the sample program.


-----------------------------------------------------------------------------------

# steps : 

1.	making a sample program as p.cpp
2.  with many branches.
3.  learned to read input in bash from a youtube video.
	(https://www.youtube.com/watch?v=dHS8bXsloHo)
4.  then generate a random number using RANDOM.
5.  then using if else statement to randomise the number of digits to 
	get some fair numbers using a moulo operator and storing result in a 
	variable in q in generate.sh and based on the value of the q generating the value 
	of the numbers with those many digits with high probability.
	(this thing came from a comment on forum about selecting a 8 digit number)
6. 	then checking coverage using gcov
7.  then in reduce.sh i needed N which was in genrate.sh so i made a file and readirected the
	value of the variable in the file and in reduce.sh taking that value using cat command;
8.  after reading k i tried to select testcases from N tests using two variable a,b and a 
	counter that tells how much cases are considered .
9. 	then after executing atleast gh numbers of test cases using gcov, tried to get branch 
	coverage of these reduces tests.
10. now i was confused how should i compare both the coverages so I tried to make a program
	branch_coverage.py to get the branch coverage as some integer value leaving fractional part.
	------------------------------------
		File 'p.cpp'
		Lines executed:91.67% of 24
		Branches executed:92.86% of 56
		Taken at least once:62.50% of 56
		Calls executed:84.62% of 13
		Creating 'p.cpp.gcov'

		File '/usr/include/c++/9/iostream'
		No executable lines
		No branches
		No calls
		Removing 'iostream.gcov'
	------------------------------------
11. this was the ouptput of gcov in some case so i needed the value ing 3 line only 
	so i only targeted the value 92 and placed it in other file and using cat taking that 
	value in a VARIABLE then i have both the original and this suit's  coverage .
12. making the variable delta to store difference of these two variables
13. then comparing this value to an arbitrary so that branch coverage in that range is
	feasible for the reduced suit.
14. if not the case then removing all the test_cases in S folder to avoid duplicacy and 
	maintaing the number of test case in the folder to be upto K;
15. this is how i came to this solution.
16. only run ./wrapper.sh
17. cleaning intermediate files at the end of the process such as g_in1,g_in2 and g_out1 and
	g_out2 and files occured during compilation using flags.

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

# difficulties i faced : 


1.  i was unable to make a program itself in reduce.sh to extract the branch coverage of the
	test suits so i placed the coverage output to some files and used those via cat command
	after passing them via a python program.

2.  i faced problem in exporting N as variable from generate.sh to reduce.sh i tried
	but it didn't work using export so again i palced it in a file and used that in reduce.sh
	via cat command.

	