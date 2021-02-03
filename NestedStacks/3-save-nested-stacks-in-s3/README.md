# Step 1
Create a new S3 bucket by running a new CloudFormation stack from 'S3-bucket.yaml' template

# Step 2
From S3 Console, upload 2 nested stack templates to a newly created S3 bucket:
- 1-vpc-as-nested-stack.yaml
- 2-sg-as-nested-stack.yaml
:eyes: Screenshot: 1-upload-files.png

# Step 3
From S3 Console, make both files publically accessable
:eyes: Screenshot: 2-make-file-public.png
Test if you can upload each file to your local machine
:eyes: Screenshot: 3-test-file-access.png