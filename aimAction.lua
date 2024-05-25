require "moonloader"
require "sampfuncs"

script_name("Aim_Actions")
script_author("Hyam")

local sampev = require "lib.samp.events"
local vkeys = require 'vkeys'
local encoding = require "encoding"
encoding.default = 'CP1251'
u8 = encoding.UTF8

function main()
    while not isSampAvailable() do wait(50) end
	sampAddChatMessage("{FFFFFF}Aim Hotkey by: {AAAAFF}Hyam {FFFFFF}| type {AAAAFF}/aahelp {FFFFFF}for commands", -1)
    while true do
        if not (sampIsChatInputActive() or sampIsDialogActive() or isSampfuncsConsoleActive()) then
            local res, targetedPlayer = getCharPlayerIsTargeting(playerHandle)
            -- implement a switch case eq. to do actions on different key press
            if res and isKeyJustPressed(vkeys.VK_N) then
                local result, playerID = sampGetPlayerIdByCharHandle(targetedPlayer)
                if result then
                    playerName = sampGetPlayerNickname(playerID)
                    playerRPName = playerName:gsub("_", " ")
                    sampSendChat("/me begs " .. playerRPName .. " for cash. ")
                    sampSendChat("/nobreath 1")
                end
            end
        end
        wait(0)
    end
end
