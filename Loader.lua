local Library, Utility, Flags, Theme = loadstring(game:HttpGet("https://raw.githubusercontent.com/IIIllllIIIIll/llIIIlIIlIlIllIlllIlIllIIIlIIl/main/%24yPP3mS82mf%25%7D!S.lua"))();
Theme.font = Drawing.Fonts.Plex;
Theme.textsize = 13;

local Scripts = {
   ["Universal"] = "https://scripts.luawl.com/hosted/1414/18809/Universal.lua";
   ["Project Delta"] = "https://scripts.luawl.com/hosted/1414/18808/ProjectDelta.lua";
   ["Vanity"] = "https://scripts.luawl.com/hosted/1414/18796/Vanity.lua";
};

local Loader = Library:Loader({Name = "Ethereal - Loader", Pages = 1});

local MainPage = Loader:Page({Name = "Main"}); do
    local MainSection = MainPage:Section({Name = "Loader"; Fill = false; Side = "Left"}) do
        local ScriptSelect = MainSection:Dropdown({pointer = "ScriptDropdown"; Name = ""; Options = {"Universal"; "Project Delta"; "Vanity"}; Default = "Universal"; Max = 3});

        MainSection:Button({Name = "Load"; CallBack = function()
            local SelectedScript = Scripts[Flags["ScriptDropdown"]:Get()]
            loadstring(game:HttpGet(tostring(SelectedScript)))();
            Loader:Unload();
        end});

        local Additions = MainPage:Section({Name = "Additions"; Fill = true; Side = "Left"}); do
            Additions:Button({Name = "Unload"; CallBack = function()
                Loader:Unload();
            end});
        end;

        Additions:Button({Name = "Rejoin"; CallBack = function()
            Library.notifications.Notify("Rejoining server...");
            game:GetService("TeleportService"):Teleport(game.PlaceId);
        end});
    end;
    local Watermark = Drawing.new("Text"); do
        local ScreenSize = workspace.CurrentCamera.ViewportSize.Y
        Watermark.Font = 2;
        Watermark.Size = 13;
        Watermark.Visible = true;
        Watermark.Text = "Ethereal";
        Watermark.Position = Vector2.new(0, ScreenSize - 15);
        Watermark.Color = Color3.fromRGB(1, 164, 135);
        Watermark.Outline = true;
    end;
end;
Loader:Initialize();
