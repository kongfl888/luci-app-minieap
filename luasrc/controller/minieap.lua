module("luci.controller.minieap", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/minieap") then
        return
    end
    if luci.sys.call("command -v minieap >/dev/null") ~= 0 then
        return
    end
    local p = entry({"admin", "services", "minieap"},
        alias("admin", "services", "minieap", "general"),
        _("MiniEAP"), 10)
    p.dependent = true
    p.i18n="minieap1"

    local p1 = entry({"admin", "services", "minieap", "general"}, cbi("minieap/general"), _("MiniEAP Settings"), 10)
    p1.leaf = true
    p1.i18n="minieap1"
    -- entry({"admin", "services", "minieap", "customfile"}, cbi("minieap/customfile"), _("custom configfiles"), 20).leaf = true
    local p3 = entry({"admin", "services", "minieap", "log"}, cbi("minieap/log"), _("MiniEAP LOG"), 30)
    p3.leaf = true
    p3.i18n="minieap1"
end
