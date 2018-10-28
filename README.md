# Distributed Systems Practice
Notes from learning about distributed systems in [GW CS 6421](https://gwdistsys18.github.io/) with [Prof. Wood](https://faculty.cs.gwu.edu/timwood/)

## Area 1: Cloud Web Apps
* AWS Tutorial: Launch a VM (took ~15 min)
  * Used the EC2 Console to create an EC2 instance of type t2.micro
  * Used `ssh -i '<path-to-ssh-pem-file>' ec2-user@<ip-address>` to connect
  * After terminating instance, connection timed out when attempting to connect
* QwikLab: Intro to S3 (took ~20 min)
  * S3 stands for Simple Storage Service, which allows storage of objects in buckets which include backups and versioning
  * When uploading objects, there are different storage class options based on how long-lived and how freuqently accessed the data will be
  * Public read access can be granted to specific objects
  * ARN is Amazon Resource Name and in this case refers to a bucket
  * The policy generator can be used to create policies to put in the policy editor
  * New versions of a file can be uploaded and will display by default; additional permissions must be given to view old versions
  

## Area 2
> Include notes here about each of the links
