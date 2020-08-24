%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gpmat Toolbox start-up script
%
% Initialise Gpmat Toolbox. This script is run automatically if Matlab is started
% in the toolbox root (installation) directory.
%
% Set configuration options in "config.m".
%
% (C) Lionel Barnett, 2015. See file LICENSE in installation
% directory for licensing terms.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global gpmat_root
gpmat_root = fileparts(mfilename('fullpath')); % directory containing this file

fprintf('[Gpmat startup] Initialising toolbox\n');

% Set configuration options: look first for user-local configuration file in
% MATLAB preferences directory, else run default

user_config = fullfile(prefdir,'gpmat_config.m');
if exist(user_config,'file') == 2
	fprintf('[Gpmat startup] Setting user-local configuration options\n');
	run(user_config);
else
	fprintf('[Gpmat startup] Setting default configuration options\n');
	config;
end
clear user_config

% Globals settings (used in some functions)

global gp_uniqid gp_gnuplot gp_defterm gp_imviewer gp_epsviewer gp_pdfviewer gp_svgviewer gp_eps2pdf gp_imconv gp_pdf2svg gp_pdfcrop gp_pdftoeps gp_pdflatex;
gp_uniqid    = gp_cfg_uniqid;
gp_gnuplot   = gp_cfg_gnuplot;
gp_defterm   = gp_cfg_defterm;
gp_imviewer  = gp_cfg_imviewer;
gp_epsviewer = gp_cfg_epsviewer;
gp_pdfviewer = gp_cfg_pdfviewer;
gp_svgviewer = gp_cfg_svgviewer;
gp_eps2pdf   = gp_cfg_eps2pdf;
gp_pdf2svg   = gp_cfg_pdf2svg;
gp_imconv    = gp_cfg_imconv;
gp_pdfcrop   = gp_cfg_pdfcrop;
gp_pdftoeps  = gp_cfg_pdftoeps;
gp_pdflatex  = gp_cfg_pdflatex;
clear gp_cfg_uniqid gp_cfg_gnuplot gp_cfg_defterm gp_cfg_imviewer gp_cfg_epsviewer gp_cfg_pdfviewer gp_cfg_svgviewer gp_cfg_eps2pdf gp_cfg_imconv gp_cfg_pdf2svg gp_cfg_pdfcrop gp_cfg_pdftoeps gp_cfg_pdflatex;

% Add Gpmat root dir + appropriate subdirs to path

addpath(gpmat_root);
addpath(fullfile(gpmat_root,'gp'));
addpath(fullfile(gpmat_root,'demos'));

if include_testing
	addpath(genpath(fullfile(gpmat_root,'testing')));
end
clear include_testing

fprintf('[Gpmat startup] Paths set\n');

fprintf('[Gpmat startup] Initialisation complete (you may re-run ''startup'' at any time)\n');
