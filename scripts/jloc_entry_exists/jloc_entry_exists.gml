/// @func jloc_entry_exists(lookup_id)
/// @desc Check if a given lookup id exists in the currently loaded language
/// @param {string} lookup_id Lookup identifier to check existance of
/// @return true if given lookup is defined, false otherwise

gml_pragma("forceinline"); // Do not use with YYC Overwrite!
return ds_map_exists(global.__jloc_data, argument0);