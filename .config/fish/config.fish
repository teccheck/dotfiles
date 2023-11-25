if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt -d "Write out the prompt"
    set -l symbol '$'
    set -l color $fish_color_cwd

    if fish_is_root_user
        set symbol '#'
        set -q fish_color_cwd_root
        and set color $fish_color_cwd_root
    end

    echo -n (set_color $color)$USER@$hostname(set_color normal):(set_color brblue; prompt_pwd;) $symbol (set_color normal)

end
