#include<iostream>
using namespace std;

int main(){	
	int a,b;
	cin >> a >> b;

	if(a>0 && b>0){
		if(a>b){
			cout << "a > b    and  ";
		}
		else if(b>a){
			cout << "a < b    and  ";
		}
		else if(b==a){
			cout << "a == b   and  ";
		}
	}
	else if(a==0||b==0){
		if(a==0 && b!=0){
			cout << "a=0 , b!=0    and  ";
		}
		else if(b==0 && a!=0){
			cout << "b=0 , a!=0    and  ";
		}
		else {
			cout << "a==0 , b==0    and  ";
		}
	}
	else {
		if(a>0 && b<0){
			cout << "a>0 , b<0    and  ";
		}
		else {
			cout << "a<0 , b>0    and  ";
		}
	}
	if(a+b==0){
		cout << "sum is 0 \n";
	}
	else if(a+b<0){
		cout << "sum is less than 0 \n";
	}
	else cout << "sum is more than 0 \n";
  return 0;
}
