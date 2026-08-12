Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BCE353A7C;
	Wed, 12 Aug 2026 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543377; cv=none; b=cXVmiKRHAyW4dWIk1UigFSYeOg9Luoc4KRaI3ydXOtxabxey9EuxnFMuEiUIsmP342VvFS90KH6Flf+0OW9XEL58o8y9YTKkxn2tUUZqK/LoOv2Oxt/IPtgg2pHuwAQZn+GbsjkVVFlVt7nYN1mHhaiJeCJigBb8p1v30Hu+mBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543377; c=relaxed/simple;
	bh=82gHQ/5Rq3CZLyTUAWRAhTsz+PCouU9ku6Gn0UhmzIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZjAbWeLZ2keo7gCiBwwaS6zjx41dw9T03PrtelHq00oNbG26xUq3xUK4vLlRQH6/JwdyyIk66aFJ+cDUyqms/JocuS/pm0ck5EYYbuKxW+j2et82QvmSDdkzbfMqHIlyezrvRLHW2vRnAFwX0sqXG5aEMfnrIdKi7LQm3AwyS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QH82+0MH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QH82+0MH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218671F000E9;
	Wed, 12 Aug 2026 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543376;
	bh=EiKxcccL1B8P/TqdVLQFZhQtYSbiWoSv/ctpadHa4Jw=;
	h=Date:From:To:Cc:Subject;
	b=QH82+0MHq2ML+uQfMOhME2ktz0n57/RPPLjtWIxUc2jx2cMeXBVwB9ZIaljo+Bvq/
	 F9uXBKmg9DYW7RBdvptN9ZFM6YS+X5vglOdx2iixZU4y1JSsd12/MpIf/uK508LpBX
	 Y14RuhQauN09aiivbDWYhpxfnruu77PmG+2StcBSVJEtzTzCjyX+SKKsNB/vTCqEfr
	 ddSvW9vHCqtJBfI/kb+XzYqLt+aKD5P03IQbywbu9p5R6aQH8flrX27bZSjjZDS7gQ
	 VTQStyzSqcy7mkuDvk50NnPVG4KL/Q+7qfhskAySopPdbWqrbv9DNWfFDdGa8iGg+e
	 Tf13fzP3mIznQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wu9Xh-00000000Dz0-3hyq;
	Wed, 12 Aug 2026 16:02:53 +0200
Date: Wed, 12 Aug 2026 16:02:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 7.3-rc1
Message-ID: <anx9DSOtHC_Eq7LB@hovoldconsulting.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc1

for you to fetch changes up to 15734de99517b0c81a1a5a3bccaff4593ef8d953:

  USB: serial: pl2303: add support for PL256X multi-port devices (2026-08-03 10:48:44 +0200)

----------------------------------------------------------------
USB serial updates for 7.3-rc1

Here are the USB serial updates for 7.3-rc1, including:

 - fix digi_acceleport port registration order
 - stop digi_acceleport I/O when ports are closed
 - fix digi_acceleport OOB port dev_printk()
 - fix metro-usb unthrottle race
 - fix option slab OOB read with malicious devices
 - add support for a new class of Prolific PL256X devices

Included are also various clean ups.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Charles Yeh (1):
      USB: serial: pl2303: add support for PL256X multi-port devices

Jiale Yao (1):
      USB: serial: option: fix slab OOB read in interrupt URB callback

Johan Hovold (17):
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

 drivers/usb/serial/digi_acceleport.c | 325 ++++++++++++++---------------------
 drivers/usb/serial/keyspan_pda.c     |   1 -
 drivers/usb/serial/metro-usb.c       |  31 ++--
 drivers/usb/serial/option.c          |  20 ++-
 drivers/usb/serial/pl2303.c          | 108 +++++++++++-
 drivers/usb/serial/pl2303.h          |   2 +-
 6 files changed, 269 insertions(+), 218 deletions(-)
