%% Tests of alignImages function
fprintf('\nTests of alignImages function\n')

clear;

r = randi([0 255], 50, 50); %a dummy red channel!
g = zeros(size(r)); %a dummy green channel!
b = zeros(size(r)); %a dummy blue channel!
g(:,3:end) = r(:,1:end-2); %but g and b are .... misaligned by a few pixels!
b(:,5:end) = r(:,1:end-4);
count = 0;

try  
  imageResult = alignChannels(r,g,b);
  fprintf('PASSED TEST 1\n')
  count = count + 1;  
catch exception
  fprintf('FAILED TEST 1: alignChannels(r,g,b) does not run!\n')
end

try  
  imageResult = alignChannels(r,g,b);
  assert(sum(sum(imageResult(:,1:end-2,1) - imageResult(:,1:end-2,2))) == 0, 'alignment is off');
  fprintf('PASSED TEST 2\n')
  count = count + 1;  
catch exception
  fprintf('FAILED TEST 2: alignChannels(r,g,b): alignment of green channel is off!\n')
end

try  
  imageResult = alignChannels(r,g,b);
  assert(sum(sum(imageResult(:,1:end-4,1) - imageResult(:,1:end-4,3))) == 0, 'alignment is off');
  fprintf('PASSED TEST 3\n')
  count = count + 1;
catch exception
  fprintf('FAILED TEST 3: alignChannels(r,g,b): alignment of blue channel is off!\n')
end

if (count == 3)
    disp("You have passed all the tests in this file!")
end