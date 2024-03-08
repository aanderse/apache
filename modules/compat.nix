{ lib, ... }: with lib;
{
  options.networking.hostName = mkOption {
    default = "system-manager";
    type = types.str;
  };

  options.time.timeZone = mkOption {
    default = null;
    type = types.nullOr (types.addCheck types.str (str: filter (c: c == " ") (stringToCharacters str) == [])) // { description = "null or string without spaces"; };
  };
}
