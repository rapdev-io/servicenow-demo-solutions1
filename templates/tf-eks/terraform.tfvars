cluster_name = "solutions1-cluster"
subnet_ids = [
    "subnet-0890d006",
    "subnet-536be00c"
]
instance_types = [ "t3.large" ]
security_group_ids = [
    "sg-010a7131125972c7f",
    "sg-01349e22e63811a46",
    "sg-0fdb3d106ec4d8931"
]
base_tags = {
    createdby = "jon@rapdev.io"
    env       = "lab"
}
k8s_version = "1.22"