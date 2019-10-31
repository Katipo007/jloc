/// @func jloc_load(language_filename)
/// @desc Loads a given localisation file based on its filename. Looks in directory set by `jloc_set_directory()`
/// @param {string} language_filename Filename without path or extension.
/// @return {JLOC_e_*} Error code
__JLOC_INITIALISED_GUARD;

ds_map_clear(global.__jloc_data);

var active_file = argument0 + ".json";
var active_path = global.__jloc_directory + "/" + active_file;
var read_file = file_text_open_read(active_path); // Open the file to read

// If the file failed to open
if( read_file == -1 )
    return JLOC_e_error.file_not_found;

// read file contents into a single string and parse to json
var filecontents = "";
while (!file_text_eof(read_file)) {
    filecontents += file_text_readln(read_file);
}
file_text_close(read_file);

// decode the file contents into a json object
var json = json_decode(filecontents);
if (json == -1)
	return JLOC_e_error.json_parse_error;


// optimise the language json into a simpler map
var parse_queue = ds_queue_create();
ds_queue_enqueue(parse_queue, ["", json]);

while (!ds_queue_empty(parse_queue)) {
	var _d = ds_queue_dequeue(parse_queue);
	var map_path = _d[0],
		map = _d[1];
	
	var key = ds_map_find_first(map);
	while (!is_undefined(key)) {
		// construct the path to get to this point (used as translation lookup)
		var path;
		if (map_path == "") {
			path = key;
		} else {
			if (key == ".")
				path = map_path;
			else
				path = map_path + "." + key;
		}
		
		var value = map[? key];
		// add string value as a language entry
		if (is_string(value)) {
			global.__jloc_data[? path] = value;
		}
		// value is a real number, treat as a sub JSON structure (ds_map) and add to the queue of entires we need to process
		else if (is_real(value) && ds_exists(value, ds_type_map)) {
			ds_queue_enqueue(parse_queue, [path, value]);
		}
		
		key = ds_map_find_next(map, key);
	} // end key iteration
} // end ds_map iteration

// clean memory
ds_map_destroy(json);
ds_queue_destroy(parse_queue);

global.__jloc_active = active_file;
global.__jloc_active_path = active_path;
global.__jloc_last_error = JLOC_e_error.no_error;

return JLOC_e_error.no_error;