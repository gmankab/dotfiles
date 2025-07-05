function fish_prompt --description 'Write out the prompt'
        set -l last_pipestatus $pipestatus
        set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
        set -l normal (set_color normal)
        set -q fish_color_status
        or set -g fish_color_status red

        # Color the prompt differently when we're root
        set -l color_cwd $fish_color_cwd
        set -l suffix '>'
        if functions -q fish_is_root_user; and fish_is_root_user
                if set -q fish_color_cwd_root
                        set color_cwd $fish_color_cwd_root
                end
                set suffix '#'
        end

        # Write pipestatus
        # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
        set -l bold_flag --bold
        set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
        if test $__fish_prompt_status_generation = $status_generation
                set bold_flag
        end
        set __fish_prompt_status_generation $status_generation
        set -l status_color (set_color $fish_color_status)
        set -l statusb_color (set_color $bold_flag $fish_color_status)
        set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

        if [ -f /etc/os-release ]
            set distro (grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')
        end
        set icon '➜'
        if [ -d /data/data/com.termux ]
            set icon ''
        end
        switch $distro
            case fedora
                set icon ''
            case arch
                set icon '󰣇'
            case archarm
                set icon '󰣇'
            case endeavour
                set icon '󰣇'
            case nixos
                set icon '󱄅'
            case vanilla
                set icon ''
            case debian
                set icon ''
            case ubuntu
                set icon ''
            case ol
                set icon '󱄛'
            case rhel
                set icon '󱄛'
            case opensuse-tumbleweed
                set icon ''
            case openwrt
                set icon ''
            case postmarketos
                set icon ''
            case alpine
                set icon ''
        end
        if test -n "$SSH_CONNECTION"
            set icon "󰌗 $icon"
        end
        if test -n "$container"
            set icon "📦$icon"
        end

        echo -n -s $icon " " (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
end

