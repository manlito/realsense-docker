# By default we mount home, but you could use another path
home ?= $(shell echo ~)
data_dir ?= $(shell pwd)/data
display := ${DISPLAY}

enviroment_vars := LOCAL_USER_ID=${local_user_id} DISPLAY=${display} HOME=${home} DATA_DIR=${data_dir}

run:
	mkdir -p ${data_dir}
	${enviroment_vars} docker-compose -f docker-compose.yml run realsense

build:
	${enviroment_vars} docker-compose -f docker-compose.yml build
