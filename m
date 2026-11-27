Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781894;
	b=MhET4czVWdZRYkdpWPaC3co3qem20eMnIH/48dB/n2GDszOuC3x3Ur5OCWIpGPrMzmAT
	 fKS6cAwJHOQz6Sy8ovRxYu26vn5YbFg4IGv/2aLoRqLJJKZhkJZ9ubqx0DYCP95D0OPTd
	 haOlL8ew1YNkKsrtCALCs8yfEdI1On4W9K/lNfY8QTRTxyDAhinTKg0pyBwefajbVPNG6
	 ATbJ6vvwUI1EsZK0tFsrVFPWueYCzFvLZQXaihv9raKH8z1dUuDVe7eIVvVacCk0KcfBF
	 A1D52Dv0J9DyrdWpYkJlgu6G6yFMASfBEChbRputApF50awwhgnUFk/euWAdByu16iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781894;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Wd4aHFfXTnX2b0pLkTIfcghYurzQVOq31bvxE2PmhOQ=;
	b=pjLpqsG6iYMCfpScMessLY+gfh++JwsJs4zY+UyVS+TeDLSqJvzaJhIo5PgDSVkCO5jP
	 VKiFi3aibgMFMP8utyl22LICeomi5em5rwBNJtsHGCyHgvfD2OGtj6Ta3J469Umwf9kg/
	 vDsBXFWwV0fOM2vKdM/1jzIffb47GRxm3mB/zbyk1JswC0RpceZs6JEgu3/T1m5OLA1bZ
	 eMrZ1va6q170d4fM07IThmg+j+fYhTYaEtYq2HzVqlxcwce8Iv8ThGPKmvRt5U2ExX07u
	 7bNh0vmWwky37G123o9vChfAP2zjYJG3ebZ+ibG94LytI5i21VS0OFFxNoTaUlIizTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFgH1glP;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E83606A330
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 12:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IFgH1glP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795781895; x=1827317895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=feY0Kf0fvQ/xNE4PzeoJYoQXjr06f1U0S9vXc5j9VUY=;
  b=IFgH1glPGhZJk6Zx19FATX2vet76R//cIW4yNpJVJM1zBBAZn7uhE1zx
   +a4OiTeuOxoiOKd+Wnan+8DUq8tae98T3BYU6qUw4BedFQ0rgQLhbKcKr
   LYGyY+HEmJ23MxAU/oz6NPQSO/1VJxv01FgtBNKZf07vJPPdDb2JZYW2m
   6OdD9vbA0DUwwP7yjurj1b1j8msmuD37bzIW5lj32ljNnbi7Wda16BrYk
   Z/rmNvDToMu3+oOJWwdke/m6Gp1GlL2h68TzqSCHscxQ/4tFt9drEZ2nc
   NtGVMU07jIyWApV3bY1yzZBmKdO1nmR27kkbmMFfnh8CqYPIEuxhJKpCN
   g==;
X-CSE-ConnectionGUID: 0InQdlydSiC2ehaA9a33xA==
X-CSE-MsgGUID: 6OvRu+HMSy2uJsJAMO9EPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4577850"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4577850"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:15 -0800
X-CSE-ConnectionGUID: CRw50nL4Sm6yDjhf+7X1Xg==
X-CSE-MsgGUID: 25CDCfQqS7C35+lrK3hqOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12270673"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.45])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 04:18:14 -0800
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Anton Bulakh <him@necauq.ua>
Subject: [PATCH 04/10] xhci: Fix reporting incorrect supported speeds in roothub BOS descriptor
Date: Fri, 27 Nov 2026 14:17:49 +0200
Message-ID: <20261127121755.281420-5-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
References: <20261127121755.281420-1-mathias.nyman@linux.intel.com>
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

xhci driver can show incorrect supported speeds for roothub ports if the
xHC controller lists several port protocol capabilities with the same
revision but with different supported speeds.

AMD xHCI 1022:149c lists several port protocol capabilities with the
same USB 3.1 revision. Some of these capabilities report that a set of
ports only support 5Gbps, while other capabilities report their ports
support both 5Gbps and 10Gbps.

xhci_create_usb3x_bos_desc() builds the root hub SSP capability from one
port capability only: the first one with the highest revision, ending up
with a roothub BOS SSP capability descriptor claiming that roothub only
supports 5Gbps speeds.

Fix this by picking the port protocol capability with highest revision
and largest unique protocol speed ID count. Prefer a capability with a
protocol speed ID count of 0, as that means its ports support all
default speeds of that USB revision.

This won't guarantee that the supported speeds of all protocol
capabilities are listed in the BOS descriptor, but it's an improvement
over the current situation.

Reported-by: Anton Bulakh <him@necauq.ua>
Closes: https://lore.kernel.org/linux-usb/8a954797-4eb4-44db-b53f-6e83f4b7b03a@necauq.ua/
Tested-by: Anton Bulakh <him@necauq.ua>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 55430b673f1e..d47d1e736a37 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -59,13 +59,20 @@ static int xhci_create_usb3x_bos_desc(struct xhci_hcd *xhci, char *buf,
 
 	/* Create the descriptor for port with the highest revision */
 	for (i = 0; i < xhci->num_port_caps; i++) {
-		u8 major = xhci->port_caps[i].maj_rev;
-		u8 minor = xhci->port_caps[i].min_rev;
-		u16 rev = (major << 8) | minor;
+		struct xhci_port_cap *cap = &xhci->port_caps[i];
+		u16 rev = (cap->maj_rev << 8) | cap->min_rev;
 
 		if (i == 0 || bcdUSB < rev) {
 			bcdUSB = rev;
-			port_cap = &xhci->port_caps[i];
+			port_cap = cap;
+		} else if (bcdUSB == rev && port_cap->psi_count != 0) {
+			/*
+			 * Same revision: prefer psi_count 0 (all default speeds),
+			 * otherwise the highest psi_uid_count.
+			 */
+			if (cap->psi_count == 0 ||
+			    cap->psi_uid_count > port_cap->psi_uid_count)
+				port_cap = cap;
 		}
 	}
 
-- 
2.43.0

