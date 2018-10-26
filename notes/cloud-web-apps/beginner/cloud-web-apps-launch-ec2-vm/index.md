---
title: Cloud Web Apps - Launch Amazon EC2 VM
date: "2018-10-08T22:12:03.284Z"
---

> This tutorial introduces the management of AWS EC2 instance, also includes
the remote access to EC2 instance via SSH client.

## Prerequisites

- AWS student account
- SSH client

## Official Links
[Launch a Linux Virtual Machine with Amazon EC2](https://aws.amazon.com/getting-started/tutorials/launch-a-virtual-machine/)

## Operations

### 1. Create and Configure an EC2 Instance

Before you can access the
[AWS EC2 console](https://console.aws.amazon.com/ec2/v2/home?region=us-east-1#Home:),
you need to set up an AWS student account.

Once logged into the console, click on the big blue __Launch Instance__ button,
which leads to the configuration wizard, where a list of preconfigured AMIs
(Amazon Machine Image) is provided.

Simply pick one from the list (e.g. ami-6871a115 - Red Hat Enterprise Linux 7.5 (HVM), SSD Volume Type) by clicking on 
the big blue __Select__ button, which leads to a list of instance types.  

![Choose AMI](https://d1.awsstatic.com/Digital%20Marketing/House/other/launchavm/amazon-linux-ami.fb514090fd448d29e8a9ff6335c3c7fe69d900fe.png)

Select the one with a small green __Free tier eligible__ label (usually a t2.micro type), 
then click on the __Review and Launch__ button at the page bottom.

![Choose an Instance Type](https://d1.awsstatic.com/Digital%20Marketing/House/other/launchavm/ec2-t2-micro.60b82cfa4244167d4c5fe21ccfe5d0b49b987d52.png)

If no modification is needed, click on __Launch__ button at the page bottom.

![Launch](https://d1.awsstatic.com/Digital%20Marketing/House/other/launchavm/review-launch.a51ec916e8aeafc8c0bca9155eb464cb71af7e76.png)

### 2. Launch

An SSH key pair is required to remotely access the instance, so either create a new one or provide an existing one 
in the next step.

![Keypair](https://d1.awsstatic.com/Getting%20Started/vm/Getting-Started-VM9.e6a369a486ef229d429b8731c8f6a889c3bd2852.png)

Once the instance has been successfully launched, it will appear in the console with __running__
Instance State.

![Console](https://d1.awsstatic.com/Getting%20Started/vm/Getting-Started-VM6.2870b5ee7a682efd2ee7fb21ebcdfd67bc83c46a.png)
 

### 3. Connect through SSH

If you have never used SSH, [this](http://www.grivet-tools.com/blog/2014/create-use-ssh-key-mac/)
would be helpful to know how to set it up on Mac.

For Mac and Linux users, move the key pair into the .ssh sub-directory under home directory by bash in terminal,

```bash
mv ~/Downloads/MyKeyPair.pem ~/.ssh/MyKeyPair.pem
``` 

Restrict permissions to your private SSH key by using __chmod 400__, making sure it is not publicly viewable,

```bash
chmod 400 ~/.ssh/mykeypair.pem
```

Then connect to instance by entering,

```bash
ssh -i ~/.ssh/MyKeyPair.pem ec2-user@{IP_Address} 
```

The exact command to enter could also be found by clicking the __Connect__ button on the console panel.

### 4. Terminate

Terminate the instances you are no longer using so you don’t keep getting charged for them.

Back on he EC2 Console, select the box next to the instance you created.  
Then click the __Actions__ button, navigate to Instance State, and click __Terminate__. 
It can take several seconds to complete.  

![Terminate](https://d1.awsstatic.com/tmt/tmt_launch-windows-vm/launch-windows-vm-18.78e67adb5892298a115d8078e10cd782f7dbd8ee.png)

Once your instance has been terminated, the Instance State will change to __terminated__ on your EC2 Console.

