Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7340F74F
	for <linux-usb@vger.kernel.org>; Thu, 13 Aug 2026 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611953; cv=none; b=tfpyMDiUDbc/OE8OuqaxFfUEigi4lJBkMqU7wuNEsqJX2lbqkljr4xxulY/9I/qyBVmnD7gfCTEkQjIHmcKE3sMeBUK2STyzVaZR8bhznYvqRv7nHNjh7thAzOjve3OCcX33EMfX0Ssbx9SidIVFg7m2LIVPG36OKOK1xGhAVyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611953; c=relaxed/simple;
	bh=3RGEJTDG6eQQBEcNEIyYzgB80ws1paIHPL5guZJiD1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uer56mCbhOIJ560TpVPgtn87llPp0fDtxD73NYXpYsefld77wQJah6Pb1MLepPfrFWQWRD/ZJwBKbY8FXi3uTZgdntB24dXvlBvq+yEMDZVolDKb+V7y3tvgcIgTI6Z1jGWvFXQAJjGqu4IEKiiWpAsccZoCr3LyJTO9a+V678k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a15tg19F; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a15tg19F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786611951; x=1818147951;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3RGEJTDG6eQQBEcNEIyYzgB80ws1paIHPL5guZJiD1M=;
  b=a15tg19FTX+Os1PVUH5BYCjo2/FtU7Lx6sjPilaNnnJ7b0CpKdfT2ju9
   vZrBNknijYJDLyb8YUuKjyJWalpy23c95hlxxBaPGRZpN0n+VhHzDaRV7
   6d5SKmSimKawhDPj6lbCJVYFfRtRE4TVabRmHLGT83m2Miym8vL0k2uD1
   sHYKManQhaRQdTC+DYwf9gmggx3zsfpYCghTfQDrlDmn94mRVNm9zpw7K
   KdmDestHy26Hmh+IQ2Ne97lzoz/D075QVIByh59HypEzSg7Lza2IXIq81
   GoLmDyClC7iV1FM7wOgoSJTX9siEn7O1yeE0084/w2zPWu/tfKj6c4x7I
   A==;
X-CSE-ConnectionGUID: Ok7PC9gcSV6ICjzVTeka9A==
X-CSE-MsgGUID: /RHsPCRpR/GnepkFBADdrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98332451"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="98332451"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:05:50 -0700
X-CSE-ConnectionGUID: I+SN4POlQqS3kkJOtuykEQ==
X-CSE-MsgGUID: z+8G48p2R8WNYMQOzP46Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260602689"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 13 Aug 2026 02:05:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6756799; Thu, 13 Aug 2026 11:05:47 +0200 (CEST)
Date: Thu, 13 Aug 2026 11:05:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v7.3 merge window
Message-ID: <20260813090547.GO893316@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Greg,

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc1

for you to fetch changes up to 86feaba911f2f1a540a7695c8f4a98fd0fd60ac4:

  thunderbolt: Clamp DMA tunnel credits to what a hop register can hold (2026-08-11 05:57:59 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v7.3 merge window

This includes following USB4/Thunderbolt changes for the v7.3 merge
window:

  - Assert Downstream Port Reset for Thunderbolt 3 devices during
    shutdown to avoid unnecessary delays over warm reset.
  - Tidy up Thunderbolt service ->probe callbacks.
  - USB4STREAM improvements.
  - AMD host interface quirk to fix Tx ring hang on teardown of a DMA tunnel.
  - Minor fixes and cleanups.

All these have been in linux-next with no reported issues.
----------------------------------------------------------------
There is one merge conflict due to a changes to drivers/thunderbolt/nhi.c
done in the current release cycle. This is how I solved it:

diff --cc drivers/thunderbolt/nhi.c
index 35e3c119d5ee,914d4f8700b5..5809809f64d4
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@@ -1235,6 -1274,10 +1276,8 @@@ int nhi_probe(struct tb_nhi *nhi
  
  	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
  
 -	init_completion(&nhi->domain_released);
 -
+ 	nhi->host_reset = host_reset;
+ 
  	res = tb_domain_add(tb, host_reset);
  	if (res) {
  		/*

Thanks!
----------------------------------------------------------------

Basavaraj Natikar (2):
      thunderbolt: Assert downstream port reset on shutdown
      thunderbolt: Add quirk to reset host interface on DMA path teardown for AMD USB4 routers

Fan Ye (2):
      thunderbolt: Use min() for the DMA path credit cap
      thunderbolt: Clamp DMA tunnel credits to what a hop register can hold

Mahad Ibrahim (1):
      thunderbolt: debugfs: Replace get_zeroed_page() with kzalloc()

Manuel Ebner (1):
      docs: admin-guide: thunderbolt: Fix sentence structure

Mika Westerberg (5):
      thunderbolt: stream: Restore consumer if copying from iter fails
      thunderbolt: stream: Fix possible short reads/writes
      thunderbolt: stream: Support IOCB_NOWAIT in non-blocking I/O as well
      thunderbolt: Make interrupt optional for rings
      thunderbolt: stream: Add support for busy polling

Milo Chen (1):
      thunderbolt: xdomain: Notify peers after enumeration

Pan Chuang (1):
      thunderbolt: Remove redundant dev_err_probe()

Uwe Kleine-König (The Capable Hub) (3):
      thunderbolt: Stop passing matched device ID to .probe()
      thunderbolt: Assert that a service driver has a probe callback
      thunderbolt: Drop comma after device id array terminator

 .../ABI/testing/configfs-thunderbolt_stream        |  15 ++
 Documentation/admin-guide/thunderbolt.rst          |   4 +-
 drivers/net/thunderbolt/main.c                     |   4 +-
 drivers/thunderbolt/debugfs.c                      |  28 +--
 drivers/thunderbolt/dma_test.c                     |   4 +-
 drivers/thunderbolt/domain.c                       |  30 ++-
 drivers/thunderbolt/nhi.c                          |  55 ++++-
 drivers/thunderbolt/nhi.h                          |  21 +-
 drivers/thunderbolt/nhi_regs.h                     |   4 +
 drivers/thunderbolt/pci.c                          |  54 ++++-
 drivers/thunderbolt/stream.c                       | 260 ++++++++++++++++-----
 drivers/thunderbolt/switch.c                       |  11 +-
 drivers/thunderbolt/tb.c                           |  21 ++
 drivers/thunderbolt/tb.h                           |   1 +
 drivers/thunderbolt/tunnel.c                       |  13 +-
 drivers/thunderbolt/xdomain.c                      |   4 +
 include/linux/thunderbolt.h                        |  10 +-
 17 files changed, 442 insertions(+), 97 deletions(-)
