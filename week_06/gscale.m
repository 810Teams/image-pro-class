function g = gscale(f, varargin)
% G = GSCALE(F, 'full8') scales the intensities of F to the full 8-bit
% intensity range [0, 255]. This is the default if there is only one input
% argument. 

% G = GSCALE(F, 'full16') scales the intensities of F to the full 16-bit
% intensity range [0, 65535].

% G = GSCALE(F, 'minmax', LOW, HIGH) scales the intensities of F to the range [LOW, HIGH].

if length(varargin) == 0
    method = 'full8';
else
    method = varargin{1};
end

if strcmp(class(f), 'double') & (max(f(:)) > 1 | min(f(:)) < 0)
    f = mat2gray(f);
end

switch method
    case 'full8'
        g = im2uint8(mat2gray(double(f)));
    case 'full16'
        g = im2uint16(mat2gray(double(f)));
    case 'minmax'
        low = varargin{2}; high = varargin{3};
        if low > 1 | low < 0 | high > 1 | high < 0
            error('parameters low and high must be in the range [0, 1].')
        end
        
        if strcmp(class(f), 'double')
            low_in = min(f(:));
            high_in = max(f(:));
        elseif strcmp(class(f), 'uint8')
            low_in = double(min(f(:)))./255;
            high_in = double(max(f(:)))./255;
        elseif strcmp(class(f), 'uint16')
            low_in = double(min(f(:)))./65535;
            high_in = double(max(f(:)))./65535;    
        end
        g = imadjust(f, [low_in, high_in], [low high]);
    otherwise
        error('Unknown method.')
end

            
    