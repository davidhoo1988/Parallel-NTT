# -*- coding: utf-8 -*-

import numpy as np
import random
import math
import copy
# np.set_printoptions(threshold=np.inf)

class NTT:
	def __init__(self, NTT_param):
		self.N = NTT_param[0]
		self.qbit = NTT_param[1]
		# self.q = NTT_param[1]
		# self.psi = NTT_param[2]%self.q
		self.q, self.psi = NTT.NTT_paramGen(self.N, self.qbit)
		self.psi_inv = NTT.modinv(self.psi, self.q)
		self.omega = (self.psi*self.psi)%self.q
		self.omega_inv = NTT.modinv(self.omega, self.q)

		# create ntt-forward-transform matrix
		self.ntt_forward = [[0]*self.N for _ in range(self.N)]
		for i in range(self.N):
			base = pow(self.omega, i, self.q)
			for j in range(self.N):
				self.ntt_forward[i][j] = pow(base, j, self.q)

		# create ntt-backward-transform matrix
		self.ntt_backward = [[0]*self.N for _ in range(self.N)]
		for i in range(self.N):
			base = pow(self.omega_inv, i, self.q)
			for j in range(self.N):
				self.ntt_backward[i][j] = pow(base, j, self.q)

		# create pre-processing and post-processing lists
		self.psi_list = [None]*self.N
		self.psi_inv_list = [None]*self.N
		for i in range(self.N):
			self.psi_list[i] = pow(self.psi, i, self.q)
			self.psi_inv_list[i] = pow(self.psi_inv, i, self.q)


	

	@staticmethod
	def NTT_paramGen(N, qbit):
		# Find the biggest modulus q s.t. q = 1 mod 2N
		for i in range(100000):
			if NTT.is_prime(2**qbit-i) and (2**qbit-i)%(2*N) == 1:
				q = 2**qbit-i
				print ("Prime q = 2^" + str(qbit)+ "-" + str(i) + ' = ' + str(q))
				break
			if i == 100000-1:
				raise Exception("cannot find the prime q in NTT_paramGen(qbit, N)!")

		# find the primitive root of unity, the algorithm is implemented according to https://math.stackexchange.com/questions/158344/how-to-find-the-solutions-for-the-n-th-root-of-unity-in-modular-arithmetic
		prime_factor = NTT.factor(q-1)
		# print ("primitive generator of q is: " + str(prime_factor))
		testv = [int((q-1)/i) for i in prime_factor]
		for gen in range(1, q):
			flag = True
			gen = gen%q
			for v in testv:
				if pow(gen,v,q) == 1:
					flag = False
					break
			if flag == True:
				print ("2N-th primitive root of q is: " + str(pow(gen,int((q-1)/(2*N)), q)))
				break

		return (q, pow(gen,int((q-1)/(2*N)), q)) # return the prime number q and the 2N-th primitive root of unity (mod q) a.k.a. psi

	@staticmethod
	def factor(nr): # https://stackoverflow.com/questions/43129076/prime-factorization-of-a-number
		i = 2
		factors = []
		while i <= nr:
			if (nr % i) == 0:
				factors.append(i)
				nr = nr / i
			else:
				i = i + 1
		return factors

	@staticmethod
	def is_prime(n): # https://stackoverflow.com/questions/15285534/isprime-function-for-python-language/15285588
		if n == 2 or n == 3: return True
		if n < 2 or n%2 == 0: return False
		if n < 9: return True
		if n%3 == 0: return False
		r = int(n**0.5)
		# since all primes > 3 are of the form 6n ± 1
		# start with f=5 (which is prime)
		# and test f, f+2 for being prime
		# then loop by 6. 
		f = 5
		while f <= r:
			# print('\t',f)
			if n % f == 0: 
				return False
			if n % (f+2) == 0: 
				return False
			f += 6
		return True  

	@staticmethod
	def egcd(a, b):
		if a == 0:
			return (b, 0, 1)
		else:
			g, y, x = NTT.egcd(b % a, a)
			return (g, x - (b // a) * y, y)

	@staticmethod
	def modinv(a, m):
		g, x, y = NTT.egcd(a, m)
		if g != 1:
			raise Exception('modular inverse does not exist')
		else:
			return x % m

	@staticmethod
	def bitreverse(integer, bit_width):
		b = '{:0{width}b}'.format(integer, width=bit_width)
		return int(b[::-1], 2)

	
	@staticmethod
	def Barret_init(q):
		# precompute for Barret reduction
		k = math.ceil(math.log(q,2))
		r = ( 1 << 2*k )//q		
		return (r, k)

	@staticmethod
	def Barret_reduce(x, r, k, q): # x%q with a pre-computed factor r. For details, refer to https://www.nayuki.io/page/barrett-reduction-algorithm
		# Barret reduction works only if 0 <= x < q^2
		t = x - ((x*r) >> 2*k)*q
		# print ('xr : ', x*r)
		# print ('(x*r) >> 2*k : ', (x*r) >> 2*k)
		# print ('((x*r) >> 2*k)*q : ', ((x*r) >> 2*k)*q)
		# print ('x - ((x*r) >> 2*k)*q : ', x - ((x*r) >> 2*k)*q)
		if t < q:
			return t 
		else:
			return t-q

	# standard but slow NTT computation based on matrix-vector multiplication
	def NTT_forward(self, A): # A is a list of polynomial coefficients over Z_q
		# first perform pre-processing on A
		# A_vector = (np.array(A, dtype='object') * np.array(self.psi_list))%self.q
		A_vector = np.empty(len(A), dtype='object')
		(r, k) = NTT.Barret_init(self.q)
		print ("Barret params: r = {r}, k = {k}".format(r = r, k = k))
		for i in range(len(A)):
			A_vector[i] = NTT.Barret_reduce(A[i]*self.psi_list[i], r, k, self.q)
		# then perform standard N-point NTT
		ntt_forward_matrix = np.array(self.ntt_forward, dtype='object')
		return (ntt_forward_matrix.dot(A_vector)%self.q).tolist()

	def NTT_backward(self, A): # A is a list of NTT evaluation points
		# first perform standard N-point NTT
		ntt_backward_matrix = np.array(self.ntt_backward, dtype='object')
		A_vector = np.array(A, dtype='object')
		A_vector = (ntt_backward_matrix.dot(A_vector)*NTT.modinv(self.N,self.q))%self.q
		# then perform post-processing on A
		return (A_vector*np.array(self.psi_inv_list, dtype='object')%self.q).tolist()
		# return (A_vector*1%self.q).tolist()

	# fast NTT computation based on CT-butterfly (or DIT_{NR}), implemented Chapter 7 of the book 'Inside FFT Black Box: Serial & Parallel FFT Algorithms' 
	def NTT_forward_ct(self, A, type='twiddle_merged'):
		if type != 'twiddle_merged':
			# initialize omega list in bit-reversed-order
			N = self.N
			q = self.q
			omega = self.omega
			omega_reverse_list = [None]*int(N/2)
			for i in range(int(N/2)):
				omega_reverse_list[i] = pow(omega, NTT.bitreverse(i,int(math.log(N/2,2))), q) # table for stand N-point NTT

			# initialize Barret reduction parameters
			(r,k) = NTT.Barret_init(q)

			# start CT-butterfly computation for all logN rounds
			PairsInGroup, NumofGroups, Distance = int(N/2), 1, int(N/2)
			A_dc = copy.deepcopy(A)
			for i in range(N): # first perform pre-processing on A
				A_dc[i] = A_dc[i]*self.psi_list[i]%self.q
			B = [None]*N
			while NumofGroups < N:
				for K in range(NumofGroups):
					JFirst = 2*K*PairsInGroup
					JLast = JFirst + PairsInGroup - 1
					Jtwiddle = K
					W = omega_reverse_list[Jtwiddle]
					for J in range(JFirst, JLast+1):
						# Temp = (W * A_dc[J+Distance])%q
						Temp = NTT.Barret_reduce(W * A_dc[J+Distance], r, k, q)
						A_dc[J+Distance] = (A_dc[J] - Temp)%q
						A_dc[J] = (A_dc[J] + Temp)%q
				print("round-{i}".format( i = int(math.log(NumofGroups,2)) + 1 ))
				print(A_dc)
				PairsInGroup = int(PairsInGroup/2)
				NumofGroups = NumofGroups*2 
				Distance = int(Distance/2)
			for i in range(N):
				B[NTT.bitreverse(i, int(math.log(N,2)))] = A_dc[i] # transform B in natural order
			return B
		else: 
			# initialize omega list in bit-reversed-order
			N = self.N
			q = self.q
			logN = int(math.log(N,2))
			omega = self.omega
			omega_reverse_list = [None]*int(N/2)
			psi = self.psi
			for i in range(int(N/2)):
				omega_reverse_list[i] = pow(omega, NTT.bitreverse(i,int(math.log(N/2,2))), q) # table for stand N-point NTT

			# initialize Barret reduction parameters
			(r,k) = NTT.Barret_init(q)
			
			# start CT-butterfly computation for all logN rounds
			PairsInGroup, NumofGroups, Distance = int(N/2), 1, int(N/2)
			A_dc = copy.deepcopy(A)
			B = [None]*N
			while NumofGroups < N:
				for K in range(NumofGroups):
					JFirst = 2*K*PairsInGroup
					JLast = JFirst + PairsInGroup - 1
					Jtwiddle = K
					W = ( omega_reverse_list[Jtwiddle] * pow(psi, 2**(logN-1-int(math.log(NumofGroups,2))), q) )%q # extra care to include psi for computing W
					for J in range(JFirst, JLast+1):
						# Temp = (W * A_dc[J+Distance])%q
						# A_dc[J+Distance] = (A_dc[J] - Temp)%q
						# A_dc[J] = (A_dc[J] + Temp)%q						
						Temp = NTT.Barret_reduce(W * A_dc[J+Distance], r, k, q)
						A_dc[J+Distance] = (A_dc[J] - Temp)%q
						A_dc[J] = (A_dc[J] + Temp)%q
						
				print("round-{i}".format( i = int(math.log(NumofGroups,2)) + 1 ))
				print(A_dc)
				PairsInGroup = int(PairsInGroup/2)
				NumofGroups = NumofGroups*2 
				Distance = int(Distance/2)
			for i in range(N):
				B[NTT.bitreverse(i, int(math.log(N,2)))] = A_dc[i] # transform B in natural order
			return B			

	def NTT_backward_gs(self, A, type='twiddle_merged'): # implemented Chapter 5 of the book 'Inside FFT Black Box: Serial & Parallel FFT Algorithms' 
		if type != 'twiddle_merged':
			# initialize omega list in bit-reversed-order
			N = self.N
			q = self.q
			omega = self.omega_inv
			omega_reverse_list = [None]*int(N/2)
			for i in range(int(N/2)):
				omega_reverse_list[i] = pow(omega, NTT.bitreverse(i,int(math.log(N/2,2))), q)

			# start GS-butterfly computation for all logN rounds
			NumOfProblems, ProblemSize, Distance = 1, N, 1
			B = [None]*N
			for i in range(N): # reshape natural-ordered A to bit-reverse ordered B
				B[NTT.bitreverse(i, int(math.log(N,2)))] = A[i]%q
			# print("put the natural-ordered input to bit-reverse order:")
			# print(B)
			while ProblemSize > 1:
				for JFirst in range(NumOfProblems):
					J, Jtwiddle = JFirst, 0
					while J < N-1:
						W = omega_reverse_list[Jtwiddle]
						Temp = B[J]
						B[J] = (Temp+B[J+Distance])%q
						B[J+Distance] = (Temp-B[J+Distance])*W%q
						Jtwiddle = Jtwiddle + 1
						J = J + 2*NumOfProblems
				# print("round-{i}".format( i = int(math.log(NumOfProblems,2)) + 1 ))
				# print(B)
				NumOfProblems = NumOfProblems*2
				ProblemSize = int(ProblemSize/2)
				Distance = Distance*2

			# then perform post-processing on B, and scaling by the factor of 1/N
			for i in range(N):
				B[i] = B[i]*self.psi_inv_list[i]*NTT.modinv(N,q)%q
			return B # return B in natural order
		else: 
			# initialize omega list in bit-reversed-order
			N = self.N
			q = self.q
			logN = int(math.log(N,2))
			omega = self.omega_inv
			omega_reverse_list = [None]*int(N/2)
			psi = self.psi_inv
			for i in range(int(N/2)):
				omega_reverse_list[i] = pow(omega, NTT.bitreverse(i,int(math.log(N/2,2))), q)

			# start GS-butterfly computation for all logN rounds
			NumOfProblems, ProblemSize, Distance = 1, N, 1
			B = [None]*N
			for i in range(N): # reshape natural-ordered A to bit-reverse ordered B
				B[NTT.bitreverse(i, int(math.log(N,2)))] = A[i]%q
			# print("put the natural-ordered input to bit-reverse order:")
			# print(B)
			while ProblemSize > 1:
				for JFirst in range(NumOfProblems):
					J, Jtwiddle = JFirst, 0
					while J < N-1:
						W = ( omega_reverse_list[Jtwiddle] * pow(psi, 2**int(math.log(NumOfProblems,2)), q) ) %q # extra care to include psi for computing W, method from 
						Temp = B[J]
						B[J] = (Temp+B[J+Distance])*NTT.modinv(2,q)%q
						B[J+Distance] = (Temp-B[J+Distance])*NTT.modinv(2,q)*W%q
						Jtwiddle = Jtwiddle + 1
						J = J + 2*NumOfProblems
				# print("round-{i}".format( i = int(math.log(NumOfProblems,2)) + 1 ))
				# print(B)
				NumOfProblems = NumOfProblems*2
				ProblemSize = int(ProblemSize/2)
				Distance = Distance*2

			# # then perform scaling by the factor of 1/N
			# for i in range(N):
			# 	B[i] = B[i]*NTT.modinv(N,q)%q
			return B # return B in natural order


if __name__ == "__main__":

	N = 1024 # number of NTT points
	qbit = 32


	inst = NTT([N, qbit])

	print ("system params for NTT: N = {N}, q = {q}, psi = {psi}, omega = {omega}\n\n".format(N = inst.N, q = inst.q, psi = inst.psi, omega = inst.omega))


	# test for NTT
	random.seed(10)
	A = [1]*N
	for i in range(N):
		A[i] = random.randint(0,inst.q-1)
	print (A)

	B = inst.NTT_backward(inst.NTT_forward(A))
	B_fast = inst.NTT_backward_gs(inst.NTT_forward_ct(A))
	print("\n")
	print (B_fast)
	if A == B and A == B_fast:
		print ("Test passed.")
	else:
		print ("Test failed.")
		print("B is as follows: ")
		print(B)	
		print("B_fast is as follows: ")
		print(B_fast)


	# # small test for Barret reduce
	x = 7*4208251219
	q = 4294957057
	(r,k) = NTT.Barret_init(q)
	result = NTT.Barret_reduce(x, r, k, q)
	print ('x ={x}, r = {r}, k = {k}, result = {result}'.format(x = x, r = r, k = k, result = result))
	print ('x ={x}, result = {result}'.format(x = x, result = x%q))
