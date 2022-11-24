# [l]ight [or] [d]ark selector
function lord -a color_variant
    if test -z "$color_variant"
        echo "Must provide color variant (light/dark)"
    else 
        if test "$color_variant" = "dark"
            set -Ux COLOR_VARIANT night
            set -Ux BAT_THEME base16
            kitty +kitten themes --reload-in=all "Tokyo Night"
            setscheme tokyonight
        else if test "$color_variant" = "light"
            set -Ux COLOR_VARIANT day
            kitty +kitten themes --reload-in=all "Tokyo Night Day"
            set -Ux BAT_THEME base16
            setscheme tokyonight_day
        else
            echo "Unknown color variant, should be (light, dark)"
        end
    end
end
