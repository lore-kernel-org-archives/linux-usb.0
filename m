Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BD24A2E11
	for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 17:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853438; cv=none; b=D4CnZeXOmDu9uBimxBsya730jpE69tVgiZVHNUofdOXJ57AMjm0meNOQzDdccSlaYL0jBuvV6P6VD6XU6FriSOp8Nk7dqxuMEpHg4tdcq/kVKishdh61YThyRhYLPJ+8GdF4yOivjpG2HQMkTQeXAUwOnVis8acTf63lYYRVO8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853438; c=relaxed/simple;
	bh=DwpfIZ9abh0DNAFJiT1jAMoD2RZMfTzrkuxAF7tz3Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aJe086+ifYdEVYKpXxF7A34xVxROLPFrpKuCGWcu+S3+aFO+ic5tHbs9C8P0GfAZdmgdNq5X5D7zfRq30SMBHt27dZW7mkNBoRcP71Nz0GW62KAWseFC59njNIG3LN7tH3pDN0cMfRvyoXGI+JexRhioVkO4xPCBwT48eozdohs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLJOrilM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLJOrilM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so199345e9.2
        for <linux-usb@vger.kernel.org>; Thu, 27 Aug 2026 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853435; x=1788458235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CLDuvyO/Qczekuq8Y0r5RqsladhskyfTIKRYuENMqB8=;
        b=FLJOrilM4e07HosKRPSgs28LuqyzR7QINzM0+zc6L3de3cQJx+c6dSqIzyaLmK5Lxs
         wfgUuS/ruO7AASd9iIesBEQQ06pOkS4Kv0pF976s4xQm6PTt/ek1Zzbww2vGTrQpM4qX
         sFs3xMtSi0QucsUaDsmhLrGVtUwgTB/g1Gc2jAxV3JBT4NWX7wGvYBNN4ywSiIF+EFCo
         fY9Sxhg3er3u2xSRNsvlajRBBtLjk66+Gx7TK36KzVhZQ3kuj9jBJzfFrz//YPfHReT0
         8jdax1+bNp/49O1ASGcHFolPEf3ZRbGsZPmLHjussmQk9I16hBC/Tw+eYE/kgXPTY5gB
         oXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853435; x=1788458235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CLDuvyO/Qczekuq8Y0r5RqsladhskyfTIKRYuENMqB8=;
        b=sQFcIL49pXyEL15OfpNHD8yKS2/lab76Soa4aeYvL3nq/S2+YNHIgcQomVC5kZONEq
         y0qMXm6RYeCvFJ1LJJp6mQ2wTRFFiCc8Pp+I9JuJf4pnY9CYogU4znVowuPDT7M8BDWo
         fgq6EuTXPNviOea370yLxpEMhKJuJYDubspUF1w3xr13ZGOhtWpOBJl3ojNLNwFrzypO
         uEuzk3roYNtXTlLoW8DO/Tot8f4uQnUMhm6TM6FZsoUnVwvKcJo3FK+IMtvmn4Q2q2n2
         w7O4SnhtVm6IacUDNyhbMsvk+vVYvIc8bZoZDzZnM/IJpZNUVjA+rsXr7Zfe+ZJs0XBE
         il2w==
X-Gm-Message-State: AFuF++lSiLwxnU2QgeUgddn8hhSu++nA+zO277+NZj8KWt9ZQX+p8KNz
	51bScmOUrYslFi3h7VOTrPnB6FQKz4SwObpvMjFotWHsQsT3fpPC10LNK86uUA==
X-Gm-Gg: AR+sD13SB4xv1il/r0kebO5fA9nM+S/EWxB2J9Jh0Ex9zsMp7C03ZU9lMM9ddkX+yA3
	r/Gbi831qKMg7o+tTUoxGXRW6FFqBMUQAJT8IcQghEqnffaNf4MGFdsmSR6Cy9tVwVrJ+nDlX7T
	z8cSprF9e7VZqdnkUo1Aql3L4jXStfoBcJyXO77acDkGcYMGtEft3MStmg9IWpi+dLEcbvWFhDK
	WfNqKNz0kbh8xwOG0uR31GIRWF25ufza2D/onPrzQYWgCHIc7asvHNYwgRLTubT8OJQTLw+0Ocd
	c46AXs1FdIT3ipEp8+6nNcdBmSyaja/bPglq2fAZpSdFRGOEzeCtzhy+c+qE4lFzkcpFHrgiNj5
	mymQaJlsXwOKlqb+oQYsOkH+SbGRR7tLHI2hvl+b5iIPzbSrGl7l7WKlHNLKbEctK7n9pSMlh9h
	ZpDxl9nh3zfeALpYKjuTjEeSfr8uxd4WbVXTpzF4jk8sa15sjc4yKp6uko/VCTStNcr6Ci6dqFp
	0cHe55Vt3KGUj0CJG7FqNxjkptgIuXq5PXlxokZZhu4O+2lGIppJhg=
X-Received: by 2002:a05:600c:3b28:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-49b91c56cdemr10031975e9.14.1787853434420;
        Thu, 27 Aug 2026 10:57:14 -0700 (PDT)
Received: from il-orgads-lp.corp.audiocodes.com ([134.231.187.64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4961004bsm82921295e9.4.2026.08.27.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:57:13 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH 2/3] usb: octeon-hcd: fail the probe when the USB core does not respond
Date: Thu, 27 Aug 2026 20:57:01 +0300
Message-ID: <20260827175703.1549-2-orgads@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827175703.1549-1-orgads@gmail.com>
References: <20260827175703.1549-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the USBN clock/PHY setup did not actually bring the core up (wrong
board reference-clock configuration, for instance), every USBC CSR
reads as all-ones and initialization marches on programming garbage,
ending in timeouts or a wedge deep in the FIFO flush.

Read GHWCFG3 - a hardwired configuration register that can be neither
0 nor all-ones on a live core - right before core initialization, and
give up cleanly if the core is not answering.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -853,6 +853,14 @@
 	 *    USBC_GAHBCFG[PTXFEMPLVL]
 	 *    Global interrupt mask, USBC_GAHBCFG[GLBLINTRMSK] = 1
 	 */
+	usbcx_gahbcfg.u32 = cvmx_usb_read_csr32(usb,
+						CVMX_USBCX_GHWCFG3(usb->index));
+	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
+		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
+			usbcx_gahbcfg.u32);
+		return -ENODEV;
+	}
+
 	usbcx_gahbcfg.u32 = 0;
 	usbcx_gahbcfg.s.dmaen = !(usb->init_flags &
 				  CVMX_USB_INITIALIZE_FLAGS_NO_DMA);
-- 
2.47.0
