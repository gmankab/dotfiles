function fish_prompt
    set -l __last_command_exit_status $status
    if not set -q -g __fish_arrow_functions_defined
        set -g __fish_arrow_functions_defined
        function _git_branch_name
            set -l branch (git symbolic-ref --quiet HEAD 2>/dev/null)
            if set -q branch[1]
                echo (string replace -r '^refs/heads/' '' $branch)
            else
                echo (git rev-parse --short HEAD 2>/dev/null)
            end
        end
        function _is_git_dirty
            not command git diff-index --cached --quiet HEAD -- &>/dev/null
            or not command git diff --no-ext-diff --quiet --exit-code &>/dev/null
        end
        function _is_git_repo
            type -q git
            or return 1
            git rev-parse --git-dir >/dev/null 2>&1
        end
        function _hg_branch_name
            echo (hg branch 2>/dev/null)
        end
        function _is_hg_dirty
            set -l stat (hg status -mard 2>/dev/null)
            test -n "$stat"
        end
        function _is_hg_repo
            fish_print_hg_root >/dev/null
        end
        function _repo_branch_name
            _$argv[1]_branch_name
        end
        function _is_repo_dirty
            _is_$argv[1]_dirty
        end
        function _repo_type
            if _is_hg_repo
                echo hg
                return 0
            else if _is_git_repo
                echo git
                return 0
            end
            return 1
        end
    end
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l green (set_color -o green)
    set -l blue (set_color -o blue)
    set -l normal (set_color normal)
    set -l color "$green"
    if test $__last_command_exit_status != 0
        set color "$red"
    end
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
    set -l cwd $cyan(basename (prompt_pwd))
    set -l repo_info
    if set -l repo_type (_repo_type)
        set -l repo_branch $red(_repo_branch_name $repo_type)
        set repo_info "$blue $repo_type:($repo_branch$blue)"
        if _is_repo_dirty $repo_type
            set -l dirty "$yellow ✗"
            set repo_info "$repo_info$dirty"
        end
    end
    echo -n -s $color $icon '  '$cwd $repo_info $normal ' '
end

