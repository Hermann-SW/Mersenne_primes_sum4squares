This repo provides sum of four squares for Mersenne primes.  
All Mersenne primes besides M<sub>1</sub> do not have a sum of three squares representation.  
Currently sum of four squares are provided for M<sub>2</sub>..M<sub>29</sub> in [M.py](M.py).  
[validate.gp](validate.gp) and [validate.py](validate.py) demonstrate how to access M.py from Pari/GP and Python.

## Validation  
```
pi@raspberrypi5:~/Mersenne_primes_sum4squares $ make

time -f %E\\n  gp -q < validate.gp
all asserts OK
0:00.02

time -f %E\\n  python validate.py
all asserts OK
0:00.05

pi@raspberrypi5:~/Mersenne_primes_sum4squares $ 
```

## Table
M<sub>n</sub>=2<sup>p<sub>n</sub></sup>-1=a<sup>2</sup>+b<sup>2</sup>+c<sup>2</sup>+d<sup>2</sup>, #x short for #digits(x)  

Sum of 4 squares was computed with [Pari/GP script](parigp.md).  
The script takes d to be maximal odd number less than sqrt(M<sub>n</sub>).  
Nothing can be said about numbers a, b and c other than a<sup>2</sup>+b<sup>2</sup>+c<sup>2</sup>=M<sub>n</sub>-d<sup>2</sup>.  

With N=M<sub>n</sub>-d<sup>2</sup> script determined minimal k, such that k\*4\*N+2\*N-1 is prime.  
This allows to create a ternary quadratic form by the method from Dirichlet;  
which allows to compute a,b and c with N=a<sup>2</sup>+b<sup>2</sup>+c<sup>2</sup>  easily.

Single thread runtime of Pari/GP script on AMD 7950X CPU is reported as t.  

Runtimes of current script definitely do not allow to complete table up to M<sub>51</sub>.  
n|#M<sub>n</sub>||#a|#b|#c|#d||k|t[s]
-:|-:|-|-:|-:|-:|-:|-|-:|-:
1|1|
2|1||1|1|1|1||2|1
3|2||1|1|1|1||2|1
4|3||1|1|1|2||2|1
5|4||2|2|1|2||1|1
6|6||2|2|1|3||2|1
7|6||2|1|1|3||6|1
8|10||3|3|3|5||5|1
9|19||5|4|4|10||6|1
10|27||7|7|7|14||10|1
11|33||8|8|8|17||16|1
12|39||10|10|9|20||4|1
13|157||40|39|39|79||139|1
14|183||46|46|46|92||4|1
15|386||96|97|96|193||93|1
16|664||167|166|166|332||216|1
17|687||172|172|171|344||2|1
18|969||241|242|242|485||155|1
19|1,281||321|320|320|641||553|2
20|1,332||334|333|333|666||45|1
21|2,917||730|729|730|1,459||475|9
22|2,993||748|749|748|1,497||1,330|27
23|3,376||844|844|844|1,688||618|18
24|6,002||1,501|1,501|1,501|3,001||741|82
25|6,533||1,634|1,634|1,634|3,267||3,853|540
26|6,987||1,747|1,747|1,747|3,494||7,570|12616
27|13,395||3,348|3,349|3,349|6,698||6,845|5377
28|25,962||6,491|6,490|6,490|12,981||5,759|23278
29|33,265||8,317|8,316|8,316|16,633||10,667|82982
30|39,751|
31|65,050|
...
50|23,249,425|
51|24,862,048|
<!--
32|227,832|
33|258,716|
34|378,632|
35|420,921|
36|895,932|
37|909,526|
38|2,098,960|
39|4,053,946|
40|6,320,430|
41|7,235,733|
42|7,816,230|
43|9,152,052|
44|9,808,358|
45|11,185,272|
46|12,837,064|
47|12,978,189|
48|17,425,170|
49|22,338,618|
-->
