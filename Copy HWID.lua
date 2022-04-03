--[[
 __      _______ _____  ______ _____  
 \ \    / /_   _|  __ \|  ____|  __ \ 
  \ \  / /  | | | |__) | |__  | |__) |
   \ \/ /   | | |  ___/|  __| |  _  / 
    \  /   _| |_| |    | |____| | \ \ 
     \/   |_____|_|    |______|_|  \_\

]]--


local http_request = http_request;

if syn then
	http_request = syn.request
end

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Krnl-Fingerprint"};
local hwid = "";

for i, v in next, hwid_list do
	if decoded.headers[v] then
		hwid = decoded.headers[v];
		break
	end
end

if hwid then
	setclipboard(hwid)
    game:GetService("StarterGui"):SetCore("SendNotification", {
       	Title = "Get HWID";
        Text = "Copy HWID Already\nPress Ctrl + V to paste";
        Duration = 9999;
    })
else
	game:GetService("Players").LocalPlayer:Kick('unable to find hwid')
end
