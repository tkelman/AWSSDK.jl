#==============================================================================#
# CloudFront.jl
#
# This file is generated from:
# https://github.com/aws/aws-sdk-js/blob/master/apis/cloudfront-2017-03-25.normal.json
#==============================================================================#

__precompile__()

module CloudFront

using AWSCore


"""
    using AWSSDK.CloudFront.create_cloud_front_origin_access_identity
    create_cloud_front_origin_access_identity([::AWSConfig], arguments::Dict)
    create_cloud_front_origin_access_identity([::AWSConfig]; CloudFrontOriginAccessIdentityConfig=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/origin-access-identity/cloudfront", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/origin-access-identity/cloudfront", CloudFrontOriginAccessIdentityConfig=)

# CreateCloudFrontOriginAccessIdentity Operation

Creates a new origin access identity. If you're using Amazon S3 for your origin, you can use an origin access identity to require users to access your content using a CloudFront URL instead of the Amazon S3 URL. For more information about how to use origin access identities, see [Serving Private Content through CloudFront](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/PrivateContent.html) in the *Amazon CloudFront Developer Guide*.

# Arguments

## `CloudFrontOriginAccessIdentityConfig = [ ... ]` -- *Required*
The current configuration information for the identity.
```
 CloudFrontOriginAccessIdentityConfig = [
        "CallerReference" => <required> ::String,
        "Comment" => <required> ::String
    ]
```



# Returns

`CreateCloudFrontOriginAccessIdentityResult`

# Exceptions

`CloudFrontOriginAccessIdentityAlreadyExists`, `MissingBody`, `TooManyCloudFrontOriginAccessIdentities`, `InvalidArgument` or `InconsistentQuantities`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateCloudFrontOriginAccessIdentity)
"""

@inline create_cloud_front_origin_access_identity(aws::AWSConfig=default_aws_config(); args...) = create_cloud_front_origin_access_identity(aws, args)

@inline create_cloud_front_origin_access_identity(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/origin-access-identity/cloudfront", args)

@inline create_cloud_front_origin_access_identity(args) = create_cloud_front_origin_access_identity(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.create_distribution
    create_distribution([::AWSConfig], arguments::Dict)
    create_distribution([::AWSConfig]; DistributionConfig=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution", DistributionConfig=)

# CreateDistribution Operation

Creates a new web distribution. Send a `POST` request to the `/*CloudFront API version*/distribution`/`distribution ID` resource.

# Arguments

## `DistributionConfig = [ ... ]` -- *Required*
The distribution's configuration information.
```
 DistributionConfig = [
        "CallerReference" => <required> ::String,
        "Aliases" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "DefaultRootObject" =>  ::String,
        "Origins" => <required> [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "Id" => <required> ::String,
                "DomainName" => <required> ::String,
                "OriginPath" =>  ::String,
                "CustomHeaders" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [[
                        "HeaderName" => <required> ::String,
                        "HeaderValue" => <required> ::String
                    ], ...]
                ],
                "S3OriginConfig" =>  ["OriginAccessIdentity" => <required> ::String],
                "CustomOriginConfig" =>  [
                    "HTTPPort" => <required> ::Int,
                    "HTTPSPort" => <required> ::Int,
                    "OriginProtocolPolicy" => <required> "http-only", "match-viewer" or "https-only",
                    "OriginSslProtocols" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["SSLv3", "TLSv1", "TLSv1.1" or "TLSv1.2", ...]
                    ],
                    "OriginReadTimeout" =>  ::Int,
                    "OriginKeepaliveTimeout" =>  ::Int
                ]
            ], ...]
        ],
        "DefaultCacheBehavior" => <required> [
            "TargetOriginId" => <required> ::String,
            "ForwardedValues" => <required> [
                "QueryString" => <required> ::Bool,
                "Cookies" => <required> [
                    "Forward" => <required> "none", "whitelist" or "all",
                    "WhitelistedNames" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ]
                ],
                "Headers" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ],
                "QueryStringCacheKeys" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ]
            ],
            "TrustedSigners" => <required> [
                "Enabled" => <required> ::Bool,
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ],
            "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
            "MinTTL" => <required> ::Int,
            "AllowedMethods" =>  [
                "Quantity" => <required> ::Int,
                "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                "CachedMethods" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                ]
            ],
            "SmoothStreaming" =>  ::Bool,
            "DefaultTTL" =>  ::Int,
            "MaxTTL" =>  ::Int,
            "Compress" =>  ::Bool,
            "LambdaFunctionAssociations" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [[
                    "LambdaFunctionARN" =>  ::String,
                    "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                ], ...]
            ]
        ],
        "CacheBehaviors" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "PathPattern" => <required> ::String,
                "TargetOriginId" => <required> ::String,
                "ForwardedValues" => <required> [
                    "QueryString" => <required> ::Bool,
                    "Cookies" => <required> [
                        "Forward" => <required> "none", "whitelist" or "all",
                        "WhitelistedNames" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" =>  [::String, ...]
                        ]
                    ],
                    "Headers" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ],
                    "QueryStringCacheKeys" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ]
                ],
                "TrustedSigners" => <required> [
                    "Enabled" => <required> ::Bool,
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ],
                "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
                "MinTTL" => <required> ::Int,
                "AllowedMethods" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                    "CachedMethods" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                    ]
                ],
                "SmoothStreaming" =>  ::Bool,
                "DefaultTTL" =>  ::Int,
                "MaxTTL" =>  ::Int,
                "Compress" =>  ::Bool,
                "LambdaFunctionAssociations" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [[
                        "LambdaFunctionARN" =>  ::String,
                        "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                    ], ...]
                ]
            ], ...]
        ],
        "CustomErrorResponses" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "ErrorCode" => <required> ::Int,
                "ResponsePagePath" =>  ::String,
                "ResponseCode" =>  ::String,
                "ErrorCachingMinTTL" =>  ::Int
            ], ...]
        ],
        "Comment" => <required> ::String,
        "Logging" =>  [
            "Enabled" => <required> ::Bool,
            "IncludeCookies" => <required> ::Bool,
            "Bucket" => <required> ::String,
            "Prefix" => <required> ::String
        ],
        "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
        "Enabled" => <required> ::Bool,
        "ViewerCertificate" =>  [
            "CloudFrontDefaultCertificate" =>  ::Bool,
            "IAMCertificateId" =>  ::String,
            "ACMCertificateArn" =>  ::String,
            "SSLSupportMethod" =>  "sni-only" or "vip",
            "MinimumProtocolVersion" =>  "SSLv3" or "TLSv1",
            "Certificate" =>  ::String,
            "CertificateSource" =>  "cloudfront", "iam" or "acm"
        ],
        "Restrictions" =>  ["GeoRestriction" => <required> [
                "RestrictionType" => <required> "blacklist", "whitelist" or "none",
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ]],
        "WebACLId" =>  ::String,
        "HttpVersion" =>  "http1.1" or "http2",
        "IsIPV6Enabled" =>  ::Bool
    ]
```



# Returns

`CreateDistributionResult`

# Exceptions

`CNAMEAlreadyExists`, `DistributionAlreadyExists`, `InvalidOrigin`, `InvalidOriginAccessIdentity`, `AccessDenied`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist`, `InvalidViewerCertificate`, `InvalidMinimumProtocolVersion`, `MissingBody`, `TooManyDistributionCNAMEs`, `TooManyDistributions`, `InvalidDefaultRootObject`, `InvalidRelativePath`, `InvalidErrorCode`, `InvalidResponseCode`, `InvalidArgument`, `InvalidRequiredProtocol`, `NoSuchOrigin`, `TooManyOrigins`, `TooManyCacheBehaviors`, `TooManyCookieNamesInWhiteList`, `InvalidForwardCookies`, `TooManyHeadersInForwardedValues`, `InvalidHeadersForS3Origin`, `InconsistentQuantities`, `TooManyCertificates`, `InvalidLocationCode`, `InvalidGeoRestrictionParameter`, `InvalidProtocolSettings`, `InvalidTTLOrder`, `InvalidWebACLId`, `TooManyOriginCustomHeaders`, `TooManyQueryStringParameters`, `InvalidQueryStringParameters`, `TooManyDistributionsWithLambdaAssociations`, `TooManyLambdaFunctionAssociations`, `InvalidLambdaFunctionAssociation`, `InvalidOriginReadTimeout` or `InvalidOriginKeepaliveTimeout`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateDistribution)
"""

@inline create_distribution(aws::AWSConfig=default_aws_config(); args...) = create_distribution(aws, args)

@inline create_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/distribution", args)

@inline create_distribution(args) = create_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.create_distribution_with_tags
    create_distribution_with_tags([::AWSConfig], arguments::Dict)
    create_distribution_with_tags([::AWSConfig]; DistributionConfigWithTags=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution?WithTags", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution?WithTags", DistributionConfigWithTags=)

# CreateDistributionWithTags Operation

Create a new distribution with tags.

# Arguments

## `DistributionConfigWithTags = [ ... ]` -- *Required*
The distribution's configuration information.
```
 DistributionConfigWithTags = [
        "DistributionConfig" => <required> [
            "CallerReference" => <required> ::String,
            "Aliases" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ],
            "DefaultRootObject" =>  ::String,
            "Origins" => <required> [
                "Quantity" => <required> ::Int,
                "Items" =>  [[
                    "Id" => <required> ::String,
                    "DomainName" => <required> ::String,
                    "OriginPath" =>  ::String,
                    "CustomHeaders" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [[
                            "HeaderName" => <required> ::String,
                            "HeaderValue" => <required> ::String
                        ], ...]
                    ],
                    "S3OriginConfig" =>  ["OriginAccessIdentity" => <required> ::String],
                    "CustomOriginConfig" =>  [
                        "HTTPPort" => <required> ::Int,
                        "HTTPSPort" => <required> ::Int,
                        "OriginProtocolPolicy" => <required> "http-only", "match-viewer" or "https-only",
                        "OriginSslProtocols" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" => <required> ["SSLv3", "TLSv1", "TLSv1.1" or "TLSv1.2", ...]
                        ],
                        "OriginReadTimeout" =>  ::Int,
                        "OriginKeepaliveTimeout" =>  ::Int
                    ]
                ], ...]
            ],
            "DefaultCacheBehavior" => <required> [
                "TargetOriginId" => <required> ::String,
                "ForwardedValues" => <required> [
                    "QueryString" => <required> ::Bool,
                    "Cookies" => <required> [
                        "Forward" => <required> "none", "whitelist" or "all",
                        "WhitelistedNames" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" =>  [::String, ...]
                        ]
                    ],
                    "Headers" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ],
                    "QueryStringCacheKeys" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ]
                ],
                "TrustedSigners" => <required> [
                    "Enabled" => <required> ::Bool,
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ],
                "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
                "MinTTL" => <required> ::Int,
                "AllowedMethods" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                    "CachedMethods" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                    ]
                ],
                "SmoothStreaming" =>  ::Bool,
                "DefaultTTL" =>  ::Int,
                "MaxTTL" =>  ::Int,
                "Compress" =>  ::Bool,
                "LambdaFunctionAssociations" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [[
                        "LambdaFunctionARN" =>  ::String,
                        "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                    ], ...]
                ]
            ],
            "CacheBehaviors" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [[
                    "PathPattern" => <required> ::String,
                    "TargetOriginId" => <required> ::String,
                    "ForwardedValues" => <required> [
                        "QueryString" => <required> ::Bool,
                        "Cookies" => <required> [
                            "Forward" => <required> "none", "whitelist" or "all",
                            "WhitelistedNames" =>  [
                                "Quantity" => <required> ::Int,
                                "Items" =>  [::String, ...]
                            ]
                        ],
                        "Headers" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" =>  [::String, ...]
                        ],
                        "QueryStringCacheKeys" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" =>  [::String, ...]
                        ]
                    ],
                    "TrustedSigners" => <required> [
                        "Enabled" => <required> ::Bool,
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ],
                    "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
                    "MinTTL" => <required> ::Int,
                    "AllowedMethods" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                        "CachedMethods" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                        ]
                    ],
                    "SmoothStreaming" =>  ::Bool,
                    "DefaultTTL" =>  ::Int,
                    "MaxTTL" =>  ::Int,
                    "Compress" =>  ::Bool,
                    "LambdaFunctionAssociations" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [[
                            "LambdaFunctionARN" =>  ::String,
                            "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                        ], ...]
                    ]
                ], ...]
            ],
            "CustomErrorResponses" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [[
                    "ErrorCode" => <required> ::Int,
                    "ResponsePagePath" =>  ::String,
                    "ResponseCode" =>  ::String,
                    "ErrorCachingMinTTL" =>  ::Int
                ], ...]
            ],
            "Comment" => <required> ::String,
            "Logging" =>  [
                "Enabled" => <required> ::Bool,
                "IncludeCookies" => <required> ::Bool,
                "Bucket" => <required> ::String,
                "Prefix" => <required> ::String
            ],
            "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
            "Enabled" => <required> ::Bool,
            "ViewerCertificate" =>  [
                "CloudFrontDefaultCertificate" =>  ::Bool,
                "IAMCertificateId" =>  ::String,
                "ACMCertificateArn" =>  ::String,
                "SSLSupportMethod" =>  "sni-only" or "vip",
                "MinimumProtocolVersion" =>  "SSLv3" or "TLSv1",
                "Certificate" =>  ::String,
                "CertificateSource" =>  "cloudfront", "iam" or "acm"
            ],
            "Restrictions" =>  ["GeoRestriction" => <required> [
                    "RestrictionType" => <required> "blacklist", "whitelist" or "none",
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ]],
            "WebACLId" =>  ::String,
            "HttpVersion" =>  "http1.1" or "http2",
            "IsIPV6Enabled" =>  ::Bool
        ],
        "Tags" => <required> ["Items" =>  [[
                "Key" => <required> ::String,
                "Value" =>  ::String
            ], ...]]
    ]
```



# Returns

`CreateDistributionWithTagsResult`

# Exceptions

`CNAMEAlreadyExists`, `DistributionAlreadyExists`, `InvalidOrigin`, `InvalidOriginAccessIdentity`, `AccessDenied`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist`, `InvalidViewerCertificate`, `InvalidMinimumProtocolVersion`, `MissingBody`, `TooManyDistributionCNAMEs`, `TooManyDistributions`, `InvalidDefaultRootObject`, `InvalidRelativePath`, `InvalidErrorCode`, `InvalidResponseCode`, `InvalidArgument`, `InvalidRequiredProtocol`, `NoSuchOrigin`, `TooManyOrigins`, `TooManyCacheBehaviors`, `TooManyCookieNamesInWhiteList`, `InvalidForwardCookies`, `TooManyHeadersInForwardedValues`, `InvalidHeadersForS3Origin`, `InconsistentQuantities`, `TooManyCertificates`, `InvalidLocationCode`, `InvalidGeoRestrictionParameter`, `InvalidProtocolSettings`, `InvalidTTLOrder`, `InvalidWebACLId`, `TooManyOriginCustomHeaders`, `InvalidTagging`, `TooManyQueryStringParameters`, `InvalidQueryStringParameters`, `TooManyDistributionsWithLambdaAssociations`, `TooManyLambdaFunctionAssociations`, `InvalidLambdaFunctionAssociation`, `InvalidOriginReadTimeout` or `InvalidOriginKeepaliveTimeout`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateDistributionWithTags)
"""

@inline create_distribution_with_tags(aws::AWSConfig=default_aws_config(); args...) = create_distribution_with_tags(aws, args)

@inline create_distribution_with_tags(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/distribution?WithTags", args)

@inline create_distribution_with_tags(args) = create_distribution_with_tags(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.create_invalidation
    create_invalidation([::AWSConfig], arguments::Dict)
    create_invalidation([::AWSConfig]; DistributionId=, InvalidationBatch=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution/{DistributionId}/invalidation", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/distribution/{DistributionId}/invalidation", DistributionId=, InvalidationBatch=)

# CreateInvalidation Operation

Create a new invalidation.

# Arguments

## `DistributionId = ::String` -- *Required*
The distribution's id.


## `InvalidationBatch = [ ... ]` -- *Required*
The batch information for the invalidation.
```
 InvalidationBatch = [
        "Paths" => <required> [
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "CallerReference" => <required> ::String
    ]
```



# Returns

`CreateInvalidationResult`

# Exceptions

`AccessDenied`, `MissingBody`, `InvalidArgument`, `NoSuchDistribution`, `BatchTooLarge`, `TooManyInvalidationsInProgress` or `InconsistentQuantities`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateInvalidation)
"""

@inline create_invalidation(aws::AWSConfig=default_aws_config(); args...) = create_invalidation(aws, args)

@inline create_invalidation(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/distribution/{DistributionId}/invalidation", args)

@inline create_invalidation(args) = create_invalidation(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.create_streaming_distribution
    create_streaming_distribution([::AWSConfig], arguments::Dict)
    create_streaming_distribution([::AWSConfig]; StreamingDistributionConfig=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/streaming-distribution", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/streaming-distribution", StreamingDistributionConfig=)

# CreateStreamingDistribution Operation

Creates a new RMTP distribution. An RTMP distribution is similar to a web distribution, but an RTMP distribution streams media files using the Adobe Real-Time Messaging Protocol (RTMP) instead of serving files using HTTP.

To create a new web distribution, submit a `POST` request to the *CloudFront API version*/distribution resource. The request body must include a document with a *StreamingDistributionConfig* element. The response echoes the `StreamingDistributionConfig` element and returns other information about the RTMP distribution.

To get the status of your request, use the *GET StreamingDistribution* API action. When the value of `Enabled` is `true` and the value of `Status` is `Deployed`, your distribution is ready. A distribution usually deploys in less than 15 minutes.

For more information about web distributions, see [Working with RTMP Distributions](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-rtmp.html) in the *Amazon CloudFront Developer Guide*.

**Important**
> Beginning with the 2012-05-05 version of the CloudFront API, we made substantial changes to the format of the XML document that you include in the request body when you create or update a web distribution or an RTMP distribution, and when you invalidate objects. With previous versions of the API, we discovered that it was too easy to accidentally delete one or more values for an element that accepts multiple values, for example, CNAMEs and trusted signers. Our changes for the 2012-05-05 release are intended to prevent these accidental deletions and to notify you when there's a mismatch between the number of values you say you're specifying in the `Quantity` element and the number of values specified.

# Arguments

## `StreamingDistributionConfig = [ ... ]` -- *Required*
The streaming distribution's configuration information.
```
 StreamingDistributionConfig = [
        "CallerReference" => <required> ::String,
        "S3Origin" => <required> [
            "DomainName" => <required> ::String,
            "OriginAccessIdentity" => <required> ::String
        ],
        "Aliases" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "Comment" => <required> ::String,
        "Logging" =>  [
            "Enabled" => <required> ::Bool,
            "Bucket" => <required> ::String,
            "Prefix" => <required> ::String
        ],
        "TrustedSigners" => <required> [
            "Enabled" => <required> ::Bool,
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
        "Enabled" => <required> ::Bool
    ]
```



# Returns

`CreateStreamingDistributionResult`

# Exceptions

`CNAMEAlreadyExists`, `StreamingDistributionAlreadyExists`, `InvalidOrigin`, `InvalidOriginAccessIdentity`, `AccessDenied`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist`, `MissingBody`, `TooManyStreamingDistributionCNAMEs`, `TooManyStreamingDistributions`, `InvalidArgument` or `InconsistentQuantities`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateStreamingDistribution)
"""

@inline create_streaming_distribution(aws::AWSConfig=default_aws_config(); args...) = create_streaming_distribution(aws, args)

@inline create_streaming_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/streaming-distribution", args)

@inline create_streaming_distribution(args) = create_streaming_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.create_streaming_distribution_with_tags
    create_streaming_distribution_with_tags([::AWSConfig], arguments::Dict)
    create_streaming_distribution_with_tags([::AWSConfig]; StreamingDistributionConfigWithTags=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/streaming-distribution?WithTags", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/streaming-distribution?WithTags", StreamingDistributionConfigWithTags=)

# CreateStreamingDistributionWithTags Operation

Create a new streaming distribution with tags.

# Arguments

## `StreamingDistributionConfigWithTags = [ ... ]` -- *Required*
The streaming distribution's configuration information.
```
 StreamingDistributionConfigWithTags = [
        "StreamingDistributionConfig" => <required> [
            "CallerReference" => <required> ::String,
            "S3Origin" => <required> [
                "DomainName" => <required> ::String,
                "OriginAccessIdentity" => <required> ::String
            ],
            "Aliases" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ],
            "Comment" => <required> ::String,
            "Logging" =>  [
                "Enabled" => <required> ::Bool,
                "Bucket" => <required> ::String,
                "Prefix" => <required> ::String
            ],
            "TrustedSigners" => <required> [
                "Enabled" => <required> ::Bool,
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ],
            "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
            "Enabled" => <required> ::Bool
        ],
        "Tags" => <required> ["Items" =>  [[
                "Key" => <required> ::String,
                "Value" =>  ::String
            ], ...]]
    ]
```



# Returns

`CreateStreamingDistributionWithTagsResult`

# Exceptions

`CNAMEAlreadyExists`, `StreamingDistributionAlreadyExists`, `InvalidOrigin`, `InvalidOriginAccessIdentity`, `AccessDenied`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist`, `MissingBody`, `TooManyStreamingDistributionCNAMEs`, `TooManyStreamingDistributions`, `InvalidArgument`, `InconsistentQuantities` or `InvalidTagging`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/CreateStreamingDistributionWithTags)
"""

@inline create_streaming_distribution_with_tags(aws::AWSConfig=default_aws_config(); args...) = create_streaming_distribution_with_tags(aws, args)

@inline create_streaming_distribution_with_tags(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/streaming-distribution?WithTags", args)

@inline create_streaming_distribution_with_tags(args) = create_streaming_distribution_with_tags(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.delete_cloud_front_origin_access_identity
    delete_cloud_front_origin_access_identity([::AWSConfig], arguments::Dict)
    delete_cloud_front_origin_access_identity([::AWSConfig]; Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/origin-access-identity/cloudfront/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/origin-access-identity/cloudfront/{Id}", Id=, <keyword arguments>)

# DeleteCloudFrontOriginAccessIdentity Operation

Delete an origin access identity.

# Arguments

## `Id = ::String` -- *Required*
The origin access identity's ID.


## `If-Match = ::String`
The value of the `ETag` header you received from a previous `GET` or `PUT` request. For example: `E2QWRUHAPOMQZL`.




# Exceptions

`AccessDenied`, `InvalidIfMatchVersion`, `NoSuchCloudFrontOriginAccessIdentity`, `PreconditionFailed` or `CloudFrontOriginAccessIdentityInUse`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/DeleteCloudFrontOriginAccessIdentity)
"""

@inline delete_cloud_front_origin_access_identity(aws::AWSConfig=default_aws_config(); args...) = delete_cloud_front_origin_access_identity(aws, args)

@inline delete_cloud_front_origin_access_identity(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "DELETE", "/2017-03-25/origin-access-identity/cloudfront/{Id}", args)

@inline delete_cloud_front_origin_access_identity(args) = delete_cloud_front_origin_access_identity(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.delete_distribution
    delete_distribution([::AWSConfig], arguments::Dict)
    delete_distribution([::AWSConfig]; Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/distribution/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/distribution/{Id}", Id=, <keyword arguments>)

# DeleteDistribution Operation

Delete a distribution.

# Arguments

## `Id = ::String` -- *Required*
The distribution ID.


## `If-Match = ::String`
The value of the `ETag` header that you received when you disabled the distribution. For example: `E2QWRUHAPOMQZL`.




# Exceptions

`AccessDenied`, `DistributionNotDisabled`, `InvalidIfMatchVersion`, `NoSuchDistribution` or `PreconditionFailed`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/DeleteDistribution)
"""

@inline delete_distribution(aws::AWSConfig=default_aws_config(); args...) = delete_distribution(aws, args)

@inline delete_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "DELETE", "/2017-03-25/distribution/{Id}", args)

@inline delete_distribution(args) = delete_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.delete_streaming_distribution
    delete_streaming_distribution([::AWSConfig], arguments::Dict)
    delete_streaming_distribution([::AWSConfig]; Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/streaming-distribution/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "DELETE", "/2017-03-25/streaming-distribution/{Id}", Id=, <keyword arguments>)

# DeleteStreamingDistribution Operation

Delete a streaming distribution. To delete an RTMP distribution using the CloudFront API, perform the following steps.

**To delete an RTMP distribution using the CloudFront API**:

1.  Disable the RTMP distribution.

2.  Submit a `GET Streaming Distribution Config` request to get the current configuration and the `Etag` header for the distribution.

3.  Update the XML document that was returned in the response to your `GET Streaming Distribution Config` request to change the value of `Enabled` to `false`.

4.  Submit a `PUT Streaming Distribution Config` request to update the configuration for your distribution. In the request body, include the XML document that you updated in Step 3. Then set the value of the HTTP `If-Match` header to the value of the `ETag` header that CloudFront returned when you submitted the `GET Streaming Distribution Config` request in Step 2.

5.  Review the response to the `PUT Streaming Distribution Config` request to confirm that the distribution was successfully disabled.

6.  Submit a `GET Streaming Distribution Config` request to confirm that your changes have propagated. When propagation is complete, the value of `Status` is `Deployed`.

7.  Submit a `DELETE Streaming Distribution` request. Set the value of the HTTP `If-Match` header to the value of the `ETag` header that CloudFront returned when you submitted the `GET Streaming Distribution Config` request in Step 2.

8.  Review the response to your `DELETE Streaming Distribution` request to confirm that the distribution was successfully deleted.

For information about deleting a distribution using the CloudFront console, see [Deleting a Distribution](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/HowToDeleteDistribution.html) in the *Amazon CloudFront Developer Guide*.

# Arguments

## `Id = ::String` -- *Required*
The distribution ID.


## `If-Match = ::String`
The value of the `ETag` header that you received when you disabled the streaming distribution. For example: `E2QWRUHAPOMQZL`.




# Exceptions

`AccessDenied`, `StreamingDistributionNotDisabled`, `InvalidIfMatchVersion`, `NoSuchStreamingDistribution` or `PreconditionFailed`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/DeleteStreamingDistribution)
"""

@inline delete_streaming_distribution(aws::AWSConfig=default_aws_config(); args...) = delete_streaming_distribution(aws, args)

@inline delete_streaming_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "DELETE", "/2017-03-25/streaming-distribution/{Id}", args)

@inline delete_streaming_distribution(args) = delete_streaming_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_cloud_front_origin_access_identity
    get_cloud_front_origin_access_identity([::AWSConfig], arguments::Dict)
    get_cloud_front_origin_access_identity([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}", Id=)

# GetCloudFrontOriginAccessIdentity Operation

Get the information about an origin access identity.

# Arguments

## `Id = ::String` -- *Required*
The identity's ID.




# Returns

`GetCloudFrontOriginAccessIdentityResult`

# Exceptions

`NoSuchCloudFrontOriginAccessIdentity` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetCloudFrontOriginAccessIdentity)
"""

@inline get_cloud_front_origin_access_identity(aws::AWSConfig=default_aws_config(); args...) = get_cloud_front_origin_access_identity(aws, args)

@inline get_cloud_front_origin_access_identity(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}", args)

@inline get_cloud_front_origin_access_identity(args) = get_cloud_front_origin_access_identity(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_cloud_front_origin_access_identity_config
    get_cloud_front_origin_access_identity_config([::AWSConfig], arguments::Dict)
    get_cloud_front_origin_access_identity_config([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", Id=)

# GetCloudFrontOriginAccessIdentityConfig Operation

Get the configuration information about an origin access identity.

# Arguments

## `Id = ::String` -- *Required*
The identity's ID.




# Returns

`GetCloudFrontOriginAccessIdentityConfigResult`

# Exceptions

`NoSuchCloudFrontOriginAccessIdentity` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetCloudFrontOriginAccessIdentityConfig)
"""

@inline get_cloud_front_origin_access_identity_config(aws::AWSConfig=default_aws_config(); args...) = get_cloud_front_origin_access_identity_config(aws, args)

@inline get_cloud_front_origin_access_identity_config(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", args)

@inline get_cloud_front_origin_access_identity_config(args) = get_cloud_front_origin_access_identity_config(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_distribution
    get_distribution([::AWSConfig], arguments::Dict)
    get_distribution([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{Id}", Id=)

# GetDistribution Operation

Get the information about a distribution.

# Arguments

## `Id = ::String` -- *Required*
The distribution's ID.




# Returns

`GetDistributionResult`

# Exceptions

`NoSuchDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetDistribution)
"""

@inline get_distribution(aws::AWSConfig=default_aws_config(); args...) = get_distribution(aws, args)

@inline get_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distribution/{Id}", args)

@inline get_distribution(args) = get_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_distribution_config
    get_distribution_config([::AWSConfig], arguments::Dict)
    get_distribution_config([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{Id}/config", Id=)

# GetDistributionConfig Operation

Get the configuration information about a distribution.

# Arguments

## `Id = ::String` -- *Required*
The distribution's ID.




# Returns

`GetDistributionConfigResult`

# Exceptions

`NoSuchDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetDistributionConfig)
"""

@inline get_distribution_config(aws::AWSConfig=default_aws_config(); args...) = get_distribution_config(aws, args)

@inline get_distribution_config(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distribution/{Id}/config", args)

@inline get_distribution_config(args) = get_distribution_config(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_invalidation
    get_invalidation([::AWSConfig], arguments::Dict)
    get_invalidation([::AWSConfig]; DistributionId=, Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{DistributionId}/invalidation/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{DistributionId}/invalidation/{Id}", DistributionId=, Id=)

# GetInvalidation Operation

Get the information about an invalidation.

# Arguments

## `DistributionId = ::String` -- *Required*
The distribution's ID.


## `Id = ::String` -- *Required*
The identifier for the invalidation request, for example, `IDFDVBD632BHDS5`.




# Returns

`GetInvalidationResult`

# Exceptions

`NoSuchInvalidation`, `NoSuchDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetInvalidation)
"""

@inline get_invalidation(aws::AWSConfig=default_aws_config(); args...) = get_invalidation(aws, args)

@inline get_invalidation(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distribution/{DistributionId}/invalidation/{Id}", args)

@inline get_invalidation(args) = get_invalidation(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_streaming_distribution
    get_streaming_distribution([::AWSConfig], arguments::Dict)
    get_streaming_distribution([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution/{Id}", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution/{Id}", Id=)

# GetStreamingDistribution Operation

Gets information about a specified RTMP distribution, including the distribution configuration.

# Arguments

## `Id = ::String` -- *Required*
The streaming distribution's ID.




# Returns

`GetStreamingDistributionResult`

# Exceptions

`NoSuchStreamingDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetStreamingDistribution)
"""

@inline get_streaming_distribution(aws::AWSConfig=default_aws_config(); args...) = get_streaming_distribution(aws, args)

@inline get_streaming_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/streaming-distribution/{Id}", args)

@inline get_streaming_distribution(args) = get_streaming_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.get_streaming_distribution_config
    get_streaming_distribution_config([::AWSConfig], arguments::Dict)
    get_streaming_distribution_config([::AWSConfig]; Id=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution/{Id}/config", Id=)

# GetStreamingDistributionConfig Operation

Get the configuration information about a streaming distribution.

# Arguments

## `Id = ::String` -- *Required*
The streaming distribution's ID.




# Returns

`GetStreamingDistributionConfigResult`

# Exceptions

`NoSuchStreamingDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/GetStreamingDistributionConfig)
"""

@inline get_streaming_distribution_config(aws::AWSConfig=default_aws_config(); args...) = get_streaming_distribution_config(aws, args)

@inline get_streaming_distribution_config(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/streaming-distribution/{Id}/config", args)

@inline get_streaming_distribution_config(args) = get_streaming_distribution_config(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_cloud_front_origin_access_identities
    list_cloud_front_origin_access_identities([::AWSConfig], arguments::Dict)
    list_cloud_front_origin_access_identities([::AWSConfig]; <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/origin-access-identity/cloudfront", <keyword arguments>)

# ListCloudFrontOriginAccessIdentities Operation

Lists origin access identities.

# Arguments

## `Marker = ::String`
Use this when paginating results to indicate where to begin in your list of origin access identities. The results include identities in the list that occur after the marker. To get the next page of results, set the `Marker` to the value of the `NextMarker` from the current page's response (which is also the ID of the last identity on that page).


## `MaxItems = ::String`
The maximum number of origin access identities you want in the response body.




# Returns

`ListCloudFrontOriginAccessIdentitiesResult`

# Exceptions

`InvalidArgument`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListCloudFrontOriginAccessIdentities)
"""

@inline list_cloud_front_origin_access_identities(aws::AWSConfig=default_aws_config(); args...) = list_cloud_front_origin_access_identities(aws, args)

@inline list_cloud_front_origin_access_identities(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/origin-access-identity/cloudfront", args)

@inline list_cloud_front_origin_access_identities(args) = list_cloud_front_origin_access_identities(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_distributions
    list_distributions([::AWSConfig], arguments::Dict)
    list_distributions([::AWSConfig]; <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution", <keyword arguments>)

# ListDistributions Operation

List distributions.

# Arguments

## `Marker = ::String`
Use this when paginating results to indicate where to begin in your list of distributions. The results include distributions in the list that occur after the marker. To get the next page of results, set the `Marker` to the value of the `NextMarker` from the current page's response (which is also the ID of the last distribution on that page).


## `MaxItems = ::String`
The maximum number of distributions you want in the response body.




# Returns

`ListDistributionsResult`

# Exceptions

`InvalidArgument`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListDistributions)
"""

@inline list_distributions(aws::AWSConfig=default_aws_config(); args...) = list_distributions(aws, args)

@inline list_distributions(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distribution", args)

@inline list_distributions(args) = list_distributions(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_distributions_by_web_aclid
    list_distributions_by_web_aclid([::AWSConfig], arguments::Dict)
    list_distributions_by_web_aclid([::AWSConfig]; WebACLId=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distributionsByWebACLId/{WebACLId}", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distributionsByWebACLId/{WebACLId}", WebACLId=, <keyword arguments>)

# ListDistributionsByWebACLId Operation

List the distributions that are associated with a specified AWS WAF web ACL.

# Arguments

## `Marker = ::String`
Use `Marker` and `MaxItems` to control pagination of results. If you have more than `MaxItems` distributions that satisfy the request, the response includes a `NextMarker` element. To get the next page of results, submit another request. For the value of `Marker`, specify the value of `NextMarker` from the last response. (For the first request, omit `Marker`.)


## `MaxItems = ::String`
The maximum number of distributions that you want CloudFront to return in the response body. The maximum and default values are both 100.


## `WebACLId = ::String` -- *Required*
The ID of the AWS WAF web ACL that you want to list the associated distributions. If you specify "null" for the ID, the request returns a list of the distributions that aren't associated with a web ACL.




# Returns

`ListDistributionsByWebACLIdResult`

# Exceptions

`InvalidArgument` or `InvalidWebACLId`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListDistributionsByWebACLId)
"""

@inline list_distributions_by_web_aclid(aws::AWSConfig=default_aws_config(); args...) = list_distributions_by_web_aclid(aws, args)

@inline list_distributions_by_web_aclid(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distributionsByWebACLId/{WebACLId}", args)

@inline list_distributions_by_web_aclid(args) = list_distributions_by_web_aclid(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_invalidations
    list_invalidations([::AWSConfig], arguments::Dict)
    list_invalidations([::AWSConfig]; DistributionId=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{DistributionId}/invalidation", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/distribution/{DistributionId}/invalidation", DistributionId=, <keyword arguments>)

# ListInvalidations Operation

Lists invalidation batches.

# Arguments

## `DistributionId = ::String` -- *Required*
The distribution's ID.


## `Marker = ::String`
Use this parameter when paginating results to indicate where to begin in your list of invalidation batches. Because the results are returned in decreasing order from most recent to oldest, the most recent results are on the first page, the second page will contain earlier results, and so on. To get the next page of results, set `Marker` to the value of the `NextMarker` from the current page's response. This value is the same as the ID of the last invalidation batch on that page.


## `MaxItems = ::String`
The maximum number of invalidation batches that you want in the response body.




# Returns

`ListInvalidationsResult`

# Exceptions

`InvalidArgument`, `NoSuchDistribution` or `AccessDenied`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListInvalidations)
"""

@inline list_invalidations(aws::AWSConfig=default_aws_config(); args...) = list_invalidations(aws, args)

@inline list_invalidations(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/distribution/{DistributionId}/invalidation", args)

@inline list_invalidations(args) = list_invalidations(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_streaming_distributions
    list_streaming_distributions([::AWSConfig], arguments::Dict)
    list_streaming_distributions([::AWSConfig]; <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/streaming-distribution", <keyword arguments>)

# ListStreamingDistributions Operation

List streaming distributions.

# Arguments

## `Marker = ::String`
The value that you provided for the `Marker` request parameter.


## `MaxItems = ::String`
The value that you provided for the `MaxItems` request parameter.




# Returns

`ListStreamingDistributionsResult`

# Exceptions

`InvalidArgument`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListStreamingDistributions)
"""

@inline list_streaming_distributions(aws::AWSConfig=default_aws_config(); args...) = list_streaming_distributions(aws, args)

@inline list_streaming_distributions(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/streaming-distribution", args)

@inline list_streaming_distributions(args) = list_streaming_distributions(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.list_tags_for_resource
    list_tags_for_resource([::AWSConfig], arguments::Dict)
    list_tags_for_resource([::AWSConfig]; Resource=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "GET", "/2017-03-25/tagging", arguments::Dict)
    cloudfront([::AWSConfig], "GET", "/2017-03-25/tagging", Resource=)

# ListTagsForResource Operation

List tags for a CloudFront resource.

# Arguments

## `Resource = ::String` -- *Required*
An ARN of a CloudFront resource.




# Returns

`ListTagsForResourceResult`

# Exceptions

`AccessDenied`, `InvalidArgument`, `InvalidTagging` or `NoSuchResource`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/ListTagsForResource)
"""

@inline list_tags_for_resource(aws::AWSConfig=default_aws_config(); args...) = list_tags_for_resource(aws, args)

@inline list_tags_for_resource(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "GET", "/2017-03-25/tagging", args)

@inline list_tags_for_resource(args) = list_tags_for_resource(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.tag_resource
    tag_resource([::AWSConfig], arguments::Dict)
    tag_resource([::AWSConfig]; Resource=, Tags=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/tagging?Operation=Tag", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/tagging?Operation=Tag", Resource=, Tags=)

# TagResource Operation

Add tags to a CloudFront resource.

# Arguments

## `Resource = ::String` -- *Required*
An ARN of a CloudFront resource.


## `Tags = ["Items" =>  [[ ... ], ...]]` -- *Required*
A complex type that contains zero or more `Tag` elements.
```
 Tags = ["Items" =>  [[
            "Key" => <required> ::String,
            "Value" =>  ::String
        ], ...]]
```



# Exceptions

`AccessDenied`, `InvalidArgument`, `InvalidTagging` or `NoSuchResource`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/TagResource)
"""

@inline tag_resource(aws::AWSConfig=default_aws_config(); args...) = tag_resource(aws, args)

@inline tag_resource(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/tagging?Operation=Tag", args)

@inline tag_resource(args) = tag_resource(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.untag_resource
    untag_resource([::AWSConfig], arguments::Dict)
    untag_resource([::AWSConfig]; Resource=, TagKeys=)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "POST", "/2017-03-25/tagging?Operation=Untag", arguments::Dict)
    cloudfront([::AWSConfig], "POST", "/2017-03-25/tagging?Operation=Untag", Resource=, TagKeys=)

# UntagResource Operation

Remove tags from a CloudFront resource.

# Arguments

## `Resource = ::String` -- *Required*
An ARN of a CloudFront resource.


## `TagKeys = ["Items" =>  [::String, ...]]` -- *Required*
A complex type that contains zero or more `Tag` key elements.




# Exceptions

`AccessDenied`, `InvalidArgument`, `InvalidTagging` or `NoSuchResource`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/UntagResource)
"""

@inline untag_resource(aws::AWSConfig=default_aws_config(); args...) = untag_resource(aws, args)

@inline untag_resource(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "POST", "/2017-03-25/tagging?Operation=Untag", args)

@inline untag_resource(args) = untag_resource(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.update_cloud_front_origin_access_identity
    update_cloud_front_origin_access_identity([::AWSConfig], arguments::Dict)
    update_cloud_front_origin_access_identity([::AWSConfig]; CloudFrontOriginAccessIdentityConfig=, Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", CloudFrontOriginAccessIdentityConfig=, Id=, <keyword arguments>)

# UpdateCloudFrontOriginAccessIdentity Operation

Update an origin access identity.

# Arguments

## `CloudFrontOriginAccessIdentityConfig = [ ... ]` -- *Required*
The identity's configuration information.
```
 CloudFrontOriginAccessIdentityConfig = [
        "CallerReference" => <required> ::String,
        "Comment" => <required> ::String
    ]
```

## `Id = ::String` -- *Required*
The identity's id.


## `If-Match = ::String`
The value of the `ETag` header that you received when retrieving the identity's configuration. For example: `E2QWRUHAPOMQZL`.




# Returns

`UpdateCloudFrontOriginAccessIdentityResult`

# Exceptions

`AccessDenied`, `IllegalUpdate`, `InvalidIfMatchVersion`, `MissingBody`, `NoSuchCloudFrontOriginAccessIdentity`, `PreconditionFailed`, `InvalidArgument` or `InconsistentQuantities`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/UpdateCloudFrontOriginAccessIdentity)
"""

@inline update_cloud_front_origin_access_identity(aws::AWSConfig=default_aws_config(); args...) = update_cloud_front_origin_access_identity(aws, args)

@inline update_cloud_front_origin_access_identity(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "PUT", "/2017-03-25/origin-access-identity/cloudfront/{Id}/config", args)

@inline update_cloud_front_origin_access_identity(args) = update_cloud_front_origin_access_identity(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.update_distribution
    update_distribution([::AWSConfig], arguments::Dict)
    update_distribution([::AWSConfig]; DistributionConfig=, Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/distribution/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/distribution/{Id}/config", DistributionConfig=, Id=, <keyword arguments>)

# UpdateDistribution Operation

Updates the configuration for a web distribution. Perform the following steps.

For information about updating a distribution using the CloudFront console, see [Creating or Updating a Web Distribution Using the CloudFront Console](http://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-web-creating-console.html) in the *Amazon CloudFront Developer Guide*.

**To update a web distribution using the CloudFront API**

1.  Submit a [GetDistributionConfig](@ref) request to get the current configuration and an `Etag` header for the distribution.

    **Note**
    > If you update the distribution again, you need to get a new `Etag` header.

2.  Update the XML document that was returned in the response to your `GetDistributionConfig` request to include the desired changes. You can't change the value of `CallerReference`. If you try to change this value, CloudFront returns an `IllegalUpdate` error.

    **Important**
    > The new configuration replaces the existing configuration; the values that you specify in an `UpdateDistribution` request are not merged into the existing configuration. When you add, delete, or replace values in an element that allows multiple values (for example, `CNAME`), you must specify all of the values that you want to appear in the updated distribution. In addition, you must update the corresponding `Quantity` element.

3.  Submit an `UpdateDistribution` request to update the configuration for your distribution:

    *   In the request body, include the XML document that you updated in Step 2. The request body must include an XML document with a `DistributionConfig` element.

    *   Set the value of the HTTP `If-Match` header to the value of the `ETag` header that CloudFront returned when you submitted the `GetDistributionConfig` request in Step 1.

4.  Review the response to the `UpdateDistribution` request to confirm that the configuration was successfully updated.

5.  Optional: Submit a [GetDistribution](@ref) request to confirm that your changes have propagated. When propagation is complete, the value of `Status` is `Deployed`.

    **Important**
    > Beginning with the 2012-05-05 version of the CloudFront API, we made substantial changes to the format of the XML document that you include in the request body when you create or update a distribution. With previous versions of the API, we discovered that it was too easy to accidentally delete one or more values for an element that accepts multiple values, for example, CNAMEs and trusted signers. Our changes for the 2012-05-05 release are intended to prevent these accidental deletions and to notify you when there's a mismatch between the number of values you say you're specifying in the `Quantity` element and the number of values you're actually specifying.

# Arguments

## `DistributionConfig = [ ... ]` -- *Required*
The distribution's configuration information.
```
 DistributionConfig = [
        "CallerReference" => <required> ::String,
        "Aliases" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "DefaultRootObject" =>  ::String,
        "Origins" => <required> [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "Id" => <required> ::String,
                "DomainName" => <required> ::String,
                "OriginPath" =>  ::String,
                "CustomHeaders" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [[
                        "HeaderName" => <required> ::String,
                        "HeaderValue" => <required> ::String
                    ], ...]
                ],
                "S3OriginConfig" =>  ["OriginAccessIdentity" => <required> ::String],
                "CustomOriginConfig" =>  [
                    "HTTPPort" => <required> ::Int,
                    "HTTPSPort" => <required> ::Int,
                    "OriginProtocolPolicy" => <required> "http-only", "match-viewer" or "https-only",
                    "OriginSslProtocols" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["SSLv3", "TLSv1", "TLSv1.1" or "TLSv1.2", ...]
                    ],
                    "OriginReadTimeout" =>  ::Int,
                    "OriginKeepaliveTimeout" =>  ::Int
                ]
            ], ...]
        ],
        "DefaultCacheBehavior" => <required> [
            "TargetOriginId" => <required> ::String,
            "ForwardedValues" => <required> [
                "QueryString" => <required> ::Bool,
                "Cookies" => <required> [
                    "Forward" => <required> "none", "whitelist" or "all",
                    "WhitelistedNames" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ]
                ],
                "Headers" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ],
                "QueryStringCacheKeys" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ]
            ],
            "TrustedSigners" => <required> [
                "Enabled" => <required> ::Bool,
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ],
            "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
            "MinTTL" => <required> ::Int,
            "AllowedMethods" =>  [
                "Quantity" => <required> ::Int,
                "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                "CachedMethods" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                ]
            ],
            "SmoothStreaming" =>  ::Bool,
            "DefaultTTL" =>  ::Int,
            "MaxTTL" =>  ::Int,
            "Compress" =>  ::Bool,
            "LambdaFunctionAssociations" =>  [
                "Quantity" => <required> ::Int,
                "Items" =>  [[
                    "LambdaFunctionARN" =>  ::String,
                    "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                ], ...]
            ]
        ],
        "CacheBehaviors" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "PathPattern" => <required> ::String,
                "TargetOriginId" => <required> ::String,
                "ForwardedValues" => <required> [
                    "QueryString" => <required> ::Bool,
                    "Cookies" => <required> [
                        "Forward" => <required> "none", "whitelist" or "all",
                        "WhitelistedNames" =>  [
                            "Quantity" => <required> ::Int,
                            "Items" =>  [::String, ...]
                        ]
                    ],
                    "Headers" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ],
                    "QueryStringCacheKeys" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" =>  [::String, ...]
                    ]
                ],
                "TrustedSigners" => <required> [
                    "Enabled" => <required> ::Bool,
                    "Quantity" => <required> ::Int,
                    "Items" =>  [::String, ...]
                ],
                "ViewerProtocolPolicy" => <required> "allow-all", "https-only" or "redirect-to-https",
                "MinTTL" => <required> ::Int,
                "AllowedMethods" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...],
                    "CachedMethods" =>  [
                        "Quantity" => <required> ::Int,
                        "Items" => <required> ["GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS" or "DELETE", ...]
                    ]
                ],
                "SmoothStreaming" =>  ::Bool,
                "DefaultTTL" =>  ::Int,
                "MaxTTL" =>  ::Int,
                "Compress" =>  ::Bool,
                "LambdaFunctionAssociations" =>  [
                    "Quantity" => <required> ::Int,
                    "Items" =>  [[
                        "LambdaFunctionARN" =>  ::String,
                        "EventType" =>  "viewer-request", "viewer-response", "origin-request" or "origin-response"
                    ], ...]
                ]
            ], ...]
        ],
        "CustomErrorResponses" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [[
                "ErrorCode" => <required> ::Int,
                "ResponsePagePath" =>  ::String,
                "ResponseCode" =>  ::String,
                "ErrorCachingMinTTL" =>  ::Int
            ], ...]
        ],
        "Comment" => <required> ::String,
        "Logging" =>  [
            "Enabled" => <required> ::Bool,
            "IncludeCookies" => <required> ::Bool,
            "Bucket" => <required> ::String,
            "Prefix" => <required> ::String
        ],
        "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
        "Enabled" => <required> ::Bool,
        "ViewerCertificate" =>  [
            "CloudFrontDefaultCertificate" =>  ::Bool,
            "IAMCertificateId" =>  ::String,
            "ACMCertificateArn" =>  ::String,
            "SSLSupportMethod" =>  "sni-only" or "vip",
            "MinimumProtocolVersion" =>  "SSLv3" or "TLSv1",
            "Certificate" =>  ::String,
            "CertificateSource" =>  "cloudfront", "iam" or "acm"
        ],
        "Restrictions" =>  ["GeoRestriction" => <required> [
                "RestrictionType" => <required> "blacklist", "whitelist" or "none",
                "Quantity" => <required> ::Int,
                "Items" =>  [::String, ...]
            ]],
        "WebACLId" =>  ::String,
        "HttpVersion" =>  "http1.1" or "http2",
        "IsIPV6Enabled" =>  ::Bool
    ]
```

## `Id = ::String` -- *Required*
The distribution's id.


## `If-Match = ::String`
The value of the `ETag` header that you received when retrieving the distribution's configuration. For example: `E2QWRUHAPOMQZL`.




# Returns

`UpdateDistributionResult`

# Exceptions

`AccessDenied`, `CNAMEAlreadyExists`, `IllegalUpdate`, `InvalidIfMatchVersion`, `MissingBody`, `NoSuchDistribution`, `PreconditionFailed`, `TooManyDistributionCNAMEs`, `InvalidDefaultRootObject`, `InvalidRelativePath`, `InvalidErrorCode`, `InvalidResponseCode`, `InvalidArgument`, `InvalidOriginAccessIdentity`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist`, `InvalidViewerCertificate`, `InvalidMinimumProtocolVersion`, `InvalidRequiredProtocol`, `NoSuchOrigin`, `TooManyOrigins`, `TooManyCacheBehaviors`, `TooManyCookieNamesInWhiteList`, `InvalidForwardCookies`, `TooManyHeadersInForwardedValues`, `InvalidHeadersForS3Origin`, `InconsistentQuantities`, `TooManyCertificates`, `InvalidLocationCode`, `InvalidGeoRestrictionParameter`, `InvalidTTLOrder`, `InvalidWebACLId`, `TooManyOriginCustomHeaders`, `TooManyQueryStringParameters`, `InvalidQueryStringParameters`, `TooManyDistributionsWithLambdaAssociations`, `TooManyLambdaFunctionAssociations`, `InvalidLambdaFunctionAssociation`, `InvalidOriginReadTimeout` or `InvalidOriginKeepaliveTimeout`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/UpdateDistribution)
"""

@inline update_distribution(aws::AWSConfig=default_aws_config(); args...) = update_distribution(aws, args)

@inline update_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "PUT", "/2017-03-25/distribution/{Id}/config", args)

@inline update_distribution(args) = update_distribution(default_aws_config(), args)


"""
    using AWSSDK.CloudFront.update_streaming_distribution
    update_streaming_distribution([::AWSConfig], arguments::Dict)
    update_streaming_distribution([::AWSConfig]; StreamingDistributionConfig=, Id=, <keyword arguments>)

    using AWSCore.Services.cloudfront
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/streaming-distribution/{Id}/config", arguments::Dict)
    cloudfront([::AWSConfig], "PUT", "/2017-03-25/streaming-distribution/{Id}/config", StreamingDistributionConfig=, Id=, <keyword arguments>)

# UpdateStreamingDistribution Operation

Update a streaming distribution.

# Arguments

## `StreamingDistributionConfig = [ ... ]` -- *Required*
The streaming distribution's configuration information.
```
 StreamingDistributionConfig = [
        "CallerReference" => <required> ::String,
        "S3Origin" => <required> [
            "DomainName" => <required> ::String,
            "OriginAccessIdentity" => <required> ::String
        ],
        "Aliases" =>  [
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "Comment" => <required> ::String,
        "Logging" =>  [
            "Enabled" => <required> ::Bool,
            "Bucket" => <required> ::String,
            "Prefix" => <required> ::String
        ],
        "TrustedSigners" => <required> [
            "Enabled" => <required> ::Bool,
            "Quantity" => <required> ::Int,
            "Items" =>  [::String, ...]
        ],
        "PriceClass" =>  "PriceClass_100", "PriceClass_200" or "PriceClass_All",
        "Enabled" => <required> ::Bool
    ]
```

## `Id = ::String` -- *Required*
The streaming distribution's id.


## `If-Match = ::String`
The value of the `ETag` header that you received when retrieving the streaming distribution's configuration. For example: `E2QWRUHAPOMQZL`.




# Returns

`UpdateStreamingDistributionResult`

# Exceptions

`AccessDenied`, `CNAMEAlreadyExists`, `IllegalUpdate`, `InvalidIfMatchVersion`, `MissingBody`, `NoSuchStreamingDistribution`, `PreconditionFailed`, `TooManyStreamingDistributionCNAMEs`, `InvalidArgument`, `InvalidOriginAccessIdentity`, `TooManyTrustedSigners`, `TrustedSignerDoesNotExist` or `InconsistentQuantities`.

See also: [AWS API Documentation](https://docs.aws.amazon.com/goto/WebAPI/cloudfront-2017-03-25/UpdateStreamingDistribution)
"""

@inline update_streaming_distribution(aws::AWSConfig=default_aws_config(); args...) = update_streaming_distribution(aws, args)

@inline update_streaming_distribution(aws::AWSConfig, args) = AWSCore.Services.cloudfront(aws, "PUT", "/2017-03-25/streaming-distribution/{Id}/config", args)

@inline update_streaming_distribution(args) = update_streaming_distribution(default_aws_config(), args)




end # module CloudFront


#==============================================================================#
# End of file
#==============================================================================#
