Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1C43D4E1
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932733; cv=none; b=ueFGsI5f6b9Lc7kshzc+s9MTWCCrUVn8rSQLTBwqaYUGWprWEqYvO+liyzPBj2T1VvEISzf3eiO7brb5eBL/d5CpKOFnxz7mSWvO/hAy11fYLuFUQDtpHxdrLZo9P7Ekl5WZu5+qeI+95mhEw2VZcn+2gU9LLgN2ZcluXX/4w/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932733; c=relaxed/simple;
	bh=TDOKESjQQtrmDSyhgLqGdxQ8kHgybbNW5Fc5EGE51c4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WKplhtd7HwsIJuBeTOf3KooUTClXxDsw0sU9Ealx2nz+Ltk1+7t5oOR5WlgAkcakky1ZMI0TpGzIIFR6eXBK0mpI+ikKCRqwkbEjHGbL5iB1h0x27GEPMl6fLHhkCpntfJMxWiqqF8bRHpq2RGwudb+sbVT5nkqPQg4KsWs+4Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1TR3EXH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1TR3EXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768932732; x=1800468732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDOKESjQQtrmDSyhgLqGdxQ8kHgybbNW5Fc5EGE51c4=;
  b=Q1TR3EXHBmC2OZjE6uifW1j25uZaMZJy+2BW4zLw5jp52zCOkIZSrIri
   b6JERcPaALe57JQwJlt5N0cnzGxAqlTxBiCxiEXIzPXrskidO1ZyzQ2RB
   5ZpnVRQqJYLb2+zk8YsYHXt+j9VZ6l6ErJIlldR9oGI1CxbDzdJU41kj6
   aJSwuwVHaPw7Z6UoFCvm/p/5sUHsu5/2S0U/n471GFW57E6F1Uai1wTKl
   c1cBBiEyWvHGV1kCXgNh0u45KVZeijHqnVwmqrTkluFAdwIItLGP6R6UE
   sNru+3hcpcqOa6K2bIf+pzhj/BdYYTr2ejYuXfXNGXQRBM9AX3RPSUulI
   A==;
X-CSE-ConnectionGUID: egXJICQKRHi8SMFN85vbZA==
X-CSE-MsgGUID: Eh4+fboxR62ffIh/i98lFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70055592"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="70055592"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:11 -0800
X-CSE-ConnectionGUID: sZnuOO5ERPWXysk83COtAA==
X-CSE-MsgGUID: tjfRXunUTBa+KOPb8oVx1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; 
   d="scan'208";a="205997468"
Received: from abityuts-desk.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.244.215])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 10:12:09 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci: dbc: allow setting product string through sysfs
Date: Tue, 20 Jan 2026 20:11:47 +0200
Message-ID: <20260120181148.128712-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
References: <20260120181148.128712-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Łukasz Bartosik <ukaszb@chromium.org>

Add dbc_product sysfs attribute to allow changing the product description
presented by the debug device when a host requests a string descriptor
with iProduct index.

Value can only be changed while debug capability (DbC) is in disabled
state to prevent USB device descriptor change while connected to a USB
host.

The default value is "Linux USB Debug Target".
The field length can be from 1 to 126 characters.
String is terminated at null or newline, driver does not support empty
string.

[ mn: Improve commit message and sysfs entry documentation ]
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 .../testing/sysfs-bus-pci-drivers-xhci_hcd    | 14 ++++++++
 drivers/usb/host/xhci-dbgcap.c                | 36 +++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
index b0e8ded09c16..d153162d6045 100644
--- a/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
+++ b/Documentation/ABI/testing/sysfs-bus-pci-drivers-xhci_hcd
@@ -100,3 +100,17 @@ Description:
 		connected to a USB host.
 		The default value is "0001".
 		The field length can be from 1 to 126 characters.
+
+What:		/sys/bus/pci/drivers/xhci_hcd/.../dbc_product
+Date:		January 2026
+Contact:	Łukasz Bartosik <ukaszb@chromium.org>
+Description:
+		The dbc_product attribute allows to change the product string
+		descriptor presented by the debug device when a host requests
+		a string descriptor with iProduct index.
+		Index is found in the iProduct field in the device descriptor.
+		Value can only be changed while debug capability (DbC) is in
+		disabled state to prevent USB device descriptor change while
+		connected to a USB host.
+		The default value is "Linux USB Debug Target".
+		The field length can be from 1 to 126 characters.
diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index a78d386ffdc3..cae98576545e 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -1210,6 +1210,40 @@ static ssize_t dbc_bcdDevice_store(struct device *dev,
 	return size;
 }
 
+static ssize_t dbc_product_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+
+	return sysfs_emit(buf, "%s\n", dbc->str.product);
+}
+
+static ssize_t dbc_product_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t size)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(dev_get_drvdata(dev));
+	struct xhci_dbc	*dbc = xhci->dbc;
+	size_t len;
+
+	if (dbc->state != DS_DISABLED)
+		return -EBUSY;
+
+	len = strcspn(buf, "\n");
+	if (!len)
+		return -EINVAL;
+
+	if (len > USB_MAX_STRING_LEN)
+		return -E2BIG;
+
+	memcpy(dbc->str.product, buf, len);
+	dbc->str.product[len] = '\0';
+
+	return size;
+}
+
 static ssize_t dbc_serial_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -1332,6 +1366,7 @@ static DEVICE_ATTR_RW(dbc_idVendor);
 static DEVICE_ATTR_RW(dbc_idProduct);
 static DEVICE_ATTR_RW(dbc_bcdDevice);
 static DEVICE_ATTR_RW(dbc_serial);
+static DEVICE_ATTR_RW(dbc_product);
 static DEVICE_ATTR_RW(dbc_bInterfaceProtocol);
 static DEVICE_ATTR_RW(dbc_poll_interval_ms);
 
@@ -1341,6 +1376,7 @@ static struct attribute *dbc_dev_attrs[] = {
 	&dev_attr_dbc_idProduct.attr,
 	&dev_attr_dbc_bcdDevice.attr,
 	&dev_attr_dbc_serial.attr,
+	&dev_attr_dbc_product.attr,
 	&dev_attr_dbc_bInterfaceProtocol.attr,
 	&dev_attr_dbc_poll_interval_ms.attr,
 	NULL
-- 
2.43.0

