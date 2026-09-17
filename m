Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E86472092
	for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629716; cv=none; b=uvlbSwZauKDOgqALythmbVu2sYfB76Gyk0uRDRLuPKaLb2LL1ag/9bXkoEShrTkM9s0ZqH+uWLpowPg73q9pdrguQFu/GoQ6UwALRPyRjMAgS72krhh3LzfC8kQ+/rXgqkblefkTGLknXuXHg9iUEdwoMw1jCyT0x3JShfmSmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629716; c=relaxed/simple;
	bh=ahqybF+CoaWqNQIXOXeC+d4xKPdMtQTjWz8cWmIIvKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TK2ev9S5cAbvNOFeNXkuFI/qU2CfRHQxQceuQGtvFg21JqYAdx7CTDVFFajDFReLRiREiMiLX7tmltXO1U3rL49HxiYDmR2PQzT5/rx0q+NrAqhmR0USoR7pu/T9KZMa4PTrKdV35LuZW+ai56KRfZ1AXvKwtXfxglO7UuebPDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XspYJKGI; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XspYJKGI"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so4496435e9.0
        for <linux-usb@vger.kernel.org>; Thu, 17 Sep 2026 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789629706; x=1790234506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHmeCv/axEn0FU2l0O8zLPSyxFYmbwsqUmNzB3nLknA=;
        b=XspYJKGIc/4/1Lkgf3QrN+ZBqvmA2p+NMVTK6bZzqiI5POkKcd28ey5ocYfF/RYZvy
         NP+kAQYBPT5F1z9g+iAPPM78hm79gEzPC5EMzCNISRR2sDxxCAG/Aln3UQJV66Q8Uxkl
         w5tn/J506E5SFWP4bGqatzjE6EmgQ5R5vwmYDsg87fObkbdpOZ8haRRExpf/GsmaxRlw
         grlfIW8BqMq60Q/MuVmrq0xfL0AD+v9WnRCBkwNizqMGMIigL4v+LWUKO4a1A7Zj58WV
         qIOt/DRWl/1q82RzYLfNW4VyCiCAbrFn58pQcDzBoX0uwbY9HIhoZ0VlRBfqqQCo3uaV
         t3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789629706; x=1790234506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHmeCv/axEn0FU2l0O8zLPSyxFYmbwsqUmNzB3nLknA=;
        b=SxDLdHHP4U27HiWcQ721cKP7xfKwccBVk9aY9dDHFtLTHtEatoLv4athRmsAOTmxnk
         JGAHQL5oV0zxcy6ZTRWHLE4t8sIrsnKtsv7qGQNHbnQ1CQgcVNY71ljfzHmtQIgC2idu
         Zyzcm5AastnUzZBdZqi40urR2yzQHbvUq9k69MC/TGZBw3lY0gq7us4HJjZzNCKhyWNC
         nMFlQ5A0mbztPdCei6x9NXuEzt5L+EJKRr6+iv8JDYW3GzRcETQ+h7jYqR25czooJD+D
         T13FVL93wSSPpp//S4ydO34MR84nc/MQcg0yDRxZIP/FAoAtuulHqm8KYblfOl7dl4iV
         4BBg==
X-Gm-Message-State: AFuF++m2Ezrd0Mi5z3r1YTMPlAPnMOhYisuF33mTZHwXXFnuXlhYNMX1
	gGjpWfACeU3v0lU549MjriqqLn+62/SCQs7Kuup3ahhiepm1SfhzaPTR
X-Gm-Gg: AYBFou3Xc5LsHE/C/H9f2oLqlWLFwtEN7AzKQ2IWVDgm30UGIywQIHMGCD9Q1LyUJI/
	EiXoLjQrcIPc/3Q8JVD5of4H9I2Hc7FVbs+saQtfT+YxSm5qGywXu2mPY2F9/ZLCfHqvUSisFEh
	Zn7aPGPcSldG3YviMAKPdTdlEM+6DnbfCqCJK/kvmcPSuDFJ8Hi9XmnsNs4CJ/G8T9wFhXUrHmY
	tfBmRjk0lhuidUog25XwATc/EUNXVLwLami+hXs6sEyCgrxLOj1ZCA3rWn4cdDvKdD4Ta3s4vhi
	v3a5koiNeuzpBkZ4/qapsKA5rPP8ix7CqhAM7GM9RaWeE2KAax3yPMa+OFaEKg0wU/R0eVP5aaS
	BOikAnigdvUgph8YLte1rJasNVD17jaG5RsYLw6wBN9UOhhPbdfGwZByr8Zh68SQ+wXhkg1bx5c
	YP1UyRBS0iZIesrNQq2aCxxS+RO05UH8OLq7uuyjkOp0OSOtzUfpKY6yRlvE34bj/ENs30CrfO0
	KBkqWr8hhZM/DbqZ5Zx2wuKpftDa9/rDzePTjbXkrC4MFxQCgUDUy1D0tzoqOb9FZWdtB9JBUYT
	04TBygkvDV528UDb+g==
X-Received: by 2002:a05:600c:3b9c:b0:49e:74b6:740f with SMTP id 5b1f17b1804b1-49eb732e48cmr85513555e9.17.1789629705483;
        Thu, 17 Sep 2026 00:21:45 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd204c1asm50915035e9.4.2026.09.17.00.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:21:45 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: octeon-hcd: release the USB block when initialization fails
Date: Thu, 17 Sep 2026 07:21:44 +0000
Message-ID: <20260917072144.438023-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_initialize() gets as far as selecting the reference clock,
enabling USBN_CLK_CTL and taking the PHY out of reset (steps 2b-2e)
before anything can go wrong, and its only caller frees the HCD and
returns without touching the hardware. Both of its error returns
therefore leave the USB block clocked and out of reset on a failed
probe.

Release it on the way out with cvmx_usb_shutdown(), which is the undo
the retry path a few lines above already uses. It cannot refuse with
-EBUSY here: the pipe lists it checks are initialised by
octeon_usb_probe() before cvmx_usb_initialize() is called, and no pipe
can have been opened yet.

Fixes: 22bce6d2b3fd ("usb: octeon-hcd: fail the probe when the USB core does not respond")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---

The -EAGAIN return predates that commit; it has the same problem and is
fixed here as well.

Found by the Sashiko review bot on the v2 posting of the series that
added the -ENODEV path.

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -708,6 +708,7 @@
 	int channel;
 	int divisor;
 	int retries = 0;
+	int status;
 	union cvmx_usbcx_hcfg usbcx_hcfg;
 	union cvmx_usbnx_clk_ctl usbn_clk_ctl;
 	union cvmx_usbcx_gintsts usbc_gintsts;
@@ -872,7 +873,8 @@
 	if (usbcx_gahbcfg.u32 == 0xffffffff || usbcx_gahbcfg.u32 == 0) {
 		dev_err(dev, "USB core is not responding (GHWCFG3=0x%08x)\n",
 			usbcx_gahbcfg.u32);
-		return -ENODEV;
+		status = -ENODEV;
+		goto err_shutdown;
 	}
 
 	usbcx_gahbcfg.u32 = 0;
@@ -961,14 +963,27 @@
 	dev_dbg(dev, "gintsts after reset: 0x%x\n", (int)usbc_gintsts.u32);
 	if (!usbc_gintsts.s.disconnint && !usbc_gintsts.s.prtint)
 		return 0;
-	if (retries++ >= 5)
-		return -EAGAIN;
+	if (retries++ >= 5) {
+		status = -EAGAIN;
+		goto err_shutdown;
+	}
 	dev_info(dev, "controller reset failed (gintsts=0x%x) - retrying\n",
 		 (int)usbc_gintsts.u32);
 	msleep(50);
 	cvmx_usb_shutdown(usb);
 	msleep(50);
 	goto retry;
+
+err_shutdown:
+	/*
+	 * Steps 2b-2e above selected the reference clock, enabled
+	 * USBN_CLK_CTL and took the PHY out of reset, and the caller only
+	 * frees the HCD, so hand the block back before giving up. The pipe
+	 * lists cvmx_usb_shutdown() checks are initialised by the caller
+	 * before it gets here, so it cannot refuse with -EBUSY.
+	 */
+	cvmx_usb_shutdown(usb);
+	return status;
 }
 
 /**
-- 
2.47.0
