-- Public loader entry point. The server still verifies every license and payload request.
local response = request({
    Url = "https://vlanya.ru/SODGUI/loader.luau",
    Method = "GET",
    Headers = {Accept = "text/plain", ["Cache-Control"] = "no-store"},
})
assert(type(response) == "table" and response.StatusCode == 200 and type(response.Body) == "string",
    "SODGUI loader download failed")
local chunk = loadstring(response.Body, "=SODGUI/loader")
assert(type(chunk) == "function", "SODGUI loader compilation failed")
return chunk()
