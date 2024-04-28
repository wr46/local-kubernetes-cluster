KIND_CONFIG="kind-cluster-config.yaml"
CLUSTER_NAME:=$(shell grep '^name:' ${KIND_CONFIG} | awk '{print $$2}')

create-cluster:
	@kind create cluster --config ${KIND_CONFIG}

show-clusters:
	@kind get clusters

show-nodes:
	@printf "Cluster nodes:\n"
	@docker ps --format '{{.Names}}' | grep "${CLUSTER_NAME}" | sort

enter-node: show-nodes
	@printf "Input node: "
	@read node && docker exec -it $$node bash

delete-cluster:
	@kind delete cluster --name ${CLUSTER_NAME}
