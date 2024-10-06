//config files
#define CONFIG_GET(X) global.config.Get(/datum/config_entry/##X)
#define CONFIG_SET(X, Y) global.config.Set(/datum/config_entry/##X, ##Y)
#define CONFIG_LOADED global.config.load_complete

#define CONFIG_MAPS_FILE "maps.txt"

//flags
/// can't edit
#define CONFIG_ENTRY_LOCKED 1
/// can't see value
#define CONFIG_ENTRY_HIDDEN 2

// Flags for respawn config
/// Respawn not allowed
#define RESPAWN_FLAG_DISABLED 0
/// Respawn as much as you'd like
#define RESPAWN_FLAG_FREE 1
/// Can respawn, but not as the same character
#define RESPAWN_FLAG_NEW_CHARACTER 2
