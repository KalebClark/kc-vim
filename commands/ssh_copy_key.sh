# ssh_copy_key
# 
# This will copy the local id_rsa.pub key to a remote host
#echo -e "ssh_copy_key:\t\tCopies your ~/.ssh/id_rsa.pub ro remote host"

function ssh_copy_key {
    read -p "Copy ssh key to host: " HOST
    read -p "Remote User to log in as: " REMOTE_USER
    cat ~/.ssh/id_rsa.pub | ssh $REMOTE_USER@$HOST 'cat >> .ssh/authorized_keys'
}
