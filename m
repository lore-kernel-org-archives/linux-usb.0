Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7BA30C637
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786804485; cv=none; b=fvgFVSRP+Q0BvjPz6eh9K8d90Dg1FH5Yn8h/jm4kqiBKePHiwQMnAEOcPlC32zoG93glwZc07WTGns9hOdj8PrkB+72ioOMbyKaz6so8eO56uQR6V+VgiBtEhpTpyOZMmia1Kk9ZUqimqDN902KQIBLkb47NcMlc+NmsWMI6gBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786804485; c=relaxed/simple;
	bh=8AAYfkIw/WPcobF9fvgpeSR3p+vRUhuIMV5BpImoUFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q/DoTXRtFE1MJp8Th6tv3rdQ7DFj1/yevudl8M6141j59t77CqOK1OUkExXHHKqmW1gfT90qiSCzJ/weuCc+5/tWdnHK5oMyXkExnu2y1XOZw2G7FeMSH5aCa2ierTbsnAJ7jSDNz0lDo/yBnnWRmvACR3wv450WHgfXPIBnQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDbofz1U; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDbofz1U"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1685657a91.2
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786804483; x=1787409283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mB13gFyb5oo+TFN7lavVIm84ZMLZ6Hndr2bjKO1MQL0=;
        b=VDbofz1UxV6ZZ8KnubVK0NWK/pWOiO588KQUehIdJhaj/xLx9pN1xRNTMBQ6zv1qtB
         7Rw1sbpJ6lIy/2TEGMzI6oTR1t+G0Ks/m2g30BtvMocYi9UGekt42UyPdQ7MpE2R/Y3x
         lx5MtuIFA7vlJHZCYi/R08vlIsCRNQuVb/eiFbTBzqCKkWJftc0s8wOL8pydXuyVmYmR
         XvQsaZw8MN/NyTIOuT/gvoKpaTUI2tgBH7joCMs38FwjTddJI5Q49radDEfxSwCfp3F9
         kloYUBA6pD9dmBe3Ct3LKvSBeyQaiF5GT12veVTNZfHASYaU8iQcFEeqMLBFaKo167Da
         GnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786804483; x=1787409283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mB13gFyb5oo+TFN7lavVIm84ZMLZ6Hndr2bjKO1MQL0=;
        b=ZVsrXsvhYbLM+vp0vtAKAigZ7NIcl8I5z8Z7DF27uaHc5NMUc/V+8dR73PFhv7otVs
         rAKaMgYLYU+RKT9qYd5zUOPN4EsGA5l0DYFyikkuGpwDn6Xpqtw+GLqcjlkAJNbImuKq
         46BJanNNarB3doatXUDopsFq8Oeeuimq75NS4bDNOWJyxY98DEkLVHCgBINuS9ZpkXlz
         gT6WukiibeN3kskP6xCnqx4V9A+t73COOKzQH6KjlMDxZcVHeoYfcNOnHd4JKQeKIFiH
         O8AJV588iJBdgY3xXrpBw3QU2NjQr9aE04f1wZAvR5M6TMh4/Ce4luf98/cM+IIeQ0MK
         VFig==
X-Gm-Message-State: AOJu0Yyp/9dOxocFyQ/m5CKjMz1nsA6SnSdcP16//sgDZaDVFloQuxuh
	uPslwyGh832TNJHj3klz7PX/3dAlagtYt+4NNnSEB87E//btnORZw+eX
X-Gm-Gg: AR+sD132KEv0oTU/DUQ+XVHZREzxSXm8Jgp4ueXpfH6DrKD7zGCznFJPhRv8T0jEGfi
	qpxzETFoL5x/YxXOT80EZfPoeJ78SeiJIF4J1ho4tQsq8f8l7oZJdyzBvHaL6qzR7OSzPUdnK7I
	o5fK08WN6j8Wr62qm2LDXQZzjpW7xXf6dSnFsRIS654mIVNhXRqMcVTCnLvmyBwlGl0L+69/cls
	ALKlXUBB5PpZeKXUr2hCLvU1ycph+lXvQ8HpBX6kq/65UWu5jLTPaZCUNS6IvPHI3LOoBgWaajd
	JogxVgnbLs17wirRzi67+Uxq2k86F9hbiZhlsaVhmKaCUr6GiU2Fe36gnQ/zw6m8S2nPB84LN3y
	9l+eDS2csAQwLZFFbHf8J5jHQJqp9kM+rTFLW4IqH+ZX1bCWv4mjQ+AOzSTysmzcsAKxlyzB+5s
	7lkhSvZCl9bgV9lXz/c9IHwp+nAX8jEx7zUMNfmSnNApjD4vzjunOzIfSFLc8oVOFXVWfDAq2Uj
	1oaEEFlo4xRRhGcMEhuuZNFNpfMKF8J8r4PYMfg4bmykaJCmwnpqw==
X-Received: by 2002:a17:90b:3147:b0:38d:f5bb:e0f4 with SMTP id 98e67ed59e1d1-3933b6f1c52mr13670076a91.1.1786804483369;
        Sat, 15 Aug 2026 07:34:43 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:23b8:ec2e:1238:f3ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413889d914sm20498490c88.13.2026.08.15.07.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 07:34:42 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: [PATCH] usbip: vhci_hcd: move sysfs attribute setup into probe/remove
Date: Sat, 15 Aug 2026 20:04:27 +0530
Message-ID: <20260815143427.19066-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The vhci sysfs attribute group is created in vhci_start() and removed in
vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Since vhci_start() and
vhci_stop() run from usb_add_hcd()/usb_remove_hcd(), which are each called
twice, the attach attribute is live while only one of the two hcds exists:
it is created during the first usb_add_hcd() before vhci_hcd_ss is set,
and it survives the first usb_put_hcd() during removal. A concurrent write
to attach can therefore reach a NULL or freed vhci_hcd_ss.

Create the group at the end of vhci_hcd_probe(), after both hcds are
added, and remove it at the start of vhci_hcd_remove(), before either
reference is dropped. sysfs_remove_group() drains in-flight store
callbacks, so no writer can be inside attach_store() once it returns.

Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=8753715f05759f1a10de
Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/usbip/vhci_hcd.c | 66 ++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 30 deletions(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index 39e8faf4c18c..90f166f3ae96 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
 	int id, rhport;
-	int err;
 
 	usbip_dbg_vhci_hc("enter vhci_start\n");
 
@@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
 		return -EINVAL;
 	}
 
-	/* vhci_hcd is now ready to be controlled through sysfs */
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		err = vhci_init_attr_group();
-		if (err) {
-			dev_err(hcd_dev(hcd), "init attr group failed, err = %d\n", err);
-			return err;
-		}
-		err = sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		if (err) {
-			dev_err(hcd_dev(hcd), "create sysfs files failed, err = %d\n", err);
-			vhci_finish_attr_group();
-			return err;
-		}
-		dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd));
-	}
-
 	return 0;
 }
 
 static void vhci_stop(struct usb_hcd *hcd)
 {
 	struct vhci_hcd *vhci_hcd = hcd_to_vhci_hcd(hcd);
-	int id, rhport;
+	int rhport;
 
 	usbip_dbg_vhci_hc("stop VHCI controller\n");
 
-	/* 1. remove the userland interface of vhci_hcd */
-	id = hcd_name_to_id(hcd_name(hcd));
-	if (id == 0 && usb_hcd_is_primary_hcd(hcd)) {
-		sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group);
-		vhci_finish_attr_group();
-	}
-
-	/* 2. shutdown all the ports of vhci_hcd */
+	/* shutdown all the ports of vhci_hcd */
 	for (rhport = 0; rhport < VHCI_HC_PORTS; rhport++) {
 		struct vhci_device *vdev = &vhci_hcd->vdev[rhport];
 
@@ -1405,8 +1381,25 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 	}
 
 	usbip_dbg_vhci_hc("bye\n");
+
+	if (pdev->id == 0) {
+		ret = vhci_init_attr_group();
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "init attr group failed\n");
+			goto remove_usb3_hcd;
+		}
+		ret = sysfs_create_group(&pdev->dev.kobj, &vhci_attr_group);
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "create sysfs files failed\n");
+			vhci_finish_attr_group();
+			goto remove_usb3_hcd;
+		}
+	}
+
 	return 0;
 
+remove_usb3_hcd:
+	usb_remove_hcd(hcd_ss);
 put_usb3_hcd:
 	usb_put_hcd(hcd_ss);
 remove_usb2_hcd:
@@ -1421,17 +1414,30 @@ static int vhci_hcd_probe(struct platform_device *pdev)
 static void vhci_hcd_remove(struct platform_device *pdev)
 {
 	struct vhci *vhci = *((void **)dev_get_platdata(&pdev->dev));
+	struct usb_hcd *hcd_hs = vhci_hcd_to_hcd(vhci->vhci_hcd_hs);
+	struct usb_hcd *hcd_ss = vhci_hcd_to_hcd(vhci->vhci_hcd_ss);
+
+	/*
+	 * Remove the userland interface before dropping the hcd references.
+	 * sysfs_remove_group() waits for in-flight attach_store()/detach_store()
+	 * callers to return and rejects new ones, so neither hcd can be reached
+	 * from sysfs by the time it is freed below.
+	 */
+	if (pdev->id == 0) {
+		sysfs_remove_group(&pdev->dev.kobj, &vhci_attr_group);
+		vhci_finish_attr_group();
+	}
 
 	/*
 	 * Disconnects the root hub,
 	 * then reverses the effects of usb_add_hcd(),
 	 * invoking the HCD's stop() methods.
 	 */
-	usb_remove_hcd(vhci_hcd_to_hcd(vhci->vhci_hcd_ss));
-	usb_put_hcd(vhci_hcd_to_hcd(vhci->vhci_hcd_ss));
+	usb_remove_hcd(hcd_ss);
+	usb_put_hcd(hcd_ss);
 
-	usb_remove_hcd(vhci_hcd_to_hcd(vhci->vhci_hcd_hs));
-	usb_put_hcd(vhci_hcd_to_hcd(vhci->vhci_hcd_hs));
+	usb_remove_hcd(hcd_hs);
+	usb_put_hcd(hcd_hs);
 
 	vhci->vhci_hcd_hs = NULL;
 	vhci->vhci_hcd_ss = NULL;
-- 
2.43.0

