Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494651;
	b=L8Hn5tqlnNQJA1ShxSZYG2gPdK5cqhAD8dZIA+N7mYNIJ6h1lagcsHjeV4iU7nTXpUTe
	 DcwBk4HV+4TDpZNHWc5XWKBciVMTETk/VYSjOD3a11VR/1jvH9G2kC0GuyTtL21vfM9tJ
	 LO1dAh3JOxoMnxPW+xIXzuMgXa0YBLinphJnA2Dt6BcIj0LfkqG95kKb/gQbYVjcUg4hd
	 YbVoEx3yh39RU5E66xEY/uy1zcCoruMMEWlcHPQ5DFNXjESTx179TRaCzP3F5kiF2dS6G
	 aCUQitmFNxNv4MjRME5AZ1NhmU01cx759E8VF5f8ziDXDyY3R2yG2fPWUiRvTRcy5qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
	b=n0rnOY1CoPajgIg79iX0STEzJIsH4GsHolBiar7MgU5Fyws9CvBoRfA+7DKJVPiK9M+b
	 qdENysbhYH9M8eDHzMVJRRBf8wArv4ejGpblHtm/0//g81T/JkNYT2M/kUD0d9XpfbJd1
	 GFKpqHT2qqXhBnDBes49nRR9OtF36B4P8fSNBWUSyIoce2mgX9vUkf1abvJGISEPspVbD
	 ecFp8l8S9+B3CH+p/GgggSLmzw2xLJzHh++OevqVoiqeLeCI03OAdGto7em2dfLQkgl+b
	 o73NmDdwFzBJ3wEP490WMQPyirlF+5Lh1D6v+1meYL5zdmW/EpgmcQr9HbYte23g1+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KvdhDkyi;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527A606A320
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 11:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8527A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KvdhDkyi
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9f6a16aedso10360355ad.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 04:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792494651; x=1793099451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
        b=KvdhDkyiKt24B89298Nv3o2nKb5PHR7YwyPPFoFuKwn8pG4lX4LsmZPG8ApGuokDT5
         IFsEeiCde2oGjC6spf/eRXzTupqC8N7+8DzxSn9tnYYoA6+jsAXe023MVhdyMRE4YM2l
         hrgzi/YWzNOMSfiJCZUzvJxyNUc8zftwiyFCCp4x072YwjIQynV0x2118FTszFIv4r8c
         O7Lt6UwxixNBaUHQSFRlu4U91mFAiAuvdiw2mCAW1OTvxvekgLkoPIBiaJfwHkX19euW
         mynHU5mhjnZhRi40uIU0vuQ0Arx5La2ECPaJquau56k8MtQpbrskiZIUqwD5xQUPCOpv
         AGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792494651; x=1793099451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RdVdlZMnqwAaBg/AE1elJnERFjptDc12NUziXfH9GT0=;
        b=KYjV0TFghF4Fm2o8JXTSOsC9wXaZzzlQt9ojQDQy3jhpcBlUrmbILIBk4emdcUfhgD
         DIMxcFdYSdhtgxbJnnXt7XTFmg2ozwSp9LatOsL43xw8zGODY23AypUx/oebHqI4j3As
         fvm+UlDiyk+83Am9vdibr0xtTybeYhTd+qJJ8GMNabOXitSH5Bz8E/iiLqedFJ9vA5xa
         WJw5gPgM5WeRyVdxrbh6QKZUfLRBTKrIa0bak7vxr/WpeuFn+LLxYekuIoxnrySICyTn
         SDU43TC8ydX+6XhLleUSGQftW56ORThTV4g87tiC8ikdMAqjtuzEoZx0BHS6T6iuskem
         NdTw==
X-Gm-Message-State: AFq9FYIUrK9G9w4tMC3L0WMJ0+4b4ANDE5bxtwGGEJr3cQsMucqOZVph
	l65wi0gPD0T5iDLOVGyrHUDQIraRcnj8eQQ10sGq2Rgg5J2wUJi310I+
X-Gm-Gg: AYBFou2TcwcguuNIeLg2Hjc8EKpQXFf5f/B0qhilqXuCnlzVeidMxN+GhIRxfIvPO6y
	oQnapqDs3Pra0VFyA/5blpB0foTSAOEhd+hJwncUnGtg1108PMEteAs4cAac0yvX5jP/rinzyyX
	COP21X6kLi6+8n2sz5XKma2AR7iN2okDAjOo9Tw6/DVbqbpx39r2DnyEAd+RM+lX5sjcfoyJrKi
	YVGYNyxTjw7TRoOLGb49v5nonykQVqNwH9i78eQxhrfGD/CBQtketiXL7XMWwHw+qUraBzmKGBc
	ys732cA9hM5nr5ecMTK9JpxsUHJasv6nN/iZSYm+lqkg27JGL4PZF9P0mifMnk2836eD8Aegx2W
	VPvacKiTS9ioqOevdckrGGc0Ladzy65BXpq3OmBVDlg7T7dJTaN5jdfOvSIQqnTiH7p8oXVDQGX
	fXFNtYQrrjDPf6evNxh3/jEACIUxRI/bf4H/O9ytCfjw4rruRsOKqO2ifft7s6Rc/jdw+/UJkSD
	vTF8B+uHnWTkdbLRsWJfwUv4ocB0akeXtC0ItPOFzLBhE2ywYkKc0Gi40ZOjUAoFTZSJOwz5BvJ
	KGjBuTZvFPTzC8jmwZ7nADBN1J0He9RbHPrGSoTUxk3/q/clLLl+ChMu/o8CjABbJAUebfcJrGy
	qU89J3yjsrewDiQ3LANXB
X-Received: by 2002:a17:902:d54a:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2e9a6e46983mr89263625ad.44.1792494650815;
        Tue, 20 Oct 2026 04:10:50 -0700 (PDT)
Received: from 7cf34ddc0813.ant.amazon.com ([54.222.46.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501e269sm10812285ad.46.2026.10.20.04.10.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 20 Oct 2026 04:10:50 -0700 (PDT)
From: Jiazi Liu <jiazi.liu1984@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guanyulin@google.com,
	liujiazi@amazon.com
Subject: [PATCH 1/1] usb: xhci-plat: keep IRQ masked while HCD is inaccessible across system sleep
Date: Tue, 20 Oct 2026 19:10:35 +0800
Message-ID: <20261020111035.25365-1-jiazi.liu1984@gmail.com>
X-Mailer: git-send-email 2.54.0
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

From: Jiazi Liu <liujiazi@amazon.com>

xhci_suspend() clears HCD_FLAG_HW_ACCESSIBLE and halts the xHC, but
the interrupter stays enabled and a pending event is not
acknowledged. The PM core re-enables device IRQs in
dpm_resume_noirq(), before the resume callback runs xhci_resume().

In this window a halted xHC with a pending event keeps its
level-triggered IRQ asserted. usb_hcd_irq() returns IRQ_NONE because
the hardware is not accessible, so the IRQ is delivered again and
again until the IRQ core reports it as spurious and disables it:

  irq 121: nobody cared (try booting with the "irqpoll" option)
   dpm_resume_early+0x90/0x300
   dpm_resume_start+0x2c/0x50
   hibernation_snapshot+0x224/0x488
  handlers:
  [<...>] usb_hcd_irq
  Disabling IRQ #121

This was seen when a hibernation snapshot is taken right after a
restore, as the restore leaves a port status change event pending.

Disable the IRQ in xhci_plat_suspend_common() and enable it again in
xhci_plat_resume_common() after xhci_resume(). Skip this if the host
is a wakeup source, as it needs the IRQ during suspend.

Signed-off-by: Jiazi Liu <liujiazi@amazon.com>
---
 drivers/usb/host/xhci-plat.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 074d9c731639..74a56f18de3e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -478,13 +478,22 @@ static int xhci_plat_suspend_common(struct device *dev)
 	ret = xhci_priv_suspend_quirk(hcd);
 	if (ret)
 		return ret;
+
+	/*
+	 * Mask the IRQ while the HCD is not accessible. The PM core unmasks
+	 * it before xhci_resume() runs, and a pending event on the halted
+	 * xHC would cause an interrupt storm.
+	 */
+	if (!device_may_wakeup(dev))
+		disable_irq(hcd->irq);
+
 	/*
 	 * xhci_suspend() needs `do_wakeup` to know whether host is allowed
 	 * to do wakeup during suspend.
 	 */
 	ret = xhci_suspend(xhci, device_may_wakeup(dev));
 	if (ret)
-		return ret;
+		goto err_enable_irq;
 
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		clk_disable_unprepare(xhci->clk);
@@ -492,6 +501,12 @@ static int xhci_plat_suspend_common(struct device *dev)
 	}
 
 	return 0;
+
+err_enable_irq:
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
+
+	return ret;
 }
 
 static int xhci_plat_suspend(struct device *dev)
@@ -523,12 +538,12 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (!device_may_wakeup(dev) && (xhci->quirks & XHCI_SUSPEND_RESUME_CLKS)) {
 		ret = clk_prepare_enable(xhci->clk);
 		if (ret)
-			return ret;
+			goto enable_irq;
 
 		ret = clk_prepare_enable(xhci->reg_clk);
 		if (ret) {
 			clk_disable_unprepare(xhci->clk);
-			return ret;
+			goto enable_irq;
 		}
 	}
 
@@ -544,6 +559,10 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 	if (ret)
 		goto disable_clks;
 
+	/* The HCD is accessible again, pair with disable_irq() in suspend. */
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
+
 	pm_runtime_disable(dev);
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
@@ -555,6 +574,9 @@ static int xhci_plat_resume_common(struct device *dev, bool power_lost)
 		clk_disable_unprepare(xhci->clk);
 		clk_disable_unprepare(xhci->reg_clk);
 	}
+enable_irq:
+	if (!device_may_wakeup(dev))
+		enable_irq(hcd->irq);
 
 	return ret;
 }
-- 
2.54.0 (Apple Git-157)

