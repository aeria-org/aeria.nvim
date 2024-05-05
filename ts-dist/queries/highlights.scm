(comment) @comment
(number) @number
(boolean) @boolean
(quoted_string) @string
(builtin_function) @function.builtin

(declaration name: (capitalized_word) @type)
(property_column name: (word) @local.definition)
(binary_operation
  property_name: (word) @variable
  (binary_operator) @operator
  )
(logical_concatenator_operator) @operator

[
  (collection_keyword)
  (properties_keyword)
  (required_keyword)
  (writable_keyword)
  (immutable_keyword)
  (functions_keyword)
] @keyword.type

[
 (condition)
 (property_str_attribute)
 (property_num_attribute)
 (property_enum_attribute)
 (property_file_attribute)
 (property_ref_attribute)
] @attribute.builtin

[
 (property_str_type)
 (property_num_type)
 (property_enum_type)
 (property_file_type)
 (property_ref type: (capitalized_word))
] @type.builtin

"," @punctuation.delimiter

[
 "("
 ")"
 "{"
 "}"
 "["
 "]"
] @punctuation.bracket

