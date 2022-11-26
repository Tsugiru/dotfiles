# [l]ight [or] [d]ark selector
function lord -a color_variant
    if test -z "$color_variant"
        echo "Must provide color variant (light/dark)"
    else 
        if test "$color_variant" = "dark"
            echo "colorscheme tokyonight-night" > ~/.vimrc.color
            kitty +kitten themes --reload-in=all "Tokyo Night"
        else if test "$color_variant" = "light"
            echo "colorscheme tokyonight-day" > ~/.vimrc.color
            kitty +kitten themes --reload-in=all "Tokyo Night Day"
        else
            echo "Unknown color variant, should be (light, dark)"
        end
    end
end
