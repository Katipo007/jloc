# jloc
> Localisation library for Gamemaker Studio 2, created by [@Katipo007](https://twitter.com/Katipo007)

![License](https://img.shields.io/github/license/katipo007/jloc)

# Installation
Using [Catalyst](https://github.com/GameMakerHub/Catalyst), the open-source package manager for GameMaker Studio 2:

```
catalyst require katipo007/jloc
```

# Usage

1. Add localisation `.json` files to your project as "Included Files" (eg: `localisation/english.json`)
2. Call `jloc_initialise()` before using any other `jloc_*` functions
3. (optional) If you wish to store your localisation files somewhere other than `/localisation/` call `jloc_set_directory()` with the desired path.
4. Call `jloc_load()` with the desired language, eg: `jloc_load("english")`
5. You are now able to use the `jloc_translate_*` functions

# Localisation File Format
Localisation files are defined in the JSON format, and the filenames use the `.json` extension.
```json
{
    "lookup": "value",
    
    "sublevel": {
        ".": "SublevelValue",
        "lookup": "value2"
    }
}
```

After loading the above example file,

- `jloc_translate("lookup")` will return "value"
- `jloc_translate("sublevel.lookup")` will return "value2"
- `jloc_translate("sublevel")` will return "SublevelValue"
- `jloc_translate("invalid.lookup")` will return "invalid.lookup"


# Replacements

`jloc_translate_ext()` and `jloc_translate_ext_array()` allow you to supply values to be inserted into the translated string via "%" tags.

Eg: A localisation value of "Hello, %1!", when called with `jloc_translate_ext("<lookupId>", "world")` will return "Hello, world!". `jloc_translate("<lookupId>")` would return "Hello, %1!".



# FAQ

- Have I seen this before?
    - This is a ported version of [the old version](https://github.com/Katipo007/oloc) to [Catalyst](https://github.com/GameMakerHub/Catalyst)
- What if a value is not found for a localisation lookup?
    - The lookup string will be returned. Eg: `jloc_translate("invalid.lookup")` will return "invalidLookup".
- Supported platforms
    - Because it is written completely in GML it will work on all export platforms. The only exception is HTML5, where the `jloc_get_languages()` function will not work due to Gamemaker limitations.
- My localisation file is not loading
    - `jloc_load()` returns an error code in the event something went wrong, you can compare the returned value against the extension macros `jloc_error_no_error`, `jloc_error_cant_find_file` and `jloc_error_read_error`. `jloc_error_read_error` signifies that the JSON file could not be parsed correctly and it should be checked for formating errors (gamemaker doesn't provide functionality to check why it failed.) It is often due to a missing `,`.
