if status is-interactive
    # Commands to run in interactive sessions can go here
end

set turbofish false
set __fish_git_prompt_showupstream verbose
set __fish_git_prompt_showdirtystate true
set __fish_git_prompt_color brpurple
set __fish_git_prompt_color_bare bryellow
set __fish_git_prompt_color_merging brred

if type -q "pay-respects"
    pay-respects fish --alias | source
end

function fish_prompt -d "Write out the prompt"
    if $turbofish
        echo -n (set_color -o brblue)"::<"(set_color brblue; prompt_pwd;)(fish_vcs_prompt; set_color -o brblue;)">" (set_color normal;)
    else
        echo -n (set_color brblue; prompt_pwd;)(fish_vcs_prompt; set_color -o brblue;) ">" (set_color normal;)
    end
end

function gplr -d "Pull git repos recursively (with rebase)"
    find -maxdepth $argv[1] -name .git -type d -printf '\n'(set_color -o brblue)'%h:'(set_color normal)'\n' -execdir git pull $argv[2..-1] ";"
end

function colors -d "Show colors with their names in fish"
    for color in black red green yellow blue purple cyan white
        echo -n (set_color -b $color)"  "$color"  "(set_color normal)
    end
    echo ""

    for color in brblack brred brgreen bryellow brblue brpurple brcyan brwhite
        echo -n (set_color -b $color) $color (set_color normal)
    end
    echo ""
end

function ytmdl -d "Download music from YTM"
    yt-dlp -f bestaudio --extract-audio --add-metadata --parse-metadata "playlist_index:%(meta_track)s" --output "%(album)s/%(playlist_index)s %(artist)s - %(title)s.%(ext)s" $argv
end

