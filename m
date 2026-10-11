Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0116B388876
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 07:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703363; cv=none; b=jAMs3ZtIcxSTJB/zI7xEVeo4fbaw6HSUEqFF/w0ScOk4AHz26q1DmjS2/+AX74SF78liPh3eUiGkw63Mym6nnMN6/iIMCrz2ba8SiD7B6wDfPtUjlNRmKmF89iAUC1Tdcxc7xO8PTyWAHSilBH+FOpNntqiXmiORJLithSm75xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703363; c=relaxed/simple;
	bh=7IaH1fDScdtUOjn5ISzYZXJrKHd6fpsN6hhLPO1szbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3MblG4ny/mXZ0IDq866TlZxYN+VULuJdVL7sj3fX+5JOUGRlRv8/+aSdWp0fBfwGknUy8acPrHk2vxmWDYvYi8h7mga+sEGZG3gXLTcIIhXVIoyTJVyX7w8OlkdT271LV7WRMqnM6oI4FvEbpCj8vbF2Yss3M3wQciNzKsvEAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrPqZR33; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrPqZR33"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so8495545e9.1
        for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791703360; x=1792308160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zRP7SN7vAPXBfK/XNlgDsuvSXkv2xgGrOBVOOO5dYUU=;
        b=YrPqZR33aYzzzaCtEODIvOOYGSaWhjMpNNPpHmffo3TcTS6pcHm6vNqLQ+Cqbsq6Dk
         QvVrxcFlELWqVdr07IVbXzPO8Ztwrm6NhzqrkkkqxY+/Lk3ABQwV8P7WMtIADVTaqcPD
         rFlFSzsoTRRM0sEC90RZtd5Qirp+VreifJkWcTG8S2qGEzAwPnDxSl4CDmiFfZDi3SWX
         I+EfSph3F7theBHjz0nNIF8hwlOdG99bbbSjwrqfqjMl1P246DlgzkV3mYNYGcz7mP5v
         Cv0Wy6HLyQLfWuJaMQDqJlcC0mi5Uw6LbRdPwra98UDMlc9hg5xgi2IwfthwfDaFK/9E
         b5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703360; x=1792308160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zRP7SN7vAPXBfK/XNlgDsuvSXkv2xgGrOBVOOO5dYUU=;
        b=GiHkjLP8FFh6S8fataYQMAzZ68e/uyt8IfSA2ZfqnJd7tvJ7ZtBkGjvpEuLi0rd/81
         xdVJmpFj+DXVX0C0HEXCz3UgayGD9ChOdH8kI81l3I51PcnH4mhF3CCT8AX5lhl/TJPP
         9rMOoVoBdDa30sF1FrUtDmhUIK2MfIljbQeV5kjBOHmYCqACHJSBKMIwVEYQGrH84D89
         DGjFBfoEhkzWSIVBtpvlD/U8l3i99YWbU5O22iWnSPHT64w+tsbKfw91jsGPGTXWWluj
         jr24GcsOhR4pi179lCLNC3A7TWoHXhLE6CACIlq+2p+0aoWEr8G6bRqQ9fAMq3NPCLmU
         927A==
X-Gm-Message-State: AFq9FYI6+BVO4m8/Yuj8nme+VJpE7wmIKklf5ZWQLbWTT+tHwjdNOjW3
	JNcYctele9hev7gJikgmCKmCXcDPrw/rTOWfSKlzAyFA0rHZIOuWCGhWkbLvS7bYyhw=
X-Gm-Gg: AYBFou2W6a2sON2R+DcV5a5/aBMVKnab0s1ZscMl3C+FDedVlMZ+tUiFBzI2JjIHHaB
	2V6hf57Rw8uvfUBHENwe9OznpQOxG/vECiPjL58RmrE8fxDWSpzsP3XKO5nVj+Ps/Jk4XHK/Qb8
	nQwixwLeOK4SDQ6i9jieyKNqmVUPOCgWv/VJHDdndeQ1iLUA5uVuoV7g9h0sn9XVCelKPUdNA45
	e5jyy76cBFyc80xcIAuDyeWrd7SKZuwwAhS8ukOSuZi1g17xjusQO08Q23tCYg07WQnjUajcyqy
	8FjHbjNmBBqvSO23ZvWb8EpMVXkGcniLSbPSEF9CNxB0w2SvS6lLdx9XJE7n8ORf4bpSei6szDA
	/AV0eSjDMGO+duKUrJT6fK437yjM4PoxTWmTJbv2NEsu42PuScHThZ80QwlsIL7omBfKYhCFrvl
	fs9YezPh211XTNyKVEnzI2fDj29nTjWt7km9+fQmD0tNSWMR3iF4QRlIgfUdVvHj7ObruZPJy1d
	IwFNNHpNJLdidWdjfhb9SOW7c2ELNIQoFOf2Egg9QPwj6jTZ+yIC6KZoOs2F5zMzGvE5ariUgbn
	h3BntmzX0bNkZNUx
X-Received: by 2002:a05:600c:3b99:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a18e48eeb6mr149058375e9.17.1791703360044;
        Sun, 11 Oct 2026 00:22:40 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd57fsm12434423f8f.37.2026.10.11.00.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:22:39 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: octeon-hcd: release the USB block when initialization fails
Date: Sun, 11 Oct 2026 07:22:38 +0000
Message-ID: <20261011072238.2381564-1-orgads@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Resend of
https://lore.kernel.org/all/20260917072144.438023-1-orgads@gmail.com/
with no code change; the Assisted-by tag is now in the form
coding-assistants.rst documents.

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
