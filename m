Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD33264D2;
	Mon, 11 May 2026 07:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778483745; cv=none; b=mY1nT34H5KzRyubWFuJAYf3l46mKOVfvBkozhi3Gw7/CtfcPFvlymi29YjkZhMdU/SNheXxO1/9vpDZb9wdZCq67ni6d6u1oPffD62lcf5kA9wXU1Eow3AdCPcpKW7HVUzduR7hJmQQEAP74zZgqhRIFAEynCR/jM7rmMsnTsx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778483745; c=relaxed/simple;
	bh=x1eGd8gTIL3ah6ESZpV6zHU39jcTRsNQMXW0jO02Fag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N2RzSZGGJ7e/m6MXb2GsSxStUvVdZimDsIgaAjjl8fyX+rmBGNvD4YqzHiDpy9e5xySajI90WtV/QqUYCreDTaz1o6+50YIorg88F70roEPT88VfDQn0Eedyckw7WDLWcDgSyyeX1lRn1B1QhLXIahVkW1nGie6AzwagFDeAUyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDbaJ9rM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDbaJ9rM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA9AC2BCF6;
	Mon, 11 May 2026 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483745;
	bh=x1eGd8gTIL3ah6ESZpV6zHU39jcTRsNQMXW0jO02Fag=;
	h=From:To:Cc:Subject:Date:From;
	b=PDbaJ9rMTRQE3/4Vqdxv5QW1Eoly8NYDx/RGKuLAAmmiO9yvOELuuJRiuHOwq2dK/
	 EaQ6NCmP6IVGhDClxeLGSF0XIZGNf0eAAE49gHeoKlkx93drUYH29y9XRpvc3PeRyF
	 NsRpR4xSXP9/+RvX2lVg+vyoWvoZBbmXsERnkhLclNVuONZ+lhcfCxxGj35L0HA6pl
	 7cKA9pyGYHtIq/3THPVVj9jP4TzOuWx/5f0YqihqifZP/dbohV4wIZ9dwIAgJtn55w
	 kU6twzcJHmo42fEDrpYWPjAC3yjUlKBra/r9QSeKSjkTRi0ygIcVCBubLXXetaezG3
	 TBMTq4opleGrQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wMKre-00000002ZCJ-2hcv;
	Mon, 11 May 2026 09:15:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] USB: serial: clean up include directives
Date: Mon, 11 May 2026 09:14:40 +0200
Message-ID: <20260511071448.611875-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include directives tend to be copied from existing drivers when new
drivers are written. Clean up the driver include directives to avoid
having to point out unnecessary includes when reviewing new drivers.

Johan


Johan Hovold (8):
  USB: serial: drop unused tty_driver includes
  USB: serial: drop unused tty_flip includes
  USB: serial: xr: add missing uaccess include
  USB: serial: drop unused uaccess includes
  USB: serial: drop unused moduleparam includes
  USB: serial: garmin_gps: drop unused atomic include
  USB: serial: add missing atomic includes
  USB: serial: whiteheat: drop termbits include

 drivers/usb/serial/ark3116.c          | 1 -
 drivers/usb/serial/belkin_sa.c        | 2 --
 drivers/usb/serial/cyberjack.c        | 2 --
 drivers/usb/serial/cypress_m8.c       | 2 --
 drivers/usb/serial/digi_acceleport.c  | 2 --
 drivers/usb/serial/empeg.c            | 3 ---
 drivers/usb/serial/f81232.c           | 3 ---
 drivers/usb/serial/f81534.c           | 1 -
 drivers/usb/serial/ftdi_sio.c         | 1 -
 drivers/usb/serial/garmin_gps.c       | 3 ---
 drivers/usb/serial/generic.c          | 1 -
 drivers/usb/serial/io_edgeport.c      | 2 +-
 drivers/usb/serial/io_ti.c            | 2 --
 drivers/usb/serial/ipaq.c             | 3 ---
 drivers/usb/serial/ipw.c              | 2 --
 drivers/usb/serial/ir-usb.c           | 2 --
 drivers/usb/serial/iuu_phoenix.c      | 2 --
 drivers/usb/serial/keyspan.c          | 2 --
 drivers/usb/serial/keyspan_pda.c      | 2 --
 drivers/usb/serial/kl5kusb105.c       | 2 --
 drivers/usb/serial/kobil_sct.c        | 2 --
 drivers/usb/serial/mct_u232.c         | 2 --
 drivers/usb/serial/metro-usb.c        | 3 ---
 drivers/usb/serial/mos7720.c          | 3 ++-
 drivers/usb/serial/mos7840.c          | 1 -
 drivers/usb/serial/mxuport.c          | 2 --
 drivers/usb/serial/omninet.c          | 2 --
 drivers/usb/serial/opticon.c          | 2 --
 drivers/usb/serial/option.c           | 1 -
 drivers/usb/serial/oti6858.c          | 3 ---
 drivers/usb/serial/pl2303.c           | 3 ---
 drivers/usb/serial/qcserial.c         | 1 -
 drivers/usb/serial/quatech2.c         | 2 --
 drivers/usb/serial/safe_serial.c      | 2 --
 drivers/usb/serial/spcp8x5.c          | 2 --
 drivers/usb/serial/ssu100.c           | 2 --
 drivers/usb/serial/symbolserial.c     | 2 --
 drivers/usb/serial/ti_usb_3410_5052.c | 2 --
 drivers/usb/serial/usb-serial.c       | 3 ---
 drivers/usb/serial/usb_wwan.c         | 1 -
 drivers/usb/serial/visor.c            | 4 ----
 drivers/usb/serial/whiteheat.c        | 4 ----
 drivers/usb/serial/wishbone-serial.c  | 1 -
 drivers/usb/serial/xr_serial.c        | 1 +
 drivers/usb/serial/xsens_mt.c         | 1 -
 45 files changed, 4 insertions(+), 88 deletions(-)

-- 
2.53.0

