package openapi.policies["info-license"]

import data.openapi.lib

# METADATA
# title: info-license
# license: Info object must have "license" object.
# custom:
#   message: Info object must have "license" object.
results[lib.format(rego.metadata.rule(), path)] {
	path := ["info", "license"]
	license := object.get(input, path, true)
	is_object(license) == false
}