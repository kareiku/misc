---
title: How to Connect GitHub to Git SSH
layout: default
---

# How to Connect GitHub to Git SSH

## Steps for Generating an SSH Key

1. Generate an SSH key (press `Enter` to accept the default file location):

    ```bash
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```

2. Add the SSH key to the SSH Agent:

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    ```

3. Add the SSH key to GitHub:

    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```

    - In [GitHub SSH settings](https://github.com/settings/keys), click "New SSH key" and paste the copied key (the
      whole .pub file's contents) as "Authentication Key".
    - Add a title that helps you remember which machine it refers to.

4. Testing the connection

   Running `ssh -T git@github.com` in your terminal should return something like "Hi _username_! You've successfully
   authenticated, but GitHub does not provide shell access."
