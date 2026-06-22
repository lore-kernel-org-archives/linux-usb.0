Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712233AC0F0;
	Mon, 22 Jun 2026 13:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782135322; cv=none; b=GhStYzzwbT2olm0gs/3CURC0Iliggr0E+2UIU5ijyPQXDf1FqE/3MYvnEGBNdHJiaty3jxRh7MDBbqb/wAoRg757V7qtFiZRKF5k4NlA+s9WsD248466m52jQlGylOCjGZpPFxWZylrxao9P7o7GjZUFHMlZ+kKGqhEoQhInnWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782135322; c=relaxed/simple;
	bh=P5ugq5sZym1PS0kLunT9dvyCbUNmJH3399w19MnR74Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQIKwiuAD+2WnR6ZFbHEjp96nV90CKYwD35aZ3njtKPKhqye8mjdbrZ5nXWsFXIop/SPMjf/5XweDczjVy1vF36NmBY7KyFIz8+l2svVwBF8EMjwS2DNzwL3OUQkKUIjfw6ETCE8tiwVsLISiO6Cw68QrQ6zwh6fSrC5lusZuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xpyrsL7F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xpyrsL7F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A2B1F000E9;
	Mon, 22 Jun 2026 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782135320;
	bh=oArVu4dMmxRik8OtGgdJLDacSWBiklj4CNrEIiPa47w=;
	h=Date:From:To:Cc:Subject;
	b=xpyrsL7F4dobMZNMnlYO+Qibmm3dcVxvB8Y0Dl8BIR2V1AdMxhNzaF1HEtFOuX4TR
	 gp3WC4OrTJ4bijY46R08UVN/xFGR+2/Nh5gzHt7QJhVi5wNg0h0IcD/TVfA2IqOWjr
	 UpX5E6zAimu75flQk0Lw/xa/NdhuhN4lBjYikmsA=
Date: Mon, 22 Jun 2026 15:35:19 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB / Thunderbolt driver changes for 7.2-1
Message-ID: <ajk6F7wN7SNpW82A@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:

  Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc1

for you to fetch changes up to 1c2b66a7d7257d2652aa41f9a860ecb96dde27dd:

  usb: ucsi: huawei_gaokun: support mode switching (2026-06-12 18:04:07 +0200)

----------------------------------------------------------------
USB/Thunderbolt driver changes for 7.2-rc1

Here is the big set of USB and Thunderbolt driver changes for 7.2-rc1.

Lots of little stuff in here, major highlights include:
  - USB4STREAM support for Thunderbolt devices.  A new way to send "raw"
    data very quickly over a USB4 connection to another system directly.
  - Other thunderbolt updates and changes to make the stream code work
  - xhci driver updates and additions
  - typec driver updates and additions
  - usb gadget driver updates and fixes for reported issues
  - zh_CN documentation translation of the USB documentation
  - usb-serial driver updates
  - dts cleanups for some USB platforms
  - other minor USB driver updates and tweaks

All of these have been in linux-next for over a week with no reported
issues, most of them for many many weeks.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adrian Wowk (2):
      usbip: vhci_hcd: fix NULL deref in status_show_vhci
      usbip: vhci_hcd: reduce CONFIG_USBIP_VHCI_NR_HCS upper bound to 32

Akash Sukhavasi (1):
      dt-bindings: usb: richtek,rt1711h: remove deprecated .txt file

Alan Borzeszkowski (2):
      thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
      thunderbolt: Improve multi-display DisplayPort tunnel allocation

Antony Kurniawan Soemardi (1):
      dt-bindings: usb: ci-hdrc-usb2: allow up to 3 clocks for qcom,ci-hdrc

Arnd Bergmann (1):
      usb: udc: pxa: remove unused platform_data

Christian Marangi (1):
      usb: host: add ARCH_AIROHA in XHCI MTK dependency

Dave Carey (1):
      USB: cdc-acm: start bulk-IN polling when ALWAYS_POLL_CTRL is set

Dmitry Baryshkov (6):
      dt-bindings: usb: qcom,pmic-typec: deprecate device-specific VBUS
      usb: typec: tcpm: qcom: prefer VBUS supply from the connector node
      arm64: dts: qcom: pm4125: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm7250b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pm8150b: move vdd-vbus-supply to connector nodes
      arm64: dts: qcom: pmi632: move vdd-vbus-supply to connector nodes

Geert Uytterhoeven (2):
      usb: host: xhci-rcar: Remove SET_XHCI_PLAT_PRIV_FOR_RCAR() macro
      usb: host: xhci-rcar: Split R-Car Gen2 and Gen3 .plat_start() handling

Gil Fine (7):
      thunderbolt: Avoid reserved fields in path config space for USB4 routers
      thunderbolt: Fix lane bonding log when bonding not possible
      thunderbolt: Activate path hops from source to destination
      thunderbolt: Verify PCIe adapter in detect state before tunnel setup
      thunderbolt: Verify Router Ready bit is set after router enumeration
      thunderbolt: Increase timeout for Configuration Ready bit
      thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers

Greg Kroah-Hartman (4):
      Merge tag 'v7.1-rc3' into usb-next
      Merge tag 'v7.1-rc6' into usb-next
      Merge tag 'thunderbolt-for-v7.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-7.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Hans Zhang (6):
      usb: dwc3: Use FIELD_MODIFY()
      usb: dwc3: google: Use FIELD_MODIFY()
      usb: dwc3: dwc3-octeon: Use FIELD_MODIFY()
      usb: xhci: Use FIELD_MODIFY()
      usb: xhci-mtk: Use FIELD_MODIFY()
      usb: typec: Use FIELD_MODIFY()

Jihong Min (2):
      usb: xhci-pci: add AMD Promontory 21 PCI glue
      hwmon: add AMD Promontory 21 xHCI temperature sensor support

Jisheng Zhang (1):
      usb: dwc2: remove WARN in dwc2_hcd_save_data_toggle

Johan Hovold (9):
      USB: serial: mxuport: update number-of-ports encoding
      USB: serial: drop unused tty_driver includes
      USB: serial: drop unused tty_flip includes
      USB: serial: xr: add missing uaccess include
      USB: serial: drop unused uaccess includes
      USB: serial: drop unused moduleparam includes
      USB: serial: garmin_gps: drop unused atomic include
      USB: serial: add missing atomic includes
      USB: serial: whiteheat: drop termbits include

Jonas Karlman (1):
      dt-bindings: usb: dwc3: Add compatible for RK3528

Kefan Bai (8):
      docs/zh_CN: Add index.rst translation
      docs/zh_CN: Add acm.rst translation
      docs/zh_CN: Add authorization.rst translation
      docs/zh_CN: Add chipidea.rst translation
      docs/zh_CN: Add dwc3.rst translation
      docs/zh_CN: Add ehci.rst translation
      docs/zh_CN: Add usbmon.rst translation
      docs/zh_CN: Add CREDITS translation

Konrad Dybcio (6):
      thunderbolt: debugfs: Don't stop reading SB registers if just one fails
      usb: typec: mux: ps883x: Power the retimer off when not in use
      thunderbolt: Move pci_device out of tb_nhi
      thunderbolt: Separate out common NHI bits
      thunderbolt: Require nhi->ops be valid
      thunderbolt: Add some more descriptive probe error messages

Krzysztof Kozlowski (3):
      USB: qcom: Unify user-visible "Qualcomm" name
      dt-bindings: usb: qcom,pmic-typec: Drop redundant port
      USB: typec: qcom-pmic-typec: Drop redundant header includes

Maoyi Xie (1):
      usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue

Mathias Nyman (6):
      xhci: dbc: Fix sysfs ABI Documentation for xhci dbc states
      xhci: dbc: serialize enabling and disabling dbc
      xhci: dbc: add helper to set and clear DbC DCE enable bit
      xhci: dbc: add timestamps to DbC state changes in a new helper.
      xhci: dbc: detect and recover hung DbC during enumeraton
      xhci: Prevent queuing new commands if xhci is inaccessible

Mauricio Faria de Oliveira (2):
      usb: atm: ueagle-atm: use dev_dbg() for 'device found' message
      usb: atm: ueagle-atm: remove function entry/exit debug messages

Michael Bommarito (3):
      thunderbolt: test: add KUnit regression tests for XDomain property parser
      thunderbolt: test: Add KUnit tests for property parser bounds checks
      thunderbolt: Prevent XDomain delayed work use-after-free on disconnect

Michal Pecio (4):
      usb: xhci: Simplify xhci_quiesce()
      usb: xhci: Remove skip_isoc_td()
      usb: xhci: Remove isochronous URB_SHORT_NOT_OK handling
      usb: xhci: Improve Soft Retries after short transfers

Mika Westerberg (20):
      thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
      thunderbolt: Make XDomain lane bonding comply with the USB4 v2 spec
      thunderbolt: Keep the domain reference while processing hotplug
      thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
      thunderbolt: Set tb->root_switch to NULL when domain is stopped
      thunderbolt: Wait for tb_domain_release() to complete when driver is removed
      thunderbolt: Keep XDomain reference during the lifetime of a service
      thunderbolt: dma_test: No need to store debugfs directory pointer
      thunderbolt: Remove service debugfs entries during unregister
      thunderbolt: Remove XDomain from the bus without holding tb->lock
      thunderbolt: Add tb_property_merge_dir()
      thunderbolt: Add KUnit test for tb_property_merge_dir()
      thunderbolt: Allow service drivers to specify their own properties
      thunderbolt / net: Move ring_frame_size() to thunderbolt.h
      thunderbolt / net: Let the service drivers configure interrupt throttling
      thunderbolt: Add helper to figure size of the ring
      thunderbolt: Add tb_ring_flush()
      thunderbolt: Add support for ConfigFS
      thunderbolt: Add support for USB4STREAM
      docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM

Nathan Chancellor (1):
      usb: typec: intel_pmc_mux: Zero initialize num_ports in pmc_usb_probe()

Niklas Neronin (4):
      usb: xhci: remove legacy 'num_trbs_free' tracking
      usb: xhci: refactor DCBAA struct
      usb: xhci: allocate DCBAA based on host controller max slots
      usb: xhci: allocate internal DCBAA mirror dynamically

Oliver Neukum (1):
      usb: core: hcd: fix possible deadlock in rh control transfers

Pawel Laszczak (3):
      usb: cdnsp: add support for eUSB2v2 port
      dt-bindings: usb: cdns3: Add cdns,cdnsp compatible string
      usb: cdnsp: Add support for device-only configuration

Pengyu Luo (1):
      usb: ucsi: huawei_gaokun: support mode switching

Peter Chen (3):
      dt-bindings: usb: cdns,usb3: document USBSSP controller support
      usb: cdns3: Add USBSSP platform driver support
      usb: cdns3: plat: fix leaked role switch on core role initialization failure

Pooja Katiyar (4):
      thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()
      usb: typec: ucsi: Add support for message_out data structure
      usb: typec: ucsi: Enable debugfs for message_out data structure
      usb: typec: ucsi: Add support for SET_PDOS command

Rosen Penev (1):
      usb: typec: intel_pmc_mux: combine kzalloc + kcalloc

Sergey Senozhatsky (1):
      usb: typec: ucsi: split connector lock classes

Seungjin Bae (2):
      usb: host: max3421: Fix shift-out-of-bounds in max3421_hub_control()
      usb: host: max3421: Reject hub port requests for non-existent ports

Shuping Bu (1):
      usb: dwc3: core: Fix incorrect kernel-doc comment for dwc3_alloc_event_buffers

Stepan Ionichev (2):
      usb: gadget: goku_udc: avoid NULL deref of dev->driver in INT_USBRESET log
      usb: xhci: fix typo in xhci_set_port_power() comment

Swati Agarwal (2):
      dt-bindings: usb: Add Genesys Logic GL3590 hub
      usb: misc: onboard_usb_hub: Add Genesys Logic GL3590 hub support

Uwe Kleine-König (The Capable Hub) (3):
      usb: typec: Use named initializers for arrays of i2c_device_data
      usb: misc: Use named initializers for struct i2c_device_id
      usb: phy: isp1301: Use named initializers for struct i2c_device_id

Xu Rao (3):
      thunderbolt: test: Release third DP tunnel
      thunderbolt: debugfs: Fix margining error counter buffer leak
      thunderbolt: debugfs: Fix sideband write size check

Xu Yang (3):
      usb: gadget: udc: skip pullup() if already connected
      usb: chipidea: udc: add a helper ci_udc_enable_vbus_irq()
      usb: chipidea: udc: support dynamic gadget add/remove

 .../ABI/testing/configfs-thunderbolt_stream        |   83 +
 .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |    2 +-
 Documentation/admin-guide/thunderbolt.rst          |   61 +
 .../devicetree/bindings/usb/cdns,usb3.yaml         |   73 +-
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      |   25 +-
 .../devicetree/bindings/usb/genesys,gl850g.yaml    |   18 +
 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   |    9 +-
 .../devicetree/bindings/usb/richtek,rt1711h.txt    |   44 -
 .../devicetree/bindings/usb/rockchip,dwc3.yaml     |    3 +
 Documentation/hwmon/index.rst                      |    1 +
 Documentation/hwmon/prom21-xhci.rst                |  101 ++
 .../translations/zh_CN/subsystem-apis.rst          |    2 +-
 Documentation/translations/zh_CN/usb/CREDITS       |  163 ++
 Documentation/translations/zh_CN/usb/acm.rst       |  147 ++
 .../translations/zh_CN/usb/authorization.rst       |  139 ++
 Documentation/translations/zh_CN/usb/chipidea.rst  |  150 ++
 Documentation/translations/zh_CN/usb/dwc3.rst      |   63 +
 Documentation/translations/zh_CN/usb/ehci.rst      |  261 +++
 Documentation/translations/zh_CN/usb/index.rst     |   54 +
 Documentation/translations/zh_CN/usb/usbmon.rst    |  427 +++++
 arch/arm/mach-pxa/devices.c                        |    7 -
 arch/arm/mach-pxa/gumstix.c                        |    1 -
 arch/arm/mach-pxa/udc.h                            |    8 -
 arch/arm64/boot/dts/qcom/pm4125.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |    1 -
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    2 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    2 +
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    2 +
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |    2 +
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    2 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    2 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    2 +
 drivers/hwmon/Kconfig                              |   10 +
 drivers/hwmon/Makefile                             |    1 +
 drivers/hwmon/prom21-xhci.c                        |  239 +++
 drivers/net/thunderbolt/main.c                     |   20 +-
 drivers/thunderbolt/Kconfig                        |   15 +
 drivers/thunderbolt/Makefile                       |    6 +-
 drivers/thunderbolt/acpi.c                         |   14 +-
 drivers/thunderbolt/configfs.c                     |   61 +
 drivers/thunderbolt/ctl.c                          |   16 +-
 drivers/thunderbolt/debugfs.c                      |   18 +-
 drivers/thunderbolt/dma_test.c                     |   25 +-
 drivers/thunderbolt/domain.c                       |   37 +-
 drivers/thunderbolt/eeprom.c                       |    2 +-
 drivers/thunderbolt/icm.c                          |   39 +-
 drivers/thunderbolt/nhi.c                          |  606 ++-----
 drivers/thunderbolt/nhi.h                          |   33 +-
 drivers/thunderbolt/nhi_ops.c                      |  185 ---
 drivers/thunderbolt/nhi_regs.h                     |    3 +-
 drivers/thunderbolt/path.c                         |   37 +-
 drivers/thunderbolt/pci.c                          |  622 +++++++
 drivers/thunderbolt/property.c                     |  164 +-
 drivers/thunderbolt/stream.c                       | 1698 ++++++++++++++++++++
 drivers/thunderbolt/switch.c                       |   77 +-
 drivers/thunderbolt/tb.c                           |   86 +-
 drivers/thunderbolt/tb.h                           |   21 +-
 drivers/thunderbolt/tb_regs.h                      |   19 +-
 drivers/thunderbolt/test.c                         |  249 +++
 drivers/thunderbolt/tunnel.c                       |   35 +
 drivers/thunderbolt/usb4.c                         |   35 +-
 drivers/thunderbolt/usb4_port.c                    |    2 +-
 drivers/thunderbolt/xdomain.c                      |  315 +++-
 drivers/usb/Makefile                               |    2 -
 drivers/usb/atm/ueagle-atm.c                       |   58 +-
 drivers/usb/cdns3/Kconfig                          |  112 +-
 drivers/usb/cdns3/Makefile                         |   46 +-
 drivers/usb/cdns3/cdns3-gadget.c                   |    1 +
 drivers/usb/cdns3/cdns3-plat.c                     |   58 +-
 drivers/usb/cdns3/cdnsp-gadget.c                   |   50 +-
 drivers/usb/cdns3/cdnsp-gadget.h                   |    1 +
 drivers/usb/cdns3/cdnsp-mem.c                      |   73 +-
 drivers/usb/cdns3/cdnsp-pci.c                      |  243 ++-
 drivers/usb/cdns3/cdnsp-ring.c                     |    9 +-
 drivers/usb/cdns3/core.c                           |   48 +-
 drivers/usb/cdns3/core.h                           |    9 +-
 drivers/usb/cdns3/drd.c                            |   45 +-
 drivers/usb/cdns3/gadget-export.h                  |   10 +-
 drivers/usb/cdns3/host-export.h                    |    4 +-
 drivers/usb/chipidea/core.c                        |   11 +-
 drivers/usb/chipidea/udc.c                         |   93 +-
 drivers/usb/class/cdc-acm.c                        |    6 +
 drivers/usb/core/hcd.c                             |   14 +-
 drivers/usb/dwc2/hcd_intr.c                        |   10 +-
 drivers/usb/dwc3/core.c                            |   14 +-
 drivers/usb/dwc3/dwc3-google.c                     |    5 +-
 drivers/usb/dwc3/dwc3-octeon.c                     |   12 +-
 drivers/usb/gadget/udc/aspeed_udc.c                |    7 +-
 drivers/usb/gadget/udc/core.c                      |    7 +-
 drivers/usb/gadget/udc/goku_udc.c                  |    3 +-
 drivers/usb/gadget/udc/pxa25x_udc.c                |   41 +-
 drivers/usb/gadget/udc/pxa25x_udc.h                |    2 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |   35 +-
 drivers/usb/gadget/udc/pxa27x_udc.h                |    2 -
 drivers/usb/host/Kconfig                           |    8 +-
 drivers/usb/host/Makefile                          |    1 +
 drivers/usb/host/max3421-hcd.c                     |    8 +
 drivers/usb/host/xhci-dbgcap.c                     |  144 +-
 drivers/usb/host/xhci-dbgcap.h                     |    3 +
 drivers/usb/host/xhci-hub.c                        |    7 +-
 drivers/usb/host/xhci-mem.c                        |   60 +-
 drivers/usb/host/xhci-mtk.c                        |    6 +-
 drivers/usb/host/xhci-pci-prom21.c                 |  137 ++
 drivers/usb/host/xhci-pci.c                        |   11 +
 drivers/usb/host/xhci-pci.h                        |    3 +
 drivers/usb/host/xhci-rcar.c                       |   70 +-
 drivers/usb/host/xhci-ring.c                       |   53 +-
 drivers/usb/host/xhci.c                            |   23 +-
 drivers/usb/host/xhci.h                            |   29 +-
 drivers/usb/misc/Kconfig                           |    2 +-
 drivers/usb/misc/onboard_usb_dev.c                 |    1 +
 drivers/usb/misc/onboard_usb_dev.h                 |    8 +
 drivers/usb/misc/usb251xb.c                        |   18 +-
 drivers/usb/misc/usb3503.c                         |    2 +-
 drivers/usb/misc/usb4604.c                         |    2 +-
 drivers/usb/phy/phy-isp1301.c                      |    2 +-
 drivers/usb/serial/ark3116.c                       |    1 -
 drivers/usb/serial/belkin_sa.c                     |    2 -
 drivers/usb/serial/cyberjack.c                     |    2 -
 drivers/usb/serial/cypress_m8.c                    |    2 -
 drivers/usb/serial/digi_acceleport.c               |    2 -
 drivers/usb/serial/empeg.c                         |    3 -
 drivers/usb/serial/f81232.c                        |    3 -
 drivers/usb/serial/f81534.c                        |    1 -
 drivers/usb/serial/ftdi_sio.c                      |    1 -
 drivers/usb/serial/garmin_gps.c                    |    3 -
 drivers/usb/serial/generic.c                       |    1 -
 drivers/usb/serial/io_edgeport.c                   |    2 +-
 drivers/usb/serial/io_ti.c                         |    2 -
 drivers/usb/serial/ipaq.c                          |    3 -
 drivers/usb/serial/ipw.c                           |    2 -
 drivers/usb/serial/ir-usb.c                        |    2 -
 drivers/usb/serial/iuu_phoenix.c                   |    2 -
 drivers/usb/serial/keyspan.c                       |    2 -
 drivers/usb/serial/keyspan_pda.c                   |    2 -
 drivers/usb/serial/kl5kusb105.c                    |    2 -
 drivers/usb/serial/kobil_sct.c                     |    2 -
 drivers/usb/serial/mct_u232.c                      |    2 -
 drivers/usb/serial/metro-usb.c                     |    3 -
 drivers/usb/serial/mos7720.c                       |    3 +-
 drivers/usb/serial/mos7840.c                       |    1 -
 drivers/usb/serial/mxuport.c                       |   40 +-
 drivers/usb/serial/omninet.c                       |    2 -
 drivers/usb/serial/opticon.c                       |    2 -
 drivers/usb/serial/option.c                        |    1 -
 drivers/usb/serial/oti6858.c                       |    3 -
 drivers/usb/serial/pl2303.c                        |    3 -
 drivers/usb/serial/qcserial.c                      |    1 -
 drivers/usb/serial/quatech2.c                      |    2 -
 drivers/usb/serial/safe_serial.c                   |    2 -
 drivers/usb/serial/spcp8x5.c                       |    2 -
 drivers/usb/serial/ssu100.c                        |    2 -
 drivers/usb/serial/symbolserial.c                  |    2 -
 drivers/usb/serial/ti_usb_3410_5052.c              |    2 -
 drivers/usb/serial/usb-serial.c                    |    3 -
 drivers/usb/serial/usb_wwan.c                      |    1 -
 drivers/usb/serial/visor.c                         |    4 -
 drivers/usb/serial/whiteheat.c                     |    4 -
 drivers/usb/serial/wishbone-serial.c               |    1 -
 drivers/usb/serial/xr_serial.c                     |    1 +
 drivers/usb/serial/xsens_mt.c                      |    1 -
 drivers/usb/typec/anx7411.c                        |    4 +-
 drivers/usb/typec/mux/fsa4480.c                    |    2 +-
 drivers/usb/typec/mux/intel_pmc_mux.c              |   19 +-
 drivers/usb/typec/mux/it5205.c                     |    2 +-
 drivers/usb/typec/mux/nb7vpq904m.c                 |    2 +-
 drivers/usb/typec/mux/pi3usb30532.c                |    2 +-
 drivers/usb/typec/mux/ps883x.c                     |  350 ++--
 drivers/usb/typec/mux/ptn36502.c                   |    2 +-
 drivers/usb/typec/mux/wcd939x-usbss.c              |    2 +-
 drivers/usb/typec/tcpm/fusb302.c                   |    4 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c      |    5 -
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |   12 +-
 drivers/usb/typec/tcpm/tcpci.c                     |   13 +-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |    2 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             |    8 +-
 drivers/usb/typec/tipd/core.c                      |    2 +-
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |    6 +-
 drivers/usb/typec/ucsi/debugfs.c                   |   31 +
 drivers/usb/typec/ucsi/ucsi.c                      |   60 +-
 drivers/usb/typec/ucsi/ucsi.h                      |   21 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c                 |   22 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   10 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |   53 +-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c              |    4 +-
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            |    6 +-
 drivers/usb/usbip/Kconfig                          |    2 +-
 drivers/usb/usbip/vhci_sysfs.c                     |   52 +-
 include/linux/platform_data/pxa2xx_udc.h           |   15 -
 include/linux/platform_data/usb-xhci-prom21.h      |   22 +
 include/linux/thunderbolt.h                        |   59 +-
 194 files changed, 6991 insertions(+), 2114 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-thunderbolt_stream
 delete mode 100644 Documentation/devicetree/bindings/usb/richtek,rt1711h.txt
 create mode 100644 Documentation/hwmon/prom21-xhci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst
 delete mode 100644 arch/arm/mach-pxa/udc.h
 create mode 100644 drivers/hwmon/prom21-xhci.c
 create mode 100644 drivers/thunderbolt/configfs.c
 delete mode 100644 drivers/thunderbolt/nhi_ops.c
 create mode 100644 drivers/thunderbolt/pci.c
 create mode 100644 drivers/thunderbolt/stream.c
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c
 create mode 100644 include/linux/platform_data/usb-xhci-prom21.h
