import sys
sys.set_int_max_str_digits(17000)
import M
for i in range(1,29):
  m=M.M[i]
  assert(len(m)==5 and 2**m[0]-1 == m[1]**2+m[2]**2+m[3]**2+m[4]**2)
print("all asserts OK")
