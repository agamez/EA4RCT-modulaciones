function plotFFT( X, Fs, color )
%PLOTFFT Plots a centered FFT using provided axis
	if ~exist('color', 'var')
		color='b';
	end


	[out, freq] = centeredFFT(X, Fs);
	out = out/max(out);
	plot(freq/1000, 20*log10(abs(out)), color);
	title('Modulo normalizado de la FFT');
	ylabel('dBc');
	xlabel('KHz');

%	periodogram(X, [], 4096, Fs);

end

