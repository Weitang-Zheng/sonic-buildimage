# linux kernel package

ifeq ($(CONFIGURED_ARCH), arm64)
KVERSION_SHORT = 5.10.0-8-2
KVERSION = $(KVERSION_SHORT)-$(CONFIGURED_ARCH)
KERNEL_VERSION = 5.10.46
KERNEL_SUBVERSION = 4
else
KVERSION_SHORT = 4.19.0-12-2
KVERSION = $(KVERSION_SHORT)-$(CONFIGURED_ARCH)
KERNEL_VERSION = 4.19.152
KERNEL_SUBVERSION = 1
endif

ifeq ($(CONFIGURED_ARCH), armhf)
# Override kernel version for ARMHF as it uses arm MP (multi-platform) for short version
KVERSION = $(KVERSION_SHORT)-armmp
endif

export KVERSION_SHORT KVERSION KERNEL_VERSION KERNEL_SUBVERSION

LINUX_HEADERS_COMMON = linux-headers-$(KVERSION_SHORT)-common_$(KERNEL_VERSION)-$(KERNEL_SUBVERSION)_all.deb
ifeq ($(BUILD_LINUX_KERNEL), y)
$(LINUX_HEADERS_COMMON)_SRC_PATH = $(SRC_PATH)/sonic-linux-kernel
SONIC_MAKE_DEBS += $(LINUX_HEADERS_COMMON)
else
$(LINUX_HEADERS_COMMON)_PATH = /sonic/binaries
SONIC_COPY_DEBS += $(LINUX_HEADERS_COMMON)
endif

LINUX_HEADERS = linux-headers-$(KVERSION)_$(KERNEL_VERSION)-$(KERNEL_SUBVERSION)_$(CONFIGURED_ARCH).deb
ifeq ($(BUILD_LINUX_KERNEL), y)
$(eval $(call add_derived_package,$(LINUX_HEADERS_COMMON),$(LINUX_HEADERS)))
else
$(LINUX_HEADERS)_PATH = /sonic/binaries
SONIC_COPY_DEBS += $(LINUX_HEADERS)
endif

ifeq ($(CONFIGURED_ARCH), armhf)
	LINUX_KERNEL = linux-image-$(KVERSION)_$(KERNEL_VERSION)-$(KERNEL_SUBVERSION)_$(CONFIGURED_ARCH).deb
else
	LINUX_KERNEL = linux-image-$(KVERSION)-unsigned_$(KERNEL_VERSION)-$(KERNEL_SUBVERSION)_$(CONFIGURED_ARCH).deb
endif
ifeq ($(BUILD_LINUX_KERNEL), y)
$(eval $(call add_derived_package,$(LINUX_HEADERS_COMMON),$(LINUX_KERNEL)))
else
$(LINUX_KERNEL)_PATH = /sonic/binaries
SONIC_COPY_DEBS += $(LINUX_KERNEL)
endif

ifeq ($(CONFIGURED_ARCH), arm64)
NXP_KERNEL = linux-image-5.10.35_arm64.deb
$(NXP_KERNEL)_PATH = /sonic/binaries
SONIC_COPY_DEBS += $(NXP_KERNEL)
endif

