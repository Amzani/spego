package openapi.policies["path-params"].lib

named_path_params(params, path_prefix) := [[param, path] | assign(param, params[i]); param.name; equal(param.in, "path"); assign(path, array.concat(path_prefix, ["parameters", sprintf("%d", [i])]))] { true }
named_path_params_unique(params, path_prefix) := {p | assign(ps, named_path_params(params, path_prefix)); assign(p, ps[_])} { true }
named_path_params_unique_required(params, path_prefix) := {p | assign(ps, named_path_params_unique(params, path_prefix)); ps[p]; p[0].required} { true }