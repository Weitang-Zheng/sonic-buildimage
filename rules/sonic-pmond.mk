# sonic-pmond (SONiC PMON mgmt daemon) wheel package

SONIC_PMOND_PY3 = sonic_pmond-1.0-py3-none-any.whl
$(SONIC_PMOND_PY3)_SRC_PATH = $(SRC_PATH)/sonic-platform-daemons/sonic-pmond
$(SONIC_PMOND_PY3)_DEPENDS = $(SONIC_PY_COMMON_PY3)
$(SONIC_PMOND_PY3)_DEBS_DEPENDS = $(LIBSWSSCOMMON) $(PYTHON3_SWSSCOMMON)
$(SONIC_PMOND_PY3)_PYTHON_VERSION = 3
SONIC_PYTHON_WHEELS += $(SONIC_PMOND_PY3)
