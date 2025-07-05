function prompt_icon
    set icon '➜'
    if [ -d /data/data/com.termux ]
        set icon ''
    end
    if [ -f /etc/os-release ]
        set distro (grep '^ID=' /etc/os-release | cut -d '=' -f2 | tr -d '"')
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
        set icon "⬢ $icon"
    end
    echo -n $icon
end

