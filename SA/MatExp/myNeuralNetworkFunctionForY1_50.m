function [y1] = myNeuralNetworkFunctionForY1_50(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 07-Dec-2014 01:41:23.
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
  b1 = [6.3020746444930253;-5.9161966724659525;-4.7500574976101957;4.6644808583798811;3.6940921836604002;3.3741367857452618;-2.3241014107167004;1.6597561164977255;1.3844067519052086;0.38867046394556648;-1.4315077649356545;-1.352429700135497;-1.6766427789225891;2.3671744983481595;2.0255598825645555;-3.6744911252664818;3.4869997102866446;-4.9658156355278278;-5.6634109140313367;6.14687507604713];
  IW1_1 = [-1.2054078761036213 6.1126617092583988;5.2768339759015745 -2.9465960749006652;1.6729194889981007 6.0912371908480418;-4.2697199284177225 -4.2511472297042605;-1.4349974013300231 6.1320940188289264;-5.6376544705647804 2.0725522990049567;6.1840353121774436 0.53248297830202629;-5.3716697172222592 3.2232589309735848;-6.6811412609796319 0.0013345005385108633;-2.5052512139810976 -5.7959519736601273;-3.5841372387526569 -5.2174647325902912;-0.50349410267102046 6.1609127016680345;-2.9959070163794839 -5.5707146592156125;4.1809318359481971 -4.6512972134556101;6.5326500864949217 0.78555287803780294;-4.8173993612530994 3.9525603200955985;5.6440946948232131 3.6693863162292062;-3.6768794763614858 -5.0319245434250979;-3.1099226078788638 -5.2983048681436502;5.0123916375166662 -3.9267604212728626];
  
  % Layer 2
  b2 = -0.66530866304242764;
  LW2_1 = [0.57527674580311294 -0.43323738748248974 -0.052174670828203373 0.022669354314583466 -0.46809811997266393 -0.11012253939750649 -0.34101896108769109 0.10462952713717266 -0.93900032330799788 0.12956945769954664 -0.21565326379197045 0.073249056608104685 0.23284062860120228 0.061064353628549617 -0.20334231922563001 0.043325484493591859 0.45414695585735071 -0.1690511805908643 -0.11405210294388995 0.029454143690044177];
  
  % Output 1
  y1_step1_ymin = -1;
  y1_step1_gain = 2.27096549317958;
  y1_step1_xoffset = 0.0291773101293988;
  
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