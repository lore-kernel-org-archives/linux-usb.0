Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108358;
	b=gt8dFWYAeZkUMwJmopkB+4A/EYll0yVgPpXG/r1D3OPkjh1x1BT9BITR0xj1sDT6YXrt
	 Yi6W4ZBomsc6ORx+m6cvm8PYKleQbc9JrrR2j+qukCGNJAZXDZ+AIoYmuv5olJTEtY/rp
	 ANfueHGGoPd8yO0SV0QarQanNMIyBP3hBuN7CQ9j5phEZtxXfgr5AsTeP1r6j1IbkGPYC
	 N8lntLCYFK8ij0PQDkOtnfi5qBkwg+H/bZuXuMIQcWJDa+7OHRQtsduXqXyuPCMsbyJYs
	 jMldIqOMsdpJq6kIUpOjS+6negIFhIk49J1n7hzXJI5HFHNqj8j+rB5OiWBhF1k9Mkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108358;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F24+7KMw1HAHYtLsPBRBUAQX5kAsHPjEyqjLhnDSmXw=;
	b=rklNQpQlfHZaTkgNtSJ+LEowjbaHaEoReHfGE90NmFATqc2OIpcPqTtT6lNG5Mm0MmT0
	 /ofSI8viknJLAD05pdiSvsZwpwNYP163AkaAlToLCTsIFB1KKyz8tVCbTqqZlCsCIK0OA
	 KyjALCmSb9Cvy6Pvq6zuThZR1fWVMTY26sPD9qeq0y1/VwXIz29oddAzQvpanQCxZjdd/
	 i+svkTBKERMcJcxuJ8fa4qDe79WuJrssWw6OhqxFWi01/YNufit+vAwuWUUF2Vfe+/8i7
	 +8eNyULD2IpEDEQ1lFmP4tpDZmqnlDNLAL8tq0I+9WjTAa4jHHaXOa9ZGM/CLbNlN0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W25tfoNm;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787C606A607
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7787C606A607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W25tfoNm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795108358; x=1826644358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoLw7C6GmMLzsw4YeWt01fuOIHd5BL2xKwh1NRKN5xo=;
  b=W25tfoNmqk6aH+WjtzoCtjTp4ARmklSg2W7zMxl04dzeCcnTQUQdOfIa
   5Ooes2jqbwGeYgCliunitIJqxKVbFekTcs+vJtqh2ZFkQewvBu0C3gGTK
   Jxe9g6z006RFrQaKOj+reRk8vs5dnbn7bnxIPmMavqDVZj30C4YKrEa5x
   6rv4K71YBr+PJ40i9Yi+AgnBSAGbqqhy/DsXtQ1Cgnj6sUUKmkJkw/jCx
   9cIsLP/VSWuEbPa0w4WIhSgV/unW2DlkBj+5fI5Yi2VT4kL/tEIYlwZkb
   eB8OZ/bb+XvgBXQ/z8PsbyzEtefD7o2GhXxMnBsF6P+OTBQhc3p2/nW9H
   w==;
X-CSE-ConnectionGUID: oXnJoArMQ9qDC1WfYsdgLQ==
X-CSE-MsgGUID: M0JxsQL3R+2g25Y/jw5OEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4012993"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="4012993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:12:38 -0800
X-CSE-ConnectionGUID: xHtfo4u9QmeudjD91HDotA==
X-CSE-MsgGUID: +JKxk8B8QwK8hLgt7Paavg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10575069"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 19 Nov 2026 09:12:36 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1093AA5; Thu, 19 Nov 2026 18:12:33 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 07/18] thunderbolt: Add usb4_port_hotplug_disable()
Date: Thu, 19 Nov 2026 18:12:21 +0100
Message-ID: <20261119171232.1616316-8-mika.westerberg@linux.intel.com>
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

This is the opposite of usb4_port_hotplug_enable() and allows the
connection manager to mask hot plug events of a USB4 port. This is
needed in subsequent patches.

Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>
---
 drivers/thunderbolt/tb.h   |  1 +
 drivers/thunderbolt/usb4.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e86845762e22..727e33992e41 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1358,6 +1358,7 @@ void usb4_switch_remove_ports(struct tb_switch *sw);
 
 int usb4_port_unlock(struct tb_port *port);
 int usb4_port_hotplug_enable(struct tb_port *port);
+int usb4_port_hotplug_disable(struct tb_port *port);
 int usb4_port_reset(struct tb_port *port);
 int usb4_port_configure(struct tb_port *port);
 void usb4_port_unconfigure(struct tb_port *port);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index c9b3931c45ed..519aeca66d6f 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1164,6 +1164,27 @@ int usb4_port_hotplug_enable(struct tb_port *port)
 	return tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
 }
 
+/**
+ * usb4_port_hotplug_disable() - Disables hotplug for a port
+ * @port: USB4 port to operate on
+ *
+ * The opposite of usb4_port_hotplug_enable().
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+int usb4_port_hotplug_disable(struct tb_port *port)
+{
+	int ret;
+	u32 val;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
+	if (ret)
+		return ret;
+
+	val |= ADP_CS_5_DHP;
+	return tb_port_write(port, &val, TB_CFG_PORT, ADP_CS_5, 1);
+}
+
 /**
  * usb4_port_reset() - Issue downstream port reset
  * @port: USB4 port to reset
-- 
2.50.1

