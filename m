Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108363;
	b=KKwNhQZXeFjzFBuEsRpvf4oFXWMwFwfgq64wQoRUzb2qT3lcjmm8PSCxI2q8mNWWL/Zy
	 DJkQaq4Buzt0YVgocChjrO5SXFV1PcnwgJCrreXY6NUvOJa0jE/rRPQfllW4qc6gqNin/
	 XdLRE1uvb3qJNcLgDEmblhIqsn5mFqK1O7fuKQu3KeDeNb5nEz1KauIem88hZ3VeiWfkj
	 OUkDF4UhETusPTZ3+NXg2SRUaljRTx1fYQp950IVLAmj4tM3OB4944b8Dohchpgvq8uCi
	 54kFCcEsHScR8nlLG/zTTdcjNt5kT/CvCYvhb0gfQ+H8y75dehinRJ4UDzK8wIwTgcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108363;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L1H6qNS3AZRC9S3OPgmkP++WUCtMQ8gmoIud2dXjaTE=;
	b=IhPbgqk5cP23azbdDe8+uEc+IEu1g1GnfdYFNsI5pDfZ1KDWM9wayFVIFa3imlaoPVl8
	 hrS10phGpHEQB423ojwmLQBCF9SzTWfSjMslLG0ay0gauMtjMHbpNXjsuyiBHgT9Vp6UZ
	 RMZvOUqvHbxIdikuOLPUtOUv7kKTmxbARSDRHXytUNa5VNjvsTW7KFLUa8DW98u8gVdGJ
	 gL1NnvxM9UAWMpp0FY8HgA9ZlE6ILRiktiIYGIEw828n3XziprLf5H3njhsx4FnRnbC3s
	 JtzagIlhynnHN6bG96tR1z+Eu1Rh97GBz2vYQ3lZ9z7/eIm+MXJjaJNBJSIJDYwnulQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adFE4S6X;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71418606A634
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71418606A634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=adFE4S6X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108362; x=1826644362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qa3kxkDa64hiZInlYbA7VMiZM9P2wVd+yTvRK8k1MYg=;
  b=adFE4S6X12OjVR8VXWDLr+JxZT6+qu6wIH87dpRZzxYHcUKd8SP6BMmR
   ZM4AZAlSc13jb4431jtEZWfEF1h924M/rLOE41ONgBiryHLbS8xesi58I
   W/vxvOkeFexS0gNsTtdWmIzm9Tas8omWTY/R743MfLmQBAF+7QfrpxBZf
   Vr0NZE0HGFF/egUS8/Egkka0jOOQ/jeJguxAWLZGeQ/2qPhXWs75KZJmm
   2sfJcfvu3iYv31m1muNbxGR2Egvrs5dCIwz9ctHQolCiFxzR3g1w0Dq4m
   ej3QaOO72PjtXvCZqme/ibTfa20OpHNpdtyhUdbOZB81s5MLnjfSRb8Aa
   A==;
X-CSE-ConnectionGUID: BIRSyy5oTeaLgNZFBV0jQg==
X-CSE-MsgGUID: KJDwT/WnTXW522Et+ck/hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4013013"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4013013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:41 -0800
X-CSE-ConnectionGUID: 8yehc9rHSpi3Jc3KxVle8Q==
X-CSE-MsgGUID: OHBX5WOaRJeL2bYViMapzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575083"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:39 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2A65AAF; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/18] thunderbolt: Rework tunnel credit allocation
Date: Thu, 19 Nov 2026 18:12:29 +0100
Message-ID: <20261119171232.1616316-16-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
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

From: "Mika Westerberg (Intel)" <westeri@kernel.org>

Currently the credit allocation code is hard to understand and does not
support on-demand allocation at all. What it does is pretty much
allocate full credits for PCIe/USB3, some for DMA and the rest goes for
DisplayPort tunnels. For instance if a host only has 2 DP IN adapters
it does not make sense to reserve credits for more than that.

This reworks the credit allocation so that it still reserves for the DP
and PCIe/USB3 but instead it:

 - Reserves the amount of DP tunnels possible from the host.
 - Reserves minimum but working amount for PCIe/USB3.
 - Reserves minimum for DMA.

Everything else is first come first served basis. For example if user
later plugs in a device router with a DP IN, it can still get the
credits from the "common" pool even if all host router DP tunnels are
already up. This also simplifies the call sites.

Because we change how credits are allocated we need to update the test
cases as well.

While we move the dma_credits parameter to credits.c allow it to
increase credits too (currently it only allowed to decrease them).

Co-developed-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/Makefile  |   2 +-
 drivers/thunderbolt/credits.c | 585 ++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/debugfs.c |  29 ++
 drivers/thunderbolt/path.c    |   4 +-
 drivers/thunderbolt/switch.c  |  22 +-
 drivers/thunderbolt/tb.h      | 145 ++++++++-
 drivers/thunderbolt/test.c    | 485 ++++++++++++++++++++++++----
 drivers/thunderbolt/tunnel.c  | 400 ++++++-----------------
 drivers/thunderbolt/usb4.c    |   7 +-
 9 files changed, 1290 insertions(+), 389 deletions(-)
 create mode 100644 drivers/thunderbolt/credits.c

diff --git a/drivers/thunderbolt/Makefile b/drivers/thunderbolt/Makefile
index beb054c3126b..86226d5ebd7b 100644
--- a/drivers/thunderbolt/Makefile
+++ b/drivers/thunderbolt/Makefile
@@ -3,7 +3,7 @@ ccflags-y := -I$(src)
 obj-${CONFIG_USB4} := thunderbolt.o
 thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o pci.o path.o tunnel.o eeprom.o
 thunderbolt-objs += domain.o dma_port.o icm.o property.o xdomain.o lc.o tmu.o usb4.o
-thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o
+thunderbolt-objs += usb4_port.o nvm.o retimer.o quirks.o clx.o credits.o
 
 thunderbolt-${CONFIG_ACPI} += acpi.o
 thunderbolt-$(CONFIG_DEBUG_FS) += debugfs.o
diff --git a/drivers/thunderbolt/credits.c b/drivers/thunderbolt/credits.c
new file mode 100644
index 000000000000..84954778b916
--- /dev/null
+++ b/drivers/thunderbolt/credits.c
@@ -0,0 +1,585 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Credit allocation support
+ *
+ * Copyright (C) 2026, Intel Corporation
+ * Authors: Gil Fine <gil.fine@linux.intel.com>
+ *	    Mika Westerberg <westeri@kernel.org>
+ */
+
+#include "tb.h"
+
+#define MIN_PCIE_CREDITS	6
+/*
+ * According to CM guide minimum amount of buffers for 1.5 Gbps can be
+ * calculated as:
+ *
+ *   Number of buffers = 1.5 * 10^9 * 2 * 10^-6 / (256 * 8)
+ *
+ * That gives us the minimum of 2 buffers.
+ */
+#define MIN_USB3_CREDITS	2
+#define MIN_DMA_CREDITS		1
+
+/* Default credits if host router does not provide them */
+#define DEFAULT_DMA_CREDITS	14
+/* Path Credits Allocated is 7-bits */
+#define MAX_PATH_CREDITS	127
+
+/**
+ * struct credit_policy - Policy for credit allocation
+ * @pool: Which pool to use
+ * @common_first: Try first from the common pool
+ * @single_user: At most one tunnel of this type goes through a lane
+ *		 adapter (only meaningful with @common_first)
+ *
+ * If @common_first is true then allocations are first tried from
+ * %USB4_CREDIT_POOL_COMMON and if there is not enough room then the
+ * reserved pool is tried. From the reserved pool the minimum is taken.
+ *
+ * If it is false then maximum allocation is done from the reserved pool
+ * first and if there is no room the same allocation is tried from the
+ * %USB4_CREDIT_POOL_COMMON.
+ *
+ * If @single_user is true and the allocation was done from
+ * %USB4_CREDIT_POOL_COMMON, the reserved pool is returned to the
+ * common pool until the credits are released.
+ */
+struct credit_policy {
+	enum usb4_credit_pool_type pool;
+	bool common_first;
+	bool single_user;
+};
+
+static const struct credit_policy credit_policy[] = {
+	[TB_CREDITS_DP_MAIN] = {
+		.pool = USB4_CREDIT_POOL_DP,
+	},
+	[TB_CREDITS_DP_AUX] = {
+		.pool = USB4_CREDIT_POOL_DP,
+	},
+	[TB_CREDITS_PCI] = {
+		.pool = USB4_CREDIT_POOL_PCI,
+		.common_first = true,
+		.single_user = true,
+	},
+	[TB_CREDITS_USB3] = {
+		.pool = USB4_CREDIT_POOL_USB3,
+		.common_first = true,
+		.single_user = true,
+	},
+	[TB_CREDITS_DMA] = {
+		.pool = USB4_CREDIT_POOL_DMA,
+		.common_first = true,
+	},
+};
+
+static const char * const pool_names[] = {
+	[USB4_CREDIT_POOL_COMMON] = "common",
+	[USB4_CREDIT_POOL_DP] = "DP",
+	[USB4_CREDIT_POOL_PCI] = "PCIe",
+	[USB4_CREDIT_POOL_USB3] = "USB3",
+	[USB4_CREDIT_POOL_DMA] = "DMA",
+};
+
+static unsigned int dma_credits;
+module_param(dma_credits, uint, 0444);
+MODULE_PARM_DESC(dma_credits,
+		 "specify custom credits for DMA tunnels, 0 uses host baMaxHI (default: 0)");
+
+/* Protects lane adapter credit pools */
+static DEFINE_MUTEX(credits_lock);
+
+static void usb4_credit_pool_init(struct usb4_credit_pool *pool, const char *name)
+{
+	pool->name = name;
+	pool->total = 0;
+	pool->used = 0;
+}
+
+static void usb4_credit_pool_set_total(struct usb4_credit_pool *pool,
+				       unsigned int credits)
+{
+	pool->total = credits;
+}
+
+static int usb4_credit_pool_alloc(struct usb4_credit_pool *pool,
+				  unsigned int min, unsigned int max)
+{
+	if (WARN_ON(min > max))
+		return -EINVAL;
+
+	max = min(max, usb4_credit_pool_available(pool));
+	if (max < min)
+		return -ENOBUFS;
+
+	pool->used += max;
+	return max;
+}
+
+static void usb4_credit_pool_free(struct usb4_credit_pool *pool,
+				  unsigned int credits)
+{
+	if (WARN_ON(pool->used < credits))
+		return;
+	pool->used -= credits;
+}
+
+static void
+usb4_port_remove_credit_pool(struct tb_port *port, unsigned int type)
+{
+	unsigned int credits;
+
+	WARN_ON(port->credit_pool[type].used);
+
+	credits = usb4_credit_pool_total(&port->credit_pool[type]);
+	usb4_credit_pool_set_total(&port->credit_pool[type], 0);
+	/* Release the credits to the common pool */
+	usb4_credit_pool_free(&port->credit_pool[USB4_CREDIT_POOL_COMMON],
+			      credits);
+}
+
+static void usb4_port_remove_credit_pools(struct tb_port *port)
+{
+	int i;
+
+	if (!port->credit_pool)
+		return;
+
+	for (i = USB4_CREDIT_NUM_POOLS - 1; i > 0; i--)
+		usb4_port_remove_credit_pool(port, i);
+}
+
+static unsigned int usb4_port_dp_credits(const struct tb_port *port)
+{
+	const struct tb_switch *sw = port->sw;
+	unsigned int credits = 0, dp_streams = 0;
+	struct tb_port *p;
+
+	if (!tb_acpi_may_tunnel_dp())
+		return 0;
+
+	tb_switch_for_each_port(sw->tb->root_switch, p) {
+		if (tb_port_is_dpin(p))
+			dp_streams++;
+	}
+
+	/* Only the device router upstream port carries DP main */
+	if (sw->min_dp_main_credits > 0 && tb_is_upstream_port(port))
+		credits = dp_streams * sw->min_dp_main_credits;
+	if (sw->min_dp_aux_credits > 0)
+		credits += dp_streams * sw->min_dp_aux_credits;
+
+	return credits;
+}
+
+static unsigned int usb4_port_pool_min_credits(const struct tb_port *port,
+					       enum usb4_credit_pool_type type)
+{
+	const struct tb_switch *sw = port->sw;
+
+	switch (type) {
+	case USB4_CREDIT_POOL_DP:
+		return usb4_port_dp_credits(port);
+	case USB4_CREDIT_POOL_PCI:
+		if (tb_acpi_may_tunnel_pcie() && sw->max_pcie_credits > 0)
+			return min(MIN_PCIE_CREDITS, sw->max_pcie_credits);
+		break;
+	case USB4_CREDIT_POOL_USB3:
+		if (tb_acpi_may_tunnel_usb3() && sw->max_usb3_credits > 0)
+			return min(MIN_USB3_CREDITS, sw->max_usb3_credits);
+		break;
+	case USB4_CREDIT_POOL_DMA:
+		if (tb_acpi_is_xdomain_allowed())
+			return MIN_DMA_CREDITS;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void usb4_port_reserve_credits(struct tb_port *port, unsigned int type)
+{
+	struct usb4_credit_pool *common =
+			&port->credit_pool[USB4_CREDIT_POOL_COMMON];
+	unsigned int credits = usb4_port_pool_min_credits(port, type);
+
+	if (WARN_ON(port->credit_pool[type].total))
+		return;
+
+	if (credits > usb4_credit_pool_available(common)) {
+		/*
+		 * If we cannot get the minimum there is no point
+		 * wasting those credits as the allocation would fail
+		 * anyway.
+		 */
+		if (type != USB4_CREDIT_POOL_DP)
+			return;
+		credits = usb4_credit_pool_available(common);
+	}
+
+	usb4_credit_pool_alloc(common, credits, credits);
+	usb4_credit_pool_set_total(&port->credit_pool[type], credits);
+}
+
+/*
+ * Reserves credits from the lane adapter common credit pool for the
+ * protocol tunnels, that's DP, USB3, PCIe and DMA (depending on what
+ * tunneling is allowed).
+ *
+ * What is left in the common pool is available as first come first
+ * served.
+ */
+static void usb4_port_init_credit_pools(struct tb_port *port)
+{
+	struct usb4_credit_pool *pool;
+	int i;
+
+	if (!port->credit_pool)
+		return;
+
+	for (i = 0; i < USB4_CREDIT_NUM_POOLS; i++)
+		usb4_credit_pool_init(&port->credit_pool[i], pool_names[i]);
+
+	/* Happens to lane 1 adapter when lanes are bonded */
+	if (!port->total_credits)
+		return;
+
+	/* Initialize the common pool */
+	pool = &port->credit_pool[USB4_CREDIT_POOL_COMMON];
+	usb4_credit_pool_set_total(pool, port->total_credits -
+				   port->ctl_credits);
+
+	/*
+	 * When XDomain is connected then there cannot be any other
+	 * tunnels through the ingress adapter than DMA so all credits
+	 * are available.
+	 */
+	if (port->xdomain)
+		return;
+
+	/* The order sets the priority when there are not enough credits */
+	usb4_port_reserve_credits(port, USB4_CREDIT_POOL_DP);
+	usb4_port_reserve_credits(port, USB4_CREDIT_POOL_PCI);
+	usb4_port_reserve_credits(port, USB4_CREDIT_POOL_USB3);
+	usb4_port_reserve_credits(port, USB4_CREDIT_POOL_DMA);
+}
+
+static bool usb4_port_credit_pools_empty(const struct tb_port *port)
+{
+	unsigned int reserved = 0;
+	int i;
+
+	for (i = 1; i < USB4_CREDIT_NUM_POOLS; i++) {
+		if (port->credit_pool[i].used)
+			return false;
+		reserved += usb4_credit_pool_total(&port->credit_pool[i]);
+	}
+
+	return port->credit_pool[USB4_CREDIT_POOL_COMMON].used == reserved;
+}
+
+/**
+ * usb4_switch_free_credit_pools() - Free router credit pools
+ * @sw: USB4 router
+ *
+ * Releases credit pools allocated for each USB4 port of this router.
+ */
+void usb4_switch_free_credit_pools(struct tb_switch *sw)
+{
+	struct tb_port *port;
+
+	if (tb_switch_is_icm(sw) || !tb_switch_is_usb4(sw))
+		return;
+
+	tb_switch_for_each_port(sw, port) {
+		if (!port->credit_pool)
+			continue;
+
+		usb4_port_remove_credit_pools(port);
+		WARN_ON(port->credit_pool[USB4_CREDIT_POOL_COMMON].used);
+		kfree(port->credit_pool);
+		port->credit_pool = NULL;
+	}
+}
+
+/**
+ * usb4_switch_alloc_credit_pools() - Allocate credit pools for this router
+ * @sw: USB4 router
+ *
+ * Allocates credit pools for each USB4 port of this router.
+ *
+ * Return: %0 in case of success, negative errno in case of failure.
+ */
+int usb4_switch_alloc_credit_pools(struct tb_switch *sw)
+{
+	struct tb_port *port;
+	int ret;
+
+	if (tb_switch_is_icm(sw) || !tb_switch_is_usb4(sw))
+		return 0;
+	if (!sw->credit_allocation)
+		return 0;
+
+	/* Initialize credit pools for lane adapters */
+	tb_switch_for_each_port(sw, port) {
+		if (!tb_port_is_null(port))
+			continue;
+
+		port->credit_pool = kzalloc_objs(*port->credit_pool,
+						 USB4_CREDIT_NUM_POOLS,
+						 GFP_KERNEL);
+		if (!port->credit_pool) {
+			ret = -ENOMEM;
+			goto err_remove;
+		}
+
+		usb4_port_init_credit_pools(port);
+	}
+
+	return 0;
+
+err_remove:
+	tb_sw_warn(sw, "credits: failed to allocate credit pools\n");
+	usb4_switch_free_credit_pools(sw);
+	sw->credit_allocation = false;
+
+	return ret;
+}
+
+static unsigned int tb_switch_dma_credits(const struct tb_switch *sw)
+{
+	unsigned int credits;
+
+	if (dma_credits)
+		credits = dma_credits;
+	else if (sw->tb->root_switch->max_dma_credits)
+		credits = sw->tb->root_switch->max_dma_credits;
+	else
+		credits = DEFAULT_DMA_CREDITS;
+	return min(credits, MAX_PATH_CREDITS);
+}
+
+static int usb4_port_alloc_credits(struct tb_port *port,
+				   const struct credit_policy *policy,
+				   unsigned int min, unsigned int max,
+				   struct usb4_credit_pool **ppool)
+{
+	enum usb4_credit_pool_type primary, secondary, resolved;
+	int ret;
+
+	guard(mutex)(&credits_lock);
+
+	if (policy->common_first) {
+		primary = USB4_CREDIT_POOL_COMMON;
+		secondary = policy->pool;
+	} else {
+		primary = policy->pool;
+		secondary = USB4_CREDIT_POOL_COMMON;
+	}
+
+	ret = usb4_credit_pool_alloc(&port->credit_pool[primary], min, max);
+	if (ret < 0) {
+		if (ret != -ENOBUFS)
+			return ret;
+		/* Only take the minimum out of the pool */
+		if (secondary != USB4_CREDIT_POOL_COMMON)
+			max = min;
+		ret = usb4_credit_pool_alloc(&port->credit_pool[secondary], min,
+					     max);
+		if (ret < 0)
+			return ret;
+		resolved = secondary;
+	} else {
+		resolved = primary;
+	}
+
+	*ppool = &port->credit_pool[resolved];
+
+	/* Single user took from common, so return the minimum back there */
+	if (policy->single_user &&
+	    *ppool == &port->credit_pool[USB4_CREDIT_POOL_COMMON])
+		usb4_port_remove_credit_pool(port, policy->pool);
+
+	tb_port_dbg(port, "credits: allocated %s: %u\n",
+		    usb4_credit_pool_name(*ppool), ret);
+
+	return ret;
+}
+
+static void usb4_port_release_credits(struct tb_port *port,
+				      unsigned int credits,
+				      struct usb4_credit_pool *pool,
+				      const struct credit_policy *policy)
+{
+	guard(mutex)(&credits_lock);
+
+	usb4_credit_pool_free(pool, credits);
+	/* The minimum went to common at allocation, reserve it again */
+	if (policy->single_user &&
+	    pool == &port->credit_pool[USB4_CREDIT_POOL_COMMON])
+		usb4_port_reserve_credits(port, policy->pool);
+}
+
+/**
+ * usb4_port_update_credit_pools() - Updates lane adapter credit pools
+ * @port: Lane adapter
+ *
+ * Updates the lane adapter credit pools based on the available credits
+ * on the hardware.
+ */
+void usb4_port_update_credit_pools(struct tb_port *port)
+{
+	guard(mutex)(&credits_lock);
+
+	if (!port->credit_pool)
+		return;
+
+	if (!usb4_port_credit_pools_empty(port))
+		return;
+
+	usb4_port_remove_credit_pools(port);
+	usb4_port_init_credit_pools(port);
+}
+
+/**
+ * tb_hop_alloc_credits() - Allocate credits for path segment
+ * @hop: Path segment
+ * @type: Credit type to allocate
+ * @flags: Flags specifying the flow control
+ *
+ * Tries to allocate credits from the ingress lane adapter using the
+ * buffer allocation information the router provides (or fixed credits
+ * in case of pre-USB4 router). Fills in @hop->initial_credits or
+ * @hop->nfc_credits with the allocation.
+ *
+ * Call tb_hop_release_credits() to release the allocated credits back
+ * to the adapter credit pool.
+ *
+ * Return: %0 in case of success, negative errno in case of error.
+ */
+int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
+			 unsigned int flags)
+{
+	struct tb_port *port = hop->in_port;
+	struct tb_switch *sw = port->sw;
+	bool dedicated;
+	int ret;
+
+	/* Only DP main link is supposed to use flow control disabled */
+	if (WARN_ON(flags && type == TB_CREDITS_DP_MAIN))
+		return -EINVAL;
+
+	dedicated = flags & TB_HOP_IFC;
+
+	if (tb_switch_is_usb4(sw) && !tb_port_is_null(port)) {
+		/*
+		 * USB4 protocol adapter path credits allocated is
+		 * vendor defined.
+		 */
+		ret = 0;
+	} else if (tb_port_use_credit_allocation(port)) {
+		unsigned int min, max;
+
+		switch (type) {
+		case TB_CREDITS_DP_MAIN:
+			min = sw->min_dp_main_credits;
+			max = sw->min_dp_main_credits;
+			break;
+		case TB_CREDITS_DP_AUX:
+			min = sw->min_dp_aux_credits;
+			max = sw->min_dp_aux_credits;
+			break;
+		case TB_CREDITS_PCI:
+			max = sw->max_pcie_credits;
+			min = min(MIN_PCIE_CREDITS, max);
+			break;
+		case TB_CREDITS_USB3:
+			max = sw->max_usb3_credits;
+			min = min(MIN_USB3_CREDITS, max);
+			break;
+		case TB_CREDITS_DMA:
+			max = tb_switch_dma_credits(sw);
+			min = min(MIN_DMA_CREDITS, max);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		if (!max)
+			return -ENOBUFS;
+
+		ret = usb4_port_alloc_credits(port, &credit_policy[type], min,
+					      max, &hop->credit_pool);
+		if (ret < 0)
+			return ret;
+		hop->credit_type = type;
+	} else {
+		switch (type) {
+		case TB_CREDITS_DP_MAIN:
+			ret = min(port->total_credits - 2, 12U);
+			break;
+		case TB_CREDITS_DP_AUX:
+			ret = 1;
+			break;
+		case TB_CREDITS_PCI:
+		case TB_CREDITS_USB3:
+			if (tb_port_is_null(port))
+				ret = port->bonded ? 32 : 16;
+			else
+				ret = 7;
+			break;
+		case TB_CREDITS_DMA:
+			if (tb_port_is_null(port))
+				ret = port->bonded ? 14 : 6;
+			else
+				ret = min(port->total_credits,
+					  tb_switch_dma_credits(sw));
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	if (dedicated) {
+		hop->initial_credits = ret;
+		hop->ingress_fc_enable = true;
+	}
+	if (flags & TB_HOP_EFC)
+		hop->egress_fc_enable = true;
+	if (!flags)
+		hop->nfc_credits = ret;
+
+	return 0;
+}
+
+/**
+ * tb_hop_release_credits() - Release credits allocated for path segment
+ * @hop: Path segment
+ *
+ * Releases the previously allocated credits back to the lane adapter's
+ * credit pools.
+ */
+void tb_hop_release_credits(struct tb_path_hop *hop)
+{
+	if (hop->credit_pool) {
+		unsigned int credits;
+
+		if (hop->nfc_credits)
+			credits = hop->nfc_credits;
+		else
+			credits = hop->initial_credits;
+
+		usb4_port_release_credits(hop->in_port, credits,
+					  hop->credit_pool,
+					  &credit_policy[hop->credit_type]);
+	}
+
+	hop->ingress_fc_enable = false;
+	hop->egress_fc_enable = false;
+	hop->credit_pool = NULL;
+	hop->initial_credits = 0;
+	hop->nfc_credits = 0;
+}
diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 0d9f41a0f2cd..eac6d564bf18 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -2488,6 +2488,32 @@ static int port_sb_regs_show(struct seq_file *s, void *not_used)
 }
 DEBUGFS_ATTR_RW(port_sb_regs);
 
+static void credits_show(const struct tb_port *port, struct seq_file *s)
+{
+	int i;
+
+	seq_puts(s, "# pool used total\n");
+
+	for (i = 0; i < USB4_CREDIT_NUM_POOLS; i++) {
+		const struct usb4_credit_pool *pool = &port->credit_pool[i];
+
+		seq_printf(s, "%s %u %u\n", usb4_credit_pool_name(pool),
+			   usb4_credit_pool_used(pool),
+			   usb4_credit_pool_total(pool));
+	}
+}
+
+static int port_credits_show(struct seq_file *s, void *not_used)
+{
+	const struct tb_port *port = s->private;
+
+	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->sw->tb->lock)
+		credits_show(port, s);
+
+	return 0;
+}
+DEBUGFS_ATTR_RO(port_credits);
+
 /**
  * tb_switch_debugfs_init() - Add debugfs entries for router
  * @sw: Pointer to the router
@@ -2527,6 +2553,9 @@ void tb_switch_debugfs_init(struct tb_switch *sw)
 		if (port->usb4)
 			debugfs_create_file("sb_regs", DEBUGFS_MODE, debugfs_dir,
 					    port, &port_sb_regs_fops);
+		if (port->credit_pool)
+			debugfs_create_file("credits", 0400, debugfs_dir,
+					    port, &port_credits_fops);
 	}
 
 	margining_switch_init(sw);
diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 79c285dd29fb..9b18704f8010 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -547,7 +547,7 @@ int tb_path_activate(struct tb_path *path)
 		hop.drop_packages = path->drop_packages;
 		hop.counter = path->hops[i].in_counter_index;
 		hop.counter_enable = path->hops[i].in_counter_index != -1;
-		hop.egress_fc = path->egress_fc_enable & out_mask;
+		hop.egress_fc = path->hops[i].egress_fc_enable;
 		hop.egress_shared_buffer = path->egress_shared_buffer & out_mask;
 		/*
 		 * Protocol adapters IFC and ISE bits, and Path Credits
@@ -557,7 +557,7 @@ int tb_path_activate(struct tb_path *path)
 		if (tb_port_is_null(path->hops[i].in_port) ||
 		    !tb_switch_is_usb4(path->hops[i].in_port->sw)) {
 			hop.initial_credits = path->hops[i].initial_credits;
-			hop.ingress_fc = path->ingress_fc_enable & in_mask;
+			hop.ingress_fc = path->hops[i].ingress_fc_enable;
 			hop.ingress_shared_buffer =
 				path->ingress_shared_buffer & in_mask;
 		}
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 216681d2bb8f..a4b96950f3e6 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1271,26 +1271,33 @@ int tb_port_wait_for_link_width(struct tb_port *port, unsigned int width,
 
 static int tb_port_do_update_credits(struct tb_port *port)
 {
-	u32 nfc_credits;
+	u32 nfc_credits, total;
 	int ret;
 
 	ret = tb_port_read(port, &nfc_credits, TB_CFG_PORT, ADP_CS_4, 1);
 	if (ret)
 		return ret;
 
-	if (nfc_credits != port->config.nfc_credits) {
-		u32 total;
+	port->config.nfc_credits = nfc_credits;
 
+	/*
+	 * When the link is bonded the lane 0 holds the total buffers
+	 * (lane 1 total buffers is vendor defined) so reflect that
+	 * here.
+	 */
+	if (port->bonded && port->link_nr)
+		total = 0;
+	else
 		total = (nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
 			ADP_CS_4_TOTAL_BUFFERS_SHIFT;
 
+	if (total != port->total_credits) {
 		tb_port_dbg(port, "total credits changed %u -> %u\n",
 			    port->total_credits, total);
-
-		port->config.nfc_credits = nfc_credits;
 		port->total_credits = total;
 	}
 
+	usb4_port_update_credit_pools(port);
 	return 0;
 }
 
@@ -2400,6 +2407,8 @@ static void tb_switch_release(struct device *dev)
 
 	dma_port_free(sw->dma_port);
 
+	usb4_switch_free_credit_pools(sw);
+
 	tb_switch_for_each_port(sw, port) {
 		ida_destroy(&port->in_hopids);
 		ida_destroy(&port->out_hopids);
@@ -3488,6 +3497,8 @@ int tb_switch_add(struct tb_switch *sw)
 				 sw->device_name);
 	}
 
+	usb4_switch_alloc_credit_pools(sw);
+
 	ret = usb4_switch_add_ports(sw);
 	if (ret) {
 		dev_err(&sw->dev, "failed to add USB4 ports\n");
@@ -3522,6 +3533,7 @@ int tb_switch_add(struct tb_switch *sw)
 err_ports:
 	usb4_switch_remove_ports(sw);
 err_del:
+	usb4_switch_free_credit_pools(sw);
 	device_del(&sw->dev);
 
 	return ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c31ede3244ac..25d3966521a8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -243,6 +243,113 @@ struct tb_bandwidth_group {
 	struct delayed_work release_work;
 };
 
+/**
+ * enum usb4_credit_pool_type - Types of credit pools
+ * @USB4_CREDIT_POOL_COMMON: Contains credits usable for on-demand allocation
+ *			     after reserved below have been taken away from it
+ * @USB4_CREDIT_POOL_DP: Credits reserved for DP tunneling
+ * @USB4_CREDIT_POOL_PCI: Credits reserved for PCIe tunneling
+ * @USB4_CREDIT_POOL_USB3: Credits reserved for USB3 tunneling
+ * @USB4_CREDIT_POOL_DMA: Credits reserved for DMA tunnels
+ * @USB4_CREDIT_NUM_POOLS: Number of credit pools
+ *
+ * Each lane adapter has its own set of pools. They are accounting only,
+ * the hardware does not partition the buffers in any way. The pools
+ * make sure each tunnel type can always get at least a working amount
+ * of credits::
+ *
+ *   0 +------------+
+ *     |   control  | port->ctl_credits, not part of any pool.
+ *     +------------+
+ *     |   COMMON   | On-demand allocation, first come first served. This
+ *     |            | is what is left after the reservations below have
+ *     |            | been carved out.
+ *     |            |
+ *     +------------+
+ *     |     DP     | DP AUX for each DP IN adapter of the host router
+ *     |            | plus DP main link on the upstream adapter of a
+ *     |            | device router. DP takes from here first and from
+ *     |            | %USB4_CREDIT_POOL_COMMON when this runs out.
+ *     +------------+
+ *     |    PCIe    | Minimum to get a PCIe tunnel working. It takes from
+ *     |            | %USB4_CREDIT_POOL_COMMON first and only the minimum
+ *     |            | from here when that runs out. A lane adapter carries
+ *     |            | at most one PCIe tunnel, so while that tunnel uses
+ *     |            | the common pool, this reserve is returned there
+ *     |            | until the tunnel is released.
+ *     +------------+
+ *     |    USB3    | Same as %USB4_CREDIT_POOL_PCI but for USB3.
+ *     +------------+
+ *     |    DMA     | Minimum for DMA tunnels. Taken from
+ *     |            | %USB4_CREDIT_POOL_COMMON first, but this reserve
+ *     |            | is kept all the time.
+ *     +------------+ port->total_credits
+ *
+ * If an XDomain is connected to the adapter only DMA can go through, so
+ * all the credits stay in %USB4_CREDIT_POOL_COMMON. Lane 1 adapter of a
+ * bonded link has no credits.
+ */
+enum usb4_credit_pool_type {
+	USB4_CREDIT_POOL_COMMON,
+	USB4_CREDIT_POOL_DP,
+	USB4_CREDIT_POOL_PCI,
+	USB4_CREDIT_POOL_USB3,
+	USB4_CREDIT_POOL_DMA,
+	USB4_CREDIT_NUM_POOLS,
+};
+
+/**
+ * struct usb4_credit_pool - Credit pool accounting
+ * @name: Name of the pool
+ * @total: Total number of credits in this pool
+ * @used: Number of credits used from @total
+ */
+struct usb4_credit_pool {
+	const char *name;
+	unsigned int total;
+	unsigned int used;
+};
+
+static inline unsigned int
+usb4_credit_pool_used(const struct usb4_credit_pool *pool)
+{
+	return pool->used;
+}
+
+static inline unsigned int
+usb4_credit_pool_available(const struct usb4_credit_pool *pool)
+{
+	return pool->total - pool->used;
+}
+
+static inline unsigned int
+usb4_credit_pool_total(const struct usb4_credit_pool *pool)
+{
+	return pool->total;
+}
+
+static inline const char *
+usb4_credit_pool_name(const struct usb4_credit_pool *pool)
+{
+	return pool->name;
+}
+
+/**
+ * enum tb_credit_type - Type of credits to allocate
+ * @TB_CREDITS_DP_MAIN: DP main link credits (video stream)
+ * @TB_CREDITS_DP_AUX: DP AUX credits (control)
+ * @TB_CREDITS_PCI: Credits for PCIe path
+ * @TB_CREDITS_USB3: Credits for USB3 path
+ * @TB_CREDITS_DMA: Credits for host-to-host path
+ */
+enum tb_credit_type {
+	TB_CREDITS_DP_MAIN,
+	TB_CREDITS_DP_AUX,
+	TB_CREDITS_PCI,
+	TB_CREDITS_USB3,
+	TB_CREDITS_DMA,
+};
+
 /**
  * struct tb_port - a thunderbolt port, part of a tb_switch
  * @config: Cached port configuration read from registers
@@ -265,8 +372,7 @@ struct tb_bandwidth_group {
  * @list: Used to link ports to DP resources list
  * @total_credits: Total number of buffers available for this port
  * @ctl_credits: Buffers reserved for control path
- * @dma_credits: Number of credits allocated for DMA tunneling for all
- *		 DMA paths through this port.
+ * @credit_pool: Pool of credits used for tunneling (USB4 only)
  * @group: Bandwidth allocation group the adapter is assigned to. Only
  *	   used for DP IN adapters for now.
  * @group_list: The adapter is linked to the group's list of ports through this
@@ -299,7 +405,7 @@ struct tb_port {
 	struct list_head list;
 	unsigned int total_credits;
 	unsigned int ctl_credits;
-	unsigned int dma_credits;
+	struct usb4_credit_pool *credit_pool;
 	struct tb_bandwidth_group *group;
 	struct list_head group_list;
 	unsigned int max_bw;
@@ -368,6 +474,11 @@ struct tb_retimer {
  *		     the path
  * @nfc_credits: Number of non-flow controlled buffers allocated for the
  *		 @in_port.
+ * @ingress_fc_enable: Enable flow control in ingress adapter
+ * @egress_fc_enable: Enable flow control in egress adapter
+ * @credit_pool: Pointer to the credit pool used to hold
+ *		 @initial_credits or @nfc_credits (%NULL if not used)
+ * @credit_type: Type of credits allocated (valid when @credit_pool is set)
  * @pm_support: Set path PM packet support bit to 1 (for USB4 v2 routers)
  *
  * Hop configuration is always done on the IN port of a switch.
@@ -389,6 +500,10 @@ struct tb_path_hop {
 	int next_hop_index;
 	unsigned int initial_credits;
 	unsigned int nfc_credits;
+	bool ingress_fc_enable;
+	bool egress_fc_enable;
+	struct usb4_credit_pool *credit_pool;
+	enum tb_credit_type credit_type;
 	bool pm_support;
 };
 
@@ -414,8 +529,6 @@ enum tb_path_port {
  * @name: Name of the path (used for debugging)
  * @ingress_shared_buffer: Shared buffering used for ingress ports on the path
  * @egress_shared_buffer: Shared buffering used for egress ports on the path
- * @ingress_fc_enable: Flow control for ingress ports on the path
- * @egress_fc_enable: Flow control for egress ports on the path
  * @priority: Priority group if the path
  * @weight: Weight of the path inside the priority group
  * @drop_packages: Drop packages from queue tail or head
@@ -434,8 +547,6 @@ struct tb_path {
 	const char *name;
 	enum tb_path_port ingress_shared_buffer;
 	enum tb_path_port egress_shared_buffer;
-	enum tb_path_port ingress_fc_enable;
-	enum tb_path_port egress_fc_enable;
 
 	unsigned int priority:3;
 	int weight:4;
@@ -1208,12 +1319,23 @@ bool tb_path_port_on_path(const struct tb_path *path,
  * tb_path_for_each_hop() - Iterate over each hop on path
  * @path: Path whose hops to iterate
  * @hop: Hop used as iterator
+ * @index: Hop index
  *
  * Iterates over each hop on path.
  */
-#define tb_path_for_each_hop(path, hop)					\
-	for ((hop) = &(path)->hops[0];					\
-	     (hop) <= &(path)->hops[(path)->path_length - 1]; (hop)++)
+#define tb_path_for_each_hop(path, hop, index)				\
+	for ((index) = 0, (hop) = &(path)->hops[0];			\
+	     (index) < (path)->path_length;				\
+	     (index)++, (hop)++)
+
+/* Use flow control in ingress adapter */
+#define TB_HOP_IFC		BIT(0)
+/* Use flow control in egress adapter */
+#define TB_HOP_EFC		BIT(1)
+
+int tb_hop_alloc_credits(struct tb_path_hop *hop, enum tb_credit_type type,
+			 unsigned int flags);
+void tb_hop_release_credits(struct tb_path_hop *hop);
 
 int tb_drom_read(struct tb_switch *sw);
 int tb_drom_read_uid_only(struct tb_switch *sw, u64 *uid);
@@ -1343,6 +1465,8 @@ int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 int usb4_switch_nvm_authenticate(struct tb_switch *sw);
 int usb4_switch_nvm_authenticate_status(struct tb_switch *sw, u32 *status);
 int usb4_switch_credits_init(struct tb_switch *sw);
+int usb4_switch_alloc_credit_pools(struct tb_switch *sw);
+void usb4_switch_free_credit_pools(struct tb_switch *sw);
 bool usb4_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in);
 int usb4_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
 int usb4_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
@@ -1365,6 +1489,7 @@ int usb4_port_router_offline(struct tb_port *port);
 int usb4_port_router_online(struct tb_port *port);
 int usb4_port_enumerate_retimers(struct tb_port *port);
 bool usb4_port_clx_supported(struct tb_port *port);
+void usb4_port_update_credit_pools(struct tb_port *port);
 
 bool usb4_port_asym_supported(struct tb_port *port);
 int usb4_port_asym_set_link_width(struct tb_port *port, enum tb_link_width width);
diff --git a/drivers/thunderbolt/test.c b/drivers/thunderbolt/test.c
index 9c6da22cd100..d6679bcc4ac3 100644
--- a/drivers/thunderbolt/test.c
+++ b/drivers/thunderbolt/test.c
@@ -69,8 +69,8 @@ static struct tb_switch *alloc_switch(struct kunit *test, u64 route,
 	sw->config.depth = tb_route_length(route);
 	sw->config.route_hi = upper_32_bits(route);
 	sw->config.route_lo = lower_32_bits(route);
-	sw->config.enabled = 0;
 	sw->config.max_port_number = max_port_number;
+	sw->config.enabled = true;
 
 	size = (sw->config.max_port_number + 1) * sizeof(*sw->ports);
 	sw->ports = kunit_kzalloc(test, size, GFP_KERNEL);
@@ -201,6 +201,8 @@ static struct tb_switch *alloc_host_usb4(struct kunit *test)
 	if (!sw)
 		return NULL;
 
+	sw->config.thunderbolt_version = 0x20;
+
 	sw->generation = 4;
 	sw->credit_allocation = true;
 	sw->max_usb3_credits = 32;
@@ -220,6 +222,8 @@ static struct tb_switch *alloc_host_br(struct kunit *test)
 	if (!sw)
 		return NULL;
 
+	sw->config.thunderbolt_version = 0x40;
+
 	sw->ports[10].config.type = TB_TYPE_DP_HDMI_IN;
 	sw->ports[10].config.max_in_hop_id = 9;
 	sw->ports[10].config.max_out_hop_id = 9;
@@ -432,13 +436,14 @@ static struct tb_switch *alloc_dev_without_dp(struct kunit *test,
 	for (i = 18; i <= 19; i++)
 		sw->ports[i].disabled = true;
 
+	sw->config.thunderbolt_version = 0x40;
+
 	sw->generation = 4;
 	sw->credit_allocation = true;
 	sw->max_usb3_credits = 109;
 	sw->min_dp_aux_credits = 0;
 	sw->min_dp_main_credits = 0;
 	sw->max_pcie_credits = 30;
-	sw->max_dma_credits = 1;
 
 	return sw;
 }
@@ -453,13 +458,14 @@ static struct tb_switch *alloc_dev_usb4(struct kunit *test,
 	if (!sw)
 		return NULL;
 
+	sw->config.thunderbolt_version = 0x20;
+
 	sw->generation = 4;
 	sw->credit_allocation = true;
 	sw->max_usb3_credits = 14;
 	sw->min_dp_aux_credits = 1;
 	sw->min_dp_main_credits = 18;
 	sw->max_pcie_credits = 32;
-	sw->max_dma_credits = 14;
 
 	return sw;
 }
@@ -1675,11 +1681,18 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	 *         [Device #5]
 	 */
 	host = alloc_host_br(test);
-	dev1 = alloc_dev_default(test, host, 0x3, true);
-	dev2 = alloc_dev_default(test, dev1, 0x303, true);
-	dev3 = alloc_dev_default(test, dev1, 0x503, true);
-	dev4 = alloc_dev_default(test, dev1, 0x703, true);
-	dev5 = alloc_dev_default(test, dev3, 0x50503, true);
+	dev1 = alloc_dev_usb4(test, host, 0x3, true);
+	dev2 = alloc_dev_usb4(test, dev1, 0x303, true);
+	dev3 = alloc_dev_usb4(test, dev1, 0x503, true);
+	dev4 = alloc_dev_usb4(test, dev1, 0x703, true);
+	dev5 = alloc_dev_usb4(test, dev3, 0x50503, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev1), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev2), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev3), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev4), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev5), 0);
 
 	in1 = &host->ports[5];
 	in2 = &host->ports[6];
@@ -1719,6 +1732,13 @@ static void tb_test_tunnel_3dp(struct kunit *test)
 	tb_tunnel_put(tunnel3);
 	tb_tunnel_put(tunnel2);
 	tb_tunnel_put(tunnel1);
+
+	usb4_switch_free_credit_pools(dev5);
+	usb4_switch_free_credit_pools(dev4);
+	usb4_switch_free_credit_pools(dev3);
+	usb4_switch_free_credit_pools(dev2);
+	usb4_switch_free_credit_pools(dev1);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_tunnel_usb3(struct kunit *test)
@@ -1738,9 +1758,13 @@ static void tb_test_tunnel_usb3(struct kunit *test)
 	 *           \ 1
 	 *         [Device #2]
 	 */
-	host = alloc_host(test);
-	dev1 = alloc_dev_default(test, host, 0x1, true);
-	dev2 = alloc_dev_default(test, dev1, 0x701, true);
+	host = alloc_host_usb4(test);
+	dev1 = alloc_dev_usb4(test, host, 0x1, true);
+	dev2 = alloc_dev_usb4(test, dev1, 0x701, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev1), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev2), 0);
 
 	down = &host->ports[12];
 	up = &dev1->ports[16];
@@ -1774,6 +1798,10 @@ static void tb_test_tunnel_usb3(struct kunit *test)
 
 	tb_tunnel_put(tunnel2);
 	tb_tunnel_put(tunnel1);
+
+	usb4_switch_free_credit_pools(dev2);
+	usb4_switch_free_credit_pools(dev1);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_tunnel_port_on_path(struct kunit *test)
@@ -2153,6 +2181,9 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 	host = alloc_host_usb4(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	down = &host->ports[8];
 	up = &dev->ports[9];
 	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
@@ -2162,18 +2193,185 @@ static void tb_test_credit_alloc_pcie(struct kunit *test)
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
 
 	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static unsigned int tb_test_common_used(const struct tb_port *port)
+{
+	return usb4_credit_pool_used(&port->credit_pool[USB4_CREDIT_POOL_COMMON]);
+}
+
+static void tb_test_check_reserve(struct kunit *test,
+				  const struct tb_port *port,
+				  enum usb4_credit_pool_type type,
+				  unsigned int total, unsigned int common_used)
+{
+	const struct usb4_credit_pool *pool = &port->credit_pool[type];
+
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_total(pool), total);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(pool), 0U);
+	KUNIT_EXPECT_EQ(test, tb_test_common_used(port), common_used);
+}
+
+static void tb_test_credit_alloc_pcie_reserve(struct kunit *test)
+{
+	unsigned int host_used, dev_used;
+	struct tb_port *host_port, *dev_port;
+	struct tb_switch *host, *dev;
+	struct tb_tunnel *tunnel;
+	int i;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	host_port = &host->ports[1];
+	dev_port = &dev->ports[1];
+	host_used = tb_test_common_used(host_port);
+	dev_used = tb_test_common_used(dev_port);
+
+	tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_PCI, 6,
+			      host_used);
+	tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_PCI, 6,
+			      dev_used);
+
+	/* The second round makes sure the release put everything back */
+	for (i = 0; i < 2; i++) {
+		tunnel = tb_tunnel_alloc_pci(NULL, &dev->ports[9],
+					     &host->ports[8]);
+		KUNIT_ASSERT_NOT_NULL(test, tunnel);
+		KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+		KUNIT_ASSERT_PTR_EQ(test, tunnel->paths[0]->hops[1].in_port,
+				    dev_port);
+		KUNIT_ASSERT_PTR_EQ(test, tunnel->paths[1]->hops[1].in_port,
+				    host_port);
+
+		/*
+		 * Both sides got their credits from the common pool so
+		 * the PCIe reserves were returned there.
+		 */
+		tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_PCI, 0,
+				      host_used - 6 + 64);
+		tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_PCI, 0,
+				      dev_used - 6 + 32);
+
+		tb_tunnel_put(tunnel);
+
+		tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_PCI, 6,
+				      host_used);
+		tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_PCI, 6,
+				      dev_used);
+	}
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_pcie_from_reserve(struct kunit *test)
+{
+	struct usb4_credit_pool *common, *pci;
+	struct tb_switch *host, *dev;
+	struct tb_tunnel *tunnel;
+	unsigned int common_used;
+	struct tb_path_hop *hop;
+	struct tb_port *port;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	/*
+	 * Leave only enough buffers on the device upstream adapter for
+	 * the control path and the reservations:
+	 *
+	 *   2 + 2 * (1 + 18) + 2 + 6 + 1 = 49
+	 */
+	port = &dev->ports[1];
+	port->total_credits = 49;
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	common = &port->credit_pool[USB4_CREDIT_POOL_COMMON];
+	pci = &port->credit_pool[USB4_CREDIT_POOL_PCI];
+	KUNIT_ASSERT_EQ(test, usb4_credit_pool_available(common), 0U);
+	KUNIT_ASSERT_EQ(test, usb4_credit_pool_total(pci), 6U);
+	common_used = usb4_credit_pool_used(common);
+
+	tunnel = tb_tunnel_alloc_pci(NULL, &dev->ports[9], &host->ports[8]);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel);
+	KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+
+	/* The minimum comes from the reserve and the reserve stays */
+	hop = &tunnel->paths[0]->hops[1];
+	KUNIT_ASSERT_PTR_EQ(test, hop->in_port, port);
+	KUNIT_EXPECT_PTR_EQ(test, hop->credit_pool, pci);
+	KUNIT_EXPECT_EQ(test, hop->initial_credits, 6U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_total(pci), 6U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(pci), 6U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_used(common), common_used);
+
+	tb_tunnel_put(tunnel);
+
+	tb_test_check_reserve(test, port, USB4_CREDIT_POOL_PCI, 6, common_used);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_reserve_below_min(struct kunit *test)
+{
+	struct usb4_credit_pool *common;
+	struct tb_switch *host, *dev;
+	struct tb_port *port;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	/*
+	 * Leave 3 buffers after the control path and DP. That is less
+	 * than the PCIe minimum but enough for USB3 and DMA:
+	 *
+	 *   2 + 2 * (1 + 18) + 3 = 43
+	 */
+	port = &dev->ports[1];
+	port->total_credits = 43;
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	common = &port->credit_pool[USB4_CREDIT_POOL_COMMON];
+	KUNIT_EXPECT_EQ(test,
+		usb4_credit_pool_total(&port->credit_pool[USB4_CREDIT_POOL_DP]),
+		38U);
+	KUNIT_EXPECT_EQ(test,
+		usb4_credit_pool_total(&port->credit_pool[USB4_CREDIT_POOL_PCI]),
+		0U);
+	KUNIT_EXPECT_EQ(test,
+		usb4_credit_pool_total(&port->credit_pool[USB4_CREDIT_POOL_USB3]),
+		2U);
+	KUNIT_EXPECT_EQ(test,
+		usb4_credit_pool_total(&port->credit_pool[USB4_CREDIT_POOL_DMA]),
+		1U);
+	KUNIT_EXPECT_EQ(test, usb4_credit_pool_available(common), 0U);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_credit_alloc_without_dp(struct kunit *test)
@@ -2189,18 +2387,19 @@ static void tb_test_credit_alloc_without_dp(struct kunit *test)
 	/*
 	 * The device has no DP therefore baMinDPmain = baMinDPaux = 0
 	 *
-	 * Create PCIe path with buffers less than baMaxPCIe.
-	 *
 	 * For a device with buffers configurations:
 	 * baMaxUSB3 = 109
 	 * baMinDPaux = 0
 	 * baMinDPmain = 0
 	 * baMaxPCIe = 30
-	 * baMaxHI = 1
-	 * Remaining Buffers = Total - (CP + DP) = 120 - (2 + 0) = 118
-	 * PCIe Credits = Max(6, Min(baMaxPCIe, Remaining Buffers - baMaxUSB3)
-	 *		= Max(6, Min(30, 9) = 9
+	 * Remaining Buffers = Total - (CP + DP + Reserve)
+	 * Remaining Buffers = 120 - (2 + (2 * 0) + 2 + 6 + 1) = 109
+	 * PCIe Credits = Min(Remaining Buffers, baMaxPCIe)
+	 * PCIe Credits = Min(109, 30) = 30
 	 */
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	down = &host->ports[8];
 	up = &dev->ports[9];
 	tunnel = tb_tunnel_alloc_pci(NULL, up, down);
@@ -2211,19 +2410,22 @@ static void tb_test_credit_alloc_without_dp(struct kunit *test)
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 9U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 30U);
 
 	/* PCIe upstream path */
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
 
 	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_credit_alloc_dp(struct kunit *test)
@@ -2236,6 +2438,9 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	host = alloc_host_usb4(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	in = &host->ports[5];
 	out = &dev->ports[14];
 
@@ -2247,7 +2452,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	/* Video (main) path */
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
-	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
@@ -2256,7 +2461,7 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
@@ -2264,11 +2469,14 @@ static void tb_test_credit_alloc_dp(struct kunit *test)
 	path = tunnel->paths[2];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
 	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_credit_alloc_usb3(struct kunit *test)
@@ -2281,6 +2489,9 @@ static void tb_test_credit_alloc_usb3(struct kunit *test)
 	host = alloc_host_usb4(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	down = &host->ports[12];
 	up = &dev->ports[16];
 	tunnel = tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
@@ -2290,18 +2501,77 @@ static void tb_test_credit_alloc_usb3(struct kunit *test)
 	path = tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	path = tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
 	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
+}
+
+static void tb_test_credit_alloc_usb3_reserve(struct kunit *test)
+{
+	unsigned int host_used, dev_used;
+	struct tb_port *host_port, *dev_port;
+	struct tb_switch *host, *dev;
+	struct tb_tunnel *tunnel;
+	int i;
+
+	host = alloc_host_usb4(test);
+	dev = alloc_dev_usb4(test, host, 0x1, true);
+
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
+	host_port = &host->ports[1];
+	dev_port = &dev->ports[1];
+	host_used = tb_test_common_used(host_port);
+	dev_used = tb_test_common_used(dev_port);
+
+	tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_USB3, 2,
+			      host_used);
+	tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_USB3, 2,
+			      dev_used);
+
+	/* The second round makes sure the release put everything back */
+	for (i = 0; i < 2; i++) {
+		tunnel = tb_tunnel_alloc_usb3(NULL, &dev->ports[16],
+					      &host->ports[12], 0, 0);
+		KUNIT_ASSERT_NOT_NULL(test, tunnel);
+		KUNIT_ASSERT_EQ(test, tunnel->npaths, (size_t)2);
+		KUNIT_ASSERT_PTR_EQ(test, tunnel->paths[0]->hops[1].in_port,
+				    dev_port);
+		KUNIT_ASSERT_PTR_EQ(test, tunnel->paths[1]->hops[1].in_port,
+				    host_port);
+
+		/*
+		 * Both sides got their credits from the common pool so
+		 * the USB3 reserves were returned there.
+		 */
+		tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_USB3, 0,
+				      host_used - 2 + 32);
+		tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_USB3, 0,
+				      dev_used - 2 + 14);
+
+		tb_tunnel_put(tunnel);
+
+		tb_test_check_reserve(test, host_port, USB4_CREDIT_POOL_USB3, 2,
+				      host_used);
+		tb_test_check_reserve(test, dev_port, USB4_CREDIT_POOL_USB3, 2,
+				      dev_used);
+	}
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_credit_alloc_dma(struct kunit *test)
@@ -2314,6 +2584,9 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	host = alloc_host_usb4(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	nhi = &host->ports[7];
 	port = &dev->ports[3];
 
@@ -2338,38 +2611,52 @@ static void tb_test_credit_alloc_dma(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	tb_tunnel_put(tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 {
-	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3;
+	struct tb_tunnel *tunnel1, *tunnel2, *tunnel3, *tunnel4;
+	struct tb_tunnel *tunnel5, *tunnel6;
 	struct tb_switch *host, *dev;
 	struct tb_port *nhi, *port;
 	struct tb_path *path;
 
-	host = alloc_host_usb4(test);
+	host = alloc_host_br(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	nhi = &host->ports[7];
 	port = &dev->ports[3];
 
 	/*
-	 * Create three DMA tunnels through the same ports. With the
-	 * default buffers we should be able to create two and the last
-	 * one fails.
+	 * Create six DMA tunnels through the same ports. With the
+	 * default reserved buffers we should be able to create five and
+	 * the last one fails.
 	 *
 	 * For default host we have following buffers for DMA:
 	 *
-	 *   120 - (2 + 2 * (1 + 0) + 32 + 64 + spare) = 20
+	 *   120 - (2 + 3 * (1 + 0) + 2 + 6 + 1) = 106
 	 *
 	 * For device we have following:
 	 *
-	 *  120 - (2 + 2 * (1 + 18) + 14 + 32 + spare) = 34
+	 *  120 - (2 + 3 * (1 + 18) + 2 + 6 + 1) = 52
+	 *
+	 * For the first 3 tunnels we get the full 14 credits both
+	 * directions.
 	 *
-	 * spare = 14 + 1 = 15
+	 * For the tunnel 4 we get 10 for the device ingres and 14 for
+	 * the host ingress.
 	 *
-	 * So on host the first tunnel gets 14 and the second gets the
-	 * remaining 1 and then we run out of buffers.
+	 * For the tunnel 5 we get 1 for the device ingres and 14 for
+	 * the host ingress.
+	 *
+	 * Tunnel 6 fails initially then we release tunnel 1 and then
+	 * tunnel 6 gets full 14 for both sides.
 	 */
 	tunnel1 = tb_tunnel_alloc_dma(NULL, nhi, port, 8, 1, 8, 1);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel1);
@@ -2398,26 +2685,18 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	path = tunnel2->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
-
-	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
-	KUNIT_ASSERT_NULL(test, tunnel3);
-
-	/*
-	 * Release the first DMA tunnel. That should make 14 buffers
-	 * available for the next tunnel.
-	 */
-	tb_tunnel_put(tunnel1);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	tunnel3 = tb_tunnel_alloc_dma(NULL, nhi, port, 10, 3, 10, 3);
 	KUNIT_ASSERT_NOT_NULL(test, tunnel3);
+	KUNIT_ASSERT_EQ(test, tunnel3->npaths, (size_t)2);
 
 	path = tunnel3->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
@@ -2433,8 +2712,73 @@ static void tb_test_credit_alloc_dma_multiple(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
+	tunnel4 = tb_tunnel_alloc_dma(NULL, nhi, port, 11, 4, 11, 4);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel4);
+	KUNIT_ASSERT_EQ(test, tunnel4->npaths, (size_t)2);
+
+	path = tunnel4->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 4U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel4->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 10U);
+
+	tunnel5 = tb_tunnel_alloc_dma(NULL, nhi, port, 12, 5, 12, 5);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel5);
+	KUNIT_ASSERT_EQ(test, tunnel5->npaths, (size_t)2);
+
+	path = tunnel5->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel5->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	KUNIT_ASSERT_NULL(test, tunnel6);
+
+	tb_tunnel_put(tunnel1);
+
+	tunnel6 = tb_tunnel_alloc_dma(NULL, nhi, port, 13, 6, 13, 6);
+	KUNIT_ASSERT_NOT_NULL(test, tunnel6);
+	KUNIT_ASSERT_EQ(test, tunnel6->npaths, (size_t)2);
+
+	path = tunnel6->paths[0];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	path = tunnel6->paths[1];
+	KUNIT_ASSERT_EQ(test, path->path_length, 2);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
+
+	tb_tunnel_put(tunnel6);
+	tb_tunnel_put(tunnel5);
+	tb_tunnel_put(tunnel4);
 	tb_tunnel_put(tunnel3);
 	tb_tunnel_put(tunnel2);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static struct tb_tunnel *TB_TEST_PCIE_TUNNEL(struct kunit *test,
@@ -2453,14 +2797,14 @@ static struct tb_tunnel *TB_TEST_PCIE_TUNNEL(struct kunit *test,
 	path = pcie_tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
 	path = pcie_tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 64U);
 
@@ -2483,7 +2827,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL1(struct kunit *test,
 
 	path = dp_tunnel1->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
-	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
@@ -2491,14 +2835,14 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL1(struct kunit *test,
 	path = dp_tunnel1->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
 	path = dp_tunnel1->paths[2];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
@@ -2521,7 +2865,7 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL2(struct kunit *test,
 
 	path = dp_tunnel2->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
-	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 12U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 18U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 0U);
@@ -2529,14 +2873,14 @@ static struct tb_tunnel *TB_TEST_DP_TUNNEL2(struct kunit *test,
 	path = dp_tunnel2->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
 	path = dp_tunnel2->paths[2];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
 
@@ -2559,14 +2903,14 @@ static struct tb_tunnel *TB_TEST_USB3_TUNNEL(struct kunit *test,
 	path = usb3_tunnel->paths[0];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	path = usb3_tunnel->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 7U);
+	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 32U);
 
@@ -2621,14 +2965,14 @@ static struct tb_tunnel *TB_TEST_DMA_TUNNEL2(struct kunit *test,
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 14U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 5U);
 
 	path = dma_tunnel2->paths[1];
 	KUNIT_ASSERT_EQ(test, path->path_length, 2);
 	KUNIT_EXPECT_EQ(test, path->hops[0].nfc_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[0].initial_credits, 0U);
 	KUNIT_EXPECT_EQ(test, path->hops[1].nfc_credits, 0U);
-	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 1U);
+	KUNIT_EXPECT_EQ(test, path->hops[1].initial_credits, 14U);
 
 	return dma_tunnel2;
 }
@@ -2648,10 +2992,24 @@ static void tb_test_credit_alloc_all(struct kunit *test)
 	host = alloc_host_usb4(test);
 	dev = alloc_dev_usb4(test, host, 0x1, true);
 
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(host), 0);
+	KUNIT_ASSERT_EQ(test, usb4_switch_alloc_credit_pools(dev), 0);
+
 	pcie_tunnel = TB_TEST_PCIE_TUNNEL(test, host, dev);
 	dp_tunnel1 = TB_TEST_DP_TUNNEL1(test, host, dev);
 	dp_tunnel2 = TB_TEST_DP_TUNNEL2(test, host, dev);
 	usb3_tunnel = TB_TEST_USB3_TUNNEL(test, host, dev);
+	/*
+	 * PCIe and USB3 Gen X got their credits from the common pool so
+	 * their minimum (6 + 2) is back there. After all the above we
+	 * get for DMA:
+	 *
+	 *   120 - (2 + 2 * (1 + 0) + 1) - (32 + 64) = 19
+	 *
+	 * For device we have following:
+	 *
+	 *  120 - (2 + 2 * (1 + 18) + 1) - (14 + 32) = 33
+	 */
 	dma_tunnel1 = TB_TEST_DMA_TUNNEL1(test, host, dev);
 	dma_tunnel2 = TB_TEST_DMA_TUNNEL2(test, host, dev);
 
@@ -2661,6 +3019,9 @@ static void tb_test_credit_alloc_all(struct kunit *test)
 	tb_tunnel_put(dp_tunnel2);
 	tb_tunnel_put(dp_tunnel1);
 	tb_tunnel_put(pcie_tunnel);
+
+	usb4_switch_free_credit_pools(dev);
+	usb4_switch_free_credit_pools(host);
 }
 
 static const u32 root_directory[] = {
@@ -3188,6 +3549,10 @@ static struct kunit_case tb_test_cases[] = {
 	KUNIT_CASE(tb_test_credit_alloc_legacy_not_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_legacy_bonded),
 	KUNIT_CASE(tb_test_credit_alloc_pcie),
+	KUNIT_CASE(tb_test_credit_alloc_pcie_reserve),
+	KUNIT_CASE(tb_test_credit_alloc_pcie_from_reserve),
+	KUNIT_CASE(tb_test_credit_alloc_reserve_below_min),
+	KUNIT_CASE(tb_test_credit_alloc_usb3_reserve),
 	KUNIT_CASE(tb_test_credit_alloc_without_dp),
 	KUNIT_CASE(tb_test_credit_alloc_dp),
 	KUNIT_CASE(tb_test_credit_alloc_usb3),
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index af10c67997be..ffadd30bff7b 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -49,19 +49,6 @@
 #define TB_DP_AUX_PRIORITY		2
 #define TB_DP_AUX_WEIGHT		1
 
-/* struct tb_regs_hop::initial_credits is 7 bits wide */
-#define TB_MAX_CREDITS			127
-
-/* Minimum number of credits needed for PCIe path */
-#define TB_MIN_PCIE_CREDITS		6U
-/*
- * Number of credits we try to allocate for each DMA path if not limited
- * by the host router baMaxHI.
- */
-#define TB_DMA_CREDITS			14
-/* Minimum number of credits for DMA path */
-#define TB_MIN_DMA_CREDITS		1
-
 #define TB_DMA_PRIORITY			5
 #define TB_DMA_WEIGHT			1
 
@@ -92,11 +79,6 @@ MODULE_PARM_DESC(dprx_timeout,
 		 "DPRX capability read timeout in ms, -1 waits forever (default: "
 		 __stringify(TB_DPRX_TIMEOUT) ")");
 
-static unsigned int dma_credits = TB_DMA_CREDITS;
-module_param(dma_credits, uint, 0444);
-MODULE_PARM_DESC(dma_credits, "specify custom credits for DMA tunnels (default: "
-		 __stringify(TB_DMA_CREDITS) ")");
-
 static bool bw_alloc_mode = true;
 module_param(bw_alloc_mode, bool, 0444);
 MODULE_PARM_DESC(bw_alloc_mode,
@@ -112,60 +94,6 @@ static const char * const tb_event_names[] = {
 	[TB_TUNNEL_NO_BANDWIDTH] = "insufficient bandwidth",
 };
 
-static inline unsigned int tb_usable_credits(const struct tb_port *port)
-{
-	return port->total_credits - port->ctl_credits;
-}
-
-/**
- * tb_available_credits() - Available credits for PCIe and DMA
- * @port: Lane adapter to check
- * @max_dp_streams: If non-%NULL stores maximum number of simultaneous DP
- *		    streams possible through this lane adapter
- *
- * Return: Number of available credits.
- */
-static unsigned int tb_available_credits(const struct tb_port *port,
-					 size_t *max_dp_streams)
-{
-	const struct tb_switch *sw = port->sw;
-	int credits, usb3, pcie, spare;
-	size_t ndp;
-
-	usb3 = tb_acpi_may_tunnel_usb3() ? sw->max_usb3_credits : 0;
-	pcie = tb_acpi_may_tunnel_pcie() ? sw->max_pcie_credits : 0;
-
-	if (tb_acpi_is_xdomain_allowed()) {
-		spare = min_not_zero(sw->max_dma_credits, dma_credits);
-		/* Add some credits for potential second DMA tunnel */
-		spare += TB_MIN_DMA_CREDITS;
-	} else {
-		spare = 0;
-	}
-
-	credits = tb_usable_credits(port);
-	if (tb_acpi_may_tunnel_dp()) {
-		/*
-		 * Maximum number of DP streams possible through the
-		 * lane adapter.
-		 */
-		if (sw->min_dp_aux_credits + sw->min_dp_main_credits)
-			ndp = (credits - (usb3 + pcie + spare)) /
-			      (sw->min_dp_aux_credits + sw->min_dp_main_credits);
-		else
-			ndp = 0;
-	} else {
-		ndp = 0;
-	}
-	credits -= ndp * (sw->min_dp_aux_credits + sw->min_dp_main_credits);
-	credits -= usb3;
-
-	if (max_dp_streams)
-		*max_dp_streams = ndp;
-
-	return credits > 0 ? credits : 0;
-}
-
 static void tb_init_pm_support(struct tb_path_hop *hop)
 {
 	struct tb_port *out_port = hop->out_port;
@@ -200,11 +128,34 @@ static void tb_tunnel_get(struct tb_tunnel *tunnel)
 	kref_get(&tunnel->kref);
 }
 
+static void tb_path_release_credits(struct tb_path *path)
+{
+	struct tb_path_hop *hop;
+	int i;
+
+	tb_path_for_each_hop(path, hop, i)
+		tb_hop_release_credits(hop);
+}
+
+static void tb_tunnel_release_credits(struct tb_tunnel *tunnel)
+{
+	int i;
+
+	for (i = 0; i < tunnel->npaths; i++) {
+		if (!tunnel->paths[i])
+			continue;
+		tb_path_release_credits(tunnel->paths[i]);
+	}
+}
+
 static void tb_tunnel_destroy(struct kref *kref)
 {
 	struct tb_tunnel *tunnel = container_of(kref, typeof(*tunnel), kref);
 	int i;
 
+	/* Automatically release credits allocated for the tunnel */
+	tb_tunnel_release_credits(tunnel);
+
 	if (tunnel->destroy)
 		tunnel->destroy(tunnel);
 
@@ -392,49 +343,25 @@ static int tb_pci_activate(struct tb_tunnel *tunnel, bool activate)
 	return activate ? 0 : tb_pci_set_ext_encapsulation(tunnel, activate);
 }
 
-static int tb_pci_init_credits(struct tb_path_hop *hop)
-{
-	struct tb_port *port = hop->in_port;
-	struct tb_switch *sw = port->sw;
-	unsigned int credits;
-
-	if (tb_port_use_credit_allocation(port)) {
-		unsigned int available;
-
-		available = tb_available_credits(port, NULL);
-		credits = min(sw->max_pcie_credits, available);
-
-		if (credits < TB_MIN_PCIE_CREDITS)
-			return -ENOSPC;
-
-		credits = max(TB_MIN_PCIE_CREDITS, credits);
-	} else {
-		if (tb_port_is_null(port))
-			credits = port->bonded ? 32 : 16;
-		else
-			credits = 7;
-	}
-
-	hop->initial_credits = credits;
-	return 0;
-}
-
 static int tb_pci_init_path(struct tb_path *path)
 {
 	struct tb_path_hop *hop;
+	int i;
 
-	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_PCI_PRIORITY;
 	path->weight = TB_PCI_WEIGHT;
 	path->drop_packages = 0;
 
-	tb_path_for_each_hop(path, hop) {
+	tb_path_for_each_hop(path, hop, i) {
+		unsigned int flags = TB_HOP_IFC;
 		int ret;
 
-		ret = tb_pci_init_credits(hop);
+		if (i < path->path_length - 1)
+			flags |= TB_HOP_EFC;
+
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_PCI, flags);
 		if (ret)
 			return ret;
 	}
@@ -481,7 +408,7 @@ struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down)
 	}
 	tunnel->paths[TB_PCI_PATH_UP] = path;
 	if (tb_pci_init_path(tunnel->paths[TB_PCI_PATH_UP]))
-		goto err_free;
+		goto err_deactivate;
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_PCI_HOPID, NULL,
 				"PCIe Down");
@@ -1481,59 +1408,28 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 	return 0;
 }
 
-static void tb_dp_init_aux_credits(struct tb_path_hop *hop)
-{
-	struct tb_port *port = hop->in_port;
-	struct tb_switch *sw = port->sw;
-
-	if (tb_port_use_credit_allocation(port))
-		hop->initial_credits = sw->min_dp_aux_credits;
-	else
-		hop->initial_credits = 1;
-}
-
-static void tb_dp_init_aux_path(struct tb_path *path, bool pm_support)
+static int tb_dp_init_aux_path(struct tb_path *path, bool pm_support)
 {
 	struct tb_path_hop *hop;
+	int i;
 
-	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DP_AUX_PRIORITY;
 	path->weight = TB_DP_AUX_WEIGHT;
 
-	tb_path_for_each_hop(path, hop) {
-		tb_dp_init_aux_credits(hop);
-		if (pm_support)
-			tb_init_pm_support(hop);
-	}
-}
-
-static int tb_dp_init_video_credits(struct tb_path_hop *hop)
-{
-	struct tb_port *port = hop->in_port;
-	struct tb_switch *sw = port->sw;
-
-	if (tb_port_use_credit_allocation(port)) {
-		unsigned int nfc_credits;
-		size_t max_dp_streams;
+	tb_path_for_each_hop(path, hop, i) {
+		unsigned int flags = TB_HOP_IFC;
+		int ret;
 
-		tb_available_credits(port, &max_dp_streams);
-		/*
-		 * Read the number of currently allocated NFC credits
-		 * from the lane adapter. Since we only use them for DP
-		 * tunneling we can use that to figure out how many DP
-		 * tunnels already go through the lane adapter.
-		 */
-		nfc_credits = port->config.nfc_credits &
-				ADP_CS_4_NFC_BUFFERS_MASK;
-		if (nfc_credits / sw->min_dp_main_credits > max_dp_streams)
-			return -ENOSPC;
+		if (i < path->path_length - 1)
+			flags |= TB_HOP_EFC;
 
-		hop->nfc_credits = sw->min_dp_main_credits;
-	} else {
-		hop->nfc_credits = min(port->total_credits - 2, 12U);
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_DP_AUX, flags);
+		if (ret)
+			return ret;
+		if (pm_support)
+			tb_init_pm_support(hop);
 	}
 
 	return 0;
@@ -1542,18 +1438,17 @@ static int tb_dp_init_video_credits(struct tb_path_hop *hop)
 static int tb_dp_init_video_path(struct tb_path *path, bool pm_support)
 {
 	struct tb_path_hop *hop;
+	int i;
 
-	path->egress_fc_enable = TB_PATH_NONE;
 	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_fc_enable = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DP_VIDEO_PRIORITY;
 	path->weight = TB_DP_VIDEO_WEIGHT;
 
-	tb_path_for_each_hop(path, hop) {
+	tb_path_for_each_hop(path, hop, i) {
 		int ret;
 
-		ret = tb_dp_init_video_credits(hop);
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_DP_MAIN, 0);
 		if (ret)
 			return ret;
 		if (pm_support)
@@ -1654,21 +1549,23 @@ struct tb_tunnel *tb_tunnel_discover_dp(struct tb *tb, struct tb_port *in,
 	}
 	tunnel->paths[TB_DP_VIDEO_PATH_OUT] = path;
 	if (tb_dp_init_video_path(tunnel->paths[TB_DP_VIDEO_PATH_OUT], false))
-		goto err_free;
+		goto err_deactivate;
 
 	path = tb_path_discover(in, TB_DP_AUX_TX_HOPID, NULL, -1, NULL,
 				"AUX TX");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_OUT] = path;
-	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_OUT], false);
+	if (tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_OUT], false))
+		goto err_deactivate;
 
 	path = tb_path_discover(tunnel->dst_port, -1, in, TB_DP_AUX_RX_HOPID,
 				&port, "AUX RX");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_DP_AUX_PATH_IN] = path;
-	tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_IN], false);
+	if (tb_dp_init_aux_path(tunnel->paths[TB_DP_AUX_PATH_IN], false))
+		goto err_deactivate;
 
 	/* Validate that the tunnel is complete */
 	if (!tb_port_is_dpout(tunnel->dst_port)) {
@@ -1761,22 +1658,25 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 			     link_nr, "Video");
 	if (!path)
 		goto err_free;
-	tb_dp_init_video_path(path, pm_support);
 	paths[TB_DP_VIDEO_PATH_OUT] = path;
+	if (tb_dp_init_video_path(path, pm_support))
+		goto err_free;
 
 	path = tb_path_alloc(tb, in, TB_DP_AUX_TX_HOPID, out,
 			     TB_DP_AUX_TX_HOPID, link_nr, "AUX TX");
 	if (!path)
 		goto err_free;
-	tb_dp_init_aux_path(path, pm_support);
 	paths[TB_DP_AUX_PATH_OUT] = path;
+	if (tb_dp_init_aux_path(path, pm_support))
+		goto err_free;
 
 	path = tb_path_alloc(tb, out, TB_DP_AUX_RX_HOPID, in,
 			     TB_DP_AUX_RX_HOPID, link_nr, "AUX RX");
 	if (!path)
 		goto err_free;
-	tb_dp_init_aux_path(path, pm_support);
 	paths[TB_DP_AUX_PATH_IN] = path;
+	if (tb_dp_init_aux_path(path, pm_support))
+		goto err_free;
 
 	return tunnel;
 
@@ -1785,102 +1685,26 @@ struct tb_tunnel *tb_tunnel_alloc_dp(struct tb *tb, struct tb_port *in,
 	return NULL;
 }
 
-static unsigned int tb_dma_available_credits(const struct tb_port *port)
-{
-	const struct tb_switch *sw = port->sw;
-	int credits;
-
-	credits = tb_available_credits(port, NULL);
-	if (tb_acpi_may_tunnel_pcie())
-		credits -= sw->max_pcie_credits;
-	credits -= port->dma_credits;
-
-	return credits > 0 ? credits : 0;
-}
-
-static int tb_dma_reserve_credits(struct tb_path_hop *hop, unsigned int credits)
-{
-	struct tb_port *port = hop->in_port;
-
-	if (tb_port_use_credit_allocation(port)) {
-		unsigned int available = tb_dma_available_credits(port);
-
-		/*
-		 * Need to have at least TB_MIN_DMA_CREDITS, otherwise
-		 * DMA path cannot be established.
-		 */
-		if (available < TB_MIN_DMA_CREDITS)
-			return -ENOSPC;
-
-		credits = min(credits, available);
-
-		tb_port_dbg(port, "reserving %u credits for DMA path\n",
-			    credits);
-
-		port->dma_credits += credits;
-	} else {
-		if (tb_port_is_null(port))
-			credits = port->bonded ? 14 : 6;
-		else
-			credits = min(port->total_credits, credits);
-	}
-
-	hop->initial_credits = credits;
-	return 0;
-}
-
-/* Path from lane adapter to NHI */
-static int tb_dma_init_rx_path(struct tb_path *path, unsigned int credits)
+static int tb_dma_init_path(struct tb_path *path)
 {
 	struct tb_path_hop *hop;
-	unsigned int i, tmp;
+	int i;
 
-	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
-	path->ingress_fc_enable = TB_PATH_ALL;
 	path->egress_shared_buffer = TB_PATH_NONE;
 	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_DMA_PRIORITY;
 	path->weight = TB_DMA_WEIGHT;
 	path->clear_fc = true;
 
-	/*
-	 * First lane adapter is the one connected to the remote host.
-	 * We don't tunnel other traffic over this link so we can use
-	 * all the credits (except the ones reserved for control traffic).
-	 */
-	hop = &path->hops[0];
-	tmp = min(tb_usable_credits(hop->in_port), credits);
-	hop->initial_credits = tmp;
-	hop->in_port->dma_credits += tmp;
-
-	for (i = 1; i < path->path_length; i++) {
+	tb_path_for_each_hop(path, hop, i) {
+		unsigned int flags = TB_HOP_IFC;
 		int ret;
 
-		ret = tb_dma_reserve_credits(&path->hops[i], credits);
-		if (ret)
-			return ret;
-	}
+		/* No EFC towards the host interface */
+		if (!tb_port_is_nhi(hop->out_port))
+			flags |= TB_HOP_EFC;
 
-	return 0;
-}
-
-/* Path from NHI to lane adapter */
-static int tb_dma_init_tx_path(struct tb_path *path, unsigned int credits)
-{
-	struct tb_path_hop *hop;
-
-	path->egress_fc_enable = TB_PATH_ALL;
-	path->ingress_fc_enable = TB_PATH_ALL;
-	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_shared_buffer = TB_PATH_NONE;
-	path->priority = TB_DMA_PRIORITY;
-	path->weight = TB_DMA_WEIGHT;
-	path->clear_fc = true;
-
-	tb_path_for_each_hop(path, hop) {
-		int ret;
-
-		ret = tb_dma_reserve_credits(hop, credits);
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_DMA, flags);
 		if (ret)
 			return ret;
 	}
@@ -1888,37 +1712,6 @@ static int tb_dma_init_tx_path(struct tb_path *path, unsigned int credits)
 	return 0;
 }
 
-static void tb_dma_release_credits(struct tb_path_hop *hop)
-{
-	struct tb_port *port = hop->in_port;
-
-	if (tb_port_use_credit_allocation(port)) {
-		port->dma_credits -= hop->initial_credits;
-
-		tb_port_dbg(port, "released %u DMA path credits\n",
-			    hop->initial_credits);
-	}
-}
-
-static void tb_dma_destroy_path(struct tb_path *path)
-{
-	struct tb_path_hop *hop;
-
-	tb_path_for_each_hop(path, hop)
-		tb_dma_release_credits(hop);
-}
-
-static void tb_dma_destroy(struct tb_tunnel *tunnel)
-{
-	int i;
-
-	for (i = 0; i < tunnel->npaths; i++) {
-		if (!tunnel->paths[i])
-			continue;
-		tb_dma_destroy_path(tunnel->paths[i]);
-	}
-}
-
 /**
  * tb_tunnel_alloc_dma() - allocate a DMA tunnel
  * @tb: Pointer to the domain structure
@@ -1941,7 +1734,6 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 	struct tb_tunnel *tunnel;
 	size_t npaths = 0, i = 0;
 	struct tb_path *path;
-	unsigned int credits;
 
 	/* Ring 0 is reserved for control channel */
 	if (WARN_ON(!receive_ring || !transmit_ring))
@@ -1961,14 +1753,6 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 
 	tunnel->src_port = nhi;
 	tunnel->dst_port = dst;
-	tunnel->destroy = tb_dma_destroy;
-
-	credits = min_not_zero(dma_credits, nhi->sw->max_dma_credits);
-	if (credits > TB_MAX_CREDITS) {
-		tb_tunnel_dbg(tunnel, "%u credits do not fit a hop, using %u\n",
-			      credits, TB_MAX_CREDITS);
-		credits = TB_MAX_CREDITS;
-	}
 
 	if (receive_ring > 0) {
 		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
@@ -1976,7 +1760,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 		if (!path)
 			goto err_free;
 		tunnel->paths[i++] = path;
-		if (tb_dma_init_rx_path(path, credits)) {
+		if (tb_dma_init_path(path)) {
 			tb_tunnel_dbg(tunnel, "not enough buffers for RX path\n");
 			goto err_free;
 		}
@@ -1988,7 +1772,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
 		if (!path)
 			goto err_free;
 		tunnel->paths[i++] = path;
-		if (tb_dma_init_tx_path(path, credits)) {
+		if (tb_dma_init_path(path)) {
 			tb_tunnel_dbg(tunnel, "not enough buffers for TX path\n");
 			goto err_free;
 		}
@@ -2195,38 +1979,30 @@ static void tb_usb3_reclaim_available_bandwidth(struct tb_tunnel *tunnel,
 		      tunnel->allocated_up, tunnel->allocated_down);
 }
 
-static void tb_usb3_init_credits(struct tb_path_hop *hop)
-{
-	struct tb_port *port = hop->in_port;
-	struct tb_switch *sw = port->sw;
-	unsigned int credits;
-
-	if (tb_port_use_credit_allocation(port)) {
-		credits = sw->max_usb3_credits;
-	} else {
-		if (tb_port_is_null(port))
-			credits = port->bonded ? 32 : 16;
-		else
-			credits = 7;
-	}
-
-	hop->initial_credits = credits;
-}
-
-static void tb_usb3_init_path(struct tb_path *path)
+static int tb_usb3_init_path(struct tb_path *path)
 {
 	struct tb_path_hop *hop;
+	int i;
 
-	path->egress_fc_enable = TB_PATH_SOURCE | TB_PATH_INTERNAL;
 	path->egress_shared_buffer = TB_PATH_NONE;
-	path->ingress_fc_enable = TB_PATH_ALL;
 	path->ingress_shared_buffer = TB_PATH_NONE;
 	path->priority = TB_USB3_PRIORITY;
 	path->weight = TB_USB3_WEIGHT;
 	path->drop_packages = 0;
 
-	tb_path_for_each_hop(path, hop)
-		tb_usb3_init_credits(hop);
+	tb_path_for_each_hop(path, hop, i) {
+		unsigned int flags = TB_HOP_IFC;
+		int ret;
+
+		if (i < path->path_length - 1)
+			flags |= TB_HOP_EFC;
+
+		ret = tb_hop_alloc_credits(hop, TB_CREDITS_USB3, flags);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /**
@@ -2267,14 +2043,16 @@ struct tb_tunnel *tb_tunnel_discover_usb3(struct tb *tb, struct tb_port *down)
 		goto err_free;
 	}
 	tunnel->paths[TB_USB3_PATH_DOWN] = path;
-	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_DOWN]);
+	if (tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_DOWN]))
+		goto err_deactivate;
 
 	path = tb_path_discover(tunnel->dst_port, -1, down, TB_USB3_HOPID, NULL,
 				"USB3 Up");
 	if (!path)
 		goto err_deactivate;
 	tunnel->paths[TB_USB3_PATH_UP] = path;
-	tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_UP]);
+	if (tb_usb3_init_path(tunnel->paths[TB_USB3_PATH_UP]))
+		goto err_deactivate;
 
 	/* Validate that the tunnel is complete */
 	if (!tb_port_is_usb3_up(tunnel->dst_port)) {
@@ -2381,15 +2159,17 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 			     "USB3 Down");
 	if (!path)
 		goto err_free;
-	tb_usb3_init_path(path);
 	tunnel->paths[TB_USB3_PATH_DOWN] = path;
+	if (tb_usb3_init_path(path))
+		goto err_free;
 
 	path = tb_path_alloc(tb, up, TB_USB3_HOPID, down, TB_USB3_HOPID, 0,
 			     "USB3 Up");
 	if (!path)
 		goto err_free;
-	tb_usb3_init_path(path);
 	tunnel->paths[TB_USB3_PATH_UP] = path;
+	if (tb_usb3_init_path(path))
+		goto err_free;
 
 	if (!tb_route(down->sw)) {
 		tunnel->allocated_up = min(max_rate, max_up);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 519aeca66d6f..8e71ca6967b6 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1308,8 +1308,12 @@ static int usb4_set_xdomain_configured(struct tb_port *port, bool configured)
  */
 int usb4_port_configure_xdomain(struct tb_port *port, struct tb_xdomain *xd)
 {
+	int ret;
+
 	xd->link_usb4 = link_is_usb4(port);
-	return usb4_set_xdomain_configured(port, true);
+	ret = usb4_set_xdomain_configured(port, true);
+	tb_port_update_credits(port);
+	return ret;
 }
 
 /**
@@ -1321,6 +1325,7 @@ int usb4_port_configure_xdomain(struct tb_port *port, struct tb_xdomain *xd)
 void usb4_port_unconfigure_xdomain(struct tb_port *port)
 {
 	usb4_set_xdomain_configured(port, false);
+	tb_port_update_credits(port);
 }
 
 static int usb4_port_wait_for_bit(struct tb_port *port, u32 offset, u32 bit,
-- 
2.50.1

