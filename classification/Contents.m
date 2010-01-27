% NMLT is a Matlab machine learning toolbox
% that is specifically tailored to offline and online
% single-trial analysis in cognitive neuroscience.
% 
% This code requires at least Matlab distribution 7.6.0.324 (R2008a)
% 
% Copyrights (C) 2008
% Intelligent Systems (http://www.ru.is/ml)
% FC Donders Centre (http://www.ru.nl/fcdonders/)
% Radboud University Nijmegen, The Netherlands
% 
% Most functions in this toolbox are licensed under the GNU General
% Public license (GPL), see http://www.gnu.org for details.
% 
% Unauthorised copying and distribution of functions that are not
% explicitely covered by the GPL is not allowed!
% 
% The functions in this toolbox are copyrighted by their authors:
% 
% Marcel van Gerven
% Pawel Herman
% Ali Bahramisharif
% Jason Farquhar
% Adriana Birlutiu
% 
% Donders Institute for Brain, Cognition and Behaviour
% 
% The toolbox depends on functions from other toolboxes to
% do some of the actual work. These other toolboxes on which
% the framework depends are copyrighted by their respective authors,
% see each individual matlab file for the details.
% 
% gpml-matlab:
% http://www.gaussianprocess.org/gpml/code/matlab/doc/
% 
% L1General:
% http://people.cs.ubc.ca/~schmidtm/Software/L1General/L1General.html
%
% netlab:
% http://www.ncrg.aston.ac.uk/netlab/
% 
% libsvm:
% libsvm toolbox (http://www.csie.ntu.edu.tw/~cjlin/libsvm/)
% matlab interface (http://www.csie.ntu.edu.tw/~cjlin/libsvm/#matlab)
%
% SLR:
% http://www.cns.atr.jp/~oyamashi/SLR_WEB.html 
%
% hugin (not included in this distribution):
% http://www.hugin.com/Products_Services/Products/Demo/Lite/
%
% For various examples about the functionality of this toolbox, please check
% out the examples folder or use the help function to the methods.
% 
% SEE ALSO:
% validator.m
% preprocessor.m
% featureselector.m
% classifier.m
% regressor.m
% reconstructor.m
% 
% TO DO
% 
% - implement transfer learning using blogreg.
% - implement reconstruction algorithm
% - rewrite inner crossvalidation for parameter selection
% - check EM code for mixture models
% - add simple gui
% - integrate utility functions in relevant classes
% - test dynamic_clf and also make dynamic_regr/static_regr
% - repeated calls to train should allow for online learning as much as possible
% - rethink significance testing and also implement for regressor
% - return standard error of mean as second argument of evaluate
% - rewrite feature selection stuff and add searchlight (also check blogreg)
% - check if NETLAB can be removed
% - better handling of checking of datasets for each method
% - profiling
% - rewrite handling of timeseries...
% - allow arbitrary labels for the classifiers
% - getmodel add descriptions and make sure they can be remapped (e.g.,
%   featureselector)
% - blogreg blinreg return used scale when using multiple updates
% - move mulreg to reconstructor
% 
