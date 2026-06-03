Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ABD37F8DF
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477928; cv=none; b=EgC3cIScUNVDM1Jg6EZdRgktnupTyknMqAQnNwtvN5ZjEtNJZdGhtiqCF2/RNBLAwmB/Nl45ZQSwTelNMzq8tP6D4sJ6fgkiqlLgrXUmXYwrEYc1YJuXwpAbaGpcAEOh6cKjMufQ/YKOj9Du+IML33K7kJbn9AUaozLjGBYaMto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477928; c=relaxed/simple;
	bh=Kkw8jBlu/7GinRagJeh88Fn0zPYz0c5tXq0s4Ihr020=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEa5YH/l2no3LuFaKrZoCR2iTHset91yL7mU9Kr8IJPcCJt7yo0aG8eYfJg6/JZinmaZSMQfXd+y5f+/DyK51Mxw+LLKPAs2UD/IFgpdMKn62rHfbD6Moek6y3ygKgu4chy8Mof+oDy6K00VqTb/MC417nHLw7SM2qo7dAgZ694=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGs5oK5o; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGs5oK5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477927; x=1812013927;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kkw8jBlu/7GinRagJeh88Fn0zPYz0c5tXq0s4Ihr020=;
  b=XGs5oK5o2XwbAKZ5Sc/IrzU1AWoysYC4EjkyRnXEC7WTWRYM6XKxL2Hn
   uotFkf639CY/Az8mwZFwxto6AxEhlpIePUXTmmvdfSmB8Gm88H1741LSY
   tAU10bNCHoFI+Tmg6NRi7WfjoTSXC15241RN6LAFGX1x/voZHwZ28s5i9
   nWEYxNlRCah47kCTFankTeUcep9Tp/vchUgsZ1XpHBk0KSIoTrIGYc9NU
   L/gLcYIjkUS674vCJNgl4TGWxb7Tjh8lHAlq9oIZPwwCDhM3M2XrCe5lx
   Q43IQQQOxBFtYHhgs4H0YJEg1PJ9gYtp9JyR8EzDFqD2qJKxVnXYXsg0D
   Q==;
X-CSE-ConnectionGUID: wm0xW0JmTCaHKQ+LsU+ntw==
X-CSE-MsgGUID: fcRRPEJhS16UtHtRsZfJHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657595"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657595"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:06 -0700
X-CSE-ConnectionGUID: uLnMGEUBSjqTYYjjkcEXlg==
X-CSE-MsgGUID: /TnEDYlQTjCAIaNPVhTTvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281998"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:12:06 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/15] xhci: dbc: detect and recover hung DbC during enumeraton
Date: Wed,  3 Jun 2026 12:11:28 +0300
Message-ID: <20260603091132.1110849-12-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a timeout between the detection of the debug host connection and
the DbC Run transition to ‘1’. Toggle the DCE bit to re-enable DbC in
order to retry the debug device enumeration process if the DbC run
transition takes too long.

Set the timeout to 2 seconds

See xhci specification section 7.6.4.1 "Debug Capability Initialization"

Also detect cable disconnect during enable and connected state.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-dbgcap.c | 28 +++++++++++++++++++++++++++-
 drivers/usb/host/xhci-dbgcap.h |  1 +
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-dbgcap.c b/drivers/usb/host/xhci-dbgcap.c
index 34441ffa5e15..b1cabf5582fa 100644
--- a/drivers/usb/host/xhci-dbgcap.c
+++ b/drivers/usb/host/xhci-dbgcap.c
@@ -901,23 +901,49 @@ static enum evtreturn xhci_dbc_do_handle_events(struct xhci_dbc *dbc)
 		return EVT_ERR;
 	case DS_ENABLED:
 		portsc = readl(&dbc->regs->portsc);
+		ctrl = readl(&dbc->regs->control);
+
 		if (portsc & DBC_PORTSC_CONN_STATUS) {
 			xhci_dbc_set_state(dbc, DS_CONNECTED);
 			dev_info(dbc->dev, "DbC connected\n");
+		} else if (!(ctrl & DBC_CTRL_DBC_ENABLE)) {
+			dev_err(dbc->dev, "unexpected DbC disable, xHC reset?\n");
 		}
 
 		return EVT_DONE;
 	case DS_CONNECTED:
 		ctrl = readl(&dbc->regs->control);
+		portsc = readl(&dbc->regs->portsc);
 		if (ctrl & DBC_CTRL_DBC_RUN) {
 			xhci_dbc_set_state(dbc, DS_CONFIGURED);
 			dev_info(dbc->dev, "DbC configured\n");
-			portsc = readl(&dbc->regs->portsc);
 			writel(portsc, &dbc->regs->portsc);
 			ret = EVT_GSER;
 			break;
 		}
 
+		/* Connection lost */
+		if (!(portsc & DBC_PORTSC_CONN_STATUS)) {
+			/* covers DCE == 0 as it also sets CONN_STATUS to 0 */
+			dev_warn(dbc->dev, "DbC connection lost mid enumeration\n");
+			xhci_dbc_set_state(dbc, DS_ENABLED);
+
+			return EVT_DONE;
+		}
+
+		/* Enumeration timeout */
+		if (time_is_before_jiffies(dbc->state_timestamp +
+				msecs_to_jiffies(DBC_ENUMERATION_TIMEOUT))) {
+			dev_err(dbc->dev, "DbC enumeration timeout, re-enabling DbC\n");
+			dev_dbg(dbc->dev, "dcctrl %x, dcportsc %x\n", ctrl, portsc);
+
+			/* Toggle DCE to retry enumeration */
+			ret = xhci_dbc_enable_dce(dbc, false);
+			udelay(100);
+			ret = xhci_dbc_enable_dce(dbc, true);
+			xhci_dbc_set_state(dbc, DS_ENABLED);
+		}
+
 		return EVT_DONE;
 	case DS_CONFIGURED:
 		/* Handle cable unplug event: */
diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
index b3efea43a6be..df7aca8bfe99 100644
--- a/drivers/usb/host/xhci-dbgcap.h
+++ b/drivers/usb/host/xhci-dbgcap.h
@@ -113,6 +113,7 @@ struct dbc_ep {
 #define DBC_POLL_INTERVAL_DEFAULT	64	/* milliseconds */
 #define DBC_POLL_INTERVAL_MAX		5000	/* milliseconds */
 #define DBC_XFER_INACTIVITY_TIMEOUT	10	/* milliseconds */
+#define DBC_ENUMERATION_TIMEOUT		2000	/* milliseconds */
 /*
  * Private structure for DbC hardware state:
  */
-- 
2.43.0

