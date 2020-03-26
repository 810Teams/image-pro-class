function R = imnoise2(type, M, N, a, b)
% IMNOISE2 generates an array of random numbers with specified PDF. 
%

% Set default values.
if nargin == 1
    a = 0; b = 1;
    M = 1; N = 1;
elseif nargin == 3
    a = 0; b = 1;
end

% Begin processing. Use lower(type) to protect against input
% being capitalalized.
switch lower(type)
    case 'uniform'
        R = a + (b - a)*rand(M, N);
    case 'gaussian'
        R = a + b*randn(M, N);
    case 'salt & pepper'
        if nargin <= 3
            a = 0.05; b = 0.05;
        end
        % Check to make sure that Pa + Pb is not > 1.
        if (a + b) > 1
            error('The sum Pa + Pb must not exceed 1.');
        end
        R(1:M, 1:N) = 0.5;
        
        % Generate an M-by-N array of uniformly-distributed random numbers
        % in the range (0, 1). Then, Pa*(M*N) of them will have value <= a.
        % The coordinates of these points we call 0 (pepper noise). Similarly, 
        % Pb*(M*N) points will have values in the range > a & <= (a + b).
        % These we call 1 (salt noise). 
        
        X = rand(M, N);
        c = find(X <= a);
        R(c) = 0;
        u = a + b;
        c = find(X > a & X <= u);
        R(c) = 1;
    case 'lognormal'
        if nargin <= 3
            a = 1; b = 0.25;
        end
        R = a*exp(b*randn(M, N));
    case 'rayleigh'
        R = a + (-b*log(1 - rand(M, N))).^0.5;
    case 'exponential'
        if nargin <= 3
            a = 1;
        end
        if a <= 0
            error('Parameter a must be positive for exponential type.')
        end
        k = -1/a;
        R = k*log(1 - rand(M, N));
    case 'erlang'
        if nargin <= 3
            a = 2; b = 5;
        end
        if(b ~= round(b) | b <= 0)
            error('Parameter b must be a positive integer for Erlang.')
        end
        k = -1/a;
        R = zeros(M, N);
        for j = 1:b
            R = R + k*log(1 - rand(M, N));
        end
    otherwise
        error('Unknown distribution type.')
end

            
        