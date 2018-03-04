################################################################################
#
# libmytest
#
################################################################################

MYTEST_VERSION = 1.0
MYTESTSOURCE = ""
MYTEST_SITE = ""
MYTEST_OVERRIDE_SRCDIR = /home/albert/code/mytest/


MYTEST_INSTALL_STAGING = YES
MYTEST_INSTALL_TARGET = YES

MYTEST_CONF_OPTS += --without-python-support

define MYTEST_REMOVE_DOC
	$(RM) -fr $(TARGET_DIR)/usr/share/mytest/doc \
		$(TARGET_DIR)/usr/share/man/man3/mytest*
endef

# Dependence
MYTEST_CONF_OPTS += --with$(if $(BR2_PACKAGE_PYTHON),,out)-python-support
MYTEST_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,)

ifneq ($(BR2_MYTEST_INSTALL_DATA),y)
	MYTEST_POST_INSTALL_TARGET_HOOKS += MYTEST_REMOVE_DATA
endif


define MYTEST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define MYTEST_INSTALL_STAGING_CMDS
#	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
#   $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
#	$(INSTALL) -D -m 0755 $(@D)/libmytest.so* $(STAGING_DIR)/usr/lib
endef

define MYTEST_INSTALL_TARGET_CMDS
#	$(INSTALL) -D -m 0755 $(@D)/libmytest.so* $(TARGET_DIR)/usr/lib
	$(INSTALL) -D -m 0755 $(@D)/mytest $(TARGET_DIR)/usr/bin
endef

#define MYTEST_PERMISSIONS
#	/bin/mytest f 0755 mytest  - - - - -
#endef

$(eval $(generic-package))