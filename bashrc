# Stat the ssh-agent for handling ssh-key based auth
eval `ssh-agent`
ssh-add ~/.ssh/id_rsa_github
