function nLoG = filter_LoG(sigma)

% This function generates Laplacian of Gaussian filter given the sigma
% parameter as its input. Filter size is estimated by multiplying the 
% sigma with a constant.

%% The function
fsize = ceil(sigma) * 5; % filter size is estimated by: sigma * constant

fsize = (fsize - 1) / 2; 

[x, y] = meshgrid(-fsize : fsize, -fsize : fsize);

% The two parts of the LoG equation
a = (x .^ 2 + y .^ 2 - 2 * sigma ^ 2) / sigma ^ 4;
b = exp( - (x .^ 2 + y .^ 2) / (2 * sigma ^ 2) );
b = b / sum(b(:));

% The LoG filter
LoG = a .* b;

% The normalized LoG filter
nLoG = LoG - mean2(LoG);

% ** end of the function ** 



return

end