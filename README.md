# So I went ahead to retry again this the right way!

## I stumbled on Puppet Bolt which was the right solution for running this locally, and installed this version below (the tutorial I watched used this, 3.20 gave some tiny errors)
Puppet Bolt: >= 2.44.0

## Steps I Took

 Notes:
 
   - I was able to also output the instance ip address `13.37.57.121` after provisioning.
   - I Changed the terraform code a bit too and used resources this time, I also added aws_key `~/.ssh/id_rsa.pub` which is the same in the `inventory.yaml`.

1. Run terraform:


    - cd terraform
    -  terraform init to get depedencies
    - terraform plan to list what would be created
    - terraform apply to apply changes


Outputs was :

web_public_ip = "13.37.57.121"

## After configuring my puppet manifest file, and downloading puppet bolt, I followed these steps
2. Run puppet (bolt):

- cd puppet
- brew install --cask puppet-bolt@2
- bolt module install
- bolt plan run puppet::deploy --inventory inventory.yaml --targets 13.37.57.121 --log-level debug --tmpdir /tmp --no-host-key-check --user ubuntu --run-as root


3. I first had errors because I skipped on installing the modules associated with the folders, after this was fixed. I can confirm it works by visitng the server instance address @ http://13.37.57.121/

4. It was a nice learning experience!, thank you.
