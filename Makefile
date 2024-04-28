KIND_CONFIG="kind-cluster-config.yaml"
CLUSTER_NAME=$(shell grep '^name:' ${KIND_CONFIG} | awk '{print $$2}')
CUSTOM_IMAGE=$(shell grep -m 1 '^  image:' ${KIND_CONFIG} | awk '{print $$2}')

build-custom-node:
	@docker build -t ${CUSTOM_IMAGE} .

create-cluster: build-custom-node
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
