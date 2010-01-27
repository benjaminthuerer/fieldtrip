classdef slrlap < classifier
%SLRLAP wrapper to sparse logistic regression with a laplace approximation
%
% http://www.cns.atr.jp/~oyamashi/SLR_WEB.html
%
% Copyright (c) 2010, Marcel van Gerven


    properties

        model; 
        
    end

    methods
       
      function obj = slrlap(varargin)
                  
           obj = obj@classifier(varargin{:});
                      
       end
       
       function obj = train(obj,data,design)
                 
         if design.nunique ~= 2, error('SLRLAP expects binary class labels'); end

         design = design.X -1; % zero based
         
         obj.model = slr_learning(design, [data.X ones(data.nsamples,1)], @linfun,...
           'reweight', 'OFF', 'nlearn', 300, 'nstep', 100,...
           'wdisplay', 'off', 'wmaxiter', 50, 'amax', 1e8);
         

       end

       function post = test(obj,data)

         [tmp, post] = calc_label([data.X ones(data.nsamples,1)], [zeros(data.nfeatures+1,1) obj.model]);
         
         post = dataset(post);
         
       end              
       
       function [m,desc] = getmodel(obj)
         % return the parameters wrt a class label in some shape 
         
           m = {obj.model(2:end)'}; % ignore bias term
           desc = {'unknown'};
           
       end
       
    end
end 
