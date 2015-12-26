function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 07-Dec-2014 16:18:21.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 3xQ matrix, input #1
% and returns:
%   y = 1xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

  % ===== NEURAL NETWORK CONSTANTS =====
  
  % Input 1
  x1_step1_remove = 1;
  x1_step1_keep = [2 3];
  x1_step2_xoffset = [0;0.623215986660841];
  x1_step2_gain = [2.23979491819022;5.75494337426123];
  x1_step2_ymin = -1;
  
  % Layer 1
  b1 = [-4.416127001674532;-3.0603756661860553;2.6054713254650181;-0.7002632728168221;-1.4554229049648564;0.463846215888578;-1.6027698141588484;2.6596481501742444;2.9992685917367288;4.6324933680316516];
  IW1_1 = [3.0104046371828441 -3.2691611027917213;3.6196722655423783 3.4438577279529938;-2.617216457669985 3.4773433272378025;4.1682639546197064 0.034648135278945447;1.5579319971922814 3.7406641385308244;-3.2788812434626871 -3.7555005992657255;-3.8611710111183708 -1.0843330806033133;0.57036868390403117 4.3128483184796744;4.077473788383811 2.2136091808179237;2.9759341948991458 2.8071213246502307];
  
  % Layer 2
  b2 = 0.36253321332956334;
  LW2_1 = [0.48999274449046043 -0.51055392100749875 0.21673794604411858 1.248749544186277 0.49473889181193931 0.49216442952786549 0.23569730088628127 0.24519041071223538 0.34321870046330027 -0.30126561288589304];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = 0.753311358989888;
  y1_step1_xoffset = 9.7733153;
  
  % ===== SIMULATION ========
  
  % Dimensions
  Q = size(x1,2); % samples
  
  % Input 1
  xp1 = removeconstantrows_apply(x1,x1_step1_keep,x1_step1_remove);
  xp1 = mapminmax_apply(xp1,x1_step2_gain,x1_step2_xoffset,x1_step2_ymin);
  
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

% Remove Constants Input Processing Function
function y = removeconstantrows_apply(x,settings_keep,settings_remove)
  if isempty(settings_remove)
    y = x;
  else
    y = x(settings_keep,:);
  end
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
