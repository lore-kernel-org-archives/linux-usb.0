Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF49237106E;
	Fri, 24 Jul 2026 11:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893001; cv=none; b=mWNSP0p1KAGZSNo+0wxCyI68nf4JcQ8c5pJm2WYc+DK/BgUbaLU3j9/qbara5ADUMwXldNor6dHfXqvKquJm2qot9cTK4s1L9PI1lFvHfdMDrcKGBvpS+w4Kzh9368Fg1jKjJE907WYYMPjMWceIZEX5KXLKymsioyQryUKZK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893001; c=relaxed/simple;
	bh=HOD5jILvPpRk34VjM8QWomv7blZg90PVhiqHE7NGnck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3jyKOFKojXm+JymGl6T0+7EwanY+JzqRevS+XAhlxrqZN6Oi+AB2AMj587cr3DXHOie79wpO2EMI8w0XdSNfLyLgxY8GzI0+lpdCVdVW3admiz00nelOjMhMInP0RNStmqCEbQ4TM/lfBLtNTDAGl/B+9z+kK0jXeEOPmsSFII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NA5pM3W2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NA5pM3W2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74951F000E9;
	Fri, 24 Jul 2026 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784893000;
	bh=dP4rUnQzSps8TJ7+LGHdjHes34kiFhy0FS6IfYPtxPU=;
	h=Date:From:To:Cc:Subject;
	b=NA5pM3W281WCQBTixAUqXJ1b/T1Xy58IohTRGXk2UpVq2gTmmYwhB4d0RAS6MpyWj
	 TXcEUn3GUdWcAJ29wHWz+yHeyC18aPkNfstuteN8m7Fva3udeZoyaTsoSVPdu+V1cA
	 V+stxm8vNQkN5VzrUaW66V7UcXNuCO2jpaDNE/OxGn9Usu6LptV12PH+pfqj5yrl25
	 EB1PVlsJzd00yiGI3J++Evt36QNuZdPS9u+ORGr6nSSImsT2oQcj097d0dPPNFXDzn
	 GQlVLRasjIGVUnO1F3Hz6nvNus0T+TndqinI2iMfTcrM7vWhphEiFnCfSNT8HHw2uB
	 KWZ416EsYSbLw==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wnECk-00000009yko-0EvO;
	Fri, 24 Jul 2026 13:36:38 +0200
Date: Fri, 24 Jul 2026 13:36:38 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.2-rc4
Message-ID: <amNORpUte3CZ8LbQ@hovoldconsulting.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc4

for you to fetch changes up to faaddd811c5099f11a5f52e68a6b31a5898cda4f:

  USB: serial: io_edgeport: cap received transmit credits (2026-07-22 11:23:54 +0200)

----------------------------------------------------------------
USB serial fixes for 7.2-rc4

Here are some fixes for 7.2:

 - fix data loss on keyspan_pda throttle
 - fix memory corruption with malicious edgeport devices
 - fix memory corruption with corrupt io_ti firmware
 - fix OOB read with corrupt mxuport firmware

Included are also some new ftdi and modem device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Chukun Pan (1):
      USB: serial: option: add TDTECH MT5710-CN

Johan Hovold (1):
      USB: serial: keyspan_pda: fix data loss on receive throttling

Pengpeng Hou (2):
      USB: serial: mxuport: validate firmware header size
      USB: serial: io_ti: reject oversized boot-mode firmware

Sunho Park (1):
      USB: serial: io_edgeport: cap received transmit credits

Tim Pambor (1):
      USB: serial: ftdi_sio: add support for E+H FXA291

 drivers/usb/serial/ftdi_sio.c     |  2 ++
 drivers/usb/serial/ftdi_sio_ids.h |  5 +++++
 drivers/usb/serial/io_edgeport.c  |  3 ++-
 drivers/usb/serial/io_ti.c        |  6 ++++++
 drivers/usb/serial/keyspan_pda.c  | 44 +++++++++++++++++++++++++++++++--------
 drivers/usb/serial/mxuport.c      |  7 +++++++
 drivers/usb/serial/option.c       |  1 +
 7 files changed, 58 insertions(+), 10 deletions(-)
