Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463723FC41;
	Sat, 23 May 2026 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525309; cv=none; b=BAHqFlmtIhjmFUCqMxZfAjjxs9KszV5bhP6lgKhMRwid4Zd+PR0ThcVJ9f/r47DMzv4MKx56uF9ucwUNUQll3zMcgYDrsu/PbC5Te9IGS3aJcwl6DIbnIybklfPz3A+A40cM5/b8c9XSMdL4TZ0mYa2fOL3/0vTC4Ahz+Q3K0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525309; c=relaxed/simple;
	bh=VZmL4UpAzNuZvD9Q7drkb5i37CcPCBJdUMf7f+tvhrU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/P0W0laSAJk8Ur3CgiZSVr3CRmOaW+9LVqRKfnhcrTxjslcY6Im5Tbqs3uEvjwjOrDPINKGEyImdTKGPRINW2LtPfv8lqbBW3TDfKtGJdCvHwgdZrRw8J4oTV9uhGpMg+e9KDFOlozFzZuBNGfXvxadu/4jzeVPej7EdBGRX00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0dW7p45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0dW7p45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19321F000E9;
	Sat, 23 May 2026 08:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779525307;
	bh=j+krLquwL7mqJ1I7jEP1/X++eJehbYdoriFkzs2ttNA=;
	h=Date:From:To:Cc:Subject;
	b=V0dW7p45uPGbA/6SmZHH3peKWeopC5b4riFSdQ4p62BNN9Hx6wiXQaaT9y3aXnNWm
	 SP+dvl10tjMyQrHHarpdA3LUr64qRE094D4p7v6dcYRiYfiplw1gDKIia++yTvvR1R
	 6dnyakaG5dXRhbXuZxZBpvYwP33SebQYO5kprfQFVFife7YEPO0SaR0Nc0UhuaOfz5
	 1kaXtIGH1WgJrhT186t0jzFKSr7wSm5dz7g9WTp5ndyegYRuLOgIe6f+D/8mlVTG82
	 KK/W6Bka3/xghXEQUzzW4PE94jK7x3z5GWICUUZv0X6bIaSzPqGf/57Sw7ieBrsxl/
	 nuDFZvIJ781pA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wQhp3-000000049V9-1JcX;
	Sat, 23 May 2026 10:35:05 +0200
Date: Sat, 23 May 2026 10:35:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.1-rc5
Message-ID: <ahFmuYsT3E8GcG5h@hovoldconsulting.com>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.1-rc5

for you to fetch changes up to 9f9bfc80c67f35a275820da7e83a35dface08281:

  USB: serial: cypress_m8: validate interrupt packet headers (2026-05-23 09:35:26 +0200)

----------------------------------------------------------------
USB serial fixes for 7.1-rc5

Here are a number of fixes for memory corruption and information leaks
due to missing endpoint and transfer sanity checks dating back to
simpler times when we trusted our hardware.

Included are also a fix for a recently added modem device id entry and
some new modem devices ids.

All but the last five commits have been in linux-next and with no
reported issues.

----------------------------------------------------------------
Jan Volckaert (1):
      USB: serial: option: add MeiG SRM813Q

Johan Hovold (8):
      USB: serial: digi_acceleport: fix memory corruption with small endpoints
      USB: serial: keyspan: fix missing indat transfer sanity check
      USB: serial: mct_u232: fix memory corruption with small endpoint
      USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
      USB: serial: cypress_m8: fix memory corruption with small endpoint
      USB: serial: mxuport: fix memory corruption with small endpoint
      USB: serial: omninet: fix memory corruption with small endpoint
      USB: serial: safe_serial: fix memory corruption with small endpoint

Wanquan Zhong (1):
      USB: serial: option: add missing RSVD(5) flag for Rolling RW135R-GL

Zhang Cen (2):
      USB: serial: belkin_sa: validate interrupt status length
      USB: serial: cypress_m8: validate interrupt packet headers

 drivers/usb/serial/belkin_sa.c       |  3 +++
 drivers/usb/serial/cypress_m8.c      | 20 +++++++++++++++++++-
 drivers/usb/serial/digi_acceleport.c | 23 +++++++++++++++++++++--
 drivers/usb/serial/keyspan.c         |  4 ++++
 drivers/usb/serial/mct_u232.c        | 26 ++++++++++++++++----------
 drivers/usb/serial/mxuport.c         |  8 ++++++++
 drivers/usb/serial/omninet.c         |  9 +++++----
 drivers/usb/serial/option.c          |  9 ++++++++-
 drivers/usb/serial/safe_serial.c     | 11 +++++++++++
 9 files changed, 95 insertions(+), 18 deletions(-)
