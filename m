Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F20471CFB
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026112; cv=none; b=R3gACWpzwyp7ds784wNW8CaMvMAZRBh/DeNPh0+eXuIFw//J+nAwOR/a3MQbLO+NQ8kYnFzdGIFqiKt2+brSzD0rrGJsvXnvLW4eFjAER8ItcwXhO+mH19bGwhrjhTy5IFKlp2nPTtsXQYcZrn7JBmzPPBluhhfzSYrbjmCX+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026112; c=relaxed/simple;
	bh=N9CLavXcs3g5/8UNj8h6BwBAbCPVC51wUp5Ts03WdhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eqkz6r8wUoYCEzdNw20wvOZR7Wc5uLYOxRhPSdTsfY19h6HJQWh53VHvLQUOc5ufvgMYe0Ww8/S/tJJtl4MTLFfDi3yNz958XbHyK6ZUQxvKH2bDB7ewO7J2+d8NAzOKdSDJksTRhziiGPIxSqfDpZvzhIGci+fbTYQmwOKS1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be7vT/Hz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be7vT/Hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786026110; x=1817562110;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N9CLavXcs3g5/8UNj8h6BwBAbCPVC51wUp5Ts03WdhQ=;
  b=Be7vT/Hzc9hHwD+XGhRJ4Vfn8HkHTmYDlFYnfn4GYberwDEdGdQsRVdu
   PyDmEgWJ92YvZvaj1vjQJ7Ta6cPHzVECtDozczidQywzbxGze7tw3mGGR
   fONG05MG3xGftFI4B0FwKrdaoAm6g3r4Ywt+JRxadZNeAyHfJIqj3KW+l
   KJpOUAaFKLp1f7L7L8xPu75Wrp7aJkEe8aiFeMyXWBKid9bZroqBYYMcf
   azc5Qda/zCorHDbZkgrJ0G+5QVf9iMa1C1a1rvW7Y+Akk8mTvfsmW607q
   Su1ChIpjdm/6YcLH4Z5IpRPDa3tVyk+rHv7AfW9WSnU75O01XAP1KzyYx
   g==;
X-CSE-ConnectionGUID: IhkGK58/T4GCerUZ/5HUEg==
X-CSE-MsgGUID: IFDa//WtR32h7WLBHrp9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97268205"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97268205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:50 -0700
X-CSE-ConnectionGUID: jCf0wCjYRU27/H2x10GpJQ==
X-CSE-MsgGUID: v0K3KQdHQTeJk3BaI/Nkog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="285500519"
Received: from amilburn-desk.amilburn-desk (HELO mnyman-desk.home) ([10.245.244.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:21:49 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 15/17] usb: xhci: replace Unicode quotes with ASCII apostrophes
Date: Thu,  6 Aug 2026 17:21:11 +0300
Message-ID: <20260806142113.2436238-16-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
References: <20260806142113.2436238-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Niklas Neronin <niklas.neronin@linux.intel.com>

Non-ASCII characters trigger git send-email to prompt for encoding on each
modification near them, which is unnecessary and annoying.
Using plain ASCII avoids these prompts and does not change its meaning.

This change only affects comments and has no functional impact.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 2 +-
 drivers/usb/host/xhci-mem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 17ac05516642..470bafe1802b 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1295,7 +1295,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 			}
 			/* In spec software should not attempt to suspend
 			 * a port unless the port reports that it is in the
-			 * enabled (PED = ‘1’,PLS < ‘3’) state.
+			 * enabled (PED = '1',PLS < '3') state.
 			 */
 			portsc = xhci_portsc_readl(port);
 			if ((portsc & PORT_PE) == 0 || (portsc & PORT_RESET) ||
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index cc916ee3cb71..7a21ac81f9c8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -2084,7 +2084,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 		       addr, port_offset, port_count, major_revision);
 	/* Port count includes the current port offset */
 	if (port_offset == 0 || (port_offset + port_count - 1) > num_ports)
-		/* WTF? "Valid values are ‘1’ to MaxPorts" */
+		/* WTF? "Valid values are '1' to MaxPorts" */
 		return;
 
 	port_cap = &xhci->port_caps[xhci->num_port_caps++];
-- 
2.43.0

