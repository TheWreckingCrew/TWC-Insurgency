#include "script_component.hpp"

class ADDON {
    init = QUOTE(call COMPILE_FILE(XEH_postInit));
    serverInit = QUOTE(call COMPILE_FILE(XEH_serverPostInit));
};
