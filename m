Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6E386C25;
	Sun, 12 Jul 2026 08:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783845698; cv=none; b=R5q5DcHYKtddrYi+G0pvjzwasfjmxkC+VIVCQx1KdkN7ZFuw9z5iuiatNbXxVh56i9XYMb5hAHLe5g+ULo0oCfTuW4RJ55NgJc7AYyzWDX/Vcukahw7o8hAWxnkzAOIsmhAhxqruJzb3yvrvGUy1EWEceBEiDLaFB1Y7GzzSi0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783845698; c=relaxed/simple;
	bh=cYezDK0/emeq9G/07EriEiRdAEgwFa3K+tEQLw/a9d0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WVBFOn8xaDNTjzZUviKVq7dLffcs5/gMBP9fP6fhhzdMhXlD43wh4MPNgTip5ZL5gjyCpUNj3NcAszpHa11aRJIlK0+9fVAJ4aqqW5irPih5bb4rMUTAn/0Vx+WEj1e5iw8LUWtnl4n7zG7zopzZnMwdHJ5GYFWFGspXv3IsPBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qcINBsfd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qcINBsfd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316AC1F000E9;
	Sun, 12 Jul 2026 08:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783845694;
	bh=t7tK7LUzn1OuMcDrqpfBNKESUY/bNomvfHpgTkeC7FY=;
	h=Date:From:To:Cc:Subject;
	b=qcINBsfdMRt4jI6PE3l9K6tpPPRftwPHNk+ZApC/5PgpLKXkCnG+sOB7+NN6bIrpo
	 8x2grjdhoVyIMaRs6a4T5In626bn/T8aggzacpFkSuebRDyC/IdXod4FFIp+ENNbV3
	 YZT20jLqGXi9iGfIZ8Y04As7kK5trriKdgMIMkfk=
Date: Sun, 12 Jul 2026 10:41:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.2-3
Message-ID: <alNTORt0auSDpDlw@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit ab9de95c9cf952332ab79453b4b5d1bfca8e514f:

  Merge tag 'rust-7.2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2026-06-24 15:11:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc3

for you to fetch changes up to 6df47500b557e01737eef6f6b07b12f97a35d841:

  USB: core: ratelimit cabling message (2026-07-08 17:19:17 +0200)

----------------------------------------------------------------
USB fixes for 7.2-rc3

Here are a number of small USB driver fixes for many reported issues.
Included in here are:
  - usb serial driver corruption and use-after-free fixes
  - usb gadget rndis bugfixes for malicious/buggy host connections
  - typec driver fixes for a load of different tiny reported issues
  - typec mux driver revert for a broken patch in -rc1
  - usb gadget driver fixes for many different reported problems
  - new usb device quirks added
  - usbip tool fixes and some core usbip fixes as well
  - dwc3 driver fixes for minor issues
  - xhci driver fixes for reported problems
  - lots of other tiny usb driver fixes for many tiny issues

All of these have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Stern (1):
      USB: chaoskey: Fix slab-use-after-free in chaoskey_release()

Andrei Kuchynski (1):
      usb: typec: ucsi: Invert DisplayPort role assignment

Andy Yan (1):
      usb: typec: tcpm: Fix VDM type for Enter Mode commands

Arnd Bergmann (1):
      usb: ucsi: huawei_gaokun: move typec_altmode off stack

Badhri Jagan Sridharan (1):
      usb: typec: tcpm: Validate SVID index in svdm_consume_modes()

Ben Dooks (1):
      usb: dwc3: fix dwc3_readl() and dwc3_writel() calls in dwc3_ulpi_setup()

Cen Zhang (1):
      usb: misc: usbio: fix disconnect UAF in client teardown

Dawei Feng (1):
      usb: free iso schedules on failed submit

Erich E. Hoover (1):
      USB: quirks: add NO_LPM for the Samsung T5 EVO Portable SSD

Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion FE990D50 compositions

Fan Wu (1):
      usb: typec: ucsi: ccg: Fix use-after-free of ucsi on remove

Greg Kroah-Hartman (2):
      MAINTAINERS: USB: add usb.rs to USB subsystem file list
      Merge tag 'usb-serial-7.2-rc2' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Griffin Kroah-Hartman (2):
      usb: gadget: function: rndis: add length check to response query
      usb: gadget: function: rndis: add length check for header

HE WEI (ギカク) (1):
      usb: misc: usbio: bound bulk IN response length to the received transfer

Haoxiang Li (2):
      usb: cdnsp: fix stream context array leak in cdnsp_alloc_stream_info()
      usb: mtu3: unmap request DMA on queue failure

Jared Baldridge (1):
      usb: cdc_acm: Add quirk for Uniden BC125AT scanner

Jens Glathe (1):
      Revert "usb: typec: mux: avoid duplicated mux switches"

Jimmy Hu (1):
      usb: gadget: udc: Fix use-after-free in gadget_match_driver

Johan Hovold (10):
      USB: ulpi: fix memory leak on registration failure
      USB: iowarrior: fix use-after-free on disconnect
      USB: iowarrior: fix use-after-free on disconnect race
      USB: idmouse: fix use-after-free on disconnect race
      USB: ldusb: fix use-after-free on disconnect race
      USB: legousbtower: fix use-after-free on disconnect race
      USB: serial: digi_acceleport: fix write buffer corruption
      USB: serial: digi_acceleport: fix hard lockup on disconnect
      USB: serial: digi_acceleport: fix broken rx after throttle
      USB: serial: keyspan_pda: fix information leak

Madhu M (1):
      usb: typec: ucsi: Pass full DP config payload in SET_NEW_CAM for DP alt mode

Maoyi Xie (1):
      usb: gadget: composite: fix dead empty check in the USB_DT_OTG handler

Mathias Nyman (1):
      xhci: dbc: support runtime suspend while DbC is in enabled state

Mauricio Faria de Oliveira (1):
      usb: atm: ueagle-atm: wait for pre-firmware load in .disconnect()

Myeonghun Pak (4):
      USB: misc: uss720: unregister parport on probe failure
      usb: typec: anx7411: use devm_pm_runtime_enable()
      usb: sl811-hcd: disable controller wakeup on remove
      usb: typec: tcpci_rt1711h: unregister TCPCI port with devres

Neill Kapron (2):
      usb: gadget: f_fs: Initialize epfile->in early to fix endpoint direction checks
      usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile

Oliver Neukum (1):
      USB: core: ratelimit cabling message

Paul Cercueil (1):
      usb: gadget: f_fs: Fix DMA fence leak

Paul Menzel (1):
      usb: typec: ucsi: cancel pending work on system suspend

Rodrigo Lugathe da Conceição Alves (1):
      USB: core: add USB_QUIRK_NO_LPM for VIA Labs USB 2.0 hub

Runyu Xiao (1):
      usb: dwc3: run gadget disconnect from sleepable suspend context

Sam Day (1):
      usbip: vudc: fix NULL deref in vep_dequeue()

Shuangpeng Bai (1):
      usb: typec: class: drop PD lookup reference

Stephan Gerhold (1):
      usb: typec: ps883x: Fix DP+USB3 configuration

Tyler Baker (1):
      usb: gadget: f_fs: initialize reset_work at allocation time

WenTao Liang (1):
      usb: dwc3: meson-g12a: fix refcount leak in dwc3_meson_g12a_resume()

Xu Rao (4):
      USB: storage: include US_FL_NO_SAME in quirks mask
      usb: gadget: f_printer: take kref only for successful open
      USB: usb-storage: ene_ub6250: restore media-ready check
      xhci: sideband: fix ring sg table pages leak

Yichong Chen (1):
      usbip: tools: support SuperSpeedPlus devices

胡连勤 (1):
      usb: xhci: Fix sleep in atomic context in xhci_free_streams()

 .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |  2 +-
 MAINTAINERS                                        |  1 +
 drivers/usb/atm/ueagle-atm.c                       | 36 +++++++++++--
 drivers/usb/cdns3/cdnsp-mem.c                      |  2 +
 drivers/usb/class/cdc-acm.c                        |  3 ++
 drivers/usb/common/ulpi.c                          | 23 ++++----
 drivers/usb/core/hub.c                             |  2 +-
 drivers/usb/core/quirks.c                          |  6 +++
 drivers/usb/dwc3/core.c                            |  4 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 | 14 +++--
 drivers/usb/dwc3/gadget.c                          | 43 ++++++++++++---
 drivers/usb/fotg210/fotg210-hcd.c                  |  6 ++-
 drivers/usb/gadget/composite.c                     |  5 +-
 drivers/usb/gadget/function/f_fs.c                 |  9 ++--
 drivers/usb/gadget/function/f_printer.c            |  3 +-
 drivers/usb/gadget/function/rndis.c                | 20 +++++--
 drivers/usb/gadget/udc/core.c                      | 29 +++++++++-
 drivers/usb/host/ehci-sched.c                      | 11 +++-
 drivers/usb/host/sl811-hcd.c                       |  1 +
 drivers/usb/host/xhci-dbgcap.c                     | 60 ++++++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h                     |  3 ++
 drivers/usb/host/xhci-sideband.c                   |  2 +
 drivers/usb/host/xhci.c                            | 11 +++-
 drivers/usb/misc/chaoskey.c                        |  1 -
 drivers/usb/misc/idmouse.c                         | 45 ++++++++--------
 drivers/usb/misc/iowarrior.c                       | 61 ++++++++++------------
 drivers/usb/misc/ldusb.c                           | 38 +++++++-------
 drivers/usb/misc/legousbtower.c                    | 37 ++++++-------
 drivers/usb/misc/usbio.c                           |  8 ++-
 drivers/usb/misc/uss720.c                          |  5 +-
 drivers/usb/mtu3/mtu3_gadget.c                     |  1 +
 drivers/usb/serial/digi_acceleport.c               | 43 +++++++++++----
 drivers/usb/serial/keyspan_pda.c                   |  2 +-
 drivers/usb/serial/option.c                        | 16 ++++++
 drivers/usb/storage/ene_ub6250.c                   |  3 +-
 drivers/usb/storage/usb.c                          |  2 +-
 drivers/usb/typec/anx7411.c                        |  4 +-
 drivers/usb/typec/class.c                          |  1 +
 drivers/usb/typec/mux.c                            | 13 +----
 drivers/usb/typec/mux/ps883x.c                     |  6 +--
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             | 13 +++--
 drivers/usb/typec/tcpm/tcpm.c                      |  9 +++-
 drivers/usb/typec/ucsi/displayport.c               |  7 ++-
 drivers/usb/typec/ucsi/ucsi.c                      | 20 +++++++
 drivers/usb/typec/ucsi/ucsi.h                      |  1 +
 drivers/usb/typec/ucsi/ucsi_acpi.c                 | 10 +++-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |  2 +-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        | 12 ++---
 drivers/usb/usbip/vudc.h                           |  1 -
 drivers/usb/usbip/vudc_dev.c                       |  4 +-
 tools/usb/usbip/libsrc/usbip_common.c              |  2 +
 tools/usb/usbip/libsrc/usbip_device_driver.c       |  4 ++
 tools/usb/usbip/libsrc/vhci_driver.c               |  1 +
 53 files changed, 463 insertions(+), 205 deletions(-)
