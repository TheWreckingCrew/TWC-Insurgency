#include "script_component.hpp"

class ADDON {
    serverInit = QUOTE(call COMPILE_FILE(XEH_serverPostInit));
};
