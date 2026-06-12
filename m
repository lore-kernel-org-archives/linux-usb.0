Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71143290C9;
	Fri, 12 Jun 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260382; cv=none; b=oEE1O8OkzGCDmr8/SPtMGmx8IPT80qMRGDYejgEj8oiMS6cEnBjh6moZBgPlt1d0SrjD/dqCCTi23eDEIfolBa1OV/LgMU8p5EfamBrdy7AHAXWEgedLngYu7QnaA4aB6L5fp4L4l4XaQcHTR8O18SONb2tIuxhawN5fQfktD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260382; c=relaxed/simple;
	bh=ogt57onDBFPJELa84Mv9jXk2Lxeyju6xOBWA3HyPfh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Frkvhn0T+2xp4YqhZ7a0NNDHRY4sQHBri4RWS7Qt9VTwWhzooKKPHNIQ6G/qS1DIvijJf6+4LzYaRpMuxFbqTDUEGZgzU+qdalBlNAk1MBWi/WUISKNndN48hoQgrou+mWCM2fHCZa5z7kujdx9USpXaQPNu5cKyxT0YlrIRRkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yzsJj5SC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yzsJj5SC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E5F1F000E9;
	Fri, 12 Jun 2026 10:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781260381;
	bh=nE36vUtPn2MVysiMnjFoeQX39qeJCN0BmzZW/9wH+Gs=;
	h=Date:From:To:Cc:Subject;
	b=yzsJj5SCaZeUoSJoY5+wYgC9j4peGEMApSkoItl7r4vBQCPJCpPzVhNZ39KpptxMy
	 rkMdRPk7sY+nUBBNipNT6GHTG+5zrZqH+V7P3tQoiq8v0cGmiHXI69jeKGTZsuxw3l
	 W50h4IfxHLzW0rpJaRpLV2E4JKxCUy9/j1THzbIs=
Date: Fri, 12 Jun 2026 12:32:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.1-final
Message-ID: <aivgIWiKBiru2YhO@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e43ffb69e0438cddd72aaa30898b4dc446f664f8:

  Linux 7.1-rc6 (2026-05-31 15:14:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-final

for you to fetch changes up to e47832c73b83ec21e67026726a1c8124697792af:

  Merge tag 'usb-serial-7.1-rc8' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-06-10 12:25:33 +0200)

----------------------------------------------------------------
USB/Thunderbolt fixes for 7.1-final

Here are some small bugfixes for USB serial and Thunderbolt drivers for
some reported and found issues.  Included in here are:
  - usb serial overflow bugs fixed
  - new usb serial device id
  - thunderbolt validation fixes for reported issues

All of these have been in linux-next this week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Adrian Korwel (2):
      USB: serial: io_ti: fix heap overflow in get_manuf_info()
      USB: serial: io_ti: fix heap overflow in build_i2c_fw_hdr()

Greg Kroah-Hartman (3):
      Merge tag 'thunderbolt-for-v7.1-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-7.1-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus
      Merge tag 'usb-serial-7.1-rc8' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

HyeongJun An (1):
      USB: serial: kl5kusb105: fix bulk-out buffer overflow

Jack Wu (1):
      USB: serial: option: add usb-id for Dell Wireless DW5826e-m

Michael Bommarito (5):
      thunderbolt: Reject zero-length property entries in validator
      thunderbolt: Bound root directory content to block size
      thunderbolt: Clamp XDomain response data copy to allocation size
      thunderbolt: Validate XDomain request packet size before type cast
      thunderbolt: Limit XDomain response copy to actual frame size

 drivers/thunderbolt/property.c  |  6 ++++++
 drivers/thunderbolt/xdomain.c   | 14 +++++++++++---
 drivers/usb/serial/io_ti.c      | 11 +++++++++++
 drivers/usb/serial/kl5kusb105.c |  4 ++--
 drivers/usb/serial/option.c     |  3 +++
 5 files changed, 33 insertions(+), 5 deletions(-)
