
% imageResult = alignChannels( r, g, b )
% 
% Function   : 
%
% Purpose:  Create an image from three colour channels (r,g,b) after
% aligning the channels so that the pixel values correspond.
%
% Parameters : 
%
% Return     : 
%
% Examples of Usage:
%
%
function imageResult = alignChannels(r, g, b)
    % write your code here!
    target = r;
    c1 = g;  g for green
    c2 = b; b for blue
    % function to compute ssd
    % This measures the difference between two images
    function score = ssd((chanel1 - chanel2).^2, 'all');
    end
    % Function to find the best allignment using SSD
    function shift = findBestAllignment(channel, target)
    minScore = inf;
    bestShift = [0,0]; %[row_shift, col_shift]
    
    
end
