(comment) @comment
(number) @number
(boolean) @boolean
(quoted_string) @string
"," @punctuation.delimiter
[
 "("
 ")"
 "{"
 "}"
 "["
 "]"
] @punctuation.bracket

(collection [
             "collection"
             "properties"
             "presets"
             "properties"
             ] @keyword)

(collection_modifiers [
                       "owned"
                       "timestamps"
                       "icon"
                       ] @keyword)
(collection_keyed_list [
                        "form"
                        "filters"
                        "immutable"
                        "indexes"
                        "presets"
                        "required"
                        "table"
                        "tableMeta"
                        "writable"
                        ] @keyword)

(schema_properties [
             "form"
             "immutable"
             "required"
             "writable"
             "properties"
             ] @keyword)

(collection_functions "functions" @keyword)

(collection_security "security" @keyword)
(collection_security_logging ["logging" "strategy"] @keyword)
(collection_security_rate_limiting ["rateLimiting" "strategy"] @keyword)

(collection_search [
                    "search"
                    "placeholder"
                    "indexes"
                    ] @keyword)

(collection_layout [
                    "layout"
                    "name"
                    "options"
                    "title"
                    "picture"
                    "badge"
                    "information"
                    "active"
                    "translateBadge"
                    ] @keyword)

[
  (attribute)
  (condition)
]@attribute.builtin

(collection name: (collection_name) @type)
(properties_column
  name: (word) @local.definition
  type: (properties_column_type) @type.builtin
)
(properties_column
  name: (word) @local.definition
  type: (collection_name) @type
)

(binary_operation
  property_name: (word) @variable
  (binary_operator) @operator
  )
(logical_concatenator_operator) @operator

