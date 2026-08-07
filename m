Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534B279DCC;
	Fri,  7 Aug 2026 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786114431; cv=none; b=XU9NBu7BplNet6rFMx9gpDRsuovKIo5g7b1qruu+Lhv1aaNXen4Ldr9btsgGqxs1x6WqQaIpYgmQezbtkUOKYqFaJYItzyKFfPhvG2zQrfUrf+onGms+MsVdXsDWewgb8E3dN+68FDj6QZznlEzXlJ7/jL4cjc2tpeThh3tPM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786114431; c=relaxed/simple;
	bh=4aAPdjvVPSpW446RrkcgARvJwZq2MwdmijmvyXvbX6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XsG66BOGM1f+u7OJkk0Eb0LLfCB7mvQjXQO5++A54/xIOtBt+IKHrwLoDLKe+ZHgZDVOsbY5DQGJJ8LFU36lyy82hutqItMeT5hA3jPusz8dGBB685UJMLNSxHyfwrO8bG+NAMXLzR2ZlGL/J+WBEzUBf5LGvF+psntAw6OSGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSJNmUQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSJNmUQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE1E1F000E9;
	Fri,  7 Aug 2026 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786114429;
	bh=YMIMQCrlDVRv05qEw2CaICktSoAkdeXgnKQg7D9xeIo=;
	h=Date:From:To:Cc:Subject;
	b=bSJNmUQfBcDtjroQCG0HMIetK67gyPnYcbnrTsBxDb7ZhwPC8Op4UQqothT6NOGdp
	 bW59IfG5qtfHldCIt9GSdcrmLnBMYgDXA7MLrWSkepSqkRUxC4NJFxuTMscIkLyJ7/
	 VPaKk8oyW/lD7Kq5mUVJd/wW7krZW107Gpa7UczTdVJKpOiutph9wp9o6fbNMQr319
	 TJzDofL61kgNlLTyqnetk/xZefyx1XUHwCotoGo9JMx8Cuu/cvh6oblTFCyJ8149wG
	 o1lPWvFQTI4PP4O5PaSwWzMyj+klBvx0X8/bexConRd7q80LG5Cxr5nJQRRN6yAYGr
	 /a1RXdTp3dPuQ==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wsLwt-00000000FEW-1OdU;
	Fri, 07 Aug 2026 16:53:27 +0200
Date: Fri, 7 Aug 2026 16:53:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.2-rc7
Message-ID: <anXxYgop3crgWa9F@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc7

for you to fetch changes up to d37186bd95a07e334447f47274a38a311dad2172:

  USB: serial: spcp8x5: drop broken carrier detect support (2026-08-07 16:41:58 +0200)

----------------------------------------------------------------
USB serial fixes for 7.2-rc7

Here is a fix for a long-standing issue in the spcp8x5 driver which
syzbot just started hitting and a change adding lockdep annotation to
digi_acceleport to suppress a false positive deadlock warning.

Note that only the digi_acceleport commit has been in linux-next (and
with no reported issues).

----------------------------------------------------------------
Johan Hovold (2):
      USB: serial: digi_acceleport: add port lock nesting annotation
      USB: serial: spcp8x5: drop broken carrier detect support

 drivers/usb/serial/digi_acceleport.c |  9 +++++++--
 drivers/usb/serial/spcp8x5.c         | 13 -------------
 2 files changed, 7 insertions(+), 15 deletions(-)
