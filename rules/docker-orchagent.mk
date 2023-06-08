# docker image for orchagent

DOCKER_ORCHAGENT_STEM = docker-orchagent
DOCKER_ORCHAGENT = $(DOCKER_ORCHAGENT_STEM).gz
DOCKER_ORCHAGENT_DBG = $(DOCKER_ORCHAGENT_STEM)-$(DBG_IMAGE_MARK).gz

$(DOCKER_ORCHAGENT)_DEPENDS += $(SWSS) \
                               $(SWSS_DBG) \
                               $(LIBSWSSCOMMON_DBG) \
                               $(LIBLAIREDIS_DBG) \
                               $(LIBLAIMETADATA_DBG)

$(DOCKER_ORCHAGENT)_DBG_DEPENDS = $($(DOCKER_CONFIG_ENGINE_BUSTER)_DBG_DEPENDS)
$(DOCKER_ORCHAGENT)_DBG_DEPENDS +=   $(SWSS_DBG) \
                                $(LIBSWSSCOMMON_DBG) \
                                $(LIBLAIREDIS_DBG) \
                                $(LIBLAIMETADATA_DBG)

$(DOCKER_ORCHAGENT)_DBG_IMAGE_PACKAGES = $($(DOCKER_CONFIG_ENGINE_BUSTER)_DBG_IMAGE_PACKAGES)

$(DOCKER_ORCHAGENT)_PATH = $(DOCKERS_PATH)/$(DOCKER_ORCHAGENT_STEM)

$(DOCKER_ORCHAGENT)_LOAD_DOCKERS += $(DOCKER_CONFIG_ENGINE_BUSTER)

SONIC_DOCKER_IMAGES += $(DOCKER_ORCHAGENT)
SONIC_INSTALL_DOCKER_IMAGES += $(DOCKER_ORCHAGENT)

SONIC_DOCKER_DBG_IMAGES += $(DOCKER_ORCHAGENT_DBG)
SONIC_INSTALL_DOCKER_DBG_IMAGES += $(DOCKER_ORCHAGENT_DBG)

$(DOCKER_ORCHAGENT)_CONTAINER_NAME = swss
$(DOCKER_ORCHAGENT)_RUN_OPT += --privileged -t
$(DOCKER_ORCHAGENT)_RUN_OPT += -v /etc/network/interfaces:/etc/network/interfaces:ro
$(DOCKER_ORCHAGENT)_RUN_OPT += -v /etc/network/interfaces.d/:/etc/network/interfaces.d/:ro
$(DOCKER_ORCHAGENT)_RUN_OPT += -v /host/machine.conf:/host/machine.conf:ro
$(DOCKER_ORCHAGENT)_RUN_OPT += -v /etc/sonic:/etc/sonic:ro
$(DOCKER_ORCHAGENT)_RUN_OPT += -v /var/log/swss:/var/log/swss:rw

$(DOCKER_ORCHAGENT)_BASE_IMAGE_FILES += swssloglevel:/usr/bin/swssloglevel
$(DOCKER_ORCHAGENT)_BASE_IMAGE_FILES += monit_swss:/etc/monit/conf.d
$(DOCKER_ORCHAGENT)_FILES += $(ARP_UPDATE_SCRIPT) $(ARP_UPDATE_VARS_TEMPLATE) $(SUPERVISOR_PROC_EXIT_LISTENER_SCRIPT)
