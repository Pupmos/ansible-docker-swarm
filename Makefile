DD_API_KEY?=''

ifndef NODE_TYPE
	NODE_TYPE='default'
endif

ifdef JOIN_EXISTING
	JOIN_EXISTING_OPTS='join_existing=$(JOIN_EXISTING)'
endif

ifdef TARGET
	TARGET_OPTS = '-l $(TARGET)'
endif

ifndef DRAIN
	DRAIN='true'
endif

master:
	@ansible-playbook -i inventory/hosts -e 'target=master $(JOIN_EXISTING_OPTS) advertise_addr=$(SWARM_ADDR) listen_addr=$(SWARM_ADDR) dd_api_key=$(DD_API_KEY) provider=$(PROVIDER) drain=$(DRAIN)' $(TARGET_OPTS) master.yml

worker:
	@ansible-playbook -i inventory/hosts -e 'target=worker advertise_addr=$(SWARM_ADDR) listen_addr=$(SWARM_ADDR) dd_api_key=$(DD_API_KEY) provider=$(PROVIDER)' $(TARGET_OPTS) worker.yml
