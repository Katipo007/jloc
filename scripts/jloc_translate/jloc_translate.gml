/// @func jloc_translate(lookup_id)
/// @desc Get the translation for the given lookup
/// @param {string} lookup_id Lookup id for the translation
/// @return {string} Lookup value if exists, otherwise returns the given lookup identifier
gml_pragma("forceinline"); // Do not use with YYC Overwrite!
return (jloc_entry_exists(argument0) ? ds_map_find_value(global.__jloc_data, argument0) : ("l{" + argument0 + "}"));