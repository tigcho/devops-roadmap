1. Create an EC2 instance on AWS and make sure you have a keypair to connect to it later. I also had to set permissions for this file with `chmod 400 example.pem`.
2. Test your connectivity with `ssh -i example.pem user@<server-ip>`.
3. Change the values of `deploy.sh` to the ones of your own instance. Make it executable with `chmod +x deploy.sh` and run it `./deploy.sh`.

### Links
- [Project URL](https://roadmap.sh/projects/static-site-server)
