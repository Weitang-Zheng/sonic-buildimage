## M2-W6510-48V8C
MICAS_M2_W6510_48V8C_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6510_48V8C_PLATFORM_MODULE_VERSION

MICAS_M2_W6510_48V8C_PLATFORM_MODULE = platform-modules-micas-m2-w6510-48v8c_$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE)_SRC_PATH = $(PLATFORM_PATH)/sonic-platform-modules-micas
$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE)_DEPENDS += $(LINUX_HEADERS) $(LINUX_HEADERS_COMMON) $(PDDF_PLATFORM_MODULE)
$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6510-48v8c-r0
SONIC_DPKG_DEBS += $(MICAS_M2_W6510_48V8C_PLATFORM_MODULE)
SONIC_STRETCH_DEBS += $(MICAS_M2_W6510_48V8C_PLATFORM_MODULE)

## M2-W6510-48GT4V
MICAS_M2_W6510_48GT4V_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6510_48GT4V_PLATFORM_MODULE_VERSION

MICAS_M2_W6510_48GT4V_PLATFORM_MODULE = platform-modules-micas-m2-w6510-48gt4v_$(MICAS_M2_W6510_48GT4V_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6510_48GT4V_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6510-48gt4v-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6510_48GT4V_PLATFORM_MODULE)))

## M2-W6520-24DC8QC
MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE_VERSION

MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE = platform-modules-micas-m2-w6520-24dc8qc_$(MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6520-24dc8qc-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6520_24DC8QC_PLATFORM_MODULE)))

## M2-W6940-128QC
MICAS_M2_W6940_128QC_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6940_128QC_PLATFORM_MODULE_VERSION

MICAS_M2_W6940_128QC_PLATFORM_MODULE = platform-modules-micas-m2-w6940-128qc_$(MICAS_M2_W6940_128QC_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6940_128QC_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6940-128qc-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6940_128QC_PLATFORM_MODULE)))

## M2-W6930-64QC
MICAS_M2_W6930_64QC_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6930_64QC_PLATFORM_MODULE_VERSION

MICAS_M2_W6930_64QC_PLATFORM_MODULE = platform-modules-micas-m2-w6930-64qc_$(MICAS_M2_W6930_64QC_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6930_64QC_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6930-64qc-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6930_64QC_PLATFORM_MODULE)))

## M2-W6940-64OC
MICAS_M2_W6940_64OC_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6940_64OC_PLATFORM_MODULE_VERSION

MICAS_M2_W6940_64OC_PLATFORM_MODULE = platform-modules-micas-m2-w6940-64oc_$(MICAS_M2_W6940_64OC_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6940_64OC_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6940-64oc-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6940_64OC_PLATFORM_MODULE)))

## M2-W6920-32QC2X
MICAS_M2_W6920_32QC2X_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6920_32QC2X_PLATFORM_MODULE_VERSION

MICAS_M2_W6920_32QC2X_PLATFORM_MODULE = platform-modules-micas-m2-w6920-32qc2x_$(MICAS_M2_W6920_32QC2X_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6920_32QC2X_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6920-32qc2x-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6920_32QC2X_PLATFORM_MODULE)))

## M2-W6510-32C
MICAS_M2_W6510_32C_PLATFORM_MODULE_VERSION = 1.0
export MICAS_M2_W6510_32C_PLATFORM_MODULE_VERSION

MICAS_M2_W6510_32C_PLATFORM_MODULE = platform-modules-micas-m2-w6510-32c_$(MICAS_M2_W6510_32C_PLATFORM_MODULE_VERSION)_amd64.deb
$(MICAS_M2_W6510_32C_PLATFORM_MODULE)_PLATFORM = x86_64-micas_m2-w6510-32c-r0
$(eval $(call add_extra_package,$(MICAS_M2_W6510_48V8C_PLATFORM_MODULE),$(MICAS_M2_W6510_32C_PLATFORM_MODULE)))