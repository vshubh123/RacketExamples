# Michael Marona
# bin.py : Given a number, will take the fraction and represent it in a binary format

def printDecToBin(m):

	# Print the whole number
	print(bin(round(m // 1)), ".", end="")

	# obtain the fractional part of the number
	temp = m - (m // 1)
	counter = 1

	# Loop to see which bits should be set
	while counter != 24:
		if (temp - 2 ** (counter * -1)) >= 0:
			print("1", end="")
			temp = temp - (2 ** (counter * -1))
		else:
			print("0", end="")
		counter = counter + 1

# printDecToBin(1098.8449351194)
# print(bin(1098))

