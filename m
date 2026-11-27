Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787479;
	b=BbHTfnCU282L5It+pDSOdFg15P8akZjleUTxgz6DGB0mkIrWbFCSW8tAM8GekVw4iHlL
	 meQMZMGD+cZmIXgKOPw6aZv1TOA0dZxdQgOjQ88IWs3mYW0M1paxRVcAm9ELCGsTPfx+L
	 pFtRzJNmffEQDheKSgWh2jSrIpMs8iN/E91LVBkQJ+snvt8+Tg9RuEJs0GV22EGbAoCcE
	 G7qX8vWAdDX+Ts5kOU0uY4xz+DBMYScsPzZWOoDDA/bqk+KBTOx7hQvzWpAz05bwXHqf4
	 bL1i1FNQYN72Ao31Y6ZIDrAdchW3l7xcEj+LQywZxqpNBIeAP42B88JrW4aAlVWtixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787479;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VDwA1UsFj19Xae6hRr5l4cQkvRFp47Spx0mMQsuDAzw=;
	b=TKLaFT9ZVKqq/2ZevztGu9w1b+ETq9BhhOo8uX+oktcrSwR4yRvykfKfpQurWuSX2GMG
	 7gbX6+S7gMGOE5OMKOfhN68JF7zimbv+WKIWmlA6cQzySdmGu+vDf5gBwktUXHKDDzB6W
	 zvAJ8GYfwDenBiwfWCCiJoGEKBYDDjK3H5ksfbOar9aF4gno4rjDzjkSOHvUJP8ZMEUrP
	 LrlITkGjOvz8H0q6a2K53WW6lR90iyN+At+x3jUGf3JEq7CyFpl0gfrm2HVAtJA+EaFcO
	 AKZj+yRhR9EBWfo+9TgI9ekgxGl/hriRSgCOaOJOinU6GiE1JrFtYN2IpsK47L8+DEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oKCJpPHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC78606A31E;
	Fri, 27 Nov 2026 13:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oKCJpPHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFEB1F00893;
	Fri, 27 Nov 2026 13:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795787478;
	bh=VDwA1UsFj19Xae6hRr5l4cQkvRFp47Spx0mMQsuDAzw=;
	h=Date:From:To:Cc:Subject;
	b=oKCJpPHi/rBasv+g7Vnq8eUo84b+NwSioKLIfqnVxAAArdmWP8pRLP88rZWV6aWP4
	 CqNNpuWEWj1Bo1E4Qf8hGYeQTEIeYkaMD/jLRBX/SQZIcv01+O2Rn89y/ecPz/6rIr
	 kYMtUilr2xiODSRIW0STZ2BqInoOFdRkv39y94qE=
Date: Fri, 27 Nov 2026 14:51:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver fixes for 7.4-rc5
Message-ID: <awmK6gaXd1EnO15l@kroah.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f11fe7603df07fbb9fa02b0d385c1696c87a6dab:

  Merge tag 'usb-7.3-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb (2026-11-16 07:55:02 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.4-rc5

for you to fetch changes up to 9aca49d33eb4191a95c57290360fe8732b639025:

  Merge tag 'usb-serial-7.4-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-11-27 12:08:38 +0100)

----------------------------------------------------------------
USB / Thunderbolt fixes for 7.4-rc5

Here are a bunch of small USB and Thunderbolt driver fixes for reported
issues.  Most of these are for gadget driver issues that people have
reported a while ago, it just took me a bit to catch up with the pending
patch submissions.  Fixes in here include:
  - small thunderbolt driver fixes for some minor issues
  - lots of small usb gadget fixes, from users having problems,
    syzbot-found issues, or llm-found problems, all with reproducers.
  - typec driver fixes
  - dwc3 driver fixes
  - dwc2 driver fixes
  - MAINTAINERS file update for the usbio driver
  - usbip driver fixes
  - usb storage fixes for broken devices
  - new usb quirk additions
  - other small USB driver fixes

All of these have been in linux-next for a week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aldo Ariel Panzardo (4):
      usb: gadget: f_printer: use the active RX list in soft reset
      usb: gadget: configfs: zero-terminate Unicode property data
      usb: gadget: ncm: validate the NDP chain before parsing
      usb: gadget: composite: pass the validated interface index

Alexander Bendezu (1):
      usb: gadget: f_phonet: don't call gether_get_ifname() on a non-u_ether netdev

Alexey Charkov (1):
      usb: gadget: udc: Clear a pending connection when starting the UDC

Anuj Bolewar (1):
      usb: gadget: uvc: fix use-after-free in uvcg_extension_drop

Boyan Liu (1):
      usb: gadget: f_ncm: Fix use-after-free in ncm_wrap_ntb()

Chaithanya Lagisetty (1):
      usb: gadget: f_loopback: fix descriptor leak on unbind

Cheng Yongkang (1):
      usbip: clear actual_length after a failed receive

Chengyu Liu (4):
      usb: musb: cancel the delayed works after quiescing the interrupt
      usb: musb: dsps: free the VBUS interrupt before the child teardown
      usb: gadget: r8a66597: free the IRQ before deleting the timer
      usb: phy: gpio-vbus: free the interrupt before cancelling the work

Daniele Palmas (1):
      USB: cdc-acm: add control line state quirk for Telit QCX216 modems

David Collin (2):
      usb: dwc3: host: fix dangling xhci pointer on init failure
      usb: dwc3: host: fix props[] overflow when all quirks are enabled

Fabrice Gasnier (3):
      usb: dwc2: fix fifo reinit in dwc2_hsotg_core_init_disconnected
      usb: dwc2: wa for isoc packet tx fifo flush at periodic frame boundary
      usb: misc: onboard-hub: add support for Microchip USB2422

Fang Xieyan (3):
      usb: gadget: f_printer: clamp GET_DEVICE_ID pnp_string to ep0 buffer
      usb: gadget: r8a66597: fix NULL dereference for unmapped endpoints
      usb: dwc2: gadget: fix off-by-one in ep_from_windex bounds check

Greg Kroah-Hartman (3):
      Revert "USB: cdc-acm: refuse writes after disconnect"
      Merge tag 'thunderbolt-for-v7.4-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-7.4-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Guangshuo Li (1):
      usb-storage: onetouch: Fix potential use-after-free on input failure

Haobo Cheng (1):
      usb: typec: mux: initialize orientation switch array

Haowen Bai (1):
      usb: pci-quirks: abort xHCI handoff if MMIO is inaccessible

Haowen Tu (1):
      USB: serial: f81232: drain work on failed open

Heikki Krogerus (1):
      usb: typec: ucsi: acpi: Add DMI quirk for Dell XPS platforms

Hongyu Xie (2):
      usb-storage: add usb_stor_bulk_transfer_buf_timeout()
      usb-storage: ene_ub6250: don't let the card-type probe hang forever

Ingo Rohloff (3):
      usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
      usb: gadget: f_fs: register cancellation handler only after request queueing
      usb: gadget: f_fs: simplify error handling using goto

JaeGwon Go (1):
      thunderbolt: Send header-only XDomain properties changed response

Jiale Yao (1):
      usb: cdns3: report endpoint reset timeout

Johan Hovold (1):
      USB: serial: mct_u232: fix NULL-deref on open() failure

Josef Bacik (12):
      usb: dwc2: wait for the TT clear in endpoint_disable
      usb: gadget: snps_udc_plat: lock out the interrupt
      usb: typec: anx7411: zero on-stack alt mode descriptors
      usb: typec: tcpm: don't wait for the VDM discovery work
      usb: host: ehci-orion: fix the probe without DT
      usb: isp1760: wait for the TT clear in endpoint_disable
      usb: host: oxu210hp-hcd: fix oxu_qh_alloc() deadlock
      usb: gadget: bdc: the resume callback is optional
      usbip: vudc: free the unlink item if the send fails
      usb: typec: mux: tusb1046: fix oops on accessory modes
      usb: gadget: f_fs: let the request keep its fence
      usb: renesas_usbhs: link URBs with interrupts disabled

Keisuke Tsukuda (1):
      usb: gadget: f_hid: keep GET_REPORT request across disable

Kuen-Han Tsai (2):
      usb: gadget: u_ether: Fix NULL pointer deref in debug logging
      usb: gadget: u_ether: Protect dev->gadget access with dev->lock

Kyle Farrell (2):
      usb: gadget: u_audio: don't exceed maxpacket when adding a residue frame
      usb: gadget: f_uac2: prevent invalid bInterval auto-selection

Liu Chao (1):
      usb: gadget: uvc: reject zero interval in uvc_v4l2_s_parm()

Marek Szyprowski (1):
      usb: dwc3: fix use of destroyed dwc->connect_mutex on gadget exit

Massimo Toscanelli (2):
      usb: gadget: f_ncm: do not notify from ncm_set_alt()
      usb: gadget: f_ecm: do not notify from ecm_set_alt()

Miao Li (1):
      usb: quirks: Add DELAY_INIT quirk for Kingston DataTraveler 3.0

Mika Westerberg (1):
      thunderbolt: Return -ETIMEDOUT if XDomain peer returns ERROR_NOT_READY

Myeonghun Pak (6):
      usb: gadget: pch_udc: Disable VBUS work before removing the gadget
      usb: mtu3: Prevent dr_work rearm during teardown
      usb: gadget: tegra-xudc: Unregister VBUS notifier
      usb: gadget: tegra-xudc: Disable reset delayed works
      usb: gadget: m66592-udc: Free the IRQ before unmapping registers
      usb: dwc3-am62: shut down refclk on remove

Neill Kapron (1):
      usb: gadget: f_fs: Fix -Wformat-truncation in proxy endpoint names

Nguyen Minh Tien (1):
      usb: musb: Disable the D+ pullup during system suspend

Priyanka Mani (1):
      usb: gadget: uvc: fix dwFrameInterval array leak on frame removal

Rafael Alejandro Diaz Cruz (1):
      USB: gadget: Fix UAF in gadgetfs_fill_super()

Ryan Brue (1):
      usb: mtu3: don't run gadget completion callbacks with interrupts disabled

Sakari Ailus (1):
      MAINTAINERS: Update usbio driver maintainers and reviewers

Shunbo Shi (3):
      usb: gadget: f_hid: fix report_list entries leak
      usb: gadget: f_hid: fix race between userspace report update and GET_REPORT response
      usb: gadget: f_hid: fix get_req leak when usb_gstrings_attach() fails

Suyuan Wang (1):
      thunderbolt: Keep the USB4 port when component_add() fails

Thomas Touhey (1):
      usb: storage: add quirks for CASIO calculators

Vasileios Almpanis (2):
      usb: gadget: f_uac1_legacy: fix double close of the ALSA devices
      usb: gadget: pch_udc: don't call pch_udc_remove() from the probe error path

William A. Kennington III (1):
      USB: cdc-acm: refuse writes after disconnect

Xinsheng Zhu (1):
      usb: gadget: f_ncm: prevent double-free of OS descriptor table

Xu Rao (1):
      usb: gadget: f_printer: Fix fsync waiting for active transfers

Xu Yang (1):
      usb: cdns3: imx: fix kernel panic on remove due to kfree of static platform_data

Yaohan Li (1):
      usb: gadget: u_audio: call period elapsed under the stream lock

Yehyeong Lee (2):
      usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
      usb: gadget: f_tcm: put the overlapped command's request back on ep_cmd

Yingjie Wang (1):
      usb: gadget: midi2: copy configfs strings for live functions

Yu Zhang (2):
      usb: gadget: f_hid: avoid copy_from_user() under get_report_spinlock
      usb: gadget: f_printer: fix pnp_string use-after-free on reconfigure

YuanZhe Liu (2):
      usb-storage: reject too small values in max_sectors_store()
      usb: storage: shuttle_usbat: set the ATA sector size at device init

 MAINTAINERS                                 |   4 +-
 drivers/thunderbolt/tb.h                    |   2 +
 drivers/thunderbolt/usb4_port.c             |  12 ++-
 drivers/thunderbolt/xdomain.c               |  12 +--
 drivers/usb/cdns3/cdns3-gadget.c            |   6 +-
 drivers/usb/cdns3/cdns3-imx.c               |   8 ++
 drivers/usb/class/cdc-acm.c                 |  12 +++
 drivers/usb/core/quirks.c                   |   3 +-
 drivers/usb/dwc2/core.h                     |   1 +
 drivers/usb/dwc2/gadget.c                   |  21 ++++-
 drivers/usb/dwc2/hcd.c                      |  15 +++
 drivers/usb/dwc3/core.c                     |   1 +
 drivers/usb/dwc3/dwc3-am62.c                |   4 +-
 drivers/usb/dwc3/gadget.c                   |   2 -
 drivers/usb/dwc3/host.c                     |   6 +-
 drivers/usb/gadget/composite.c              |   4 +-
 drivers/usb/gadget/configfs.c               |   3 +-
 drivers/usb/gadget/function/f_ecm.c         |   8 --
 drivers/usb/gadget/function/f_fs.c          | 138 ++++++++++++++++------------
 drivers/usb/gadget/function/f_hid.c         |  75 +++++++++++----
 drivers/usb/gadget/function/f_loopback.c    |   7 +-
 drivers/usb/gadget/function/f_midi2.c       |  57 +++++++++++-
 drivers/usb/gadget/function/f_ncm.c         |  38 ++++++--
 drivers/usb/gadget/function/f_phonet.c      |   5 +-
 drivers/usb/gadget/function/f_printer.c     |  14 ++-
 drivers/usb/gadget/function/f_tcm.c         |  13 ++-
 drivers/usb/gadget/function/f_uac1_legacy.c |   8 +-
 drivers/usb/gadget/function/f_uac2.c        |   6 +-
 drivers/usb/gadget/function/u_audio.c       |  17 +++-
 drivers/usb/gadget/function/u_ether.c       |  84 +++++++++--------
 drivers/usb/gadget/function/u_uac1_legacy.c |  17 +++-
 drivers/usb/gadget/function/uvc_configfs.c  |  19 +++-
 drivers/usb/gadget/function/uvc_v4l2.c      |   5 +
 drivers/usb/gadget/legacy/inode.c           |   1 +
 drivers/usb/gadget/udc/bdc/bdc_udc.c        |   3 +-
 drivers/usb/gadget/udc/core.c               |  10 +-
 drivers/usb/gadget/udc/m66592-udc.c         |  10 +-
 drivers/usb/gadget/udc/pch_udc.c            |  34 ++++---
 drivers/usb/gadget/udc/r8a66597-udc.c       |  20 ++++
 drivers/usb/gadget/udc/r8a66597-udc.h       |   1 +
 drivers/usb/gadget/udc/snps_udc_plat.c      |   8 +-
 drivers/usb/gadget/udc/tegra-xudc.c         |   9 +-
 drivers/usb/host/ehci-orion.c               |   6 +-
 drivers/usb/host/oxu210hp-hcd.c             |  23 +++--
 drivers/usb/host/pci-quirks.c               |  22 ++++-
 drivers/usb/isp1760/isp1760-hcd.c           |  11 +++
 drivers/usb/misc/onboard_usb_dev.c          |   1 +
 drivers/usb/misc/onboard_usb_dev.h          |   1 +
 drivers/usb/mtu3/mtu3_core.c                |   5 +-
 drivers/usb/mtu3/mtu3_dr.c                  |   2 +-
 drivers/usb/musb/musb_core.c                |  31 +++++--
 drivers/usb/musb/musb_dsps.c                |  11 +++
 drivers/usb/phy/phy-gpio-vbus-usb.c         |   8 ++
 drivers/usb/renesas_usbhs/mod_host.c        |   7 ++
 drivers/usb/serial/f81232.c                 |   3 +
 drivers/usb/serial/mct_u232.c               |   2 +-
 drivers/usb/storage/ene_ub6250.c            | 110 ++++++++++++++--------
 drivers/usb/storage/onetouch.c              |   8 +-
 drivers/usb/storage/scsiglue.c              |   4 +
 drivers/usb/storage/shuttle_usbat.c         |   4 +-
 drivers/usb/storage/transport.c             |  31 +++++--
 drivers/usb/storage/transport.h             |   5 +
 drivers/usb/storage/unusual_devs.h          |  19 ++++
 drivers/usb/storage/unusual_ene_ub6250.h    |   2 +-
 drivers/usb/typec/anx7411.c                 |   2 +-
 drivers/usb/typec/class.c                   |   2 +-
 drivers/usb/typec/mux.c                     |   2 +-
 drivers/usb/typec/mux/tusb1046.c            |  14 ++-
 drivers/usb/typec/tcpm/tcpm.c               |  14 ++-
 drivers/usb/typec/ucsi/ucsi_acpi.c          |  41 +++++++++
 drivers/usb/usbip/vhci_rx.c                 |   1 +
 drivers/usb/usbip/vudc_tx.c                 |   2 +-
 72 files changed, 817 insertions(+), 300 deletions(-)
