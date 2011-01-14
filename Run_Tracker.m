% Base script for multi-frame single-target tracker using batch SMC

% Clear the workspace (maintaining breakpoints)
clup

% Set a standard random stream (for repeatability)
s = RandStream('mt19937ar', 'seed', 0);
RandStream.setDefaultStream(s);

% Define all the necessary parameters in a global structure.
DefineParameters;

% Specify target behaviour
TargSpec = SpecifyTargetBehaviour;

% Generate target motion
[TrueState, TargSpec] = GenerateTargetMotion(TargSpec);

% Generate observations from target states
[Observs] = GenerateObs(TrueState);

% Plot states and observations
PlotTrueState(TrueState);
PlotObs(Observs);

% Run tracker
[ ~ ] = EasySingleTargetTrack( Observs );