%%% This function computers the parallel operation of two numbers.
function out = parallel(in)
	 flippedIn = in.^(-1);
	 inverseOut = sum(flippedIn);
	out = inverseOut^(-1);
end