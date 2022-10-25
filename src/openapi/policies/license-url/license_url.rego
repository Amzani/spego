package openapi.policies["license-url"]

import data.openapi.lib

# METADATA
# title: license-url
# url: License object must include "url".
# custom:
#   message: License object must include "url".
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "license", "url"]
	url := object.get(input, path, true)

	is_not_str := is_string(url) == false
	is_empty := url == ""
	any([is_not_str, is_empty])
}