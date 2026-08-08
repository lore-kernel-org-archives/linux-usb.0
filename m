Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8944D78F29;
	Sat,  8 Aug 2026 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786203166; cv=none; b=cuXbb2jUj5OGIqXHaFX+Yj5+8SBw2EqoIfaNkrHJfPbKD63SgY0+UDtetkV4JfixxLqUBm+zK8B+2gmEINy/vbhPHs9Np0BH/yYlA2oNs7c+Iv9RoPxG2zCglxj5qM6F3ZHNvrGRMe5RSymNflGyu9ySwDY1T071lsyYTqAb57I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786203166; c=relaxed/simple;
	bh=SaxCoN3fSdT5L50t380F+EaPg48JgE5B04/UXqVXwXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GZVJkKHkXmLHsD/bNufpbS6KQbdBGLkwdrbYERqBwulH3tRmJPMFwisZXTH6WhyNwbbtAs73qETQojoY4nz5otWAm8oaNf9E7jMk4Wc0eeFdzYeloqPkEmJ0IxDvObGoTowd7GsZqyblLrLouRGXXevF5xnYGCZmT8P2xB3Co6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dW4s2xlk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dW4s2xlk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC0381F000E9;
	Sat,  8 Aug 2026 15:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786203165;
	bh=R1D8Spox+OHXjw9ztBtSushFOM37vuH6nZ2IpesB9kU=;
	h=Date:From:To:Cc:Subject;
	b=dW4s2xlkEWdNAHh83ssoxjFj95iNPT2owlVvebniuBhEuqu7lCs43CamhDpcNAKFl
	 K1lQTlmtCL7ac6opkko11BdUT3Mw2/XAxwkNKDsaJEWNWfx/w0CZVVXDkwLUNBQmK8
	 2nY/rfVr6qP7+Hc9LxJ7nceG0QctKMhOdjupVG4Y=
Date: Sat, 8 Aug 2026 17:32:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.2-rc7
Message-ID: <andMCv-BUhm2QhAf@kroah.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.2-rc7

for you to fetch changes up to 3d26cd1f3ff25cebd10d4b0e8188cf40dade28e9:

  usb: xhci: use BIT_ULL for CRCR bits to fix incorrect 64bit mask (2026-08-04 10:54:57 +0200)

----------------------------------------------------------------
USB / Thunderbolt fixes for 7.2-rc7

Here are some small USB and Thunderbolt driver fixes for 7.2-rc7 that
resolve some reported issues.  Included in here are:
  - new quirk for some broken USB devices
  - thunderbolt device fixes for reported issues
  - usb gadget driver fix
  - usb atm driver fix
  - xhci driver fixes.
  - other minor USB driver fixes

All of these have been in linux-next this week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Aleksandr Nogikh (1):
      usb: atm: cxacru: properly kill rcv_urb on error in cxacru_cm()

Bryam Vargas (1):
      thunderbolt: Bound the DROM dual link port number before indexing sw->ports

Greg Kroah-Hartman (1):
      Merge tag 'thunderbolt-for-v7.2-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

Ishaan Dandekar (1):
      usb: quirks: Add ShanWan gamepad to quirk list

Jiangshan Yi (1):
      usb: misc: usbio: check ibuf_len against rxbuf_len in bulk msg

Lachlan Hodges (1):
      usb: xhci: use BIT_ULL for CRCR bits to fix incorrect 64bit mask

Mika Westerberg (1):
      thunderbolt: Initialize ->domain_released completion before it is being used

Nikhil Solanke (2):
      usb: core: Add quirk for 255-bytes initial config read
      usb: hub: Split announce_device() to log device identity before enumeration

Pawel Laszczak (1):
      usb: cdnsp: fix incorrect endian conversions for APB timeout register

Sonali Pradhan (1):
      usb: gadget: f_ncm: Use unsigned int for ndp_index

Xu Rao (3):
      thunderbolt: stream: Unmap buffers with mapped size
      thunderbolt: Fix bandwidth group reservation indexing
      thunderbolt: icm: Preserve USB4 proxy data-valid bit

 Documentation/admin-guide/kernel-parameters.txt |  5 ++++
 drivers/thunderbolt/eeprom.c                    |  9 ++++++-
 drivers/thunderbolt/icm.c                       |  2 +-
 drivers/thunderbolt/nhi.c                       |  4 ++--
 drivers/thunderbolt/stream.c                    |  2 +-
 drivers/thunderbolt/tb.c                        |  2 +-
 drivers/usb/atm/cxacru.c                        |  2 ++
 drivers/usb/cdns3/cdnsp-gadget.c                |  4 ++--
 drivers/usb/core/config.c                       | 32 ++++++++++++++++++-------
 drivers/usb/core/hub.c                          | 16 +++++++++----
 drivers/usb/core/quirks.c                       |  7 ++++++
 drivers/usb/gadget/function/f_ncm.c             |  2 +-
 drivers/usb/host/xhci.h                         | 12 +++++-----
 drivers/usb/misc/usbio.c                        |  2 +-
 include/linux/usb/quirks.h                      |  3 +++
 15 files changed, 76 insertions(+), 28 deletions(-)
