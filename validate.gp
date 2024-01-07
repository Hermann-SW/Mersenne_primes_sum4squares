assert(b,s)=if(!(b), error(Str(s)));
readvec("M.py");
{
  for(i=2,29,m=M[i];
    assert(#m==5&&
      2^m[1]-1==norml2(m[2..5])
    )
  );
}
print("all asserts OK");
