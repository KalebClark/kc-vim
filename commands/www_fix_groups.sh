# Fix groups
#echo -e "www_fix_groups:\t\tAdds groups to user and www user"
function www_fix_groups {
    read -p "What normal user: " USER_NORMAL
    read -p "Webserver Group: " USER_WWW

    usermod -a -G $USER_NORMAL $USER_WWW
    usermod -a -G $USER_WWW $USER_NORMAL
}
