-- ya pkg add yazi-rs/plugins:git
-- ya pkg add yazi-rs/plugins:full-border
-- ya pkg add Rolv-Apneseth/starship
-- ya pkg add lpanebr/yazi-plugins:first-non-directory

require("git"):setup { order = 0 }
require("full-border"):setup()
require("starship"):setup()
