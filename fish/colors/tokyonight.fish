 # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467C
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7
    
    # Syntax Highlighting Colors
    set -Ux fish_color_normal $foreground
    set -Ux fish_color_command $cyan
    set -Ux fish_color_keyword $pink
    set -Ux fish_color_quote $yellow
    set -Ux fish_color_redirection $foreground
    set -Ux fish_color_end $orange
    set -Ux fish_color_error $red
    set -Ux fish_color_param $purple
    set -Ux fish_color_comment $comment
    set -Ux fish_color_selection --background=$selection
    set -Ux fish_color_search_match --background=$selection
    set -Ux fish_color_operator $green
    set -Ux fish_color_escape $pink
    set -Ux fish_color_autosuggestion $comment
    set -Ux fish_color_user $green
    set -Ux fish_color_host $green
    set -Ux fish_color_host_remote $red
    set -Ux fish_color_cancel $red
    set -Ux fish_color_cwd $green
    
    # Completion Pager Colors
    set -Ux fish_pager_color_progress $comment
    set -Ux fish_pager_color_prefix $cyan
    set -Ux fish_pager_color_completion $foreground
    set -Ux fish_pager_color_description $comment
    
