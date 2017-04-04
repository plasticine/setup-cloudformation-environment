# setup-cloudformation-environment
A container to assist in providing environmental information for a given instance launched via AWS Cloudformation

``` shell
touch /etc/cloudformation-environment

docker run --rm -v /etc/cloudformation-environment:/etc/cloudformation-environment plasticine/setup-cloudformation-environment
```
