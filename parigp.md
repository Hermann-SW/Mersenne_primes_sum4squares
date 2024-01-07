
required packages:  make, time, pari-gp, python3, python-is-python3

Computation took 31.5h ([nohup.out](nohup.out)):  
```
hermann@7950x:~$ stat nohup.out | tail -2
Change: 2024-01-05 07:30:45.780739807 +0100
 Birth: 2024-01-03 23:57:38.773085349 +0100
hermann@7950x:~$ 
```

Started with:  
```
nohup ./doit
```

Bash script [doit](doit) runs [tqf_P_S_loop.gp](tqf_P_S_loop.gp) for Mersenne primes, one after the other.  
Different to [[1]](#1) the Pari/GP script does check all k from 1 sequentially.   

##### [1]
Paul Pollack, Peter Schorn:  
Dirichlet's proof of the three-square theorem: An algorithmic perspective.  
Math. Comput. 88(316): 1007-1019 (2019)  
https://pollack.uga.edu/finding3squares-6.pdf  

