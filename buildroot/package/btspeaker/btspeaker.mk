################################################################################
#
# btspeaker
#
################################################################################

BTSPEAKER_DEPENDENCIES = alsa-lib 

define BTSPEAKER_BUILD_CMDS
endef

define BTSPEAKER_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/main.conf \
           $(TARGET_DIR)/etc/bluetooth/main.conf
#    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/a2dp-agent.py \
#           $(TARGET_DIR)/opt/btspeaker/a2dp-agent.py
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/btuart.sh \
           $(TARGET_DIR)/opt/btspeaker/btuart.sh
    $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/btagent.sh \
           $(TARGET_DIR)/opt/btspeaker/btagent.sh
endef

define BTSPEAKER_INSTALL_INIT_SYSV
        $(INSTALL) -D -m 0755 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/S99btspeaker \
                $(TARGET_DIR)/etc/init.d/S99btspeaker

endef

define BTSPEAKER_INSTALL_INIT_SYSTEMD
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/btuart.service \
                $(TARGET_DIR)/lib/systemd/system/btuart.service
        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/btagent.service \
                $(TARGET_DIR)/lib/systemd/system/btagent.service
#        $(INSTALL) -D -m 0644 $(BR2_EXTERNAL_HIFIBERRY_PATH)/package/btspeaker/a2dp-agent.service \
#                $(TARGET_DIR)/lib/systemd/system/a2dp-agent.service
endef

# Overwrite original Bluez5 package to make sure it doesn't install in systemd
#define BLUEZ5_UTILS_INSTALL_INIT_SYSTEMD
#endef

$(eval $(generic-package))
