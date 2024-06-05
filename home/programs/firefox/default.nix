{ colors, pkgs, ... }:
with colors;{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "general.smoothScroll" = true;
          "svg.context-properties.content.enabled" = true;
        };
        # search = {
        #   force = true;
        #   default = "Gooogle";
        #   order = [ "Google" ];
        #   engines = {
        #     "Nix Packages" = {
        #       urls = [{
        #         template = "https://search.nixos.org/packages";
        #         params = [
        #           { name = "type"; value = "packages"; }
        #           { name = "query"; value = "{searchTerms}"; }
        #         ];
        #       }];
        #       icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        #       definedAliases = [ "@np" ];
        #     };
        #     "Bing".metaData.hidden = true;
        #     "Google".metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        #   };
        # };

        # extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        #   ublock-origin
        #   re-enable-right-click
        #   don-t-fuck-with-paste

        #   enhancer-for-youtube
        #   sponsorblock
        #   return-youtube-dislikes

        #   enhanced-github
        #   refined-github
        #   github-file-icons
        #   reddit-enhancement-suite
        # ];

        
      };
    };
  };
}
