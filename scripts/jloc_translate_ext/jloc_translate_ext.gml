/// @func jloc_translate_ext(lookup_id, ...replacement_values)
/// @desc Get the translation for the given lookup, with any '%X' replacers filled in with the extra arguments.
/// @param {string} lookup_id Lookup id for the translation
/// @return {string}

var value = ds_map_find_value(global.__jloc_data, argument[0]);
if (!is_undefined(value)) {
    if (argument_count > 1) {
        for (var i=argument_count-1; i>0; i--) {
            value = string_replace_all(value, "%"+string(i), string(argument[i]));
		}
    }
    return value;
}
else {
    return "l{" + argument[0] + "}";
}