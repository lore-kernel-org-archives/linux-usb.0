Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D3320A37;
	Fri,  3 Jul 2026 08:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068697; cv=none; b=imrRdi+o26kWlSCed3Wpdh8v24fvi3Tk+xNH2oKdSxwpt1TRvVo8CUowv8s7XtiZCnRvjKX2asjKgZ5NBjaPLo2zcxnigvUz7MrU1EkbIWydO59DkLdxo5lzm5XGcRDoUlXK5EhMY/jUlSS6FEtZYpv8zfabumAK8HrOluAqn8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068697; c=relaxed/simple;
	bh=+kPkGRJTyRHSRsga3AJgW8qbNxbcX3V4vDfoEXuOduI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dh3pNz77+FIeQ6wZzqogKlbiORebsGEPYbuaZcK8i1GFgKqFJlsNNhQe2wg4zj+c2zwD6UiGq+0R1dRSD1cpMqyNKFhqzGMGgNb6Ekw9S5yKcUWvOB0zsBJ/V6lxJuO9KZHzYZfmDGaYw9DzIKLEzbW7XTYjfCsZAP+sZsnd7fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZIg7V5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZIg7V5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA371F000E9;
	Fri,  3 Jul 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783068696;
	bh=+4Xj5ScbfscfRMohc/Cvnm4y3yYOSCSOmYSBSnSss90=;
	h=Date:From:To:Cc:Subject;
	b=PZIg7V5DmgLzbc0LUUeyd9lH9NYI8AqEvAM5+fbiBnemcMZIqSiUTHjgXxAf326H6
	 aSnEjR/qalx6vAUB5G+46nvxniQiK+TJ4jYGOraCiY2JRTQbYcxKZDAxNmOS1JHlCs
	 l8VomAI/9RzafpOTevZ4JNePVtaWfujJ70jjWMCNtcJ32DpAU/lYCLK10pyoO9YsW6
	 Jj0uDNIY/URZzFMS9jUn01qrLmKQpbNzh9zJXDn8G7hqSC9ILU9B5Whvh+GLz2Gkun
	 n6CcCGp3jJkf0Ka3KNpggkQV5DaUA+LNEiNGLI3JJY5D8BZMaanuzn8P0CUsv7vq5X
	 9MIM0xLBKtvgQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wfZcT-00000000YUE-2ifM;
	Fri, 03 Jul 2026 10:51:33 +0200
Date: Fri, 3 Jul 2026 10:51:33 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial fixes for 7.2-rc2
Message-ID: <akd4FQzHuMKG7qQ1@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ab9de95c9cf952332ab79453b4b5d1bfca8e514f:

  Merge tag 'rust-7.2-2' of git://git.kernel.org/pub/scm/linux/kernel/git/ojeda/linux (2026-06-24 15:11:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.2-rc2

for you to fetch changes up to 6bfc8d01ac4068eced509f8fc74d0cd205e4dcec:

  USB: serial: keyspan_pda: fix information leak (2026-06-30 10:36:06 +0200)

----------------------------------------------------------------
USB serial fixes for 7.2-rc2

Here is a fix for an information leak in the keyspan_pda driver and
three fixes for digi_acceleport addressing stuck rx if a port is closed
while throttled, a hard lockup on disconnect and write buffer
corruption.

Included are also some new modem device ids.

All have been in linux-next for a few days with no reported issues.

----------------------------------------------------------------
Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion FE990D50 compositions

Johan Hovold (4):
      USB: serial: digi_acceleport: fix write buffer corruption
      USB: serial: digi_acceleport: fix hard lockup on disconnect
      USB: serial: digi_acceleport: fix broken rx after throttle
      USB: serial: keyspan_pda: fix information leak

 drivers/usb/serial/digi_acceleport.c | 43 +++++++++++++++++++++++++++---------
 drivers/usb/serial/keyspan_pda.c     |  2 +-
 drivers/usb/serial/option.c          | 16 ++++++++++++++
 3 files changed, 50 insertions(+), 11 deletions(-)
