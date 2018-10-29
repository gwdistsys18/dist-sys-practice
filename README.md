# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Cloud Web Apps
### AWS Tutorial: Launch a VM - 30 min ###
**Time: 15 minutes**
- UI is pretty intuitive
- Roles is the most interesting thing to do with EC2
- Record IP and ssh in using credentials

### QwikLab: Intro to S3 - 30 min ###
**Time: 25 minutes**
- S3 buckets are an abstraction over disk, function mostly as a way to store and serve persistent web objects.
- Versioning is very useful. Upload a picture with an identical name and it automatically catalogs the old one!
- Object permissions are a little less intuitive but the policy generator is very helpful.

### Video: Virtualization - 10 min ###
**Time: 10 minutes**
- Backwards compatibility inspired virtualization.
- This sounds like a talk I just heard in GW SHC. Did computerphile steal Gregor's presentation?
- Xen hypervisor runs in ring zero while its guest OSes think they are ring 0.
- Performance hit because of extra switching, solved by intel VT-x.
- Cool that NT4 can get modern hardware benefits without an actual port.

### AWS Tutorial: Install a LAMP Web Server on Amazon Linux 2 - 45 min ###
**Time: 30 minutes**
- Good thing I didn't delete my free tier linux 2 box! Need it here.
- Needed to allow HTTP/S traffic.
- First need to install and setup apache server and mariadb. Pretty easy with yum and systemctl.
- Did not enable SSL. Might in the future for fun!
- Since I don't have SSL, I decided not to install phpMyAdmin. Just skimmed through how it's done.
- Now I have a functioning db and webserver!

### Comparisons - 30 min ###
**Time: TODO**


### QwikLab: Intro to DynamoDB - 20 min ###
**Time: 15 minutes**
- Interesting that the schema is not predefined.
- *Query*: Fast search using primary key
- *Scan*: look through every item in a table for a match.

### AWS Tutorial: Deploy a Scalable Node.js Web App - 60 min ###
**Time: 45 minutes**
- Creates a lot of stuff preconfigured. Load balancer too!
- This would be a really useful reference for deploying a simple website. Might use it for a personal website.
- Would be interesting to do performance testing on DynamoDB vs MariaDB.

## Area 2
> Include notes here about each of the links
