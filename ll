def back_subst(R,b_tilde):
 n = R.shape[0]
 x = np.zeros(n)
 for i in reversed(range(n)):
   x[i] = b_tilde[i]
   for j in range(i+1,n):
    x[i] = x[i] - R[i,j]*x[j]
   x[i] = x[i]/R[i,i]
 return x

def solve(A,b):
 Q,R = np.linalg.qr(A)
 Q = -Q
 R= -R
 b_tilde = Q.T @ b
 x = back_subst(R,b_tilde)
 return x

===
#second difference matrix
D = lambda n: np.c_[-np.identity(n-1), np.zeros(n-1)] +np.c_[np.zeros(n-1), np.identity(n-1)]
A = np.array([[1,-3,7],[-1,4,-6],[1,4,6],[1,-3,0]])
Dif = D( len(A[0]) )@D( len(A[0]) + 1)
print(Dif@A)

