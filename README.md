# Local Kubernetes multi-node cluster

Local multi node kubernetes cluster playground using kind

# How to use it


```bash
# Setup the kind cluster using ./kind-cluster-config.yaml
make create-cluster

# Show kind clusters
make show-clusters

# Show cluster nodes
make show-nodes

# Open shell in given node
make enter-node

# Delete previous created cluster
make delete-cluster
```

# Cluster Configuration

```bash
./kind-cluster-config.yaml
```

[Go here for Kind Documentation](https://kind.sigs.k8s.io/docs/user/configuration/)
