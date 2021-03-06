# AWSSDK.jl

Julia interface for [Amazon Web Services](https://aws.amazon.com).

Based on [JuliaCloud/AWSCore.jl](https://github.com/JuliaCloud/AWSCore.jl).

This package provides automatically generated low-level API wrappers and
documentation strings for each operation in each Amazon Web Service.

The following high-level packages are also available:
[AWS S3](http://github.com/samoconnor/AWSS3.jl),
[AWS SQS](http://github.com/samoconnor/AWSSQS.jl),
[AWS SNS](http://github.com/samoconnor/AWSSNS.jl),
[AWS IAM](http://github.com/samoconnor/AWSIAM.jl),
[AWS EC2](http://github.com/samoconnor/AWSEC2.jl),
[AWS Lambda](http://github.com/samoconnor/AWSLambda.jl),
[AWS SES](http://github.com/samoconnor/AWSSES.jl) and
[AWS SDB](http://github.com/samoconnor/AWSSDB.jl).
These packages include operation specific result structure parsing, error
handling, type convenience functions, iterators, etc.


Full documentation [is available here](https://juliacloud.github.io/AWSCore.jl/build/index.html),
or see below for some examples of how to get started.


## Configuration

Option 1: [environment variables](http://docs.aws.amazon.com/cli/latest/userguide/cli-environment.html):
`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` (and `AWS_DEFAULT_REGION`),

Option 2: [`~/.aws/credentials`](http://docs.aws.amazon.com/cli/latest/userguide/cli-config-files.html) file:
```
[default]
aws_access_key_id = AKIAXXXXXXXXXXXXXXXX
aws_secret_access_key = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Option 3: run the [AWS CLI](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html#cli-quick-configuration)
configure command: `aws configure`.

## SNS Example

```julia
julia> using AWSSDK.SNS

julia> AWSCore.set_debug_level(1)

julia> SNS.publish(PhoneNumber="+61401555555", Message="Hello")
Dict{String,Any} with 1 entry:
  "MessageId" => "f0607542-7b54-5c66-b271-27453b0bd979"
```

## S3 Example

```julia
julia> using AWSSDK.S3

julia> r = S3.list_buckets()
XMLDict.XMLDictElement with 2 entries:
  "Owner"   => <Owner>…
  "Buckets" => <Buckets>…

julia> v = [b["Name"] for b in r["Buckets"]["Bucket"]]
3-element Array{String,1}:
 "bucket1"
 "bucket2"
 "bucket3"

julia> S3.put_object(Bucket="bucket1", Key="myfile", Body="mydata")
Response(200 OK, 10 headers, 0 bytes in body)

julia> S3.get_object(Bucket="bucket1", Key="myfile") |> String
"mydata"

```

## EC2 Example

```julia
julia> using AWSSDK.EC2

julia> r = EC2.describe_images(Filter=[
    ["Name" => "owner-alias", "Value" => "amazon"],
    ["Name" => "name", "Value" => "amzn-ami-hvm-2015.09.1.x86_64-gp2"]])

XMLDict.XMLDictElement with 2 entries:
  "requestId" => "af8cf64c-d5b0-4e2e-959c-3f703eeb362f"
  "imagesSet" => <imagesSet>…

julia> r["imagesSet"]["item"]
XMLDict.XMLDictElement with 17 entries:
  "imageId"            => "ami-48d38c2b"
  "imageLocation"      => "amazon/amzn-ami-hvm-2015.09.1.x86_64-gp2"
  "imageState"         => "available"
  "imageOwnerId"       => "137112412989"
  "creationDate"       => "2015-10-29T18:16:22.000Z"
  "isPublic"           => "true"
  "architecture"       => "x86_64"
  "imageType"          => "machine"
  "sriovNetSupport"    => "simple"
  "imageOwnerAlias"    => "amazon"
  "name"               => "amzn-ami-hvm-2015.09.1.x86_64-gp2"
  "description"        => "Amazon Linux AMI 2015.09.1 x86_64 HVM GP2"
  "rootDeviceType"     => "ebs"
  "rootDeviceName"     => "/dev/xvda"
  "blockDeviceMapping" => <blockDeviceMapping>…
  "virtualizationType" => "hvm"
  "hypervisor"         => "xen"
```

## SES Example

```julia
julia> r = SES.send_email(
    Source = "sam@octech.com.au",
    Destination = ["ToAddresses" => ["sam@octech.com.au"]],
    Message = [
        "Subject" => ["Data" => "Hello"],
        "Body" => ["Text" =>  ["Data" => "Hello"]]
    ])
XMLDict.XMLDictElement with 2 entries:
  "SendEmailResult"  => <SendEmailResult>…
  "ResponseMetadata" => <ResponseMetadata>…
```
