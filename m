Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400913;
	b=xOOix0R76ye1WzR6FMb82hTEbO1cNsBeNGCFS8x1foW7TOjk9JDogLEndtJZIbarLaSM
	 XTUSzVjmU2u2tcCcDt3o5KUHR2/FdQjAZl30S3xVyF1y6IutDCD9O05LJHCyeq68EnbgK
	 J0AWfo8FXd7/m0rEDbEPhJWq2VPW4FSF5tDhvJhnzPf8g5SUvJyai8Tw9DAOYAogmJUi2
	 pk86QsNkvAdK0EsJ1RNugBtEiMbgvb8XjHYnMy90MpjV3G448VVPGgb/THUv4EQxK8SNp
	 M2Nmve490Z0myYP+Tplk3wSGTSjd3V8NqvU4rn+36QYTvwX4Ad8UMgzzMcxFkwIJENQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400913;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hyUU/xI7+akYGI5lXj3GqwDU9aBoo8cKqcEBWZMe9ko=;
	b=Y/9y77csaKBUl1MKstaeRUHJeb2KjG2x0eg4UhHORhW1n9+WttXYBxPOVmlmaiELIKHe
	 PaLJDLbw8flzyMjnwfVA/3L0/GBqCzWaMf9LQKtsBwcd/9Xdt/yE61T4UJNOwSVIBTizp
	 cO9IBtUro9LvNwwHYTZdFW4FRBT/W7ZZkGbTFI92hXsP+fy4Ua/E0YFPzksBHnELruj7X
	 11gulHz6kx6o/uaZGQhxuTZQt2l/cYZnlytG0Ie9h58AKt90DFp1YZA3evPx04xGc7Qy5
	 5T5e7NuxYcQctpoWkHS1gOCz6wMsA6/ckwb2G2LgWtNKBzjDdToT/E5aJ2gx8Fy3YpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3NgcN0Z;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE272606A321
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 12:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE272606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E3NgcN0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400913; x=1825936913;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nVtN7i3FWCE93qGfMc442QrryfG+0y44e4npEme/vBQ=;
  b=E3NgcN0ZrP4EryokXfKTNOXEBhwqR8+OTMmV0T1J7uwHbkY5mN0xWns0
   cKuowPF0RavI7Kl6RV2FR4gLhiqHGmTUvld+1yUZD0j8ECggSy6m4hUvS
   ERTzQ8a/V+ws8tKuxovuODEUEmSA2/bn0C14kLAYa2tVDu6OpFoilfz36
   50q5kSTyXT5CFqlVxjes0lfSC2h0K9xOtxNdix7YkxoI1GvT4n0gMrdft
   nHxtl2VqVoMARspZjcRKqJ+KM74OYmt3Nww5Va+s413Ajfs6Q+oy0qDIS
   4K9NB2DXuwDSh6z/ZmrEDqp9xXB35f4Sh7g8tlPWwligrWgaaiot3MLS6
   w==;
X-CSE-ConnectionGUID: wHnQAFzJSjGZfd/fUXUzLQ==
X-CSE-MsgGUID: hPQtA+aRTPKTCFQxir1mKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3192261"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3192261"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:41:53 -0800
X-CSE-ConnectionGUID: HtBD9Mm/R7a+Vj3ZxVUFqA==
X-CSE-MsgGUID: nmGNmFQUS7SngXYd1t1cfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8586187"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 11 Nov 2026 04:41:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CDA659B; Wed, 11 Nov 2026 13:41:49 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] Documentation/thunderbolt: Update Mika Westerberg's email address
Date: Wed, 11 Nov 2026 13:41:49 +0100
Message-ID: <20261111124149.1324711-1-mika.westerberg@linux.intel.com>
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

From: Mika Westerberg <westeri@kernel.org>

My @linux.intel.com address will be going away soon so switch to use my
@kernel.org address.

Signed-off-by: Mika Westerberg <westeri@kernel.org>
---
 .../ABI/testing/configfs-thunderbolt_stream   | 16 ++---
 .../ABI/testing/sysfs-bus-thunderbolt         | 60 +++++++++----------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-thunderbolt_stream b/Documentation/ABI/testing/configfs-thunderbolt_stream
index cbecb3d8db50..57e7aa44f3dd 100644
--- a/Documentation/ABI/testing/configfs-thunderbolt_stream
+++ b/Documentation/ABI/testing/configfs-thunderbolt_stream
@@ -1,7 +1,7 @@
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Configuration group for a stream Thunderbolt/USB4
 		service. It is possible to create groups even if there
@@ -21,7 +21,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Creates new stream with $name and fills it with the
 		default values. If there is an advertised remote stream
@@ -30,7 +30,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/busy_poll
 Date:		Nov 2026
 KernelVersion:	v7.3
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Instead of using interrupts for completing the frames in
 		the TX/RX rings, busy poll them directly from the
@@ -45,7 +45,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/index
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		This matches the X in /dev/tbstreamX and allows userspace
 		to map the configfs directory to the corresponding character
@@ -54,7 +54,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/in_hopid
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		In HopID used with the read path of the tunnel. Available HopIDs
 		for tunneling start from 8. You can pass also -1 for automatic
@@ -73,7 +73,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/out_hopid
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Out HopID used with the write path of the tunnel. Available HopIDs
 		for tunneling start from 8. You can pass also -1 for automatic
@@ -84,7 +84,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/ring_size
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Size of the TX/RX rings. Can be adjusted between 32 and
 		4096. The default is 256.
@@ -92,7 +92,7 @@ Description:
 What:		/sys/kernel/config/thunderbolt/stream/<xdomain>.<service>/$name/throttling
 Date:		Sep 2026
 KernelVersion:	v7.2
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:
 		Interrupt throttling rate in ns. Lower values can give
 		better latency. The default is 8192 ns.
diff --git a/Documentation/ABI/testing/sysfs-bus-thunderbolt b/Documentation/ABI/testing/sysfs-bus-thunderbolt
index 221b6c75ed93..4c954cb6b5e4 100644
--- a/Documentation/ABI/testing/sysfs-bus-thunderbolt
+++ b/Documentation/ABI/testing/sysfs-bus-thunderbolt
@@ -1,7 +1,7 @@
 What:		/sys/bus/thunderbolt/devices/.../domainX/boot_acl
 Date:		Jun 2018
 KernelVersion:	4.17
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Holds a comma separated list of device unique_ids that
 		are allowed to be connected automatically during system
 		startup (e.g boot devices). The list always contains
@@ -24,7 +24,7 @@ Description:	Holds a comma separated list of device unique_ids that
 What:		/sys/bus/thunderbolt/devices/.../domainX/deauthorization
 Date:		May 2021
 KernelVersion:	5.12
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute tells whether the system supports
 		de-authorization of devices. Value of 1 means user can
 		de-authorize PCIe tunnel by writing 0 to authorized
@@ -33,7 +33,7 @@ Description:	This attribute tells whether the system supports
 What:		/sys/bus/thunderbolt/devices/.../domainX/iommu_dma_protection
 Date:		Mar 2019
 KernelVersion:	4.21
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute tells whether the system uses IOMMU
 		for DMA protection. Value of 1 means IOMMU is used 0 means
 		it is not (DMA protection is solely based on Thunderbolt
@@ -42,7 +42,7 @@ Description:	This attribute tells whether the system uses IOMMU
 What:		/sys/bus/thunderbolt/devices/.../domainX/security
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute holds current Thunderbolt security level
 		set by the system BIOS. Possible values are:
 
@@ -64,7 +64,7 @@ Description:	This attribute holds current Thunderbolt security level
 What:		/sys/bus/thunderbolt/devices/.../authorized
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute is used to authorize Thunderbolt devices
 		after they have been connected. If the device is not
 		authorized, no PCIe devices are available to the system.
@@ -98,7 +98,7 @@ Description:	This attribute is used to authorize Thunderbolt devices
 What:		/sys/bus/thunderbolt/devices/.../boot
 Date:		Jun 2018
 KernelVersion:	4.17
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains 1 if Thunderbolt device was already
 		authorized on boot and 0 otherwise.
 
@@ -113,7 +113,7 @@ Description:	This attribute contains the generation of the Thunderbolt
 What:		/sys/bus/thunderbolt/devices/.../key
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	When a devices supports Thunderbolt secure connect it will
 		have this attribute. Writing 32 byte hex string changes
 		authorization to use the secure connection method instead.
@@ -123,70 +123,70 @@ Description:	When a devices supports Thunderbolt secure connect it will
 What:		/sys/bus/thunderbolt/devices/.../device
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains id of this device extracted from
 		the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../device_name
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains name of this device extracted from
 		the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../maxhopid
 Date:		Jul 2021
 KernelVersion:	5.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Only set for XDomains. The maximum HopID the other host
 		supports as its input HopID.
 
 What:		/sys/bus/thunderbolt/devices/.../rx_speed
 Date:		Jan 2020
 KernelVersion:	5.5
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute reports the device RX speed per lane.
 		All RX lanes run at the same speed.
 
 What:		/sys/bus/thunderbolt/devices/.../rx_lanes
 Date:		Jan 2020
 KernelVersion:	5.5
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute reports number of RX lanes the device is
 		using simultaneously through its upstream port.
 
 What:		/sys/bus/thunderbolt/devices/.../tx_speed
 Date:		Jan 2020
 KernelVersion:	5.5
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute reports the TX speed per lane.
 		All TX lanes run at the same speed.
 
 What:		/sys/bus/thunderbolt/devices/.../tx_lanes
 Date:		Jan 2020
 KernelVersion:	5.5
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute reports number of TX lanes the device is
 		using simultaneously through its upstream port.
 
 What:		/sys/bus/thunderbolt/devices/.../vendor
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains vendor id of this device extracted
 		from the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../vendor_name
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains vendor name of this device extracted
 		from the device DROM.
 
 What:		/sys/bus/thunderbolt/devices/.../unique_id
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This attribute contains unique_id string of this device.
 		This is either read from hardware registers (UUID on
 		newer hardware) or based on UID from the device DROM.
@@ -195,7 +195,7 @@ Description:	This attribute contains unique_id string of this device.
 What:		/sys/bus/thunderbolt/devices/.../nvm_version
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	If the device has upgradeable firmware the version
 		number is available here. Format: %x.%x, major.minor.
 		If the device is in safe mode reading the file returns
@@ -204,7 +204,7 @@ Description:	If the device has upgradeable firmware the version
 What:		/sys/bus/thunderbolt/devices/.../nvm_authenticate
 Date:		Sep 2017
 KernelVersion:	4.13
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	When new NVM image is written to the non-active NVM
 		area (through non_activeX NVMem device), the
 		authentication procedure is started by writing to
@@ -246,7 +246,7 @@ Description:	For supported devices, automatically authenticate the new Thunderbo
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/key
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This contains name of the property directory the XDomain
 		service exposes. This entry describes the protocol in
 		question. Following directories are already reserved by
@@ -261,35 +261,35 @@ Description:	This contains name of the property directory the XDomain
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/modalias
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Stores the same MODALIAS value emitted by uevent for
 		the XDomain service. Format: tbtsvc:kSpNvNrN
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcid
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This contains XDomain protocol identifier the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcvers
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This contains XDomain protocol version the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcrevs
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This contains XDomain software version the XDomain
 		service supports.
 
 What:		/sys/bus/thunderbolt/devices/<xdomain>.<service>/prtcstns
 Date:		Jan 2018
 KernelVersion:	4.15
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	This contains XDomain service specific settings as
 		bitmask. Format: %x
 
@@ -306,7 +306,7 @@ Description:
 What:		/sys/bus/thunderbolt/devices/usb4_portX/link
 Date:		Sep 2021
 KernelVersion:	v5.14
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Returns the current link mode. Possible values are
 		"usb4", "tbt" and "none".
 
@@ -339,13 +339,13 @@ Description:	When the USB4 port is in offline mode writing 1 to this
 What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/device
 Date:		Oct 2020
 KernelVersion:	v5.9
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Retimer device identifier read from the hardware.
 
 What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/nvm_authenticate
 Date:		Oct 2020
 KernelVersion:	v5.9
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	When new NVM image is written to the non-active NVM
 		area (through non_activeX NVMem device), the
 		authentication procedure is started by writing 1 to
@@ -360,11 +360,11 @@ Description:	When new NVM image is written to the non-active NVM
 What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/nvm_version
 Date:		Oct 2020
 KernelVersion:	v5.9
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Holds retimer NVM version number. Format: %x.%x, major.minor.
 
 What:		/sys/bus/thunderbolt/devices/<device>:<port>.<index>/vendor
 Date:		Oct 2020
 KernelVersion:	v5.9
-Contact:	Mika Westerberg <mika.westerberg@linux.intel.com>
+Contact:	Mika Westerberg <westeri@kernel.org>
 Description:	Retimer vendor identifier read from the hardware.
-- 
2.50.1

