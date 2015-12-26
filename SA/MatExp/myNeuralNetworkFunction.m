function [y1] = myNeuralNetworkFunction(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 07-Dec-2014 01:05:07.
% 
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 3xQ matrix, input #1
% and returns:
%   y = 3xQ matrix, output #1
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
  b1 = [-4.5050914846968846;-2.9648749631011553;1.9915423702491111;-2.0432453043540661;-0.88288656904452134;-1.6500985405207014;-1.6899370617818219;3.7434341252860968;2.8143182473819124;5.677662409763494];
  IW1_1 = [2.9096478422879959 -3.1930308886986292;4.3734786933833316 2.8128829893923699;-1.6109753562677125 4.1589470527997285;6.4468441331236841 0.20733879186922305;2.4248103507737406 7.3906147275242411;-5.3443801142070573 -1.8340614763607028;-4.1788926189582876 -1.5519330917627097;-0.57724593014049241 6.4163648790320735;4.281376246003739 3.5836420281841996;2.3628242485234741 5.6087975701913679];
  
  % Layer 2
  b2 = [0.045512674600662377;-0.74692981097787237];
  LW2_1 = [0.21650424653415365 -0.18707400073154526 1.0608673616905404 0.81105669120678103 -0.31256676918770288 0.54447662605754865 -0.7725334234995509 -2.2753093912119402 0.2505399411997557 1.5139791778674458;-0.26026089974890104 0.093749933703000193 -0.26758538830930284 0.061075123844051685 -0.52571944292931871 0.59182705850636996 -1.0631116020296598 0.7615379381725712 0.37192735826601031 -0.59089846375483035];
  
  % Output 1
  y1_step2_ymin = -1;
  y1_step2_gain = [2.27096549317958;95.3033093128024];
  y1_step2_xoffset = [0.0291773101293988;0.314474104720724];
  y1_step1_xrows = 3;
  y1_step1_remove = 3;
  y1_step1_value = 1;
  y1_step1_keep = [1 2];
  
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
  y1 = mapminmax_reverse(a2,y1_step2_gain,y1_step2_xoffset,y1_step2_ymin);
  y1 = removeconstantrows_reverse(y1,y1_step1_keep,y1_step1_remove,y1_step1_value,y1_step1_xrows);
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

% Remove Constants Output Reverse-Processing Function
function x = removeconstantrows_reverse(y,settings_keep,settings_remove,settings_value,settings_xrows)
  Q = size(y,2);
  x = zeros(settings_xrows,Q);
  x(settings_remove,:) = settings_value(:,ones(1,Q));
  x(settings_keep,:) = y;
end
