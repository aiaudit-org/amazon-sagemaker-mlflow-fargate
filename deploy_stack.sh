#!/usr/bin/env bash

python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
npm install -g aws-cdk@1.65.0

ACCOUNT_ID=$(aws sts get-caller-identity --query Account | tr -d '"')
AWS_REGION=$(aws configure get region)
cdk bootstrap aws://${ACCOUNT_ID}/${AWS_REGION}
cdk deploy --parameters ProjectName=mlflow --require-approval never
