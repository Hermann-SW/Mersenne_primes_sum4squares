\\ Paul Pollack, Peter Schorn:
\\ Dirichlet's proof of the three-square theorem: An algorithmic perspective.
\\ Math. Comput. 88(316): 1007-1019 (2019)
\\
\\ https://pollack.uga.edu/finding3squares-6.pdf
\\
assert(b,s)=if(!(b), error(Str(s)));

dbg(a,b,c="")=if(getenv("dbg"),print(a,b,c));

get_tqf_P_S(n)={
    assert(n%4!=0);
    assert(n%8!=7);
    my(Q,v,b=#binary(n), D,p,q,a,k,a12,c=0);
    if(n%4==2, \\ case I
        q=4*n;
        a=2*n-1;
        while(1,
            c+=1;
            k=c; \\ random(q); \\ 2*q^2
            p=(q*k+a);
            D=(p+1)/n;
            if((Mod(-D,p)^((p+1)/4))^2==Mod(-D,p),
                break()));
        print(c);
        dbg(" D=",D);
        dbg(" q=",q);
        dbg(" a=",a);
        dbg(" k=",k);
        dbg(" p=",p);
        assert(kronecker(-D,p)==1);
        a12=lift(sqrt(Mod(-D,p)));
        dbg("12=",a12);
        dbg("ma=",Mod(-D,p)^((p+1)/2));
\\        if(Mod(a12,2)!=Mod(-D,2),a12+=p);
        ,
        assert(0,"todo: cases II, III and IV");
        );
    [(D+a12^2)/p,a12,1;a12,p,0;1,0,n];
}

squares34(n)={
    my(Q,G,V=valuation(n,4),n1=n>>(2*V),res=[],x=[0,0,1]~);
    if(n1%8==7,n=sqrtint(n1);if(n%2==0,n-=1);res=[n*2^V];n1-=n^2;);

    Q=get_tqf_P_S(n1);
    if(type(Q)!="t_MAT",return([]));
    assert(qfeval(Q,x)==n1);
    dbg(" Q=",Q);
    dbg(matdet(Q));
    assert(matdet(Q)==1);

    G=qflllgram(Q,1);
    dbg(" G=",G);
    assert(G~*Q*G==matdiagonal([1,1,1]));

    res=concat([2^V*i|i<-G^-1*x],res);
    abs(res);
}


{
    if(getenv("n")!=0,
        n=eval(getenv("n"));

        if(getenv("seed")!=0,
            my(s=eval(getenv("seed")));
            if(s<0,
                setrand(getwalltime()),
                setrand(s)));
    
        if(getenv("par")==0,
            sq=squares34(n);
            print(getenv("n"),"=",sq);
            assert(norml2(sq)==n);
            print("all asserts OK")
            ,
            export(squares34);
            export(n);
            export(get_tqf_P_S);
            export(assert);
            export(dbg);
            parforeach([1..128],
                i,
                setrand(i);
                my(t0=getabstime());
                my(s=squares34(n));
                [i,#s,getabstime()-t0],
                r,
                print(r,"=dt"))));
}
