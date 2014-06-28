def decToBin(m):
	#print(bin((m // 1)), ". ")
	temp = m // 1
	#print(bintemp)
	temp = m - (m // 1)
	counter = 1
	while counter != 24:
		if (temp - 2 ** (counter * -1)) >= 0:
			print("1 ")
			temp = temp - (2 ** (counter * -1))
		else:
			print("0 ")
		counter = counter + 1

decToBin(1098.8449351194)
print(bin(1098))

