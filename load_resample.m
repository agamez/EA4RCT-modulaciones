function [ original, resampled ] = load_resample( file, Fs )
%LOAD_RESAMPLE Loads a wav file and resamples it to Fs
%
	[original, oFs] = wavread(file);
	original = original/max(original);
	mean(original)

	resampled = resample(original, Fs, oFs);
	resampled = resampled/max(resampled);
	resampled = resampled-mean(resampled);
	mean(resampled)
end
