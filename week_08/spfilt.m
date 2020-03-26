function f = spfilt(g, type, m, n, parameter)
% SPFILT performs linear and nonlinear spatial filtering
%   F = SPFILT(G, TYPE, M, N, PARAMETER) performs spatail filtering
%   of image G using a type filter of size M-by-N. Valid calls to 
%   SPFILT are as follows:
%
%   F = SPFILT(G, 'amean', M, N)    Arithmetic mean filtering.
%   F = SPFILT(G, 'gmean', M, N)    Geometric mean filtering.
%   F = SPFILT(G, 'hmean', M, N)    Harmonic mean filtering.
%   F = SPFILT(G, 'chrmean', M, N)   Contraharmonic mean filtering of
%                                   order Q = 1.5.
%   F = SPFILT(G, 'median', M, N)   Median filtering.
%   F = SPFILT(G, 'max', M, N)      Max filtering.
%   F = SPFILT(G, 'min', M, N)      Min filtering.
%   F = SPFILT(G, 'midpoint', M, N) Midpoint filtering.
%   F = SPFILT(G, 'atrimmed', M, N) Alpha-trimmed mean filtering.
%                                   Parameter D must be a nonnegative
%                                   Even integer; its default value
%                                   is D = 2.
%
%   The default values when only G and TYPE are input are M = N = 3,
%   Q = 1.5, and D = 2.

%   Process input
if nargin == 2
    m = 3; n = 3; Q = 1.5; d = 2;
elseif nargin == 5
    Q = parameter; d = parameter;
elseif nargin == 4
    Q = 1.5; d = 2;
else
    error('Wrong number of inputs.');
end

% Do the filtering
switch type
    case 'amean'
        w = fspecial('average', [m n]);
        f = imfilter(g, w, 'replicate');
    case 'gmean'
        f = gmean(g, m, n);
    case 'hmean'
        f = harmean(g, m, n);
    case 'chmean'
        f = charmean(g, m, n, Q);
    case 'median'
        f = medfilt2(g, [m n], 'symmetric');
    case 'max'
        f = ordfilt2(g, m*n, ones(m, n), 'symmetric');
    case 'min'
        f = ordfilt2(g, 1, ones(m, n), 'symmetric');
    case 'midpoint'
        f1 = ordfilt2(g, 1, ones(m, n), 'symmetric');
        f2 = ordfilt2(g, m*n, ones(m, n), 'symmetric');
        f = imlincomb(0.5, f1, 0.5, f2);
    case 'atrimmed'
        if (d < 0) | (d/2 ~= round(d/2))
            error('d must be a nonnegative, even integer.');
        end
        f = alphatrim(g, m, n, d);
    otherwise
        error('Unknown filter type.');
end

%%% -------------------------------------------------------------

function f = gmean(g, m, n)
% Implementing a geometric mean filter.
inclass = class(g);
g = im2double(g);
% Disable log(0) warning.
warning off;
f = exp(imfilter(log(g), ones(m, n), 'replicate')).^(1/m/n);
warning on;
f = changeclass(inclass, f);
% ---------------------------------------------------------------

function f = harmean(g, m, n)
% Implementing a harmonic mean filter.
inclass = class(g);
g = im2double(g);
f = m*n./imfilter(1./(g + eps), ones(m, n), 'replicate');
f = changeclass(inclass, f);
% ---------------------------------------------------------------

function f = charmean(g, m, n, q)
% Implementing a contraharmonic filter.
inclass = class(g);
g = im2double(g);
f = imfilter(g.^(q + 1), ones(m, n), 'replicate');
f = f./(imfilter(g.^q, ones(m, n), 'replicate') + eps);
f = changeclass(inclass, f);
% ---------------------------------------------------------------

function f = alphatrim(g, m, n, d)
% Implementing a alpha-trimmed filter.
inclass = class(g);
g = im2double(g);
f = imfilter(g, ones(m, n), 'symmetric');
for k = 1:d/2
    f = imsubtract(f, ordfilt2(g, k, ones(m, n), 'symmetric'));
end
for k = (m*n - (d/2) + 1):m*n
    f = imsubtract(f, ordfilt2(g, k, ones(m, n), 'symmetric'));
end
f = f / (m*n -d);
f = changeclass(inclass, f);





        
        

