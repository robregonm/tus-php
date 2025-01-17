#!/bin/sh

XDEBUG_CONFIG=/etc/php/7.3/conf.d/00_xdebug

enable()
{
    if [[ -f  ${XDEBUG_CONFIG}.disable ]]; then
        mv ${XDEBUG_CONFIG}.disable ${XDEBUG_CONFIG}.ini;
        echo "Xdebug enabled";
    fi
}

disable()
{
    if [[ -f  ${XDEBUG_CONFIG}.ini ]]; then
        mv ${XDEBUG_CONFIG}.ini ${XDEBUG_CONFIG}.disable;
        echo "Xdebug disabled";
    fi
}

case "$1" in
    (enable)
        enable
        exit 0
        ;;
    (disable)
        disable
        exit 0
        ;;
    (*)
        echo "Usage: $0 {enable|disable}"
        exit 2
        ;;
esac
