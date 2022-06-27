# README

This template contains a script which contains script to backup mongodb database and archive it to tarball and push it to s3 bucket. This template can be configured using environment variables. These variables can be configured in `env.sh` file. The script needs to run with `sudo` permission as it install psql client and aws client. The script can be run on cron schedule or in a docker container.

## Configuration

| Name | Description |
| - | - |
| MONGO_HOST | Mongodb Host IP or URL
| MONGO_PORT | Mongodb Port
| MONGO_ADMIN_USER | Mongodb admin user
| MONGOPASSWORD | Mongodb password
| AWS_ACCESS_KEY | AWS access key
| AWS_SECRET_KEY | Aws secret key
| AWS_DEFAULT_REGION | AWS region containing the s3 bucket
| BUCKET_NAME | Bucket path where the backup is to be stored

## Running the script

To run the script, set the value for above variables in `env.sh` file and execute the command:
```
chmod +x script.sh
sudo ./script.sh
```