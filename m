Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155F3E92A9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939744; cv=none; b=h2dwAyryf+WHCHo23Nqvp/fxs1fVetzn58r/xMCTYlfWyG+7h9ystjwr+FGPns1iFDPZrXg0aTCzEHzu1n+cf452pYq0UbOUFl2cOA9zzh1Azh0rtaqxvVIoUBngnZk15BoLa57R/6soPui4V+vXhjExX1YrfU5bFQpc2PJGgCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939744; c=relaxed/simple;
	bh=fP6XyNVBNW4mz9tR4qida/MBLe3Uag7ERlG1NhRzgDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vurf1WYFLGVQrxFcFoL91iFt1BPMapVVJXNbCRmcuTASLYrzSwDQg6mc470O35RmT/qlZkMGdfUxxP9zrFGxcsr+Zesuk8S/B25OsAdsV5XxH0Kr1T4VamP+0FlK5uKlqSmGYOzvVens8NY32tjdcuGQuPJjXtgrqdpAcf2fUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iN4ed13A; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iN4ed13A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783939741; x=1815475741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fP6XyNVBNW4mz9tR4qida/MBLe3Uag7ERlG1NhRzgDk=;
  b=iN4ed13AT+g12Wm7vXcMKwaW65poaFMWZAjCeHjlBV8hCugWOAHn1gDr
   zMEeEG3ttBbzaWnvNFWgrisX1hdZqsroDrOiahsNQK9UWn27b27ml7vnM
   NIOBfoAVkxEhHmyYH2mjSVggie8eMAZzc/LZYpI50+9P8YSj75dCkQzkj
   GSgf887s9xMqSR0MpDEpTSXCpEKbSrnSMFnECdinXPCRVsmB/4RP6Qzu2
   e8U+iJzhTFNynIq3VokH1g+NIOAK6R5CNPJ2h3Rh/6VWG+YRq9ZG1OgO1
   jk99U79fzZ87wIzz6UlccHN6KZT1LVtP7AsRP0nQTrT/Nu7AGTwPQXTsF
   Q==;
X-CSE-ConnectionGUID: 7LEJFhssQ2iCZD0S/uph6Q==
X-CSE-MsgGUID: 8fbjvWY+RlOPlUqyBekFWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="96057042"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="96057042"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 03:48:50 -0700
X-CSE-ConnectionGUID: tcu1nYPoTAOisQ8u1FLSkw==
X-CSE-MsgGUID: ijyo6hCzSi+GYkdvW1DSnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279928985"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 13 Jul 2026 03:48:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1058)
	id 5D78595; Mon, 13 Jul 2026 12:48:48 +0200 (CEST)
From: Niklas Neronin <niklas.neronin@linux.intel.com>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: [PATCH 17/22] usb: xhci: preserve RW bits in xhci_port_state_to_neutral()
Date: Mon, 13 Jul 2026 12:47:31 +0200
Message-ID: <20260713104738.629612-18-niklas.neronin@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
References: <20260713104738.629612-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xhci_port_state_to_neutral() prepares a PORTSC value that can be
written back without changing port state by dropping bits with
side effects on write (e.g. Read-Write-1-to-Clear).

Currently the helper preserves Read-Only (RO) and Read/Write Sticky
(RWS) bits, but omits standard Read/Write (RW) bits. This does not
currently cause issues, since the only RW bit, Port Link State Write
Strobe (LWS), always reads as 0 and ignores 0 writes.

Preserve RW bits as well to make the helper consistent with its
intent and robust against future changes to PORTSC definitions.

Update the function comment accordingly.

Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 111db70642b1..0375929aac70 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -386,25 +386,22 @@ static unsigned int xhci_port_speed(int portsc)
 	return 0;
 }
 
-/**
- * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
- * @portsc: u32 port value read from portsc register to be cleanup up
+/*
+ * Given a PORTSC register value, return a "neutral" value that can be written
+ * back to the register without changing the current port state.
  *
- * Given a portsc, this function returns a value that would result in the
- * port being in the same state, if the value was written to the port status
- * control register.
- * Save Read Only (RO) bits and save read/write bits where
- * writing a 0 clears the bit and writing a 1 sets the bit (RWS).
- * For all other types (RW1S, RW1CS, RW, and RZ), writing a '0' has no effect.
+ * The function preserves:
+ *  - Read-Only (RO) bits
+ *  - Read/Write (RW) bits
+ *  - Read/Write Sticky (RWS) bits
  *
- * Return: u32 value that can be written back to portsc register without
- * changing port state.
+ * For other bit types (e.g. RW1S, RW1CS, and RsvdZ), writing 0 has no effect,
+ * so they are intentionally cleared in the returned value to avoid unintended
+ * side effects.
  */
-
 u32 xhci_port_state_to_neutral(u32 portsc)
 {
-	/* Save read-only status and port state */
-	return (portsc & PORTSC_RO_BITS) | (portsc & PORTSC_RWS_BITS);
+	return (portsc & PORTSC_RO_BITS) | (portsc & PORTSC_RWS_BITS) | (portsc & PORTSC_RW_BITS);
 }
 EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
-- 
2.50.1

