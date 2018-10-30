# Launch VM

1. Launch an Amazon EC2 Instance

2. Configure your Instance

   * Find a suitable system and click select
   * Configure storage, tagging, and security settings
   * choose an existing key pair or create a new key pair

3. Connect to instance

   * Open terminal.

   * Use `chmod 400 ~/.ssh/mykeypair.pem` to restrict permissions to your private SSH key.
   * Use `ssh -i ~/.ssh/MyKeyPair.pem ec2-user@{IP_Address}` to connect instace.

4. Terminate Instace