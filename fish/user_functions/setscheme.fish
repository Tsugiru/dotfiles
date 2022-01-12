function setscheme
    if test -z "$argv"
        return 1
    end

    if test -e ~/.config/fish/colors/$argv[1].fish
        fish ~/.config/fish/colors/$argv[1].fish
    else
        echo $argv[1].fish does not exist
    end
end
