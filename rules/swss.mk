# swss package

SWSS = swss_1.0.0_$(CONFIGURED_ARCH).deb
$(SWSS)_SRC_PATH = $(SRC_PATH)/sonic-swss
$(SWSS)_DEPENDS += $(LIBLAIREDIS_DEV) $(LIBLAIMETADATA_DEV) \
    $(LIBSWSSCOMMON_DEV) \
    $(LIBLAIVS) $(LIBLAIVS_DEV)
$(SWSS)_UNINSTALLS = $(LIBLAIVS_DEV)

$(SWSS)_RDEPENDS += $(LIBLAIREDIS) $(LIBLAIMETADATA) \
    $(LIBSWSSCOMMON) $(PYTHON3_SWSSCOMMON)
SONIC_DPKG_DEBS += $(SWSS)

SWSS_DBG = swss-dbg_1.0.0_$(CONFIGURED_ARCH).deb
$(SWSS_DBG)_DEPENDS += $(SWSS)
$(SWSS_DBG)_RDEPENDS += $(SWSS)
$(eval $(call add_derived_package,$(SWSS),$(SWSS_DBG)))

# The .c, .cpp, .h & .hpp files under src/{$DBG_SRC_ARCHIVE list}
# are archived into debug one image to facilitate debugging.
#
DBG_SRC_ARCHIVE += sonic-swss

