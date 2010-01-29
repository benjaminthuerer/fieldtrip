function [acc,sig,cv] = test_procedure(myproc,nfolds,X,Y)
% test classification procedure
%
% [acc,sig,cv] = test_procedure(myproc,nfolds,data,design)
%
%   Copyright (c) 2009, Marcel van Gerven
%
%   $Log: test_procedure.m,v $
%

  if nargin == 1
    nfolds = 10;
  end

  if nargin < 4
    
    % load example data
    load covattfrq1
    
    cvec = ismember(left.label,ft_channelselection({'MLO' 'MRO'},left.label)); % subset of channels
    fvec = (left.freq >= 8 & left.freq <= 14); % subset of frequencies
    tvec = (left.time >= 1.5 & left.time <= 2.5); % subset of time segment
    
    X  = dataset([squeeze(mean(left.powspctrm(:,cvec,fvec,tvec),4)); squeeze(mean(right.powspctrm(:,cvec,fvec,tvec),4))]);
    Y  = dataset([ones(size(left.powspctrm,1),1); 2*ones(size(right.powspctrm,1),1)]);
  
    if isa(myproc{end},'transfer_learner')
      
      load covattfrq2;
      
      cvec = ismember(left.label,ft_channelselection({'MLO' 'MRO'},left.label)); % subset of channels
      fvec = (left.freq >= 8 & left.freq <= 14); % subset of frequencies
      tvec = (left.time >= 1.5 & left.time <= 2.5); % subset of time segment
      
      X2  = dataset([squeeze(mean(left.powspctrm(:,cvec,fvec,tvec),4)); squeeze(mean(right.powspctrm(:,cvec,fvec,tvec),4))]);
      Y2  = dataset([ones(size(left.powspctrm,1),1); 2*ones(size(right.powspctrm,1),1)]);
      
      X = {X X2};
      Y = {Y Y2};
      
    end    
    
  end
  
  cv = crossvalidator('procedure',myproc,'nfolds',nfolds,'verbose',true,'compact',false,'balanced',false);

  cv = cv.validate(X,Y);
  
  acc = cv.evaluate;
  sig = cv.significance;
  
end