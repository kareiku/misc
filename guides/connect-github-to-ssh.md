# Connecting GitHub to Git SSH

## Steps for Generating an SSH Key

1. Generate an SSH key:

    ```bash
    ssh-keygen -t ed25519 -C "your_email@example.com"
    ```

2. Add the SSH key to the SSH Agent

    ```bash
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed15519
    ```

3. Add the SSH key to GitHub

    ```bash
    cat ~/.ssh/id_ed25519.pub
    ```

    - In [GitHub SSH settings](https://github.com/settings/keys), click "New SSH key" and paste the copied key (the
      whole .pub file's contents).
    - Add a title that helps you remember which machine it refers to.

4. Testing the connection

   Running `ssh -T git@github.com` in your terminal should return something like "Hi _username_! You've successfully
   authenticated, but GitHub does not provide shell access."
