package openapi.policies["no-script-tags-in-markdown"]

test_script_tag_in_markdown_title_fails = true { assign(result, {"code": "no-script-tags-in-markdown", "message": "Markdown descriptions must not have \"<script>\" tags.", "path": ["info", "title"]}); results[result] with input as {"info": {"title": "hi <script>alert('hi')</script> there"}} }
test_script_tag_in_markdown_description_fails = true { assign(result, {"code": "no-script-tags-in-markdown", "message": "Markdown descriptions must not have \"<script>\" tags.", "path": ["info", "description"]}); results[result] with input as {"info": {"description": "hi <script>alert('hi')</script> there"}} }
test_script_tag_in_markdown_title_and_description_fails = true { assign(mock_input, {"info": {"description": "hi <script>alert('hi')</script> there", "title": "hi <script>alert('hi')</script> there"}}); assign(result1, {"code": "no-script-tags-in-markdown", "message": "Markdown descriptions must not have \"<script>\" tags.", "path": ["info", "title"]}); assign(result2, {"code": "no-script-tags-in-markdown", "message": "Markdown descriptions must not have \"<script>\" tags.", "path": ["info", "description"]}); assign(res, results) with input as mock_input; res[result1]; res[result2] }
test_no_script_tag_in_markdown_title_succeeds = true { assign(a, results) with input as {"info": {"title": "hi"}}; equal(count(a), 0) }
test_no_script_tag_in_markdown_description_succeeds = true { assign(a, results) with input as {"info": {"description": "hi"}}; equal(count(a), 0) }