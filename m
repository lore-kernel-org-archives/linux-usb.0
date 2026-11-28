Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853256;
	b=tLZ52GvhLOr8MhhL1hgwyqAaModbyNmOmwIzz+rhGpE5KLBIexaZQFoEY9AXyQKU72zQ
	 MagTy+7ZHUh6bziQE4cZ5d2uIAiqX/iS2q+pJgmLHfqSAdIlE6jlPW8OkU1kFG69Mwj99
	 LBYQIhEH1Mq1cF4YPgSJmfqFDXcmNTiGWvQ7YoKeyfAO6l+3wNJubxCZT36nYZaRaXGgG
	 fvJo9t3oKoj6QvGte8qMubmaz830Jdp2nqP0RdSlT5hlcXbUFtbG5nfsNpfEFkJbdanFY
	 UaDflnBrezBz+TxVX/wPe3IIEUzsyMjA5SD4bLpbgy9zZplUpHTfcN42A/I34Z9OVJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853256;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OnTzIn2jKSF+Ir2yMa+jaLQwl/LmxUFwy2QAbjh4kSk=;
	b=3218+2VdRfj6CmC3MJBsqQgAwigDCY/ZFYuMmMCo3RkEjYO0oFnnvLV3kGOBoUWxQEMJ
	 Oo1KjVxYOPvrv7HGmRButUWmfIySwOvfXJsUfpPyU3a++67o9P3VQiDAoJwlDpfhdaZ0L
	 oUZMP3qoI0la5kRrToH74gwb8yLIxJpNdkCwqYMM4n3Gio9aDGbbZJyXkHH4p7uvzKcKv
	 t2CInuTCxo+nX8uB7C/uGaFT+dxbcmyu/3lfbBP50lWAj3ArHnRbzLwBJnIRT0ZURiujX
	 WrxlHoEqItZjJzY7CGnrvYeE6FcRRSNsfW15UDIUdnJyGsrCtO5YU1cQvI2Fixm+4Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=gyYXXEVm;
	arc=none smtp.remote-ip=115.124.28.122
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D4606A31C;
	Sat, 28 Nov 2026 08:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=gyYXXEVm
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1795853245; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=OnTzIn2jKSF+Ir2yMa+jaLQwl/LmxUFwy2QAbjh4kSk=;
	b=gyYXXEVmfw46jXhz0r3z+3MkusAFBQoF1bD0iJxdiG7rjdekmzdaZunOOOxQ/g6Ool3nYdYj6AV6Blz4MZC3KwMOoSPog1H36nJmD51wJ4Ck7MXXhRAxwayGptpMRbkwgJg2WoCEcMRyfjVR++60gwL4ybKu0n+l5YCNcqj8Iv0=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07892613|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0176764-0.000741304-0.981582;FP=16842467091372412336|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.kC0FY2a_1795853242;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.kC0FY2a_1795853242 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sat, 28 Nov 2026 16:07:23 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	khtsai@google.com,
	fangxy@xiaopeng.com,
	Randy Dunlap <rdunlap@infradead.org>,
	dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v6 0/2] usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
Date: Sat, 28 Nov 2026 16:07:13 +0800
Message-ID: <20261128080722.1469508-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework of

  [PATCH v5] usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
  https://lore.kernel.org/all/20261117090110.3263592-1-liuc63@xiaopeng.com/

following Andy's reply to the Sashiko bot on the v5 2/2 thread: 1/2 prepares a
parse_mac_pton() helper in lib/net_utils.c, 2/2 uses it in get_ether_addr().

The two patches belong to different trees: 1/2 touches lib/ and should go via
netdev or -mm, 2/2 is for the USB tree.  2/2 depends on 1/2, so it can only be
applied once 1/2 has reached Linus' tree.

Changes since v5:
  - 2/2: the commit message wrongly said the legacy module parameters go
    through gether_setup_name(), which has no callers; describe the path
    they really take, through gether_set_dev_addr() and
    gether_set_host_addr(), which return -EINVAL and keep the random
    address picked at setup
  - 2/2: as Andy suggested, make both setters warn when get_ether_addr()
    rejects the input, so a rejected legacy address is no longer silent
  - 2/2: amend the five configfs ABI notes: the raw twelve-digit notation
    matches at the beginning of the input, trailing characters are
    ignored, and the address must be unicast and not all-zero
  - 1/2: unchanged

Changes since v4:
  - no driver code change; only documentation and the commit messages
  - 1/2: reword the parse_mac_pton() kernel-doc to say at least
    MAC_ADDR_STR_LEN characters, only the first MAC_ADDR_STR_LEN checked
  - 2/2: describe the configfs behaviour, name all five functions, restore
    a Fixes: tag for 1da177e4c3f4 ("Linux-2.6.12-rc2") keeping the real
    introducing commit in prose, and say "minimum length"

Changes since v3:
  - no code change, only the log of 2/2 changed; name 331a2d82bcaf from
    v2.6.7 as the commit that introduced the loop; pick up the Reviewed-by

Changes since v2:
  - 1/2: pick up Andy's Reviewed-by, no code change
  - 2/2: keep the separator-less notation "aabbccddeeff" working by
    falling back to hex2bin() when parse_mac_pton() does not match
  - 2/2: spell out in the log which notations stop being accepted

Changes since v1:
  - rework the fix on top of parse_mac_pton() as suggested by Andy instead
    of open coding the bounds checks in get_ether_addr()
  - add the KASAN report and the malformed address example
  - select GENERIC_NET_UTILS for USB_U_ETHER

One user visible effect remains: the Cisco notation "aabb.ccdd.eeff" and
irregular groupings such as "123456:789abc" are no longer parsed.  A
configfs store then fails with -EINVAL and keeps the previous value, while
the legacy module parameters keep the random address set up earlier and,
with this version, log a warning naming the rejected address.

Liu Chao (2):
  lib/net_utils: allow mac_pton() to take a custom delimiter
  usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr

 .../ABI/testing/configfs-usb-gadget-ecm       |  9 +++++-
 .../ABI/testing/configfs-usb-gadget-eem       |  9 ++++++
 .../ABI/testing/configfs-usb-gadget-ncm       |  8 +++++
 .../ABI/testing/configfs-usb-gadget-rndis     |  9 ++++++
 .../ABI/testing/configfs-usb-gadget-subset    |  9 ++++++
 drivers/usb/gadget/Kconfig                    |  1 +
 drivers/usb/gadget/function/u_ether.c         | 30 +++++++++++--------
 include/linux/hex.h                           |  7 ++++-
 lib/net_utils.c                               | 19 ++++++++++--
 9 files changed, 84 insertions(+), 17 deletions(-)


base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.50.1

