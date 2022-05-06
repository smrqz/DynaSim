%% 3-layer neocortical model of PFC / Predictive task

% Manually determined weights version. 
% memoize.m -> suspended due to an error
% dsModel: 

%% Model parameters

clear;
clc;

Ne = 20;Ni = 4;Nio = 10;noise_rate = 13;
% s = NeoCortex(Ne, Ni, Nio, noise_rate);
% s = dlDemoPING(5, 1, 2, noise_rate); % 14 Mins on mex generator
s = dlDemoPredictivePFC(Ne, Ni, Nio, noise_rate);

%% Create DynaLearn Class (First time)

m = DynaLearn(s, 'models/dlDemoPredictivePFC'); % ~ 120min
m.dlSimulate(); % ~ 40sec
m.dlSave(); % < 1sec

%% Load DynaLearn Class (previously saved file is required, default is dlFileBase.mat)

clc;
m = DynaLearn(); % ~ 1sec
m = m.dlLoad('models/dlPredictivePFCDemo'); % ~ 10sec
m.dlSimulate(); % ~ 40sec

 %% Continue simulation: Vary example

clc;
g_poisson = 5.7e-4;
dc_poisson = 9e6;

vary1 = containers.Map();
vary2 = containers.Map();
vary3 = containers.Map();

vary1('tspan') = [0 500];
vary2('tspan') = [0 500];
vary3('tspan') = [0 500];

vary('SA1_ctx_iPoisson_g_poisson') = g_poisson;
vary('SA2_ctx_iPoisson_g_poisson') = g_poisson;
vary('SB1_ctx_iPoisson_g_poisson') = g_poisson;
vary('SB2_ctx_iPoisson_g_poisson') = g_poisson;
vary('SC1_ctx_iPoisson_g_poisson') = g_poisson;
vary('SC2_ctx_iPoisson_g_poisson') = g_poisson;

vary('SA1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary('SA2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary('SB1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary('SB2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary('SC1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary('SC2_ctx_iPoisson_DC_poisson') = dc_poisson;

vary('SA1_ctx_iPoisson_onset_poisson') = 150;
vary('SA1_ctx_iPoisson_offset_poisson') = 250;
vary('SA2_ctx_iPoisson_onset_poisson') = 250;
vary('SA2_ctx_iPoisson_offset_poisson') = 350;

vary('SB1_ctx_iPoisson_onset_poisson') = 250;
vary('SB1_ctx_iPoisson_offset_poisson') = 250;
vary('SB2_ctx_iPoisson_onset_poisson') = 350;
vary('SB2_ctx_iPoisson_offset_poisson') = 350;

vary('SC1_ctx_iPoisson_onset_poisson') = 250;
vary('SC1_ctx_iPoisson_offset_poisson') = 250;
vary('SC2_ctx_iPoisson_onset_poisson') = 350;
vary('SC2_ctx_iPoisson_offset_poisson') = 350;

vary1('SA1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary1('SA2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary1('SB1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary1('SB2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary1('SC1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary1('SC2_ctx_iPoisson_DC_poisson') = dc_poisson;

vary1('SA1_ctx_iPoisson_onset_poisson') = 150;
vary1('SA1_ctx_iPoisson_offset_poisson') = 250;
vary1('SA2_ctx_iPoisson_onset_poisson') = 250;
vary1('SA2_ctx_iPoisson_offset_poisson') = 350;

vary1('SB1_ctx_iPoisson_onset_poisson') = 250;
vary1('SB1_ctx_iPoisson_offset_poisson') = 250;
vary1('SB2_ctx_iPoisson_onset_poisson') = 350;
vary1('SB2_ctx_iPoisson_offset_poisson') = 350;

vary1('SC1_ctx_iPoisson_onset_poisson') = 250;
vary1('SC1_ctx_iPoisson_offset_poisson') = 250;
vary1('SC2_ctx_iPoisson_onset_poisson') = 350;
vary1('SC2_ctx_iPoisson_offset_poisson') = 350;

vary2('SA1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary2('SA2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary2('SB1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary2('SB2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary2('SC1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary2('SC2_ctx_iPoisson_DC_poisson') = dc_poisson;

vary2('SA1_ctx_iPoisson_onset_poisson') = 250;
vary2('SA1_ctx_iPoisson_offset_poisson') = 250;
vary2('SA2_ctx_iPoisson_onset_poisson') = 350;
vary2('SA2_ctx_iPoisson_offset_poisson') = 350;

vary2('SB1_ctx_iPoisson_onset_poisson') = 150;
vary2('SB1_ctx_iPoisson_offset_poisson') = 250;
vary2('SB2_ctx_iPoisson_onset_poisson') = 250;
vary2('SB2_ctx_iPoisson_offset_poisson') = 350;

vary2('SC1_ctx_iPoisson_onset_poisson') = 250;
vary2('SC1_ctx_iPoisson_offset_poisson') = 250;
vary2('SC2_ctx_iPoisson_onset_poisson') = 350;
vary2('SC2_ctx_iPoisson_offset_poisson') = 350;

vary3('SA1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary3('SA2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary3('SB1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary3('SB2_ctx_iPoisson_DC_poisson') = dc_poisson;
vary3('SC1_ctx_iPoisson_DC_poisson') = dc_poisson;
vary3('SC2_ctx_iPoisson_DC_poisson') = dc_poisson;

vary3('SA1_ctx_iPoisson_onset_poisson') = 250;
vary3('SA1_ctx_iPoisson_offset_poisson') = 250;
vary3('SA2_ctx_iPoisson_onset_poisson') = 350;
vary3('SA2_ctx_iPoisson_offset_poisson') = 350;

vary3('SB1_ctx_iPoisson_onset_poisson') = 250;
vary3('SB1_ctx_iPoisson_offset_poisson') = 250;
vary3('SB2_ctx_iPoisson_onset_poisson') = 350;
vary3('SB2_ctx_iPoisson_offset_poisson') = 350;

vary3('SC1_ctx_iPoisson_onset_poisson') = 150;
vary3('SC1_ctx_iPoisson_offset_poisson') = 250;
vary3('SC2_ctx_iPoisson_onset_poisson') = 250;
vary3('SC2_ctx_iPoisson_offset_poisson') = 350;

outputParams = [{'DeepE_V', 1:4, [200 400], 'afr'}; {'DeepE_V', 5:8, [200 400], 'afr'}; {'DeepE_V', 9:12, [200 400], 'afr'}; {'DeepE_V', 13:16, [200 400], 'afr'}; {'DeepE_V', 17:20, [200 400], 'afr'}];
targetParams1 = [{'MSE', 1, 6, 0.25}; {'MSE', 2, 3, 0.25}; {'MSE', 3, 3, 0.25}; {'Compare', [1, 2, 3], 0, 0.15}; {'Diff', [2, 3], 0, 0.05}]; % A 
targetParams2 = [{'MSE', 2, 6, 0.25}; {'MSE', 1, 3, 0.25}; {'MSE', 3, 3, 0.25}; {'Compare', [2, 1, 3], 0, 0.15}; {'Diff', [1, 3], 0, 0.05}]; % B
targetParams3 = [{'MSE', 3, 6, 0.25}; {'MSE', 2, 3, 0.25}; {'MSE', 1, 3, 0.25}; {'Compare', [3, 1, 2], 0, 0.15}; {'Diff', [1, 2], 0, 0.05}]; % C

%% Trial: training script 
% TODO ->>> (similar inputs-outputs problem)

clc;
dlInputParameters = {vary1, vary2, vary3};
dlTargetParameters = {targetParams1, targetParams2, targetParams3};
dlOutputParameters = outputParams;

dlTrainOptions = containers.Map();
dlTrainOptions('dlEpochs') = 4;
dlTrainOptions('dlBatchs') = 3;
dlTrainOptions('dlLambda') = 0.0007;

dlTrainOptions('dlCheckpoint') = 'true';
dlTrainOptions('dlCheckpointCoefficient') = 2; % e.g sqrt(2), sqrt(3), 2, sqrt(5) ... 
dlTrainOptions('dlUpdateMode') = 'batch';
dlTrainOptions('dlLearningRule') = 'DeltaRule'; % BioDeltaRule, RWDelta, ...

dlTrainOptions('dlSimulationFlag') = 1; % Manully turning simulation, on or off (on is default and recommended)
dlTrainOptions('dlOutputLogFlag') = 1; % Autosaving trial outputs, on or off (off is default and recommended) % TODO Output/Random/SameValueProblem
dlTrainOptions('dlOfflineOutputGenerator') = 0; % Just for debugging, generates random outputs based on last outputs. 
dlTrainOptions('dlAdaptiveLambda') = 1; % Adaptive lambda parameter; recommended for long simulations.

% dlTrainOptions('dlMetaLearningRule') = 'TODO'; %%% 
% dlTrainOptions() = '';
% dlTrainOptions() = '';
% dlTrainOptions() = '';

% m.dlResetTraining(); % Reset logs and optimal states
m.dlTrain(dlInputParameters, dlOutputParameters, dlTargetParameters, dlTrainOptions);
% m.dlLoadOptimal();  % Load the current optimal state (if exists)

%% Run a simulation (without training)

m.dlRunSimulation(dlInputParameters{1}, dlOutputParameters);
m.dlPlotAllPotentials('lfp');
m.dlRunSimulation(dlInputParameters{2}, dlOutputParameters);
m.dlPlotAllPotentials('lfp');
m.dlRunSimulation(dlInputParameters{3}, dlOutputParameters);
m.dlPlotAllPotentials('lfp');

%% End of Demo