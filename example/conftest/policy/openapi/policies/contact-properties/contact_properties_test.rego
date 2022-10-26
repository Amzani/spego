package openapi.policies["contact-properties"]

test_contact_missing_name_fails = true { assign(result, {"code": "contact-properties", "message": "Contact object must have \"name\", \"url\" and \"email\".", "path": ["info", "contact"]}); results[result] with input as {"info": {"contact": {"email": "web@example.org", "url": "https://example.org"}}} }
test_contact_missing_email_fails = true { assign(result, {"code": "contact-properties", "message": "Contact object must have \"name\", \"url\" and \"email\".", "path": ["info", "contact"]}); results[result] with input as {"info": {"contact": {"name": "Example", "url": "https://example.org"}}} }
test_contact_missing_url_fails = true { assign(result, {"code": "contact-properties", "message": "Contact object must have \"name\", \"url\" and \"email\".", "path": ["info", "contact"]}); results[result] with input as {"info": {"contact": {"email": "web@example.org", "name": "Example"}}} }
test_contact_with_all_fields_succeeds = true { assign(a, results) with input as {"info": {"contact": {"email": "web@example.org", "name": "Example", "url": "https://example.com"}}}; equal(count(a), 0) }