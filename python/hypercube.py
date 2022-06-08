import math
import random
import glob, os

class HyperCube:

	def __init__(self, NTT_type='NR', NTT_param=[32, 2**32-639, -1591788670], d=4, A=[]): # NTT_type: RN or NR,  N: number of NTT points (power-of-2), d: number of processors (power-of-2)  A: an instance for input array [a0,a1,...a_{N-1}]
		self.NTT_type = NTT_type
		self.N = NTT_param[0]
		self.q = NTT_param[1]
		self.psi = NTT_param[2] # 2N-th primitive root of unity (mod q)
		self.d = d 
		self.A = A
		self.logN = int(math.log(self.N,2))
		self.logd = int(math.log(self.d,2))
		self.N_inv = HyperCube.modinv(self.N, self.q)
		self.psi_inv = HyperCube.modinv(self.psi, self.q)
		self.status = [] # represent FFT shorthand notation, initially set as [i_{logN-1},i_{logN-2},...,i_1,i_0]
		self.processor_connection = [] # represent the inter-connections between processors, it has d/2 pairs of connection
		self.processor_elts = [] # represent the collection of nodes(a_i) residing in each processor(P_j)
		self.processor_elts_real = []
		self.flag_hollow = [] # index position for bit swapping 
		self.flag_solid = [] # index position for NTT distance
		self.twiddle_factor = [] #  twiddle factors used in each round, number of twiddle factors = 1/2 * N/d * d
		self.twiddle_factor_real = []

		self.twiddle_factors_LUT = [] # twiddle factor look-up table used in hardware implementation
		self.twiddle_factors_LUT_real = []
		self.init_status()


	@staticmethod
	def egcd(a, b):
		if a == 0:
			return (b, 0, 1)
		else:
			g, y, x = HyperCube.egcd(b % a, a)
			return (g, x - (b // a) * y, y)

	@staticmethod
	def modinv(a, m): # a^{-1} mod m
		a = a%m # normalize a if negative
		g, x, y = HyperCube.egcd(a, m)
		if g != 1:
			raise Exception('modular inverse does not exist')
		else:
			return x % m

	def extractNumfromStr(self, string):
		return int(''.join([n for n in string if n.isdigit()]))

	def extractBitfromInt(self, integer, position): # extract the i_position-th bit from an integer I = |i_max-1,...,i_0|
		if position > self.logN-1 or position < 0:
			raise Exception('position must be in [0,1,...,self.logN-1]!')
		bin_repr = "{0:b}".format(integer).zfill(self.logN)
		return int(bin_repr[self.logN-1-position])

	def convertBitstoInt(self, bit_list): # convert [i_k, i_{k-1}, ... , i_0] to I, msb-first
		length = len(bit_list)
		integer = 0
		for i in range(length):
			integer += bit_list[i]*(2**(length-1-i))
		return integer

	def print_status(self, mode = ''):
		print ('flag_hollow: ' + str(self.flag_hollow))
		print ('flag_solid: ' + str(self.flag_solid))
		print ('status: ' + str(self.status))
		print ('processor_elts: ' + str(self.processor_elts))
		print ('twiddle_factors: ' + str(self.twiddle_factor))
		print ('processor_connection: ' + str(self.processor_connection))
		if mode == 'verbose': # print out twiddle factor table used in hardware implementation
			print ('twiddle_factors_LUT: ' + str(self.twiddle_factors_LUT))

		if self.A: # if concrete instance provided, print out 'real'
			print ("processor_elts_real: " + str(self.processor_elts_real))
			print ("twiddle_factor_real: " + str(self.twiddle_factor_real))
			if mode == 'verbose':
				print ('twiddle_factors_LUT_real: ' + str(self.twiddle_factors_LUT_real))
				for i in range(len(self.twiddle_factors_LUT_real)):
					file_out = open("./P{i}_twiddle_factors_LUT.txt".format(i = i), 'a')
					for item in self.twiddle_factors_LUT_real[i]:
						file_out.write(str(item)+'\n')
					file_out.close()



	def getNTTresult(self, round_i): # round_i = 1, 2, ..., logN or (logN+1)
		self.init_status()
		self.update_status(round_i)

		processor_elts = self.processor_elts
		processor_elts_real = self.processor_elts_real
		distance = int(self.d/2)
		idx, A_reshape = 0, [None]*self.N # prepare the data in A_reshape in natural order

		if self.NTT_type == 'NR':
			for i in range(distance):
				for item in processor_elts_real[i]:
					A_reshape[idx] = item
					idx = idx + 1
				for item in processor_elts_real[i+distance]:
					A_reshape[idx] = item
					idx = idx + 1
				
		elif self.NTT_type == 'RN':
			for i in range(0,self.d,2): # first extract even terms
				for item in processor_elts_real[i]:
					A_reshape[idx] = item*self.N_inv%self.q # include the 1/N factor
					idx = idx + 1	
			for i in range(1,self.d,2):	# then extract odd terms
				for item in processor_elts_real[i]:
					A_reshape[idx] = item*self.N_inv%self.q # include the 1/N factor
					idx = idx + 1			

		return (processor_elts, processor_elts_real, A_reshape)



	def init_status(self):
		self.status = []
		self.processor_connection = [] # represent the inter-connections between processors, it has d/2 pairs of connection
		self.processor_elts = [] # represent the collection of nodes(a_i) residing in each processor(P_j)
		self.flag_hollow = [] # index position for bit swapping 
		self.flag_solid = [] # index position for NTT distance
		self.twiddle_factor = [] #  twiddle factors used in each round, number of twiddle factors = 1/2 * N/d * d

		if self.NTT_type == 'NR':
			for i in range(self.logN):
				self.status.append('i{i}'.format(i = self.logN-1-i))
			self.flag_hollow = ['n.a.', 'n.a.'] 
			self.flag_solid = ['n.a.']

		elif self.NTT_type == 'RN':
			for i in range(self.logN):
				self.status.append('i{i}'.format(i = i))
			self.flag_hollow = ['n.a.', 'n.a.'] 
			self.flag_solid = ['n.a.']

		else:
			raise Exception('NTT_type can either be NR or RN!')

		for i in range(self.d):
			collect = []
			for j in range(int(self.N/self.d)):
				collect.append('a{k}'.format(k = i*int(self.N/self.d)+j))
			self.processor_elts.append(collect)

		for i in range(self.d):
			bin_repr = "{0:b}".format(i).zfill(self.logd)
			collect = []
			if bin_repr[0] == '0': # if the leading bit is 0, then do it.
				collect.append('n.a.')
				collect.append('n.a.')
				self.processor_connection.append(collect)

		for i in range(self.d):
			collect = []
			for j in range(int(self.N/(2*self.d))):
				collect.append('n.a.')
			self.twiddle_factor.append(collect)

		self.init_status_real();

	def update_status(self, round_num):	# update status to Round-i (i=1,2,...,logN)
		if self.NTT_type == 'NR':
			for i in range(self.logN): # in total logN rounds
				if i <= self.logd: # valid only when i is [0,1,...,logd]
					# update flag_hollow, flag_solid
					self.flag_hollow = [self.status[i%self.logd], self.status[self.logd]]
					self.flag_solid = ['i{i}'.format(i = self.logN-1-i)]

					# update status according to flag_hollow
					a, b = self.status.index(self.flag_hollow[0]), self.status.index(self.flag_hollow[1])
					self.status[b], self.status[a] = self.status[a], self.status[b]
					
					# update processor_connection according to the round_num
					self.processor_connection = []
					for j in range(self.d):
						bin_repr = "{0:b}".format(j).zfill(self.logd)
						collect = []
						if bin_repr[i%self.logd] == '0': # if the target bit is 0, then do it s.t. all processors are evenly paired
							#print(bin_repr)	
							collect.append('P{j}'.format(j = j))
							collect.append('P{j}'.format(j = j+2**(self.logd-1-i%self.logd)))
							self.processor_connection.append(collect)

					# update inner elements in every processor
					for pair in self.processor_connection:
						list0 = self.processor_elts[self.extractNumfromStr(pair[0])]
						list1 = self.processor_elts[self.extractNumfromStr(pair[1])]
						# swap the last half of list0 with the first half of list1
						for j in range(int(len(list0)/2)):
							a, b = list0[int(len(list0)/2+j)], list1[j]
							list0[int(len(list0)/2+j)], list1[j] = b, a

				else: # when i > logd, no swap performed
					self.processor_connection = []
					for j in range(int(self.d/2)):
						self.processor_connection.append(['n.a.', 'n.a.'])
					self.flag_hollow = ['n.a.', 'n.a.']
					self.flag_solid = ['i{i}'.format(i = self.logN-1-i)]


				# update twiddle_factor by the newly updated processor_elts
				tmp = [0] * (self.logN-1) # tmp list keeps the exponent of twiddle factor, e.g. [0,0,0,0]->[i4,0,0,0]->[i3,i4,0,0]->[i2,i3,i4,0]->[i1,i2,i3,i4] according to i=[i4,i3,i2,i1,i0] (in some sense, right shift operation)
				for j in range(self.d): # search the elts in processor Pj
					if i > self.logd:
						num_butterfly_blk = 2**(i-self.logd) # inter-processor butterfly computatation
					else:
						num_butterfly_blk = 1	# extra-processor butterfly computation
					size_butterfly_blk = int(self.N/(num_butterfly_blk*self.d))
					for k in range(num_butterfly_blk):
						for l in range(int(size_butterfly_blk/2)):
							integer = self.extractNumfromStr(self.processor_elts[j][k*size_butterfly_blk+l]) # recall that integer is arranged by the index [i4 i3 i2 i1 i0]
							# fill tmp(has logN-1 bit) to determine the value of twiddle factor in round-i(i=0,1,...,logN-1), using two loops for m
							for m in range(i): 
								tmp[m] = self.extractBitfromInt(integer, self.logN-i+m)
							for m in range(i, self.logN-1):
								tmp[m] = 0
							self.twiddle_factor[j][int(k*(size_butterfly_blk/2)+l)] = 'psi_{v}'.format(v=self.convertBitstoInt(tmp)*2+2**(self.logN-1-i)) 									
							# self.twiddle_factor[j][int(k*(size_butterfly_blk/2)+l)] = 'w_{v}'.format(v=self.convertBitstoInt(tmp)) 

				# update twiddle_factors_LUT by the newly updated twiddle_factor
				self.twiddle_factors_LUT = []
				if i <= self.logd:
					read_num = 1
				else:
					read_num = 1 <<	(i-self.logd)
				for item in self.twiddle_factor:
					tmp = []
					for j in range(read_num):
						tmp.append(item[int(j*self.N/(2*self.d*read_num))]) # extractor gap = N/(2d*read_num)
					self.twiddle_factors_LUT.append(tmp)


				self.update_status_real(i) # update the real instance in round-i

				if i+1 == round_num:
					break # output the status at iteration = round_num

		elif self.NTT_type == 'RN':
			for i in range(self.logN + 1):	 # in total, logN+1 rounds
				if i >= self.logN-self.logd: # valid only when i is [logN-logd,...,logN]
					# update flag_hollow, flag_solid
					self.flag_hollow = [self.status[(self.logN-1-i)%self.logd], self.status[self.logd]]
					if i != self.logN:
						self.flag_solid = ['i{i}'.format(i = self.logN-1-i)]
					else:
						self.flag_solid = ['n.a.']	

					# update status according to flag_hollow
					a, b = self.status.index(self.flag_hollow[0]), self.status.index(self.flag_hollow[1])
					self.status[b], self.status[a] = self.status[a], self.status[b]	

					# update processor_connection according to the round_num
					self.processor_connection = []
					for j in range(self.d):
						bin_repr = "{0:b}".format(j).zfill(self.logd)
						collect = []
						if bin_repr[(self.logN-1-i)%self.logd] == '0': # if the target bit is 0, then do it s.t. all processors are evenly paired
							#print(bin_repr)	
							collect.append('P{j}'.format(j = j))
							collect.append('P{j}'.format(j = j+2**(self.logd-1-(self.logN-1-i)%self.logd)))
							self.processor_connection.append(collect)

					# update inner elements in every processor
					for pair in self.processor_connection:
						list0 = self.processor_elts[self.extractNumfromStr(pair[0])]
						list1 = self.processor_elts[self.extractNumfromStr(pair[1])]
						# swap the last half of list0 with the first half of list1
						for j in range(int(len(list0)/2)):
							a, b = list0[int(len(list0)/2+j)], list1[j]
							list0[int(len(list0)/2+j)], list1[j] = b, a
				else:
					self.flag_hollow = ['n.a.', 'n.a.']
					self.flag_solid = ['i{i}'.format(i = self.logN-1-i)]

				# update twiddle_factor by the newly updated processor_elts
				if i != self.logN: # if not the final round, update twiddle_factor list
					tmp = [0] * (self.logN-1) # tmp list keeps the exponent of twiddle factor, e.g. [i3,i2,i1,i0]->[i2,i1,i0,0]->[i1,i0,0,0]->[i0,0,0,0]->[0,0,0,0] according to i=[i0,i1,i2,i3,i4] (with N=32)
					for j in range(self.d): # search the elts in processor Pj
						if i > self.logN-self.logd:
							num_butterfly_blk = 1 # extra-processor butterfly computation
						else:
							if int((self.N/self.d)/2**(i+1)) == 0:
								num_butterfly_blk = 1;
							else:	
								num_butterfly_blk = int((self.N/self.d)/2**(i+1)) # intra-processor butterfly computation
						size_butterfly_blk = int(self.N/(num_butterfly_blk*self.d))
						for k in range(num_butterfly_blk):
							for l in range(int(size_butterfly_blk/2)):
								integer = self.extractNumfromStr(self.processor_elts[j][k*size_butterfly_blk+l])
								# fill tmp to determine the value of twiddle factor in round-i(i=0,1,...,logN), using two loops for m
								for m in range(0, self.logN-1-i):
									tmp[m] = self.extractBitfromInt(integer, i+1+m)
								for m in range(self.logN-1-i, self.logN-1):
									tmp[m] = 0
								self.twiddle_factor[j][int(k*(size_butterfly_blk/2)+l)] = 'psi_inv_{v}'.format(v=self.convertBitstoInt(tmp)*2+2**(i))
	
				else: # recall that in the final round, invalidate the twiddle_factor list
					num_butterfly_blk = 1
					size_butterfly_blk = int(self.N/(num_butterfly_blk*self.d))
					for j in range(self.d):
						for k in range(num_butterfly_blk):
							for l in range(int(size_butterfly_blk/2)):
								self.twiddle_factor[j][int(k*(size_butterfly_blk/2)+l)] = 'n.a.' 

				self.update_status_real(i) # update the real instance in round-i				

				if i+1 == round_num:
					break
		


	def init_status_real(self): # initialize status for a real instance of [a0,a1,...,aN-1]
		if len(self.A) != self.N:
			raise Exception("The input NTT array must have N elements!")
		self.twiddle_factor_real = [['n.a.']*int(self.N/(2*self.d)) for _ in range(self.d)]
		self.processor_elts_real = [] # represent the collection of nodes(a_i) residing in each processor(P_j)
		for i in range(self.d):
			collect = []
			for j in range(int(self.N/self.d)):
				collect.append(self.A[i*int(self.N/self.d)+j]) # assign the real instance A[k=i*(N/d)+j] to Processor P's
			self.processor_elts_real.append(collect)


	def update_status_real(self, i): # update the status of a real NTT instance in round-i, according to the more abstract description returned by update_status()
		if self.NTT_type == 'NR':
			if i <= self.logd: # data swapping is valid only when i belongs to [0,1,...,logd]					
				# update inner elements in every processor
				for pair in self.processor_connection:
					list0 = self.processor_elts_real[self.extractNumfromStr(pair[0])]
					list1 = self.processor_elts_real[self.extractNumfromStr(pair[1])]
					# swap the last half of list0 with the first half of list1
					for j in range(int(len(list0)/2)):
						a, b = list0[int(len(list0)/2+j)], list1[j]
						list0[int(len(list0)/2+j)], list1[j] = b, a

			# update twiddle_factor_real by the newly updated twiddle_factor
			for j in range(self.d): # search the elts in processor Pj
				for k in range(int(self.N/(2*self.d))):
					self.twiddle_factor_real[j][k] = pow(self.psi, self.extractNumfromStr(self.twiddle_factor[j][k]), self.q)
					
			# update twiddle_factors_LUT_real by the newly update twiddle_factors_LUT
			self.twiddle_factors_LUT_real = []
			for item in self.twiddle_factors_LUT:
				tmp = []
				for l in range(len(item)):
					tmp.append(pow(self.psi, self.extractNumfromStr(item[l]), self.q))
				self.twiddle_factors_LUT_real.append(tmp)

			# update processor_elts_real by the newly updated twiddle_factor_real
			for j in range(self.d): # search the elts in processor Pj
				if i > self.logd:
					num_butterfly_blk = 2**(i-self.logd) # inter-processor butterfly computatation
				else:
					num_butterfly_blk = 1	# extra-processor butterfly computation
				size_butterfly_blk = int(self.N/(num_butterfly_blk*self.d))
				distance = int(size_butterfly_blk/2)
				idx = 0
				for k in range(num_butterfly_blk):
					for l in range(distance):
						#perform butterfly computation on every element in processor_elts_real
						tmp0 = (self.processor_elts_real[j][k*size_butterfly_blk+l] + self.twiddle_factor_real[j][idx]*self.processor_elts_real[j][k*size_butterfly_blk+l+distance])%self.q
						tmp1 = (self.processor_elts_real[j][k*size_butterfly_blk+l] - self.twiddle_factor_real[j][idx]*self.processor_elts_real[j][k*size_butterfly_blk+l+distance])%self.q
						self.processor_elts_real[j][k*size_butterfly_blk+l], self.processor_elts_real[j][k*size_butterfly_blk+l+distance] = tmp0, tmp1
						idx = idx + 1
						
			# print("--------Debug information(Round-{i}):------------".format(i = i+1))
			# print(self.twiddle_factor)
			# print(self.twiddle_factor_real)
			# print(self.processor_elts)
			# print(self.processor_elts_real)

		elif self.NTT_type == 'RN':
			if i >= self.logN-self.logd: # valid only when i is [logN-logd,...,logN]	
				# update inner elements in every processor
				for pair in self.processor_connection:
					list0 = self.processor_elts_real[self.extractNumfromStr(pair[0])]
					list1 = self.processor_elts_real[self.extractNumfromStr(pair[1])]
					# swap the last half of list0 with the first half of list1
					for j in range(int(len(list0)/2)):
						a, b = list0[int(len(list0)/2+j)], list1[j]
						list0[int(len(list0)/2+j)], list1[j] = b, a			

			# update twiddle_factor_real by the newly updated twiddle_factor
			if i != self.logN:
				for j in range(self.d): # search the elts in processor Pj
					for k in range(int(self.N/(2*self.d))):
						self.twiddle_factor_real[j][k] = pow(self.psi_inv, self.extractNumfromStr(self.twiddle_factor[j][k]),self.q)	
						
				# update processor_elts_real by the newly updated twiddle_factor_real
				for j in range(self.d): # search the elts in processor Pj
					if i > self.logN-self.logd:
						num_butterfly_blk = 1 # extra-processor butterfly computation
					else:
						if int((self.N/self.d)/2**(i+1)) == 0:
							num_butterfly_blk = 1;
						else:	
							num_butterfly_blk = int((self.N/self.d)/2**(i+1)) # intra-processor butterfly computation
					size_butterfly_blk = int(self.N/(num_butterfly_blk*self.d))
					distance = int(size_butterfly_blk/2)
					idx = 0
					for k in range(num_butterfly_blk):
						for l in range(distance):
							#perform butterfly computation on every element in processor_elts_real, be cautious that 1/N is not included in the calculation
							tmp0 = (self.processor_elts_real[j][k*size_butterfly_blk+l] + self.processor_elts_real[j][k*size_butterfly_blk+l+distance])%self.q
							tmp1 = (self.processor_elts_real[j][k*size_butterfly_blk+l] - self.processor_elts_real[j][k*size_butterfly_blk+l+distance])*self.twiddle_factor_real[j][idx]%self.q
							self.processor_elts_real[j][k*size_butterfly_blk+l], self.processor_elts_real[j][k*size_butterfly_blk+l+distance] = tmp0, tmp1
							idx = idx + 1	
			else:
				for j in range(self.d):
					for k in range(int(self.N/(2*self.d))):
						self.twiddle_factor_real[j][k] = float('NaN')

			# print("--------Debug information(Round-{i}):------------".format(i = i+1))
			# print(self.twiddle_factor)
			# print(self.twiddle_factor_real)
			# print(self.processor_elts)
			# print(self.processor_elts_real)

# #############################
# ## system params for N = 32
# #############################												
# N = 32 # number of NTT points
# d = 2**(2) # number of prcoessors, be in range [2,...,N/2]
# q = 4294966657
# psi = 2703177987
# omega = psi*psi%q

#############################
## system params for N = 256
#############################
# N = 256 # number of NTT points
# d = 2**(2) # number of prcoessors, be in range [2,...,N/2]
# q = 4294962689
# psi = 2906121546
# omega = psi*psi%q

#############################
## system params for N = 1024
#############################
N = 1024 # number of NTT points
d = 2**(2) # number of prcoessors, be in range [2,...,N/2]
q = 4294957057
psi = 2631753170
omega = psi*psi%q

# FILE IO interface
for f in glob.glob("*.txt"): # remove all txt files in the folder
	os.remove(f)

file_in = open("./NTT_points_in.txt", 'w')
file_out = open("./NTT_points_out.txt", 'w')

# Test NTT_NR part
print ("---------Test NTT_NR begin-----------")
NTT_type = 'NR'
logN = int(math.log(N,2))
logd = int(math.log(d,2))
A = [1]*N
# random.seed(10)  # set a fixed seed for RNG
for i in range(N):
	# A[i] = i
	A[i] = random.randint(0,q-1)
	file_in.write(str(A[i])+'\n')
file_in.close()

inst = HyperCube(NTT_type, [N, q, psi], d, A)

inst.print_status()
print ("\n")

if NTT_type == 'NR':
	round_num = logN
else:
	round_num = logN + 1

for k in range(round_num): # NR has logN rounds;  RN has logN + 1 rounds
	inst.init_status()
	inst.update_status(k+1) # round-1,2,...
	print("############ Round-{i} information ##########".format(i=k+1))
	inst.print_status('verbose')
	print ("\n")

[processor_elts, processor_elts_real, A_ntt] = inst.getNTTresult(round_num)
# print ('processor_elts: {i}'.format(i=processor_elts))
# print ('processor_elts_real: {i}'.format(i=processor_elts_real))
for i in range(len(processor_elts_real)):
	for item in processor_elts_real[i]:
		file_out.write(str(item)+'\n')
file_out.close()
# print ('A_ntt: {i}'.format(i=A_ntt)) # A_ntt in bit-reverse-order
print ("---------Test NTT_NR end-----------")


# # Test NTT_RN part
# print ("---------Test NTT_RN begin-----------")
# NTT_type = 'RN'
# inst = HyperCube(NTT_type, [N, q, psi], d, A_ntt)

# inst.print_status()
# print ("\n")

# if NTT_type == 'NR':
# 	round_num = logN
# else:
# 	round_num = logN + 1

# for k in range(round_num): # NR has logN rounds;  RN has logN + 1 rounds
# 	inst.init_status()
# 	inst.update_status(k+1) # round-1,2,...
# 	print("############ Round-{i} information ##########".format(i=k+1))
# 	inst.print_status()
# 	print ("\n")

# [processor_elts, processor_elts_real, A_ntt_intt] = inst.getNTTresult(round_num)
# print (processor_elts)
# print (processor_elts_real)
# print (A_ntt_intt)
# print ("---------Test NTT_RN end-----------")

# if A == A_ntt_intt:
# 	print ("HyperCube NTT correctness test passed.")
# else:
# 	print ("HyperCube NTT correctness test failed!")	