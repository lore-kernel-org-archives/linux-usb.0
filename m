Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666BE175A77;
	Sun, 26 Jul 2026 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785070881; cv=none; b=qcWWt3vX5c/CdsJ8xWgzgfD9ev1ACoExx2is23m446xjI6NNcaOkogWMt6EcAoka71mzk4FZ8/xGcVwFkIBLDTj3WZLkl7d7T04JryQD6N10XtBsJbV7KByagy8A3NaymXqyMKD6tTPdClYYocLP1rYVTkOuzKQaQeRt0wT57/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785070881; c=relaxed/simple;
	bh=Ru0UFjykOln5ewh6FO8HL2m8RToudCoOwLTxBtSKzoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgxWcv9k7rYJn2vG6Fzsv4kv7IlTtXmCbQd6opDHfx151sCuGc36UhEH51uayt9a5dkNkEx4ilj3aPafFxSg23x+ikBZiRHFB4pn6Nb/F346MJAyonBWw1mSwW6ji1Ye6cCmIkSIbCyz8idSJEZWgsFLtmBFMlTHoACYqtv05g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z1sjt/rE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z1sjt/rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BE81F000E9;
	Sun, 26 Jul 2026 13:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785070879;
	bh=g3nwtjtoOq0YSP3PSE5SAya12CJvpOWINtZYWxcePd8=;
	h=Date:From:To:Cc:Subject;
	b=z1sjt/rEUw68o/Git7mSo1FvJKlw+a+k5NInnxvlzL1HxXrgASRvEcj/m6dCYlm/M
	 vqHEm6hsj5pHaEa+UqeD0Cpz89U3iZjgbEGkm/K9xO6yPBBIbI0nkBlc5bCadqPLbv
	 MormdzqCSvDXD5VB4KDelgEf0FCHNyIXoTbtLnNU=
Date: Sun, 26 Jul 2026 15:01:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.2-rc5
Message-ID: <amYFFFruzS4L7mQH@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc5

for you to fetch changes up to b6061b6cca72d6a20f5eccd72b8da78c2e460861:

  Merge tag 'usb-serial-7.2-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-07-24 15:36:52 +0200)

----------------------------------------------------------------
USB fixes for 7.2-rc5

Here are some small USB fixes and new device quirks and ids for 7.2-rc5.
Included in here are:
  - usb storage quirk added
  - new usb serial device ids added
  - usb-serial device name leak and other bug fixes
  - small xhci driver fixes
  - normal batch of typec driver fixes for reported issues
  - usb-atm much-reported-by-syzbot fix for firmware download races
  - sysfs BOS device removal race fix
  - lots of usb gadget driver fixes for reported issues
  - other small USB driver fixes for other reported problems.

All of these have been in linux-next this past week, many of them much
longer.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Andrei Kuchynski (2):
      usb: typec: ucsi: Fix race condition and ordering in port unregistration
      usb: typec: ucsi: Correct teardown ordering in ucsi_init() error path

Arnd Bergmann (1):
      usb: udc: pxa: fix error handling

Cen Zhang (1):
      usb: gadget: f_tcm: synchronize delayed set_alt with teardown

Chia-Lin Kao (AceLan) (4):
      usb: core: port: Deattach Type-C connector on component unbind
      usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware
      usb: typec: ucsi: Add duplicate detection to nvidia registration path
      usb: typec: ucsi: yoga_c630: Remove redundant duplicate altmode handling

Chukun Pan (1):
      USB: serial: option: add TDTECH MT5710-CN

Diego Fernando Mancera Gomez (1):
      usb: atm: ueagle-atm: reject descriptors that confuse probe and disconnect

Fan Wu (2):
      usb: gadget: udc: bdc: free IRQ and drain func_wake_notify before teardown
      usb: gadget: f_midi: cancel pending IN work before freeing the midi object

Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-7.2-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Griffin Kroah-Hartman (1):
      usb: core: sysfs: add lock to bos_descriptors_read()

Guangshuo Li (1):
      usb: musb: omap2430: Do not put borrowed of_node in probe

Huang Wei (1):
      USB: storage: add NO_ATA_1X quirk for Longmai USB Key

Jinchao Wang (1):
      usb: gadget: dummy_hcd: prevent fifo_req reuse during giveback

Johan Hovold (5):
      USB: gadget: fsl-udc: fix device name leak on probe failure
      USB: gadget: snps-udc: fix device name leak on probe failure
      USB: gadget: fsl-udc: fix dev_printk() device
      USB: gadget: fsl-udc: drop misleading unbind sanity check
      USB: serial: keyspan_pda: fix data loss on receive throttling

Melbin K Mathew (1):
      usb: gadget: printer: fix infinite loop in printer_read()

Muhammad Bilal (1):
      usb: gadget: uvc: clamp SEND_RESPONSE length to the response buffer

Pengpeng Hou (2):
      USB: serial: mxuport: validate firmware header size
      USB: serial: io_ti: reject oversized boot-mode firmware

Sonali Pradhan (1):
      usb: gadget: f_ncm: validate datagram bounds in ncm_unwrap_ntb()

Sunho Park (1):
      USB: serial: io_edgeport: cap received transmit credits

Tim Pambor (1):
      USB: serial: ftdi_sio: add support for E+H FXA291

Xincheng Zhang (1):
      usb: xhci-pci: Limit VIA VL805 DMA addressing to 36 bits

Xu Yang (1):
      usb: chipidea: fix usage_count leak when autosuspend_delay is negative

 drivers/usb/atm/ueagle-atm.c            |  17 +++
 drivers/usb/chipidea/core.c             |   1 +
 drivers/usb/core/port.c                 |   2 +
 drivers/usb/core/sysfs.c                |   8 +-
 drivers/usb/gadget/function/f_midi.c    |   1 +
 drivers/usb/gadget/function/f_ncm.c     |  17 ++-
 drivers/usb/gadget/function/f_printer.c |  23 ++-
 drivers/usb/gadget/function/f_tcm.c     | 192 +++++++++++++++++++++----
 drivers/usb/gadget/function/tcm.h       |  13 ++
 drivers/usb/gadget/function/uvc_v4l2.c  |   2 +
 drivers/usb/gadget/udc/bdc/bdc_core.c   |  20 +++
 drivers/usb/gadget/udc/bdc/bdc_udc.c    |   7 +-
 drivers/usb/gadget/udc/dummy_hcd.c      |  40 ++++--
 drivers/usb/gadget/udc/fsl_udc_core.c   |  99 ++++++-------
 drivers/usb/gadget/udc/fsl_usb2_udc.h   |   1 +
 drivers/usb/gadget/udc/pxa27x_udc.c     |  10 +-
 drivers/usb/gadget/udc/snps_udc_core.c  |   1 -
 drivers/usb/host/xhci-pci.c             |   1 +
 drivers/usb/host/xhci.c                 |  15 +-
 drivers/usb/host/xhci.h                 |   1 +
 drivers/usb/musb/omap2430.c             |   2 -
 drivers/usb/serial/ftdi_sio.c           |   2 +
 drivers/usb/serial/ftdi_sio_ids.h       |   5 +
 drivers/usb/serial/io_edgeport.c        |   3 +-
 drivers/usb/serial/io_ti.c              |   6 +
 drivers/usb/serial/keyspan_pda.c        |  44 ++++--
 drivers/usb/serial/mxuport.c            |   7 +
 drivers/usb/serial/option.c             |   1 +
 drivers/usb/storage/unusual_devs.h      |   7 +
 drivers/usb/typec/ucsi/ucsi.c           | 240 +++++++++++++++++++++++++-------
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c |  23 ---
 31 files changed, 599 insertions(+), 212 deletions(-)
