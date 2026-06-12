Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06939280D;
	Fri, 12 Jun 2026 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781279766; cv=none; b=k4Y8WXuVFKZ65IHW7Rxd2oW2VeRMDQOsQgeMSu7BfZhbZFcvq0pCbGKdxqLfQZ5XTBvxSPrAYZ8e2/rMZmhVem/eFMph0NMoRhXhPy2/rUTMHzfhUn4F2LIIhlyte+7q2ygIFQm4B05qlt+woTv1TbPw304xMyE4+pxrIpPPqvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781279766; c=relaxed/simple;
	bh=fXPKIIF75NmOnrsbD5ZTFBNgdEQCEywXcAhRhpR8o/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmPscNz8h0MDsCGmCd6F0H8vunCiPQyP8BbF1pmg1ZSweJOMSttKxbxUPzNEElcPenyrUupp76jDLpal6u6lrqq4vhIo5B01FmNAUjRX+6M0hXzwOu3DH9i08WjHebp+N2OrhIXiG9FYvMcvP+SKfoNR9GHfX6ycYBiOLRj4ZUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCvIwqlU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCvIwqlU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E73C1F000E9;
	Fri, 12 Jun 2026 15:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279765;
	bh=737FmR8Bbyz5cv65+gzdOBNN+rRhI+nOHtwD6AfN904=;
	h=Date:From:To:Cc:Subject;
	b=fCvIwqlUi5Buou/A2A+K+Wy/Z9v9aFwaMzrKUJiLhwXo/y38a6u5c/p/HMOoQQC16
	 Q+ag1Czy3U5xhf4QTVrAhJBdkUYNx+A81FHG1+e6/O2qzAYSAxiH/KRmpAtFb0yiOu
	 HJGwRhtYq1PlCjGsAfQ6ha0SmPc9A/38+7qYufnlWQByE2ZE8Ew37YQ48yAF/aIZBn
	 s1hHa2g/L26ElmS/aeJCtsa0w9nM/XEOpQJkjQC0LT82gnchXr9yoXFELA5YNYoUug
	 86zWLwSP4CX1AouL6uoncctHnz/0BNklO+3yFeB2gcPvscHuz/OE4xxk97otF5LXa7
	 onMXBJRJfuckw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wY4El-00000002OSV-0iIf;
	Fri, 12 Jun 2026 17:56:03 +0200
Date: Fri, 12 Jun 2026 17:56:03 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 7.2-rc1
Message-ID: <aiwsE2wLDgdC97xY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc1

for you to fetch changes up to e690592f98c81416c5be5ce65828aa4665abc302:

  USB: serial: whiteheat: drop termbits include (2026-05-11 09:34:25 +0200)

----------------------------------------------------------------
USB serial updates for 7.2-rc1

Here are the USB serial updates for 7.2-rc1, including:

 - an updated mxuport number-of-ports encoding, and
 - include directive cleanups

Everything has been in linux-next with no reported issues.

----------------------------------------------------------------
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

 drivers/usb/serial/ark3116.c          |  1 -
 drivers/usb/serial/belkin_sa.c        |  2 --
 drivers/usb/serial/cyberjack.c        |  2 --
 drivers/usb/serial/cypress_m8.c       |  2 --
 drivers/usb/serial/digi_acceleport.c  |  2 --
 drivers/usb/serial/empeg.c            |  3 ---
 drivers/usb/serial/f81232.c           |  3 ---
 drivers/usb/serial/f81534.c           |  1 -
 drivers/usb/serial/ftdi_sio.c         |  1 -
 drivers/usb/serial/garmin_gps.c       |  3 ---
 drivers/usb/serial/generic.c          |  1 -
 drivers/usb/serial/io_edgeport.c      |  2 +-
 drivers/usb/serial/io_ti.c            |  2 --
 drivers/usb/serial/ipaq.c             |  3 ---
 drivers/usb/serial/ipw.c              |  2 --
 drivers/usb/serial/ir-usb.c           |  2 --
 drivers/usb/serial/iuu_phoenix.c      |  2 --
 drivers/usb/serial/keyspan.c          |  2 --
 drivers/usb/serial/keyspan_pda.c      |  2 --
 drivers/usb/serial/kl5kusb105.c       |  2 --
 drivers/usb/serial/kobil_sct.c        |  2 --
 drivers/usb/serial/mct_u232.c         |  2 --
 drivers/usb/serial/metro-usb.c        |  3 ---
 drivers/usb/serial/mos7720.c          |  3 ++-
 drivers/usb/serial/mos7840.c          |  1 -
 drivers/usb/serial/mxuport.c          | 40 ++++++++++++++---------------------
 drivers/usb/serial/omninet.c          |  2 --
 drivers/usb/serial/opticon.c          |  2 --
 drivers/usb/serial/option.c           |  1 -
 drivers/usb/serial/oti6858.c          |  3 ---
 drivers/usb/serial/pl2303.c           |  3 ---
 drivers/usb/serial/qcserial.c         |  1 -
 drivers/usb/serial/quatech2.c         |  2 --
 drivers/usb/serial/safe_serial.c      |  2 --
 drivers/usb/serial/spcp8x5.c          |  2 --
 drivers/usb/serial/ssu100.c           |  2 --
 drivers/usb/serial/symbolserial.c     |  2 --
 drivers/usb/serial/ti_usb_3410_5052.c |  2 --
 drivers/usb/serial/usb-serial.c       |  3 ---
 drivers/usb/serial/usb_wwan.c         |  1 -
 drivers/usb/serial/visor.c            |  4 ----
 drivers/usb/serial/whiteheat.c        |  4 ----
 drivers/usb/serial/wishbone-serial.c  |  1 -
 drivers/usb/serial/xr_serial.c        |  1 +
 drivers/usb/serial/xsens_mt.c         |  1 -
 45 files changed, 20 insertions(+), 110 deletions(-)
