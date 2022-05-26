l="l"
for i in range(5):
	g=list(map(str,input().split()))
	if('Branches' in g):
		l=g[1]
		break

# s='VARIABLE="' 
s=""
for i in l:
	if(ord(i)<ord('A') ):
		if(i!=':' and i!='%'):
			if(i=='.'):
				break;
			s+=i
# s+='"'
print(s,end="")