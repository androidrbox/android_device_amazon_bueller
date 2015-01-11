#!/system/bin/sh
#
# Checks every file that should be on the persist partition, and ensures that
# each one is there and is bigger than zero bytes, and that it can be read by
# doing on md5 on it.
#
# Currently putting a lot of files in the optional pool, as many units are
# missing these files, and they are not required for basic AIV playback
#
# Andrew Pierson
# 2013 Sep 26

required_directories=()
required_directories+=('/persist')
required_directories+=('/persist/data')
required_directories+=('/persist/data/app_ms')
required_directories+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_')
required_directories+=('/persist/data/device_info')
required_directories+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_')

required_files=()
required_files+=('/persist/data/app_ms/keyfile.dat')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/-lndchIc3h7lLcBHqLCVTRwsBQU_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/AqEmxtFosQPPH-ASRTWrTN0zFwI_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/xmCXhhIu8UwnU13OCzfWzRXOFiI_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/wHPCuFBMd5Z7-P4jMU--oBvQDz4_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/wz7LfpFWq6YFJQj8lLYN4vEsd0g_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/mxrN+7RFB9miwfZrRU1xlWieu4M_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/oUtpSCeDR40uafRBmUR7mFYw+ik_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/fil8fYE2kpyD+gNF9IULyWpJiMs_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/8oPVwf9NrhTSk5DXKuiMfak4SQI_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/39j-Wt07C-dAogUK9xbr3vf7xFY_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/2a8EC7fiuOLWZ6xkJz2qV9BUyqY_')
required_files+=('/persist/data/app_ms/MxNw57WpMwUrwl29zlzqzCirAwg_/aZ532jwWSI64IZ5usuKIzxv4BOQ_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/TiQ38N6dNlsdOVagMPcp+dTmNY0_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/R4LPLcv7zaq2n4fC0sGMBeZ3X-s_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/oILr5P46fwr1teYGqdOWizlbO24_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/k9jpH9Usu3WsJmtEfoScRKCTmfw_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/qV8+SDU-JDm37ek6d0ZYpwxNdlw_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/KT+KQyp0IMXq8bdfNndhEV197wc_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/FKPXfu3sbhB9qL49Dqjhf7372Fc_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/lO4HY8g3PhzbmDfofpViU+jZjD0_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/wknJJ8gtR1cIJ90KgEhqieDxf3E_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/I7DjTl61kbWEmIactniPa9PcS4Y_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/yVx634a75ZFYkahVXKFgczhvBsc_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/7KHZKMuwtU5qWsgKlhOHzNBWC5E_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/DbfvhNyeaXGaW9mMSl5figrZ6Wk_')
required_files+=('/persist/data/device_info/lU0buD2Au29udGso8N4+xMTtmAw_/46DPBk0rqq+GUTOg9Tt6t3dlodM_')

optional_directories=()
optional_directories+=('/persist/data/dxhdcp2')
optional_directories+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_')
optional_directories+=('/persist/data/future')
optional_directories+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_')
optional_directories+=('/persist/data/nero')
optional_directories+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_')

optional_files=()
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/serFqPRjzYKOgVsbW2aNQ1ETzl4_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/etK7oituoft7bxrO5H7GIVuhEQM_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/6RuErxADnG1e2HZAv69Kyezt+lo_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/huPZ4cLSC8mTHntfpZ7MC9DH9CE_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/uBecdIgYGs41JYff98nfv-EWKn4_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/zttE+GVYd9YzREzMHiKY-IlERZM_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/WDHhiwshvAlJFop6xTwsOfk9mnc_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/363C-Y3DPmmGauCE8+3lKsWWUBo_')
optional_files+=('/persist/data/dxhdcp2/acGSIRU1TX-2o-nJ69e1aFGgUxE_/Z1jw29Oommpj0dqujGYWnyWUvjo_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/iTX40KP1DnuBA5sxZZidrDKGaUs_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/vJvUKUfNz3Bu0YF7aU7p78T6V+o_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/hWOb7roH+3tJHVEgem+sh56aG48_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/v25JOYR7wNjo1x+DCRYYnuFMuls_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/gMnvtIKzCoUFjfDeDDi8IdLSFa8_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/JmYe8xE3aYXHFRojJWvtocGdV9s_')
optional_files+=('/persist/data/future/67Peij2aQDZhMutd61r0TkyWwRY_/wwqO6C6KXvJUDTntoXf6zM8otZ4_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/7kPsuAR7UtjbwLdFU56L7qzyKq0_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/eV5Rjd7N6VvZETiA2DTzoCeWZIQ_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/p2gPw87gZYlQRGn+VFQf0diS1j8_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/nfCmqd6AnX8kP7tEqEe-Od2ppw8_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/X0zM0+l-i52y1dDNHfJSILYgG8M_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/fsEWqkfeP3pv-fP4tS+BvF8vpK8_')
optional_files+=('/persist/data/nero/UowpHjFVkubFR5XYNPXNCKRfRiQ_/icK54L2DEOPT03VVDA6crDJ0bHk_')

function check_directory ()
{
    d=${1:-no.argument.supplied}
    exit_on_fail=${2:-1}
    if [ ! -d ${d} ]
    then
        echo "${d} does not exist" > /dev/kmsg
        if [ "${exit_on_fail}" == "1" ]
        then
            exit 1
        fi
    fi
}

function check_file ()
{
    f=${1:-no.argument.supplied}
    exit_on_fail=${2:-1}
    if [ ! -s ${f} ]
    then
        echo "${f} does not exist or have size > 0" > /dev/kmsg
        if [ "${exit_on_fail}" == "1" ]
        then
            exit 1
        fi
    fi
    /system/bin/md5 ${f} 2>&1 > /dev/null
    if [ "$?" != "0" ]
    then
        echo "could not perform an md5 on ${f}" > /dev/kmsg
        if [ "${exit_on_fail}" == "1" ]
        then
            exit 1
        fi
    fi
}

for d in ${required_directories[@]}
do
    check_directory ${d} 1
done

for f in ${required_files[@]}
do
    check_file ${f} 1
done

for d in ${optional_directories[@]}
do
    check_directory ${d} 0
done

for f in ${optional_files[@]}
do
    check_file ${f} 0
done

exit 0
