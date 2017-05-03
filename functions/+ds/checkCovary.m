function [effective_vary_lengths, linked_indices] = checkCovary(vary_lengths, vary_params, varargin)
%% CHECKCOVARY
% TODO does this check if any varied parameters are covaried?

%% localfn output
if ~nargin
  effective_vary_lengths = localfunctions; % output var name specific to this fn
  return
end

%% auto_gen_test_data_flag argin
options = ds.checkOptions(varargin,{'auto_gen_test_data_flag',0,{0,1}},false);
if options.auto_gen_test_data_flag
  varargs = varargin;
  varargs{find(strcmp(varargs, 'auto_gen_test_data_flag'))+1} = 0;
  varargs(end+1:end+2) = {'unit_test_flag',1};
  argin = [{vary_lengths}, {vary_params}, varargs]; % specific to this function
end

non_singleton_vary_lengths = vary_lengths(vary_lengths > 1);

non_singleton_vary_params = vary_params(:, vary_lengths > 1);

diff_vary_lengths = diff(non_singleton_vary_lengths);

equal_vary_length_indices = diff_vary_lengths == 0;

equal_vary_length_blocks = ds.indexToBlocks(equal_vary_length_indices);

if ~isempty(equal_vary_length_blocks)
  equal_vary_length_blocks(:, 2) = equal_vary_length_blocks(:, 2) + 1;
end

no_blocks = size(equal_vary_length_blocks, 1);

linked_indices = {};

number_linked_sets = 0;

for block = 1:no_blocks
  param_indices = equal_vary_length_blocks(block, 1):equal_vary_length_blocks(block, 2);
  
  iteration_number = 1;
  while length(param_indices) > 1
    [linked_set, param_indices] = find_linked_params(param_indices, non_singleton_vary_params, varargin{:});
    
    if ~isempty(linked_set)
      number_linked_sets = number_linked_sets + 1;
      linked_indices{number_linked_sets} = linked_set;
    end
    
    iteration_number = iteration_number + 1;
    if iteration_number > 10
      return
    end
  end
end

effective_vary_lengths = non_singleton_vary_lengths;

for l = 1:number_linked_sets
  effective_vary_lengths(linked_indices{l}(2:end)) = [];
end

%% auto_gen_test_data_flag argout
if options.auto_gen_test_data_flag
  argout = {effective_vary_lengths, linked_indices}; % specific to this function
  
  ds.unit.saveAutoGenTestData(argin, argout);
end

end % main fn


%% local functions
function [linked_indices, non_linked_indices] = find_linked_params(param_indices, vary_params, varargin)

%% auto_gen_test_data_flag argin
options = ds.checkOptions(varargin,{'auto_gen_test_data_flag',0,{0,1}},false);
if options.auto_gen_test_data_flag
  varargs = varargin;
  varargs{find(strcmp(varargs, 'auto_gen_test_data_flag'))+1} = 0;
  varargs(end+1:end+2) = {'unit_test_flag',1};
  argin = [{param_indices},{vary_params}, varargs];
end

param1_index = param_indices(1);

params_at_value1 = vary_params(vary_params(:, param1_index) == vary_params(1, param1_index), :);

no_values_at_value1 = nan(size(param_indices));

no_values_at_value1(1) = 1;

for p = 2:length(param_indices)
  
  param_index = param_indices(p);
  
  no_values_at_value1(p) = length(unique(params_at_value1(:, param_index)));
  
end

linked_indices = param_indices(no_values_at_value1 == 1);

non_linked_indices = param_indices(no_values_at_value1 > 1);


%% auto_gen_test_data_flag argout
if options.auto_gen_test_data_flag
  argout = {linked_indices, non_linked_indices}; % specific to this function
  
  ds.unit.saveAutoGenTestDataLocalFn(argin, argout); % localfn
end

end
