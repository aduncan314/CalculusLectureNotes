function Decoherence (dim, deltaT)
	Psi = [.5,.5;.5,.5];
	bath = rand(2^dim)+i*rand(2^dim);
	bath = bath/abs(trace(bath));
	
	Htot=eye(2^(dim+1));
	dt = deltaT/30;
	for j= 1:10
		Hpart= rand(2^(dim+1))+i*rand(2^(dim+1));
		H = (Hpart+Hpart')/2;
		expH = expm(-i*H*dt);
		Htot = Htot*expH;
	end
	
	
	sys = kron(Psi,bath);
	det(expH*expH')
	sysFinal = expH*sys*expH';
		
	rho = zeros(2);
	for i=1:(2^dim)
		rho(1,1) += sysFinal(i,i);
		rho(1,2) += sysFinal(i, (2^dim)+i);
		rho(2,1) += sysFinal((2^dim)+i,i);
		rho(2,2) += sysFinal((2^dim)+i,(2^dim)+i);
	end
	
	rho = rho/trace(rho)
	
end
