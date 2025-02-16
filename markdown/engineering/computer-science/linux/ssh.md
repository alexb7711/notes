<!-- :networking: -->
# Debian
- Add key: `ssh-copy-id user@ip-address` from the client computer
- Edit `/etc/sshd_config` on the server
- Go to the line labeled `PasswordAuthentication` and change to `no`
- Restart the ssh server
