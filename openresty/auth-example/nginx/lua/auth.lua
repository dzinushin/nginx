local cjson = require "cjson"

local originalXRealUserId = ngx.req.get_headers()["x-real-userid"]
ngx.log(ngx.ERR, "originalXRealUserId: "..(function() if originalXRealUserId then return originalXRealUserId else return 'nil' end end)());
if originalXRealUserId then
    ngx.req.set_header("x-original-real-userid", originalXRealUserId)
    local res = ngx.location.capture("/finauth/?cianId="..originalXRealUserId)
    local body = cjson.decode(res.body)
    local financeUserId = body["XRealUserId"]
    if financeUserId then
        ngx.req.set_header("x-real-userid", financeUserId)
        ngx.req.set_header("x-fin-authenticated", body["finAuth"])
        return
    end
end

local financeCookie = ngx.var.cookie_finauth
ngx.log(ngx.ERR, "financeCookie: "..(function() if financeCookie then return financeCookie else return 'nil' end end)());
if financeCookie then
    local res = ngx.location.capture("/finauth/?cookie="..financeCookie)
    local body = cjson.decode(res.body)
    local financeUserId = body["XRealUserId"]
    if financeUserId then
        ngx.req.set_header("x-real-userid", financeUserId)
        ngx.req.set_header("x-fin-authenticated", body["finAuth"])
        ngx.req.set_header("x-fin-secured", "true")
        return
    end
end

local res = ngx.location.capture("/finauth-newuser/")
local cookie = res.header["Set-Cookie"]
local body = cjson.decode(res.body)
local x_real_userid = body["XRealUserId"]

ngx.req.set_header("x-real-userid", x_real_userid)
ngx.req.set_header("x-fin-authenticated", body["finAuth"])
ngx.header["Set-Cookie"] = cookie


