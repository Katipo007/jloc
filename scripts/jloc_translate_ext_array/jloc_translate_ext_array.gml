/// @func jloc_translate_ext_array(lookup_id, replacement_values_array)
/// @desc Version of `jloc_translate_ext` but takes an array instead of variable parameters.
/// Get the translation for the given lookup, with any '%X' replacers filled in with values from the array.
/// @param {string} lookup_id Lookup id for the translation
/// @param {array<string>} replacement_values_array Array of replacement values
/// @return {string}

var value = ds_map_find_value(global.__jloc_data, argument0);
if (!is_undefined(value)) {
    if (argument_count > 1) {
        for (var i=array_length_1d(argument1)-1; i>=0; i--) {
            value = string_replace_all(value, "%"+string(i), string(argument1[i]));
		}
    }
    return value;
}
else {
    return "l{" + argument0 + "}";
}