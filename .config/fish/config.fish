if status is-interactive
    # Commands to run in interactive sessions can go here
end

set turbofish false

function fish_prompt -d "Write out the prompt"
    if $turbofish
        echo -n (set_color -o brblue)"::<"(set_color brblue; prompt_pwd;)(set_color bryellow; fish_vcs_prompt)(set_color -o brblue)">" (set_color normal)
    else
        echo -n (set_color brblue; prompt_pwd;)(set_color brpurple; fish_vcs_prompt)(set_color -o brblue) ">" (set_color normal)
    end
end

function gplr -d "Pull git repos recursively (with rebase)"
    find -maxdepth 3 -name .git -type d -printf '\n'(set_color -o brblue)'%h:'(set_color normal)'\n' -execdir git pull --rebase ";"
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
