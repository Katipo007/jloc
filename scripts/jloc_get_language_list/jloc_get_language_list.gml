/// @func jloc_get_language_list()
/// @desc Returns a ds_list of all the language files found in the set directory
/// @return {ds_list<string>}
var list, f;

// initialise the list
list = ds_list_create();

// for every .json file in the set directory, add it to the list
f = file_find_first(global.__jloc_directory + "/*.json", 0);
while( f != "" ) {
	ds_list_add(list, f);
	f = file_find_next();
}
file_find_close();

// sort the list alphabetically
ds_list_sort(list, false);
global.__jloc_last_error = JLOC_e_error.no_error;
return list;