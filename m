Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2A02EB0F
	for <linux-usb@vger.kernel.org>; Thu, 11 Jun 2026 08:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167730; cv=none; b=AB6mEw3EXtJfjHDSTMZcjq5WnkWm3jIPIlTs3m1JdXSNLGpUpjNY7Dk2LGQPeezW3jb14zxONRDhZrftnLjOrUc62JX+MbXY3qSRjbZsEg+Fx3Ir8xFMkp9MmXtGRFk8uU3UCroDnZW2jjTOtz9pO9Vn6OJHOwMyF9uyeG5qaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167730; c=relaxed/simple;
	bh=rnb24awCkPm3HOdLq3E6BOx+yu+w4RgEybe9LSZ0Y6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7mNOhVIoUTkkCCBLh+U2hjs+dZ79ZCbpO4a4SnCV8tM2uez/IujypDhk94XzxZQIl9YOdx+zCxiE+V7EvyCTF+/T2AXuq8cO62ParBcKJughFBTwdGjb3yOYTECV03IIxKZApW6Qlp7I1XrVaiCWIMiDH18jGZ9rJ1MawVYI5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbYs2g9Q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbYs2g9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781167729; x=1812703729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnb24awCkPm3HOdLq3E6BOx+yu+w4RgEybe9LSZ0Y6k=;
  b=kbYs2g9QvQr+7dTT+TOsWBSkSVNeBMCvkTFG8EjijSDpq/bXQ8unC06f
   QlKf1pMwmikzQLdZpgivmsYyqzLInGqXHSDGzVbsn3XVkZY40mK++j3qc
   9aDRCn0zSi9SV7NVAkxhzVfX4JmdqXIXBDOczyFnT3/coKh3u7sY42XZF
   YT3vcxJvijNwXJbhTgq+iw+sPhiWxYZ7Nt3bJzTsiwJpnoLvytWEzMbsM
   FuLJnOw5fuTO15sLVK31mS+YWygFzK1JJ9299u1EwvTb9UD0FeNYieBjf
   iNXX3bjXTdy003eJIj9vr76X/DGZOIwVanYfqVvzeIMDufkGdcEMhag25
   A==;
X-CSE-ConnectionGUID: jGNLrjrlRNuoONis5Rdsdg==
X-CSE-MsgGUID: Frscz0VxR+WQ+kcI25KspA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99553164"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="99553164"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 01:48:49 -0700
X-CSE-ConnectionGUID: QitzVyQoTbC7hfkzgFqn9Q==
X-CSE-MsgGUID: 1M/ZxKqQTyGtoSLDQvUGnA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 01:48:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0388095; Thu, 11 Jun 2026 10:48:46 +0200 (CEST)
Date: Thu, 11 Jun 2026 10:48:45 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [GIT PULL] USB4/Thunderbolt changes for v7.2 merge window
Message-ID: <20260611084845.GX2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Greg,

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.2-rc1

for you to fetch changes up to c1bef05763c94ae284ee2881c03bf0753f8d213a:

  thunderbolt: debugfs: Fix sideband write size check (2026-06-08 12:47:28 +0200)

----------------------------------------------------------------
thunderbolt: Changes for v7.2 merge window

This includes following USB4/Thunderbolt changes for the v7.2 merge
window:

  - Make the driver more compliant with the connection manager guide.
  - Improvements over Thunderbolt XDomain service handling.
  - USB4STREAM driver.
  - Split out PCIe bits into pci.c to allow the driver to work on
    non-PCIe hosts as well.
  - Various fixes and improvements.

All these have been in linux-next with no reported issues.

----------------------------------------------------------------

There is one trivial merge conflict due to changes in
drivers/thunderbolt/property.c done in the current -rc. Here's how I would
resolve it:

diff --cc drivers/thunderbolt/property.c
index 59beab43f90a,6b9666b61181..df18a6d69d8b
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@@ -39,7 -37,8 +39,8 @@@ struct tb_property_dir_entry 
  
  static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
  	size_t block_len, unsigned int dir_offset, size_t dir_len,
 -	bool is_root);
 +	bool is_root, unsigned int depth);
+ static struct tb_property *tb_property_copy(const struct tb_property *property);
  
  static inline void parse_dwdata(void *dst, const void *src, size_t dwords)
  {


Thanks!

----------------------------------------------------------------

Alan Borzeszkowski (2):
      thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
      thunderbolt: Improve multi-display DisplayPort tunnel allocation

Gil Fine (7):
      thunderbolt: Avoid reserved fields in path config space for USB4 routers
      thunderbolt: Fix lane bonding log when bonding not possible
      thunderbolt: Activate path hops from source to destination
      thunderbolt: Verify PCIe adapter in detect state before tunnel setup
      thunderbolt: Verify Router Ready bit is set after router enumeration
      thunderbolt: Increase timeout for Configuration Ready bit
      thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers

Konrad Dybcio (5):
      thunderbolt: debugfs: Don't stop reading SB registers if just one fails
      thunderbolt: Move pci_device out of tb_nhi
      thunderbolt: Separate out common NHI bits
      thunderbolt: Require nhi->ops be valid
      thunderbolt: Add some more descriptive probe error messages

Michael Bommarito (3):
      thunderbolt: test: add KUnit regression tests for XDomain property parser
      thunderbolt: test: Add KUnit tests for property parser bounds checks
      thunderbolt: Prevent XDomain delayed work use-after-free on disconnect

Mika Westerberg (20):
      thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
      thunderbolt: Make XDomain lane bonding comply with the USB4 v2 spec
      thunderbolt: Keep the domain reference while processing hotplug
      thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
      thunderbolt: Set tb->root_switch to NULL when domain is stopped
      thunderbolt: Wait for tb_domain_release() to complete when driver is removed
      thunderbolt: Keep XDomain reference during the lifetime of a service
      thunderbolt: dma_test: No need to store debugfs directory pointer
      thunderbolt: Remove service debugfs entries during unregister
      thunderbolt: Remove XDomain from the bus without holding tb->lock
      thunderbolt: Add tb_property_merge_dir()
      thunderbolt: Add KUnit test for tb_property_merge_dir()
      thunderbolt: Allow service drivers to specify their own properties
      thunderbolt / net: Move ring_frame_size() to thunderbolt.h
      thunderbolt / net: Let the service drivers configure interrupt throttling
      thunderbolt: Add helper to figure size of the ring
      thunderbolt: Add tb_ring_flush()
      thunderbolt: Add support for ConfigFS
      thunderbolt: Add support for USB4STREAM
      docs: admin-guide: thunderbolt: Add instructions how to use USB4STREAM

Pooja Katiyar (1):
      thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()

Xu Rao (3):
      thunderbolt: test: Release third DP tunnel
      thunderbolt: debugfs: Fix margining error counter buffer leak
      thunderbolt: debugfs: Fix sideband write size check

 .../ABI/testing/configfs-thunderbolt_stream        |   83 +
 Documentation/admin-guide/thunderbolt.rst          |   61 +
 drivers/net/thunderbolt/main.c                     |   20 +-
 drivers/thunderbolt/Kconfig                        |   15 +
 drivers/thunderbolt/Makefile                       |    6 +-
 drivers/thunderbolt/acpi.c                         |   14 +-
 drivers/thunderbolt/configfs.c                     |   61 +
 drivers/thunderbolt/ctl.c                          |   16 +-
 drivers/thunderbolt/debugfs.c                      |   18 +-
 drivers/thunderbolt/dma_test.c                     |   25 +-
 drivers/thunderbolt/domain.c                       |   37 +-
 drivers/thunderbolt/eeprom.c                       |    2 +-
 drivers/thunderbolt/icm.c                          |   39 +-
 drivers/thunderbolt/nhi.c                          |  606 ++-----
 drivers/thunderbolt/nhi.h                          |   33 +-
 drivers/thunderbolt/nhi_ops.c                      |  185 ---
 drivers/thunderbolt/nhi_regs.h                     |    3 +-
 drivers/thunderbolt/path.c                         |   37 +-
 drivers/thunderbolt/pci.c                          |  622 +++++++
 drivers/thunderbolt/property.c                     |  154 +-
 drivers/thunderbolt/stream.c                       | 1698 ++++++++++++++++++++
 drivers/thunderbolt/switch.c                       |   77 +-
 drivers/thunderbolt/tb.c                           |   86 +-
 drivers/thunderbolt/tb.h                           |   21 +-
 drivers/thunderbolt/tb_regs.h                      |   19 +-
 drivers/thunderbolt/test.c                         |  249 +++
 drivers/thunderbolt/tunnel.c                       |   35 +
 drivers/thunderbolt/usb4.c                         |   35 +-
 drivers/thunderbolt/usb4_port.c                    |    2 +-
 drivers/thunderbolt/xdomain.c                      |  311 +++-
 include/linux/thunderbolt.h                        |   59 +-
 31 files changed, 3710 insertions(+), 919 deletions(-)
 create mode 100644 Documentation/ABI/testing/configfs-thunderbolt_stream
 create mode 100644 drivers/thunderbolt/configfs.c
 delete mode 100644 drivers/thunderbolt/nhi_ops.c
 create mode 100644 drivers/thunderbolt/pci.c
 create mode 100644 drivers/thunderbolt/stream.c
