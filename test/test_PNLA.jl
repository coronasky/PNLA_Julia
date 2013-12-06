cd("..\\users\\coronasky\\documents\\my dropbox\\matlab\\pnla_julia\\src")
using PNLA


polysys=cell(1,2);
polysys[1,1]=1;
polysys[1,2]=[1 0];
getM(polysys,1);
getDorig(polysys);
getD0(polysys);
# getDreg(polysys);
getMDim(polysys,getD0(polysys));
feti([1 1]);
fite(2,2);

# boon example

polysys=cell(6,2);
polysys[1,1] = [1 1 -1];
polysys[1,2] = [2 0 0 0 0 0;0 0 2 0 0 0;0 0 0 0 0 0];
#  s2**2+g2**2 - 1;
polysys[2,1] = [1 1 -1];
polysys[2,2] = [0 2 0 0 0 0;0 0 0 2 0 0;0 0 0 0 0 0];
#  C1*g1**3+C2*g2**3 - 1.2;
polysys[3,1] = [1 1 -1.2];
polysys[3,2] = [0 0 3 0 1 0; 0 0 0 3 0 1;0 0 0 0 0 0];
#  C1*s1**3+C2*s2**3 - 1.2;
polysys[4,1] = [1 1 -1.2];
polysys[4,2] = [3 0 0 0 1 0; 0 3 0 0 0 1;0 0 0 0 0 0];
#  C1*g1**2*s1+C2*g2**2*s2 - 0.7;
polysys[5,1] = [1 1 -.7];
polysys[5,2] = [1 0 2 0 1 0; 0 1 0 2 0 1;0 0 0 0 0 0];
#  C1*g1*s1**2+C2*g2*s2**2 - 0.7;
polysys[6,1] = [1 1 -.7];
polysys[6,2] = [2 0 1 0 1 0; 0 2 0 1 0 1;0 0 0 0 0 0];

M=getM(polysys,9);

@time N,tol=sparseN(polysys,9)
#println(size(N,2))
# println(norm(full(M*N)))