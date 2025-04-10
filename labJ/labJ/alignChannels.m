function combined = alignChannels(r, g, b)
    % Step 1: Identify the target channel (channel with fewest zero pixels)
    zeroCounts = [sum(r(:) == 0), sum(g(:) == 0), sum(b(:) == 0)];
    [~, targetIdx] = min(zeroCounts);
    
    if targetIdx == 1
        target = r;
        channels = {'g', 'b'};
    elseif targetIdx == 2
        target = g;
        channels = {'r', 'b'};
    else
        target = b;
        channels = {'r', 'g'};
    end
    
    % Initialize aligned channels
    alignedChannels = cell(1, 2);

    % Step 2: Align each non-target channel
    for i = 1:2
        channel = eval(channels{i});
        bestDisplacement = 0;
        bestScore = inf; % Start with an infinitely large score
        
        % Search for displacement from -30 to 30
        for d = -30:30
            % Displace the channel using circshift
            shifted = circshift(channel, [0, d]);
            % Compute the score for this displacement
            score = sum(sum((shifted - target).^2));
            
            % Update best displacement if score improves
            if score < bestScore
                bestScore = score;
                bestDisplacement = d;
            end
        end
        
        % Apply the best displacement to the channel
        alignedChannels{i} = circshift(channel, [0, bestDisplacement]);
    end
    
    % Combine all three channels into one
    if targetIdx == 1
        combined = cat(3, target, alignedChannels{1}, alignedChannels{2});
    elseif targetIdx == 2
        combined = cat(3, alignedChannels{1}, target, alignedChannels{2});
    else
        combined = cat(3, alignedChannels{1}, alignedChannels{2}, target);
    end
end