function [y1] = myNeuralNetworkFunctionForY3_881(x1)

%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 07-Dec-2014 02:56:35.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 2xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

  % ===== NEURAL NETWORK CONSTANTS =====
  
  % Input 1
  x1_step1_xoffset = [-1;0.610235033462089];
  x1_step1_gain = [1;7.77364515901972];
  x1_step1_ymin = -1;
  
  % Layer 1
  b1 = [-14.037698888958772;10.940216114369601;-7.8628508677307867;-3.7707335590775934;1.7062448133454864;0.71919436284684468;9.1031579702108552;-7.9190675166681403;9.9704729818872444;-13.980020978224559];
  IW1_1 = [0 13.95432620795582;0 -13.935952663397243;0 13.950095472941891;0 14.180431314318048;0 -13.385767592857809;0 14.208878975426153;0 12.232830641491192;0 -13.885698190219934;0 14.99942178103769;0 -14.016691254640067];
  
  % Layer 2
  b2 = 0.24789418868489377;
  LW2_1 = [-0.011229990217709485 -0.0063806599490452837 -0.02790625928999188 0.30462018786737538 0.00033335573056071655 0.097857575515070502 -0.28331277761459295 0.94752783304383326 1.8265365205226105 0.23094744372226111];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = 2;
  y1_step1_xoffset = 0;
  
  % ===== SIMULATION ========
  
  % Dimensions
  Q = size(x1,2); % samples
  
  % Input 1
  xp1 = mapminmax_apply(x1,x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
  
  % Layer 1
  a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);
  
  % Layer 2
  a2 = repmat(b2,1,Q) + LW2_1*a1;
  
  % Output 1
  y1 = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
  y = bsxfun(@minus,x,settings_xoffset);
  y = bsxfun(@times,y,settings_gain);
  y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
  a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
  x = bsxfun(@minus,y,settings_ymin);
  x = bsxfun(@rdivide,x,settings_gain);
  x = bsxfun(@plus,x,settings_xoffset);
end
