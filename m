Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFE39061D;
	Tue, 25 Aug 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667796; cv=none; b=Nelsew5oDQ3Yvm7PFnPsJBY8+gVxW9MOvWsfWdC8byUH8NWr573dtcdHWb7XbdvOgnWGZy4wo/hNCO8C/mR2nNNr8PGThbu9m9IT+A0qmh6pPmS/dszWQnXleUKwhoHZc9E+WhHEhd3R778C7n0dlc0L7Vl/ReXfj/TgcfXMs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667796; c=relaxed/simple;
	bh=jAUOrEh99MNxNEn+6nMb3ZHO1ML7I62+f0z9iCcwHy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9e30ZytvZzaQstYpdVQQJR/OCpAg7G8nQorJB2pxG5jlB2n4VW5Q5W+pz62yqM3GEgVdRqxJ8IU1ouWZ+vR4wFmVZIghnfFdYE5rvoA4pyt0mFdbIWOS0TIADIOpuccXYwwuNf1TsQo3g8F7O3qGEVNbG/qx+OA9a8rsx+C8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G3Pa9vYb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G3Pa9vYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4296A1F000E9;
	Tue, 25 Aug 2026 14:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787667794;
	bh=QifaeodsyncoKWpIJLwiGdYQw2XXAHkjubJBcd+MG0s=;
	h=Date:From:To:Cc:Subject;
	b=G3Pa9vYbEqyODG8RxqX4BSngIbsJm0rZmyMhGFYVgmGQfxNefqDAxZgM64dqmt6wQ
	 sYhySSVCRJblkxJEgV57RdHlR0LIXgckfXUJ6+Y684vB3YRQxeXgTJHkTkre/trVco
	 eyWiPRKS0vTBG/mKm4AHt+3viIV0nWIuFDoF4ZxE=
Date: Tue, 25 Aug 2026 16:23:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver updates for 7.3-rc1
Message-ID: <ao2lTODMw1_aPWRP@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.3-rc1

for you to fetch changes up to e1e6e541c5c9cf548e9fdc35fc26808c82074440:

  Merge tag 'thunderbolt-for-v7.3-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next (2026-08-19 10:01:59 +0200)

----------------------------------------------------------------
USB / Thunderbolt changes for 7.3-rc1

Here is the big set of USB and Thunderbolt driver updates for 7.3-rc1.

Lots of driver work for new devices and systems, and many other minor
fixes and updates.  Included in here are:
  - Thunderbolt subsystem driver updates and additions
  - typec driver updates and additions
  - usb gadget fixes all over the place, seems like people are finally
    paying attention to these drivers for some reason
  - xhci driver updates and fixes based on lots of reports
  - usb-serial driver updates and additions
  - new device ids
  - other minor USB driver updates and fixes

All of these have been in linux-next for a while with no reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aleksandr Nogikh (1):
      usb: usbtest: disable dynamic ID support

Amit Sunil Dhamne (3):
      power: supply: Add helpers to get and put arrays of power supply handles
      usb: typec: tcpm: Add support for Battery Status response message
      usb: typec: tcpm: Add support for Battery Cap response message

Andrei Kuchynski (3):
      usb: typec: Add helper to check cable altmode support
      usb: typec: thunderbolt: Check cable altmode support
      usb: typec: displayport: Check cable altmode support

André Moreira (1):
      usb: core: devio: validate device and interface before buffer allocation

Badhri Jagan Sridharan (1):
      usb: typec: tcpm: Defensively bound altmode array accesses

Basavaraj Natikar (2):
      thunderbolt: Assert downstream port reset on shutdown
      thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers

Ben Dooks (2):
      usb: dwc3: qcom: make dwc3_qcom_glue_ops static
      usb: gadget: f_fs: fix __le16 of wMaxPacketSize

Biju Das (2):
      dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
      usb: renesas_usbhs: Fix power-off ordering on unbind

Bjorn Andersson (1):
      usb: typec: ucsi: unregister debugfs entries on teardown

Breno Leitao (1):
      usb: xhci: bail out of setup if the controller is inaccessible

Chaoyi Chen (1):
      usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for TYPEC_DP_ALTMODE

Charles Yeh (1):
      USB: serial: pl2303: add support for PL256X multi-port devices

Chunfeng Yun (2):
      dt-bindings: usb: mtu3: add support mt8196
      usb: mtu3: add support remote wakeup of mt8196

David Laight (1):
      usb_string_copy: Use kzalloc() to avoid leaking old data

Elson Serrao (1):
      usb: dwc3: avoid probe deferral when USB power supply is not available

Ethan Nelson-Moore (1):
      usb: gadget: nokia: correct CONFIG_USB_GADGET_DEBUG_FILES macro name in comment

Fabio Estevam (1):
      usb: gadget: f_mass_storage: Remove obsolete version log

Fan Wu (2):
      usb: typec: thunderbolt: Disable work before freeing tbt on remove
      usb: gadget: at91_udc: drain polled-VBUS timer/work before udc is freed

Fan Ye (2):
      thunderbolt: Use min() for the DMA path credit cap
      thunderbolt: Clamp DMA tunnel credits to what a hop register can hold

Fei Shao (2):
      usb: mtu3: allow system suspend during active gadget connection
      usb: mtu3: condition PHY wakeup for host mode and runtime suspend

Francesco Lavra (1):
      usb: dwc2: gadget: Exit partial power down state when changing USB pull-up

Frank Li (1):
      dt-bindings: usb: cdns3: allow iommus property

Gabriel Prostitis (2):
      USB: gadget: ffs: fix mm lifetime handling
      USB: gadget: inode: fix mm lifetime handling

Gary Guo (7):
      wifi: ath9k_htc: don't store usb_device_id
      usb: usbtmc: don't store usb_device_id
      usb: serial: spcp8x5: don't store usb_device_id
      media: as102: do not rely on id table address comparison
      net: usb: pegasus: don't rely on id table pointer arithmetic
      usb: xusbatm: don't rely on id table pointer arithmetic
      usb: fix UAF when probe runs concurrent to dyn ID removal

Greg Kroah-Hartman (6):
      Merge 7.2-rc3 into usb-next
      Merge 7.2-rc5 into usb-next
      Merge 7.2-rc7 into usb-next
      Merge tag 'usb-serial-7.2-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
      Merge tag 'usb-serial-7.3-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
      Merge tag 'thunderbolt-for-v7.3-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next

Griffin Kroah-Hartman (3):
      usb: core: Add lock to usb_wakeup_notification()
      usb: core: Strengthen error handling in hub_hub_status()
      usb: core: reformat error handling and messages

Haoxiang Li (1):
      usb: fsl_qe_udc: check qe_alloc_request() failure in ch9getstatus()

Hongyan Xu (1):
      usb: gadget: r8a66597: avoid double free of ep0_req in probe error path

Huang Wei (1):
      usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command completion

Ihor Matushchak (1):
      usb: cdns3: plat: fix a typo in cdns3_plat_probe()

Jakov Novak (1):
      usb: dwc3: fix kernel-doc string in struct dwc3_ep

Jeffin Philip (2):
      usb: gadget: uvc: Fix null pointer dereference in uvcg_video_init()
      usb: gadget: uvc: fix dangling pointers in uvc_function_bind() and uvc_function_unbind()

Jiale Yao (1):
      USB: serial: option: fix slab OOB read in interrupt URB callback

Johan Hovold (21):
      USB: gadget: fsl-udc: enable compile testing
      USB: serial: digi_acceleport: do not log stopping of urbs as errors
      USB: serial: digi_acceleport: fix port registration order
      USB: serial: digi_acceleport: drop unused wait queue
      USB: serial: digi_acceleport: always stop write urb on close
      USB: serial: digi_acceleport: add oob port helper
      USB: serial: digi_acceleport: clean up declarations and whitespace
      USB: serial: digi_acceleport: drop redundant driver data sanity checks
      USB: serial: digi_acceleport: stop OOB I/O when not in use
      USB: serial: digi_acceleport: drop unused in-buf define
      USB: serial: digi_acceleport: clean up xfer buf length expression
      USB: serial: digi_acceleport: clean up write completion
      USB: serial: digi_acceleport: clean up inb command submission
      USB: serial: digi_acceleport: fix oob port dev_printk()
      USB: serial: metro-usb: replace unnecessary atomic allocation
      USB: serial: metro-usb: fix unthrottle race
      USB: serial: metro-usb: drop redundant initialisations
      USB: serial: keyspan_pda: drop unused driver data usb-serial pointer
      USB: phy: fsl-usb: fix missing static keywords
      USB: serial: digi_acceleport: add port lock nesting annotation
      USB: serial: spcp8x5: drop broken carrier detect support

Joshua Crofts (1):
      usb: gadget: midi2: remove default configfs groups on teardown

Julian Braha (1):
      usb: musb: remove dead select of USB_MUSB_DUAL_ROLE

Kefan Bai (1):
      docs/zh_CN: usb: refine translated wording and formatting

Krishna Kurapati (2):
      dt-binding: qcom,snps-dwc3: Add Maili compatible to supported device list
      dt-bindings: usb: qcom,snps-dwc3: Add Shikra compatible

Krzysztof Kozlowski (2):
      dt-bindings: usb: generic-ehci: Document clock-names in top-level
      dt-bindings: usb: generic-ohci: Document clock-names in top-level

Lucas De Marchi (3):
      xhci: dbgtty: Fix unregister on tty_register_driver() failure
      xhci: dbgtty: Fix unregister on tty_alloc_driver() failure
      xhci: dbgtty: Drop extra call to idr_destroy()

Lucas Martins Alves (1):
      usb: musb: host: clear stale RX interrupt on three-strikes error

Madhu M (2):
      usb: typec: ucsi: Fix debugfs response truncation beyond 16 bytes
      usb: typec: displayport: Reject DP Alt Mode VDO with no pin assignment for its capability

Mahad Ibrahim (1):
      thunderbolt: debugfs: Replace get_zeroed_page() with kzalloc()

Manuel Ebner (3):
      ABI: sysfs-bus-usb: fix brace
      docs: admin-guide: thunderbolt: fix sentence structure
      docs: admin-guide: thunderbolt: Fix sentence structure

Maoyi Xie (1):
      usb: ljca: bound bank_num in ljca_enumerate_gpio()

Marco Crivellari (1):
      usb: typec: ucsi: Move long delayed work on system_dfl_long_wq

Mathias Nyman (6):
      xhci: fix frame id calculation and checks for isoc URBs
      xhci: Set frame ID field of isoc TRB when starting an isoch stream
      xhci: include all root port children in recovery prevention on link error
      xhci: prevent endpoint recovery after roothub disconnect
      xhci: avoid xHC endpoint changes after disconnect or link error.
      xhci: move dequeue to next valid td instead of past cancelled one

Michael Bommarito (1):
      usb: gadget: configfs: fix out-of-bounds read of qw_sign

Michail Tatas (1):
      USB: misc: uss720: Fix leak in get_1284_register

Michal Pecio (1):
      usb: xhci: Handle bogus TRB pointers in Missed Service Error events

Miguel Peñaranda (1):
      usb: usbfs: fix use-after-free of usb_device in usbdev_release()

Mika Westerberg (5):
      thunderbolt: stream: Restore consumer if copying from iter fails
      thunderbolt: stream: Fix possible short reads/writes
      thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well
      thunderbolt: Make interrupt optional for rings
      thunderbolt: stream: Add support for busy polling

Mike Rapoport (Microsoft) (2):
      usb: host: ohci-dbg: use kmalloc() for print buffer
      usb: core: devices: use kmalloc() to allocate dump buffer

Milo Chen (1):
      thunderbolt: xdomain: Notify peers after enumeration

Myeonghun Pak (1):
      usb: gadget: snps_udc_plat: clean up PHY on probe deferral

Neill Kapron (4):
      usb: gadget: f_fs: Add zero-length packet ioctl
      usb: gadget: f_fs: Introduce rw_proxy file descriptors
      usb: gadget: f_fs: Prevent deadlock during ep0 read loop
      usb: gadget: f_fs: Fix Use-After-Free in AIO error path

Nicolás Antinori (2):
      usb: rust: Use pin_init::zeroed for usb_device_id initialization
      usb: rust: mark Device and Interface methods as inline

Niklas Neronin (5):
      usb: xhci: standardize multi bit-field macros
      usb: xhci: use 64-bit Addressing Capability macro
      usb: xhci: remove redundant function wrapper
      usb: xhci: remove redundant 'xhci' pointer from endpoint struct
      usb: xhci: replace Unicode quotes with ASCII apostrophes

Nuno Sá (1):
      usb: gadget: f_fs: Fix fence cleanup in ffs_dmabuf_transfer() error paths

Oliver Neukum (1):
      usb: misc: cypress_cy7c63: check result of IO

Pan Chuang (1):
      thunderbolt: Remove redundant dev_err_probe()

Pei Xiao (1):
      usb: dwc3: gadget: Fix use-after-free in dwc3_gadget_free_endpoints due to race condition

Pengpeng Hou (3):
      usb: typec: mux: tusb1046: add missing MODULE_DEVICE_TABLE()
      usb: dwc3: am62: Propagate USB2 refclk enable failures
      usb: typec: ucsi: gaokun: unwind notifier on UCSI register failure

Qing Ming (1):
      usb: gadget: uac: validate rate list length before storing

RD Babiera (1):
      usb: typec: tcpm: implement retry mechanism for Discover Identity VDMs

Radhey Shyam Pandey (8):
      usb: dwc3: xilinx: fix missing space before closing comment delimiter
      usb: dwc3: xilinx: use reset_control_reset() in versal init
      usb: typec: tipd: add error message for vendor ID read failure
      usb: typec: tipd: demote missing IRQ message to debug
      usb: typec: tipd: name TPS_REG_POWER_STATUS field masks
      dt-bindings: usb: ti,tps6598x: add TPS66993 compatible
      usb: typec: tipd: add read_power_status callback to tipd_data
      usb: typec: tipd: add TPS66993 support

Rosen Penev (3):
      usb: fsl-mph-dr-of: add regulator support
      usb: gadget: pch_udc: remove excess kernel-doc member for registered
      usb: dwc2: add missing @remotewakeup kernel-doc parameter

Ruoyu Wang (1):
      usb: gadget: aspeed_udc: check endpoint DMA allocation

Ryan Chen (1):
      dt-bindings: usb: Add Aspeed AST2700 DWC3 controller

Sardaruddin Syed (1):
      Documentation: ABI: remove outdated USB power/level removal notice

Semih Baskan (1):
      usb: xhci: Handle USB3 port events when there is one roothub

Shuangpeng Bai (2):
      USB: c67x00: fix use-after-free in c67x00_add_iso_urb()
      usb: gadget: f_tcm: keep port count until LUN teardown completes

Sonali Pradhan (1):
      usb: gadget: u_audio: Fix use-after-free on sound card disconnect

Subasri S (1):
      usb: typec: ucsi: Use %pe to print error pointers

Uwe Kleine-König (The Capable Hub) (3):
      thunderbolt: Stop passing matched device ID to .probe()
      thunderbolt: Assert that a service driver has a probe callback
      thunderbolt: Drop comma after device id array terminator

Varadarajan Narayanan (1):
      dt-bindings: usb: qcom,snps-dwc3: Add ipq5210 to USB DWC3

Xu Rao (4):
      usb: typec: tcpm: fix EPR AVS APDO maximum voltage decoding
      usb: gadget: u_audio: clean up capture endpoint on feedback failure
      usb: core: config: fix SS companion log for interrupt endpoints
      usb: typec: hd3ss3220: fix VBUS regulator error message

Xu Yang (3):
      usb: chipidea: imx: fix missing ret assignment for dev_err_probe
      usb: gadget: f_uac1_legacy: remove broken string configfs attributes
      usb: typec: tcpci: pass correct rx_type to tcpm_pd_receive()

Yun Zhou (1):
      usb: gadget: f_tcm: fix deadlock in usbg_make_tpg()

 Documentation/ABI/obsolete/sysfs-bus-usb           |   2 +-
 .../ABI/testing/configfs-thunderbolt_stream        |  15 +
 .../ABI/testing/configfs-usb-gadget-uac1_legacy    |   3 -
 Documentation/ABI/testing/sysfs-bus-usb            |   2 +-
 Documentation/admin-guide/thunderbolt.rst          |   4 +-
 .../devicetree/bindings/usb/aspeed,dwc3.yaml       |  93 +++
 .../devicetree/bindings/usb/cdns,usb3.yaml         |   3 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |   7 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |   5 +
 .../devicetree/bindings/usb/mediatek,mtu3.yaml     |   6 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |   9 +
 .../devicetree/bindings/usb/renesas,usbhs.yaml     |   1 +
 .../devicetree/bindings/usb/ti,tps6598x.yaml       |   6 +-
 Documentation/translations/zh_CN/usb/CREDITS       | 147 +++--
 Documentation/translations/zh_CN/usb/acm.rst       |  62 +-
 .../translations/zh_CN/usb/authorization.rst       |  79 ++-
 Documentation/translations/zh_CN/usb/chipidea.rst  |  63 +-
 Documentation/translations/zh_CN/usb/dwc3.rst      |  37 +-
 Documentation/translations/zh_CN/usb/ehci.rst      | 249 ++++----
 Documentation/translations/zh_CN/usb/index.rst     |  18 +-
 Documentation/translations/zh_CN/usb/usbmon.rst    | 332 +++++------
 Documentation/usb/functionfs.rst                   |  80 +++
 Documentation/usb/gadget-testing.rst               |   3 -
 drivers/media/usb/as102/as102_usb_drv.c            |  75 +--
 drivers/net/thunderbolt/main.c                     |   4 +-
 drivers/net/usb/pegasus.c                          |  54 +-
 drivers/net/usb/pegasus.h                          |   3 -
 drivers/net/wireless/ath/ath9k/hif_usb.c           |  12 +-
 drivers/net/wireless/ath/ath9k/hif_usb.h           |   2 +-
 drivers/power/supply/power_supply_core.c           | 153 +++++
 drivers/target/target_core_fabric_configfs.c       |   8 +
 drivers/thunderbolt/debugfs.c                      |  28 +-
 drivers/thunderbolt/dma_test.c                     |   4 +-
 drivers/thunderbolt/domain.c                       |  30 +-
 drivers/thunderbolt/nhi.c                          |  55 +-
 drivers/thunderbolt/nhi.h                          |  21 +-
 drivers/thunderbolt/nhi_regs.h                     |   4 +
 drivers/thunderbolt/pci.c                          |  54 +-
 drivers/thunderbolt/stream.c                       | 268 +++++++--
 drivers/thunderbolt/switch.c                       |  11 +-
 drivers/thunderbolt/tb.c                           |  21 +
 drivers/thunderbolt/tb.h                           |   1 +
 drivers/thunderbolt/tunnel.c                       |  13 +-
 drivers/thunderbolt/xdomain.c                      |   4 +
 drivers/usb/atm/xusbatm.c                          |   6 +-
 drivers/usb/c67x00/c67x00-sched.c                  |   4 +-
 drivers/usb/cdns3/cdns3-plat.c                     |   4 +-
 drivers/usb/chipidea/ci_hdrc_imx.c                 |   2 +-
 drivers/usb/class/usbtmc.c                         |   2 -
 drivers/usb/core/config.c                          |   2 +-
 drivers/usb/core/devices.c                         |   7 +-
 drivers/usb/core/devio.c                           |  15 +-
 drivers/usb/core/driver.c                          |  12 +-
 drivers/usb/core/hub.c                             |  17 +-
 drivers/usb/dwc2/core_intr.c                       |   3 +-
 drivers/usb/dwc2/gadget.c                          |  11 +-
 drivers/usb/dwc3/core.c                            |  99 +++-
 drivers/usb/dwc3/core.h                            |   7 +-
 drivers/usb/dwc3/dwc3-am62.c                       |  13 +-
 drivers/usb/dwc3/dwc3-qcom.c                       |   2 +-
 drivers/usb/dwc3/dwc3-xilinx.c                     |  18 +-
 drivers/usb/dwc3/gadget.c                          |  16 +-
 drivers/usb/dwc3/host.c                            |   5 +-
 drivers/usb/gadget/configfs.c                      |   8 +-
 drivers/usb/gadget/function/f_fs.c                 | 163 +++++-
 drivers/usb/gadget/function/f_mass_storage.c       |   3 -
 drivers/usb/gadget/function/f_midi2.c              |   2 +
 drivers/usb/gadget/function/f_tcm.c                |  25 +-
 drivers/usb/gadget/function/f_uac1.c               |  13 +-
 drivers/usb/gadget/function/f_uac1_legacy.c        |  56 --
 drivers/usb/gadget/function/f_uac2.c               |  13 +-
 drivers/usb/gadget/function/f_uvc.c                |   7 +-
 drivers/usb/gadget/function/u_audio.c              |  36 +-
 drivers/usb/gadget/function/u_fs.h                 |   8 +-
 drivers/usb/gadget/function/u_uac1_legacy.h        |   3 -
 drivers/usb/gadget/function/uvc_video.c            |   2 +-
 drivers/usb/gadget/legacy/inode.c                  |  17 +-
 drivers/usb/gadget/legacy/nokia.c                  |   2 +-
 drivers/usb/gadget/udc/Kconfig                     |   2 +-
 drivers/usb/gadget/udc/aspeed_udc.c                |  50 +-
 drivers/usb/gadget/udc/at91_udc.c                  |  20 +-
 drivers/usb/gadget/udc/fsl_qe_udc.c                |   8 +-
 drivers/usb/gadget/udc/pch_udc.c                   |   1 -
 drivers/usb/gadget/udc/r8a66597-udc.c              |   1 -
 drivers/usb/gadget/udc/snps_udc_plat.c             |   5 +-
 drivers/usb/host/fsl-mph-dr-of.c                   |   7 +-
 drivers/usb/host/ohci-dbg.c                        |   9 +-
 drivers/usb/host/xhci-caps.h                       |  41 +-
 drivers/usb/host/xhci-dbgtty.c                     |  25 +-
 drivers/usb/host/xhci-debugfs.c                    |   3 +-
 drivers/usb/host/xhci-histb.c                      |   2 +-
 drivers/usb/host/xhci-hub.c                        |   6 +-
 drivers/usb/host/xhci-mem.c                        |   7 +-
 drivers/usb/host/xhci-mtk.c                        |   4 +-
 drivers/usb/host/xhci-pci.c                        |   4 +-
 drivers/usb/host/xhci-plat.c                       |   2 +-
 drivers/usb/host/xhci-ring.c                       | 496 ++++++++--------
 drivers/usb/host/xhci-tegra.c                      |   5 +-
 drivers/usb/host/xhci.c                            |  43 +-
 drivers/usb/host/xhci.h                            |  21 +-
 drivers/usb/misc/cypress_cy7c63.c                  |   8 +-
 drivers/usb/misc/usb-ljca.c                        |   3 +
 drivers/usb/misc/usbtest.c                         |   1 +
 drivers/usb/misc/uss720.c                          |   1 +
 drivers/usb/mtu3/mtu3_core.c                       |  11 +-
 drivers/usb/mtu3/mtu3_host.c                       |  26 +
 drivers/usb/mtu3/mtu3_plat.c                       |   3 +-
 drivers/usb/musb/Kconfig                           |   1 -
 drivers/usb/musb/musb_host.c                       |  14 +-
 drivers/usb/phy/phy-fsl-usb.c                      |  52 +-
 drivers/usb/phy/phy-fsl-usb.h                      |   6 +-
 drivers/usb/renesas_usbhs/common.c                 |   6 +-
 drivers/usb/serial/digi_acceleport.c               | 334 +++++------
 drivers/usb/serial/keyspan_pda.c                   |   1 -
 drivers/usb/serial/metro-usb.c                     |  31 +-
 drivers/usb/serial/option.c                        |  20 +-
 drivers/usb/serial/pl2303.c                        | 108 +++-
 drivers/usb/serial/pl2303.h                        |   2 +-
 drivers/usb/serial/spcp8x5.c                       |  19 +-
 drivers/usb/typec/altmodes/Kconfig                 |   1 +
 drivers/usb/typec/altmodes/displayport.c           |  18 +-
 drivers/usb/typec/altmodes/thunderbolt.c           |   6 +
 drivers/usb/typec/class.c                          |  71 +++
 drivers/usb/typec/hd3ss3220.c                      |   2 +-
 drivers/usb/typec/mux/tusb1046.c                   |   1 +
 drivers/usb/typec/tcpm/tcpci.c                     |  12 +-
 drivers/usb/typec/tcpm/tcpm.c                      | 636 ++++++++++++++++-----
 drivers/usb/typec/tipd/core.c                      |  85 ++-
 drivers/usb/typec/tipd/tps6598x.h                  |  10 +-
 drivers/usb/typec/ucsi/debugfs.c                   |   5 +-
 drivers/usb/typec/ucsi/ucsi.c                      |  21 +-
 drivers/usb/typec/ucsi/ucsi.h                      |   1 +
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |  15 +-
 include/linux/power_supply.h                       |  15 +
 include/linux/thunderbolt.h                        |  10 +-
 include/linux/usb.h                                |   3 +-
 include/linux/usb/pd.h                             |  53 +-
 include/linux/usb/tcpci.h                          |   1 +
 include/linux/usb/typec.h                          |   1 +
 include/target/target_core_fabric.h                |   2 +
 include/uapi/linux/usb/functionfs.h                |  24 +
 rust/kernel/usb.rs                                 |  35 +-
 142 files changed, 3311 insertions(+), 1780 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/aspeed,dwc3.yaml
