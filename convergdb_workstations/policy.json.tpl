{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:DescribeLogGroups"
            ],
            "Resource": [
                "arn:aws:logs:${region}:${account_id}:log-group:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:*"
            ],
            "Resource": [
                "arn:aws:logs:${region}:${account_id}:log-group:convergdb*",
                "arn:aws:logs:${region}:${account_id}:log-group:convergdb*:log-stream:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "events:PutRule",
                "events:PutTargets"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "events:*"
            ],
            "Resource": [
                "arn:aws:events:${region}:${account_id}:rule/convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
              "dynamodb:*"
            ],
            "Resource": [
                "arn:aws:dynamodb:${region}:${account_id}:table/convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::convergdb*",
                "arn:aws:s3:::convergdb*/*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:PutBucketNotification",
                "s3:GetBucketNotification",
                "s3:HeadBucket",
                "s3:ListBucket"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecs:CreateCluster",
                "ecs:RegisterTaskDefinition",
                "ecs:DeregisterTaskDefinition"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecs:*"
            ],
            "Resource": [
                "arn:aws:ecs:${region}:${account_id}:cluster/convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "lambda:CreateFunction"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "lambda:*"
            ],
            "Resource": [
                "arn:aws:lambda:${region}:${account_id}:function:convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:*"
            ],
            "Resource": [
                "arn:aws:iam::${account_id}:role/convergdb*",
                "arn:aws:iam::${account_id}:policy/convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ec2:*"
            ],
            "Resource": [
                "arn:aws:ec2:${region}:${account_id}:internet-gateway/*",
                "arn:aws:ec2:${region}:${account_id}:natgateway/*",
                "arn:aws:ec2:${region}:${account_id}:network-acl/*",
                "arn:aws:ec2:${region}:${account_id}:route-table/*",
                "arn:aws:ec2:${region}:${account_id}:subnet/*",
                "arn:aws:ec2:${region}:${account_id}:vpc/*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ec2:AllocateAddress",
                "ec2:ReleaseAddress",
                "ec2:AssociateRouteTable",
                "ec2:DisassociateRouteTable",
                "ec2:AttachInternetGateway",
                "ec2:DetachInternetGateway",
                "ec2:CreateInternetGateway",
                "ec2:DeleteInternetGateway",
                "ec2:CreateNatGateway",
                "ec2:DeleteNatGateway",
                "ec2:CreateNetworkAcl",
                "ec2:DeleteNetworkAcl",
                "ec2:CreateNetworkAclEntry",
                "ec2:DeleteNetworkAclEntry",
                "ec2:CreateRoute",
                "ec2:DeleteRoute",
                "ec2:CreateRouteTable",
                "ec2:DeleteRouteTable",
                "ec2:CreateSubnet",
                "ec2:DeleteSubnet",
                "ec2:CreateVpc",
                "ec2:ModifyVpcAttribute",
                "ec2:DeleteVpc",
                "ec2:CreateVpcEndpoint",
                "ec2:DeleteVpcEndpoints",
                "ec2:Describe*",
                "ec2:ReplaceNetworkAclAssociation"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudwatch:GetDashBoard",
                "cloudwatch:ListDashBoards",
                "cloudwatch:PutDashBoard",
                "cloudwatch:DeleteDashBoards"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "sns:*"
            ],
            "Resource": [
                "arn:aws:sns:${region}:${account_id}:convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudformation:CreateStack",
                "cloudformation:DeleteStack",
                "cloudformation:DescribeStackEvents",
                "cloudformation:DescribeStacks",
                "cloudformation:GetTemplate",
                "cloudformation:UpdateStack"
            ],
            "Resource": [
                "arn:aws:cloudformation:${region}:${account_id}:stack/convergdb*/*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "glue:CreateDatabase",
                "glue:CreateJob",
                "glue:CreateTable",
                "glue:CreateTrigger",
                "glue:DeleteDatabase",
                "glue:DeleteJob",
                "glue:DeleteTable",
                "glue:DeleteTrigger",
                "glue:GetDatabase",
                "glue:GetDatabases",
                "glue:GetJob",
                "glue:GetJobs",
                "glue:GetTable",
                "glue:GetTables",
                "glue:GetTrigger"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "codecommit:*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "events:ListRules"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "events:ListRules"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "firehose:*"
            ],
            "Resource": [
                "arn:aws:firehose:${region}:${account_id}:deliverystream/convergdb*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecs:DescribeTaskDefinition"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}