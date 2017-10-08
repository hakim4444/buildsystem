#
# auxiliary targets for model-specific builds
#

#
# release_cube_common
#
enigma2_release_cube_common:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_cuberevo $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)install -m 0777 $(SKEL_ROOT)/release/reboot_cuberevo $(RELEASE_DIR)/etc/init.d/reboot
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/ipbox/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx24116.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/

#
# release_cube_common_tuner
#
enigma2_release_cube_common_tuner:
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/multituner/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/media/dvb/frontends/dvb-pll.ko $(RELEASE_DIR)/lib/modules/

#
# cuberevo_9500hd
#
enigma2_release_cuberevo_9500hd: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_2000hd
#
enigma2_release_cuberevo_2000hd: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_250hd
#
enigma2_release_cuberevo_250hd: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_mini_fta
#
enigma2_release_cuberevo_mini_fta: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_mini2
#
enigma2_release_cuberevo_mini2: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_mini
#
enigma2_release_cuberevo_mini: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo
#
enigma2_release_cuberevo: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# cuberevo_3000hd
#
enigma2_release_cuberevo_3000hd: enigma2_release_cube_common enigma2_release_cube_common_tuner

#
# release_common_ipbox
#
enigma2_release_common_ipbox:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ipbox $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/siinfo/siinfo.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp -f $(SKEL_ROOT)/release/fstab_ipbox $(RELEASE_DIR)/etc/fstab
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_ipbox.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)rm -f $(RELEASE_DIR)/lib/firmware/*
	$(SILENT)rm -f $(RELEASE_DIR)/lib/modules/boxtype.ko
	$(SILENT)rm -f $(RELEASE_DIR)/lib/modules/stmvbi.ko
	$(SILENT)rm -f $(RELEASE_DIR)/lib/modules/stmvout.ko
	$(SILENT)rm -f $(RELEASE_DIR)/etc/network/interfaces
	$(SILENT)echo "config.usage.hdd_standby=0" >> $(RELEASE_DIR)/etc/enigma2/settings

#
# ipbox9900
#
enigma2_release_ipbox9900: enigma2_release_common_ipbox
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/ipbox99xx/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/rmu/rmu.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/ipbox99xx_fan/ipbox_fan.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp -p $(SKEL_ROOT)/release/tvmode_ipbox $(RELEASE_DIR)/usr/bin/tvmode
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ipbox.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ipbox99
#
enigma2_release_ipbox99: enigma2_release_common_ipbox
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/ipbox99xx/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/ipbox99xx_fan/ipbox_fan.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp -p $(SKEL_ROOT)/release/tvmode_ipbox $(RELEASE_DIR)/usr/bin/tvmode
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ipbox.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ipbox55
#
enigma2_release_ipbox55: enigma2_release_common_ipbox
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/ipbox55/front.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp -p $(SKEL_ROOT)/release/tvmode_ipbox55 $(RELEASE_DIR)/usr/bin/tvmode
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ipbox.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ufs910
#
enigma2_release_ufs910:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/vfd/vfd.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7100.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7100.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7100.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx21143.fw $(RELEASE_DIR)/lib/firmware/dvb-fe-cx24116.fw
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_ufs910.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_ufs912.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs910.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ufs912
#
enigma2_release_ufs912:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs912 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/micom/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_ufs912.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs912.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ufs913
#
enigma2_release_ufs913:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs912 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/micom/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/multituner/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7105.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7105.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7105_pdk7105.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs912.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ufs922
#
enigma2_release_ufs922:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/micom/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/ufs922_fan/fan_ctrl.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl2108.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx21143.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs910.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# ufc960
#
enigma2_release_ufc960:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/micom/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7100.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx21143.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs910.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# spark
#
enigma2_release_spark:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_spark $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/aotom_spark/aotom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_spark.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_spark.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/sparkVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/leddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/sparkVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/sparkVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/sparkVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_spark.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# spark7162
#
enigma2_release_spark7162:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_spark7162 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/aotom_spark/aotom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp -f $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/i2c_spi/i2s.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7105.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7105.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7105_pdk7105.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_spark7162.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_spark.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/spark7162VFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/spark7162VFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/spark7162VFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/spark7162VFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_spark.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# fortis_hdbox
#
enigma2_release_fortis_hdbox:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_fortis_hdbox $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_fs9000.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/fs9000VFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/fs9000VFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/fs9000VFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/fs9000VFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# atevio7500
#
enigma2_release_atevio7500:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_fortis_hdbox $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/multituner/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7105.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7105.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7105_pdk7105.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl2108.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)rm -f $(RELEASE_DIR)/lib/modules/boxtype.ko
	$(SILENT)rm -f $(RELEASE_DIR)/lib/modules/mpeg2hw.ko
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_fs9000.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs8200VFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs8200VFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs8200VFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs8200VFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# octagon1008
#
enigma2_release_octagon1008:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_octagon1008 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl2108.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs9510VFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs9510VFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs9510VFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs9510VFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7110
#
enigma2_release_hs7110:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs7110 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs7110.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7420
#
enigma2_release_hs7420:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs742x $(RELEASE_DIR)/etc/init.d/halt
	chmod 755 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7429
#
enigma2_release_hs7429:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs742x $(RELEASE_DIR)/etc/init.d/halt
	chmod 755 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs742xVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7810a
#
enigma2_release_hs7810a:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs7810a $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fww
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7119
#
enigma2_release_hs7119:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs7119 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs7110.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hs7819
#
enigma2_release_hs7819:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hs7819 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/nuvoton/nuvoton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/plugin.py ]; then \
		rm -f $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons/*; \
		cp -f $(SKEL_ROOT)/release/vfddisplay.png $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD/* $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/VFD-Icons; \
		rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/hs7810aVFD; \
	fi
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_fortis.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# atemio520
#
enigma2_release_atemio520:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_atemio520 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/cn_micom/cn_micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs910.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# atemio530
#
enigma2_release_atemio530:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_atemio530 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/cn_micom/cn_micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/lnb/lnb.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_ufs910.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# hl101
#
enigma2_release_hl101:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_hl101 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/proton/proton.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl2108.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-stv6306.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_hl101.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_hl101.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# adb_box
#
enigma2_release_adb_box:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_adb_box $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/adb_box_vfd/vfd.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7100.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/adb_box_fan/cooler.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cec_adb_box/cec_ctrl.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/as102/dvb-as102.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7100.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7100.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/as102_data1_st.hex $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/as102_data2_st.hex $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl2108.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/release/fstab_adb_box $(RELEASE_DIR)/etc/fstab
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_adb_box.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_adb_box.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# tf7700
#
enigma2_release_tf7700:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_tf7700 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/tffp/tffp.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx24116.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -f $(SKEL_ROOT)/release/fstab_tf7700 $(RELEASE_DIR)/etc/fstab
	$(SILENT)rm -f $(RELEASE_DIR)/bin/vdstandby
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_tf7700.png $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/rc.png
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_tf7700.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml
#	$(MAKE) tfinstaller

#
# vitamin_hd5000
#
enigma2_release_vitamin_hd5000:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs912 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7111.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/vitamin_hd5000/micom.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/smartcard/smartcard.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7111.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7111.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7111_mb618.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_vitamin_hd5000.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# sagemcom88
#
enigma2_release_sagemcom88:
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/halt_ufs912 $(RELEASE_DIR)/etc/init.d/halt
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-sti7105.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/front_led/front_led.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/front_vfd/front_vfd.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/sagemcomtype/boxtype.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)[ -e $(SKEL_ROOT)/release/fe_core_sagemcom88$(KERNEL_STM_LABEL).ko ] && cp $(SKEL_ROOT)/release/fe_core_sagemcom88$(KERNEL_STM_LABEL).ko $(RELEASE_DIR)/lib/modules/fe_core.ko || true
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7105.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7105.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/component_7105_pdk7105.fw $(RELEASE_DIR)/lib/firmware/component.fw
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_sagemcom88.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_sagemcom88.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# arivalink200
#
enigma2_release_arivalink200:
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmcore-display-stx7109c3.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontends/*.ko $(RELEASE_DIR)/lib/modules/
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/front_ArivaLink200/vfd.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/frontcontroller/front_ArivaLink200/vfd.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)cp $(SKEL_ROOT)/boot/video_7109.elf $(RELEASE_DIR)/boot/video.elf
	$(SILENT)cp $(SKEL_ROOT)/boot/audio_7109.elf $(RELEASE_DIR)/boot/audio.elf
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-avl6222.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp $(SKEL_ROOT)/firmware/dvb-fe-cx24116.fw $(RELEASE_DIR)/lib/firmware/
	$(SILENT)mkdir -p $(RELEASE_DIR)/var/run/lirc
	$(SILENT)cp -dp $(SKEL_ROOT)/release/lircd_arivalink200.conf $(RELEASE_DIR)/etc/lircd.conf
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/keymap_arivalink200.xml $(RELEASE_DIR)/usr/local/share/enigma2/keymap.xml

#
# release_base
#
# the following target creates the common file base
enigma2_release_base:
	@echo "=============================================================="
	@echo
	@echo -e "Start build of $(TERM_GREEN_BOLD)enigma2_release$(TERM_NORMAL)."
	$(SILENT)rm -rf $(RELEASE_DIR) || true
	@echo -n "Copying image to release directory..."
	$(SILENT)install -d $(RELEASE_DIR)
	$(SILENT)install -d $(RELEASE_DIR)/{autofs,bin,boot,dev,dev.static,etc,lib,media,mnt,proc,ram,root,sbin,share,sys,tmp,usr,var}
	$(SILENT)install -d $(RELEASE_DIR)/etc/{enigma2,init.d,network,mdev,tuxbox,tuxtxt}
	$(SILENT)install -d $(RELEASE_DIR)/etc/network/if-{post-{up,down},pre-{up,down},up,down}.d
	$(SILENT)install -d $(RELEASE_DIR)/lib/{modules,udev,firmware}
	$(SILENT)install -d $(RELEASE_DIR)/media/{dvd,hdd,net}
	$(SILENT)ln -sf /media/hdd $(RELEASE_DIR)/hdd
	$(SILENT)install -d $(RELEASE_DIR)/mnt/{hdd,nfs,usb}
	$(SILENT)install -d $(RELEASE_DIR)/usr/{bin,lib,local,sbin,share}
	$(SILENT)install -d $(RELEASE_DIR)/usr/local/{bin,share}
	$(SILENT)ln -sf /etc $(RELEASE_DIR)/usr/local/etc
	$(SILENT)install -d $(RELEASE_DIR)/usr/local/share/{enigma2,keymaps}
	$(SILENT)ln -s /usr/local/share/keymaps $(RELEASE_DIR)/usr/share/keymaps
	$(SILENT)install -d $(RELEASE_DIR)/usr/share/{fonts,udhcpc,zoneinfo}
	$(SILENT)install -d $(RELEASE_DIR)/var/{etc,opkg}
	$(SILENT)ln -fs halt $(RELEASE_DIR)/sbin/reboot
	$(SILENT)ln -fs halt $(RELEASE_DIR)/sbin/poweroff
	$(SILENT)mkdir -p $(RELEASE_DIR)/etc/rc.d/rc0.d
	$(SILENT)ln -s ../init.d/sendsigs $(RELEASE_DIR)/etc/rc.d/rc0.d/S20sendsigs
	$(SILENT)ln -s ../init.d/umountfs $(RELEASE_DIR)/etc/rc.d/rc0.d/S40umountfs
	$(SILENT)ln -s ../init.d/halt $(RELEASE_DIR)/etc/rc.d/rc0.d/S90halt
	$(SILENT)mkdir -p $(RELEASE_DIR)/etc/rc.d/rc6.d
	$(SILENT)ln -s ../init.d/sendsigs $(RELEASE_DIR)/etc/rc.d/rc6.d/S20sendsigs
	$(SILENT)ln -s ../init.d/umountfs $(RELEASE_DIR)/etc/rc.d/rc6.d/S40umountfs
	$(SILENT)ln -s ../init.d/reboot $(RELEASE_DIR)/etc/rc.d/rc6.d/S90reboot
	$(SILENT)touch $(RELEASE_DIR)/var/etc/.firstboot
	$(SILENT)cp -a $(TARGET_DIR)/bin/* $(RELEASE_DIR)/bin/
	$(SILENT)cp -a $(TARGET_DIR)/usr/bin/* $(RELEASE_DIR)/usr/bin/
	$(SILENT)cp -a $(TARGET_DIR)/sbin/* $(RELEASE_DIR)/sbin/
	$(SILENT)cp -a $(TARGET_DIR)/usr/sbin/* $(RELEASE_DIR)/usr/sbin/
	$(SILENT)cp $(SKEL_ROOT)/etc/image-version $(RELEASE_DIR)/etc/
	$(SILENT)cp $(TARGET_DIR)/boot/uImage $(RELEASE_DIR)/boot/
	$(SILENT)ln -sf /proc/mounts $(RELEASE_DIR)/etc/mtab
	$(SILENT)cp -dp $(SKEL_ROOT)/sbin/MAKEDEV $(RELEASE_DIR)/sbin/
	$(SILENT)ln -sf ../sbin/MAKEDEV $(RELEASE_DIR)/dev/MAKEDEV
	$(SILENT)ln -sf ../../sbin/MAKEDEV $(RELEASE_DIR)/lib/udev/MAKEDEV
	$(SILENT)cp -aR $(SKEL_ROOT)/etc/mdev/* $(RELEASE_DIR)/etc/mdev/
	$(SILENT)cp -aR $(SKEL_ROOT)/usr/share/udhcpc/* $(RELEASE_DIR)/usr/share/udhcpc/
	$(SILENT)cp -aR $(SKEL_ROOT)/usr/share/zoneinfo/* $(RELEASE_DIR)/usr/share/zoneinfo/
	$(SILENT)cp $(SKEL_ROOT)/bin/autologin $(RELEASE_DIR)/bin/
	$(SILENT)cp $(SKEL_ROOT)/bin/vdstandby $(RELEASE_DIR)/bin/
	$(SILENT)cp $(SKEL_ROOT)/usr/sbin/fw_printenv $(RELEASE_DIR)/usr/sbin/
	$(SILENT)cp -aR $(TARGET_DIR)/etc/init.d/* $(RELEASE_DIR)/etc/init.d/
	$(SILENT)cp -aR $(TARGET_DIR)/etc/* $(RELEASE_DIR)/etc/
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/boot/bootlogo.mvi $(RELEASE_DIR)/boot/
	$(SILENT)echo "720p50" > $(RELEASE_DIR)/etc/videomode
	$(SILENT)echo "$(BOXTYPE)" > $(RELEASE_DIR)/etc/hostname
	$(SILENT)ln -sf ../../bin/showiframe $(RELEASE_DIR)/usr/bin/showiframe
	$(SILENT)ln -sf ../../usr/sbin/fw_printenv $(RELEASE_DIR)/usr/sbin/fw_setenv
	$(SILENT)ln -sf ../../bin/grab $(RELEASE_DIR)/usr/bin/grab
ifeq ($(BOXTYPE), $(filter $(BOXTYPE), atevio7500 fortis_hdbox octagon1008 ufs910 ufs912 ufs913 ufs922 ufc960 spark spark7162 ipbox55 ipbox99 ipbox9900 cuberevo cuberevo_mini cuberevo_mini2 cuberevo_250hd cuberevo_2000hd cuberevo_3000hd adb_box tf7700 vitamin_hd5000))
	$(SILENT)cp $(SKEL_ROOT)/release/fw_env.config_$(BOXTYPE) $(RELEASE_DIR)/etc/fw_env.config
endif
	$(SILENT)install -m 0755 $(SKEL_ROOT)/release/rcS_enigma2_$(BOXTYPE) $(RELEASE_DIR)/etc/init.d/rcS
#
# player
#
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stm_v4l2.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stm_v4l2.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmvbi.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmvbi.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmvout.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmvout.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmfb.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/stgfb/stmfb/stmfb.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)cd $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra && \
	for mod in \
		sound/pseudocard/pseudocard.ko \
		sound/silencegen/silencegen.ko \
		stm/mmelog/mmelog.ko \
		stm/monitor/stm_monitor.ko \
		media/dvb/stm/dvb/stmdvb.ko \
		sound/ksound/ksound.ko \
		media/dvb/stm/mpeg2_hard_host_transformer/mpeg2hw.ko \
		media/dvb/stm/backend/player2.ko \
		media/dvb/stm/h264_preprocessor/sth264pp.ko \
		media/dvb/stm/allocator/stmalloc.ko \
		stm/platform/platform.ko \
		stm/platform/p2div64.ko \
		media/sysfs/stm/stmsysfs.ko \
	;do \
		if [ -e player2/linux/drivers/$$mod ]; then \
			cp player2/linux/drivers/$$mod $(RELEASE_DIR)/lib/modules/; \
			$(TARGET)-strip --strip-unneeded $(RELEASE_DIR)/lib/modules/`basename $$mod`; \
		else \
			touch $(RELEASE_DIR)/lib/modules/`basename $$mod`; \
		fi; \
	done
#
# modules
#
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/avs/avs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/avs/avs.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/bpamem/bpamem.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/bpamem/bpamem.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/boxtype/boxtype.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/boxtype/boxtype.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/compcache/ramzswap.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/compcache/ramzswap.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/e2_proc/e2_proc.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/e2_proc/e2_proc.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/net/ipv6/ipv6.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/net/ipv6/ipv6.ko $(RELEASE_DIR)/lib/modules/ || true
#
# multicom 324
#
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxshell/embxshell.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxshell/embxshell.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxmailbox/embxmailbox.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxmailbox/embxmailbox.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxshm/embxshm.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/embxshm/embxshm.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/mme/mme_host.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/mme/mme_host.ko $(RELEASE_DIR)/lib/modules/ || true
#
# multicom 406
#
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embx/embx.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embx/embx.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embxmailbox/embxmailbox.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embxmailbox/embxmailbox.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embxshm/embxshm.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/embxshm/embxshm.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/ics/ics.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/ics/ics.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/ics/ics_user.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/ics/ics_user.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/mme/mme.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/mme/mme.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/mme/mme_user.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/multicom/src/mme/mme_user.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/simu_button/simu_button.ko $(RELEASE_DIR)/lib/modules/
ifneq ($(BOXTYPE), $(filter $(BOXTYPE), vip2_v1 spark spark7162))
	$(SILENT)cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cic/*.ko $(RELEASE_DIR)/lib/modules/
endif
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/button/button.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/button/button.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cec/cec.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cec/cec.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cpu_frequ/cpu_frequ.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/cpu_frequ/cpu_frequ.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/led/led.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/led/led.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/pti/pti.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/pti/pti.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/pti_np/pti.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/pti_np/pti.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/smartcard/smartcard.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/smartcard/smartcard.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/autofs4/autofs4.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/autofs4/autofs4.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/net/tun.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/net/tun.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/ftdi_sio.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/ftdi_sio.ko $(RELEASE_DIR)/lib/modules/ftdi.ko || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/pl2303.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/pl2303.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/usbserial.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/usb/serial/usbserial.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/fuse/fuse.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/fuse/fuse.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/ntfs/ntfs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/ntfs/ntfs.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/cifs/cifs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/cifs/cifs.ko $(RELEASE_DIR)/lib/modules/ || true
ifneq ($(BOXTYPE), $(filter $(BOXTYPE), ufs910 ufs922))
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/jfs/jfs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/jfs/jfs.ko $(RELEASE_DIR)/lib/modules/ || true
endif
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfsd/nfsd.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfsd/nfsd.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/exportfs/exportfs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/exportfs/exportfs.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfs_common/nfs_acl.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfs_common/nfs_acl.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfs/nfs.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/nfs/nfs.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/sata_switch/sata.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/sata_switch/sata.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/mini_fo/mini_fo.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/fs/mini_fo/mini_fo.ko $(RELEASE_DIR)/lib/modules/ || true
#
# wlan
#
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/mt7601u/mt7601Usta.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/mt7601u/mt7601Usta.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt2870sta/rt2870sta.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt2870sta/rt2870sta.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt3070sta/rt3070sta.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt3070sta/rt3070sta.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt5370sta/rt5370sta.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rt5370sta/rt5370sta.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl871x/8712u.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl871x/8712u.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8188eu/8188eu.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8188eu/8188eu.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192cu/8192cu.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192cu/8192cu.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192du/8192du.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192du/8192du.ko $(RELEASE_DIR)/lib/modules/ || true
	$(SILENT)[ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192eu/8192eu.ko ] && cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/wireless/rtl8192eu/8192eu.ko $(RELEASE_DIR)/lib/modules/ || true
ifeq ($(IMAGE), $(filter $(IMAGE), enigma2-wlandriver neutrino-wlandriver))
	$(SILENT)install -d $(RELEASE_DIR)/etc/Wireless
	$(SILENT)cp -aR $(SKEL_ROOT)/firmware/Wireless/* $(RELEASE_DIR)/etc/Wireless/
	$(SILENT)cp -aR $(SKEL_ROOT)/firmware/rtlwifi $(RELEASE_DIR)/lib/firmware/
	$(SILENT)cp -aR $(SKEL_ROOT)/firmware/*.bin $(RELEASE_DIR)/lib/firmware/
	$(SILENT)[ -e $(SKEL_ROOT)/etc/wpa_supplicant.wlan0.conf ] && cp -aR $(SKEL_ROOT)/etc/wpa_supplicant.wlan0.conf $(RELEASE_DIR)/etc/ || true
endif
#
# lib usr/lib
#
	$(SILENT)cp -R $(TARGET_DIR)/lib/* $(RELEASE_DIR)/lib/
	$(SILENT)rm -f $(RELEASE_DIR)/lib/*.{a,o,la}
	$(SILENT)chmod 755 $(RELEASE_DIR)/lib/*
	$(SILENT)cp -R $(TARGET_DIR)/usr/lib/* $(RELEASE_DIR)/usr/lib/
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/{engines,enigma2,gconv,libxslt-plugins,pkgconfig,python$(PYTHON_VER),sigc++-1.2,sigc++-2.0}
	$(SILENT)rm -f $(RELEASE_DIR)/usr/lib/*.{a,o,la}
	$(SILENT)chmod 755 $(RELEASE_DIR)/usr/lib/*
#
# fonts
#
	$(SILENT)cp $(SKEL_ROOT)/root_enigma2/usr/share/fonts/* $(RELEASE_DIR)/usr/share/fonts/
	$(SILENT)cp $(TARGET_DIR)/usr/local/share/fonts/* $(RELEASE_DIR)/usr/share/fonts/
	$(SILENT)ln -s /usr/share/fonts $(RELEASE_DIR)/usr/local/share/fonts
#
# enigma2
#
	$(SILENT)if [ -e $(TARGET_DIR)/usr/bin/enigma2 ]; then \
		cp -f $(TARGET_DIR)/usr/bin/enigma2 $(RELEASE_DIR)/usr/local/bin/enigma2; \
	fi
	$(SILENT)if [ -e $(TARGET_DIR)/usr/local/bin/enigma2 ]; then \
		cp -f $(TARGET_DIR)/usr/local/bin/enigma2 $(RELEASE_DIR)/usr/local/bin/enigma2; \
	fi
	$(SILENT)cp -a $(TARGET_DIR)/usr/local/share/enigma2/* $(RELEASE_DIR)/usr/local/share/enigma2
	$(SILENT)cp -f $(SKEL_ROOT)/root_enigma2/usr/local/share/enigma2/skin_default/spinner/* $(RELEASE_DIR)/usr/local/share/enigma2/skin_default/spinner/
	$(SILENT)cp $(SKEL_ROOT)/root_enigma2/etc/enigma2/* $(RELEASE_DIR)/etc/enigma2
	$(SILENT)ln -s /usr/local/share/enigma2 $(RELEASE_DIR)/usr/share/enigma2
	$(SILENT)ln -sf /etc/timezone.xml $(RELEASE_DIR)/etc/tuxbox/timezone.xml
	$(SILENT)install -d $(RELEASE_DIR)/usr/lib/enigma2
	$(SILENT)cp -a $(TARGET_DIR)/usr/lib/enigma2/* $(RELEASE_DIR)/usr/lib/enigma2/
	$(SILENT)if test -d $(TARGET_DIR)/usr/local/lib/enigma2; then \
		cp -a $(TARGET_DIR)/usr/local/lib/enigma2/* $(RELEASE_DIR)/usr/lib/enigma2; \
	fi
#
# copy root_enigma2
#
	$(SILENT)cp -aR $(SKEL_ROOT)/root_enigma2/etc/* $(RELEASE_DIR)/etc/
#
# python2.7
#
	$(SILENT)if [ $(PYTHON_VER_MAJOR) == 2.7 ]; then \
		install -d $(RELEASE_DIR)/usr/include; \
		install -d $(RELEASE_DIR)/$(PYTHON_INCLUDE_DIR); \
		cp $(TARGET_DIR)/$(PYTHON_INCLUDE_DIR)/pyconfig.h $(RELEASE_DIR)/$(PYTHON_INCLUDE_DIR); \
	fi
#
# hotplug
#
	$(SILENT)if [ -e $(TARGET_DIR)/usr/bin/hotplug_e2_helper ]; then \
		cp -dp $(TARGET_DIR)/usr/bin/hotplug_e2_helper $(RELEASE_DIR)/sbin/hotplug; \
		cp -dp $(TARGET_DIR)/usr/bin/bdpoll $(RELEASE_DIR)/sbin/; \
	else \
		cp -dp $(TARGET_DIR)/sbin/hotplug $(RELEASE_DIR)/sbin/; \
	fi
#
# alsa
#
	$(SILENT)if [ -e $(TARGET_DIR)/usr/share/alsa ]; then \
		mkdir -p $(RELEASE_DIR)/usr/share/alsa/; \
		mkdir $(RELEASE_DIR)/usr/share/alsa/cards/; \
		mkdir $(RELEASE_DIR)/usr/share/alsa/pcm/; \
		cp -dp $(TARGET_DIR)/usr/share/alsa/alsa.conf $(RELEASE_DIR)/usr/share/alsa/alsa.conf; \
		cp $(TARGET_DIR)/usr/share/alsa/cards/aliases.conf $(RELEASE_DIR)/usr/share/alsa/cards/; \
		cp $(TARGET_DIR)/usr/share/alsa/pcm/default.conf $(RELEASE_DIR)/usr/share/alsa/pcm/; \
		cp $(TARGET_DIR)/usr/share/alsa/pcm/dmix.conf $(RELEASE_DIR)/usr/share/alsa/pcm/; \
	fi
#
# directfb
#
	$(SILENT)if [ -d $(RELEASE_DIR)/usr/lib/directfb-1.4-5 ]; then \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/gfxdrivers/*.{a,o,la}; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/inputdrivers/*; \
		cp -a $(TARGET_DIR)/usr/lib/directfb-1.4-5/inputdrivers/libdirectfb_enigma2remote.so $(RELEASE_DIR)/usr/lib/directfb-1.4-5/inputdrivers/; \
		cp -a $(TARGET_DIR)/usr/lib/directfb-1.4-5/inputdrivers/libdirectfb_linux_input.so $(RELEASE_DIR)/usr/lib/directfb-1.4-5/inputdrivers/; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/systems/*.{a,o,la}; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/systems/libdirectfb_dummy.so; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/systems/libdirectfb_fbdev.so; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/wm/*.{a,o,la}; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/interfaces/IDirectFBFont/*.{a,o,la}; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/interfaces/IDirectFBImageProvider/*.{a,o,la}; \
		rm -rf $(RELEASE_DIR)/usr/lib/directfb-1.4-5/interfaces/IDirectFBVideoProvider/*.{a,o,la}; \
	fi
	$(SILENT)if [ -d $(RELEASE_DIR)/usr/lib/icu ]; then \
		rm -rf $(RELEASE_DIR)/usr/lib/icu; \
	fi
	$(SILENT)if [ -d $(RELEASE_DIR)/usr/lib/glib-2.0 ]; then \
		rm -rf $(RELEASE_DIR)/usr/lib/glib-2.0; \
	fi
	$(SILENT)if [ -d $(RELEASE_DIR)/usr/lib/enchant ]; then \
		rm -rf $(RELEASE_DIR)/usr/lib/enchant; \
	fi
#
# DVB-T USB
#
	$(SILENT)if [ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/media/dvb/frontends/dvb-pll.ko ]; then \
		cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/kernel/drivers/media/dvb/frontends/dvb-pll.ko $(RELEASE_DIR)/lib/modules/; \
	fi
	$(SILENT)if [ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/as102/dvb-as102.ko ]; then \
		cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/as102/dvb-as102.ko $(RELEASE_DIR)/lib/modules/; \
		cp $(SKEL_ROOT)/firmware/as102_data1_st.hex $(RELEASE_DIR)/lib/firmware/; \
		cp $(SKEL_ROOT)/firmware/as102_data2_st.hex $(RELEASE_DIR)/lib/firmware/; \
	fi
	$(SILENT)if [ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/siano/ ]; then \
		cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/siano/* $(RELEASE_DIR)/lib/modules/; \
		cp $(SKEL_ROOT)/firmware/dvb_nova_12mhz_b0.inp $(RELEASE_DIR)/lib/firmware/; \
	fi
	$(SILENT)if [ -e $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/it913x/dvb-it913x.ko ]; then \
		cp $(TARGET_DIR)/lib/modules/$(KERNEL_VER)/extra/dvbt/it913x/dvb-it913x.ko $(RELEASE_DIR)/lib/modules/; \
		cp $(SKEL_ROOT)/firmware/dvb-usb-it9135-01.fw $(RELEASE_DIR)/lib/firmware/; \
		cp $(SKEL_ROOT)/firmware/dvb-usb-it9135-02.fw $(RELEASE_DIR)/lib/firmware/; \
		cp $(SKEL_ROOT)/firmware/dvb-usb-it9137-01.fw $(RELEASE_DIR)/lib/firmware/; \
	fi
#
# Complete the videomode selection picture set
#
	$(SILENT)if [ -e $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/Videomode/YPbPr.png ]; then \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/Videomode/YPbPr.png $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/Videomode/Component.png; \
		cp -rf $(TARGET_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/Videomode/lcd_YPbPr.png $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/Videomode/lcd_Component.png; \
	fi
	@echo " done."
#
# delete unnecessary files
#
	@echo -n "Cleaning up..."
ifeq ($(BOXTYPE), $(filter $(BOXTYPE), ufs910 ufs922))
	$(SILENT)rm -f $(RELEASE_DIR)/sbin/jfs_fsck
	$(SILENT)rm -f $(RELEASE_DIR)/sbin/fsck.jfs
	$(SILENT)rm -f $(RELEASE_DIR)/sbin/jfs_mkfs
	$(SILENT)rm -f $(RELEASE_DIR)/sbin/mkfs.jfs
	$(SILENT)rm -f $(RELEASE_DIR)/sbin/jfs_tune
endif
	$(SILENT)rm -f $(RELEASE_DIR)/usr/bin/avahi-*
	$(SILENT)rm -f $(RELEASE_DIR)/usr/bin/easy_install*
	$(SILENT)rm -f $(RELEASE_DIR)/usr/bin/glib-*
	$(SILENT)rm -f $(addprefix $(RELEASE_DIR)/usr/bin/,dvdnav-config gio-querymodules gobject-query gtester gtester-report)
	$(SILENT)rm -f $(addprefix $(RELEASE_DIR)/usr/bin/,livestreamer mailmail manhole opkg-check-config opkg-cl)
	$(SILENT)rm -rf $(RELEASE_DIR)/lib/autofs
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/m4-nofpu/
	$(SILENT)rm -rf $(RELEASE_DIR)/lib/modules/$(KERNEL_VER)
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/gcc
	$(SILENT)rm -f $(RELEASE_DIR)/usr/lib/libc.so
#
# delete unnecessary files python
#
	$(SILENT)install -d $(RELEASE_DIR)/$(PYTHON_DIR)
	$(SILENT)cp -a $(TARGET_DIR)/$(PYTHON_DIR)/* $(RELEASE_DIR)/$(PYTHON_DIR)/
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/{bsddb,compiler,curses,distutils,lib-old,lib-tk,plat-linux3,test}
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/ctypes/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/email/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/json/tests
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/lib2to3/tests
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/sqlite3/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/unittest/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/{test,conch,mail,names,news,words,flow,lore,pair,runner}
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/Cheetah/Tests
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/livestreamer_cli
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/lxml
	$(SILENT)rm -f $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/libxml2mod.so
	$(SILENT)rm -f $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/libxsltmod.so
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/OpenSSL/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/setuptools
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/zope/interface/tests
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/application/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/conch/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/internet/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/lore/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/mail/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/manhole/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/names/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/news/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/pair/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/persisted/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/protocols/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/python/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/runner/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/scripts/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/trial/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/web/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/twisted/words/test
	$(SILENT)rm -rf $(RELEASE_DIR)/$(PYTHON_DIR)/site-packages/*-py$(PYTHON_VER_MAJOR).egg-info
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/DemoPlugins
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/FrontprocessorUpgrade
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/SystemPlugins/NFIFlash
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/FileManager
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/lib/enigma2/python/Plugins/Extensions/TuxboxPlugins
#
# delete unnecessary remote control files and VFD plugins
#
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_spark.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/spark.png
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_fs9000.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/fs9000.png
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs9510.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs9510.png
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_hs7110.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs7110.png
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_tf7700.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/tf7700.png
	$(SILENT)cp -f $(SKEL_ROOT)/release/rc_ufs912.png $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/ufs912.png
# delete mips remote control files
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et4x00.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et6x00.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et7x00.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et8000.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et9x00.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/et9500.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/formuler1.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hd1100.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hd2400.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/vu*.*
	$(SILENT)rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/xp1000.*
	$(SILENT)if [[ ! ENABLE_SPARK7162 && ! ENABLE_SPARK ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/spark/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/spark; \
	fi
	$(SILENT)if [[ ! ENABLE_HDBOX && ! ENABLE_ATEVIO7500 ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/fs9000/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/fs9000; \
	fi
	$(SILENT)if [[ ! ENABLE_OCTAGON1008 && ! ENABLE_HS7420 && ! ENABLE_HS7810A && ! ENABLE_HS7429 && ! ENABLE_HS7819 ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs9510/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs9510; \
	fi
	$(SILENT)if [[ ! ENABLE_HS7110 && ! ENABLE_HS7119 ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs7110/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/hs7110; \
	fi
	$(SILENT)if [[ ! ENABLE_TF7700 ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/tf7700/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/tf7700; \
	fi
	$(SILENT)if [[ ! ENABLE_UFS910 && ! ENABLE_UFS912 ]]; then \
		rm -rf $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/ufs912/*; \
		rmdir $(RELEASE_DIR)/usr/local/share/enigma2/rc_models/ufs912; \
	fi
#
	@echo " done."
#
# Do not remove pyo files, remove pyc instead
#
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -name '*.pyc' -exec rm -f {} \;
ifeq ($(OPTIMIZATIONS), size)
ifneq ($(BOXTYPE), atevio7500)
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -not -name 'mytest.py' -name '*.py' -exec rm -f {} \;
else
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -not -name 'mytest.py' -not -name 'Language.py' -name '*.py' -exec rm -f {} \;
endif
endif
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -name '*.a' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -name '*.o' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/usr/lib/enigma2/ -name '*.la' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.pyc' -exec rm -f {} \;
ifeq ($(OPTIMIZATIONS), size)
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.py' -exec rm -f {} \;
endif
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.a' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.c' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.pyx' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.o' -exec rm -f {} \;
	$(SILENT)find $(RELEASE_DIR)/$(PYTHON_DIR)/ -name '*.la' -exec rm -f {} \;
#
# The main target depends on the model.
#
$(D)/enigma2_release: \
$(D)/%enigma2_release: enigma2_release_base enigma2_release_$(BOXTYPE)
	$(TUXBOX_CUSTOMIZE)
	$(TOUCH)
#
# FOR YOUR OWN CHANGES use these folder in cdk/own_build/enigma2
#
#	default for all receivers
	@echo -n "Processing own_build..." ;
	$(SILENT)find $(OWN_BUILD)/enigma2/ -mindepth 1 -maxdepth 1 -exec cp -at$(RELEASE_DIR)/ -- {} +
	@echo " done."
#	receiver specific (only if directory exists)
	@echo -n "Processing receiver specific own build for $(BOXTYPE)..."
	$(SILENT)[ -d "$(OWN_BUILD)/enigma2.$(BOXTYPE)" ] && find $(OWN_BUILD)/enigma2.$(BOXTYPE)/ -mindepth 1 -maxdepth 1 -exec cp -at$(RELEASE_DIR)/ -- {} + || true
	@echo " done."
	$(SILENT)echo $(BOXTYPE) > $(RELEASE_DIR)/etc/model
	@rm -f $(RELEASE_DIR)/for_your_own_changes
#
# sh4-linux-strip all
#
ifneq ($(OPTIMIZATIONS), $(filter $(OPTIMIZATIONS), kerneldebug debug))
	@echo -n "Stripping..." ;
	$(SILENT)find $(RELEASE_DIR)/ -name '*' -exec $(TARGET)-strip --strip-unneeded {} &>/dev/null \;
	@echo -e " done.\n" ;
endif
#
# release-clean
#
enigma2-release-clean:
	$(SILENT)rm -f $(D)/enigma2_release

