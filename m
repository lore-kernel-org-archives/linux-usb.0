Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A5537EFE6
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477914; cv=none; b=AB2Gnz07JcFgbJJFfE1RXQe0YBjDkZqyiYBo3/1X8j/uUcLCAm5zUMIgog2FFZICMtzuwDBjXSmegq3YLxcDPT5ljT68krbqiofgTcBezxkSyxT+vgAG1noeXDKlGYXEj1Y30kAiNN60uZCDVNtxXKWF8mgbi1zvNUptn/y9LWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477914; c=relaxed/simple;
	bh=tImnEfZuaGmplpsOsUFhMB4cTSJyETBfdEfptDL7bOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMpbPgK+rspvoifSScD96U0zmvQ4CvTZJJ39eFR5ZI8lHCUqeqndtxmsACS4pipLD8T9AKMkvMsxjot3V2n7KD1SybmjMqtBFEwFAmsQrC3O5DpIYI+KMzXHM61gv1FKP58WhktZioQBfpEpQ8Hr9611ucAe0TbbJ339dz83bEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GQx91vf2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GQx91vf2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780477913; x=1812013913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tImnEfZuaGmplpsOsUFhMB4cTSJyETBfdEfptDL7bOk=;
  b=GQx91vf2+JSfmkyEOWyxnvQsSeUzZksCMjMZhQ6XtN+0MSG+CleYAvcU
   NSqZW6DNKBpG0WEpKiY00ZnyNuief6hn/w6/ozmOSWVCcVu0LgXN8BGyt
   VD8rWw0KfZv09/LSx5TjRnF0YXYMkosrtM3XqwjccJsRR4tyJoOxpk6GI
   08EGFvfNM6wp62RSTU6uh3yXOBDD+aKEQ8vFux3xk17AyzzvPSJ0bR9Ul
   eXS/Nx2smGJpUzoQ1/O9ecEHQuL11QmN7crAY9JEJTquj858K8ZOL79MP
   XqH22yWUZqWZrdPApsi2xoG5CvtLKjc9VMSZIcYLKKuA1n+kFcWxkNyxZ
   g==;
X-CSE-ConnectionGUID: rZrfE67dQrSLMVeIujOwBA==
X-CSE-MsgGUID: 3YcVuBnkROWabozHOjP0hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92657515"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="92657515"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:51 -0700
X-CSE-ConnectionGUID: Xx4t5Dl7R++6cHM8OfAGQw==
X-CSE-MsgGUID: fzRDwh43SQaScZVikk0inQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="244281774"
Received: from slindbla-desk.ger.corp.intel.com (HELO mnyman-desk.intel.com) ([10.245.244.174])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 02:11:50 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 01/15] usb: xhci: fix typo in xhci_set_port_power() comment
Date: Wed,  3 Jun 2026 12:11:18 +0300
Message-ID: <20260603091132.1110849-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
References: <20260603091132.1110849-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stepan Ionichev <sozdayvek@gmail.com>

Fix a spelling mistake (re-aquire -> re-acquire) in the function
header comment.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index bacd0ddd0d09..712eaf330a76 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -639,7 +639,7 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
 
 /*
  * xhci_set_port_power() must be called with xhci->lock held.
- * It will release and re-aquire the lock while calling ACPI
+ * It will release and re-acquire the lock while calling ACPI
  * method.
  */
 static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
-- 
2.43.0

