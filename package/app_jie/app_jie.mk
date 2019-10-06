################################################################################
#
# app_jie
#
################################################################################

# APP_JIE_VERSION = 1.0.0
# APP_JIE_SITE_METHOD = local
# APP_JIE_SITE = $(CURDIR)/dl/buildroot-app

APP_JIE_VERSION = master
APP_JIE_SITE_METHOD = git  
APP_JIE_SITE = $(call github,jiejietop,buildroot-app,$(APP_JIE_VERSION))

APP_JIE_ALWAYS_BUILD = YES
APP_JIE_INSTALL_TARGET = YES
APP_JIE_CFLAGS =
APP_JIE_LDFLAGS =
OUT_BIN = hello
APP_JIE_MAKE_FLAGS += \
        CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
        CC=$(TARGET_CC) \
        OUT_BIN=$(OUT_BIN) \
        AR=$(TARGET_AR) \
        STRIP=$(TARGET_STRIP) \
        CFLAGS=$(APP_JIE_CFLAGS) \
        LDFLAGS=$(APP_JIE_LDFLAGS) \
        STAGING_DIR=$(STAGING_DIR) \
        TARGET_DIR=$(TARGET_DIR)

define APP_JIE_BUILD_CMDS
    #$(MAKE) clean -C $(@D) 
    $(MAKE) $(APP_JIE_MAKE_FLAGS)  -C $(@D)
endef

define APP_JIE_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/$(OUT_BIN) $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

