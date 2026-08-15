Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38F396588
	for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 14:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786804375; cv=none; b=OSLEFcRVe9Si+pukwP1amNmCAXuQ2ngz3IoBDpFxg3exWvjWgyS9x/YVSba5mC+8j/k2cDfnAdWClqJkLbadL1cMR2JcQuf/P7HiXxIQ9DYi/BQ3yKFg+gv7E68AL/Q1Q7K8KWKjUSjsjZtRKMBurSV0owkbPv8ZygKXV19soxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786804375; c=relaxed/simple;
	bh=w8casfbUY+n/o3USf0Anm7PszBhYVrrI/iO0pzYrd7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nki8RomWeB/74b+cOYB1za4GFlQKqv4SQcvCyPUVzlfJur1Oy7C7FHBebcabXmPsuaJKbB13zdIA+zAji3EAjoLjOecS3I5n2CL2yMxPXmOmPJy5/v/uEPT1hZP0zAuvM+p+AiScfve7A6QXM1ToylMG1oqboQH5eXUHkvJ3KZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbYKtxaO; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbYKtxaO"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1804841a12.0
        for <linux-usb@vger.kernel.org>; Sat, 15 Aug 2026 07:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786804371; x=1787409171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rGXa9+fEFOBNrPTOFjL1GNNQ/ydcZrlZP2RFSrg+7+4=;
        b=dbYKtxaOGxg/w14kQIPh3VEYuWizDeqll/0wgomwL9T8zDmfRyB3FoZfvfGjkLiRuQ
         H8oPr0b3UpfSjCBJ5hcDK0LM/3su8AaDKo04wrfb6U87U3dD8LPEp7mpiy30AHkmvZiW
         /GsOecFDSGt4NcpvL5R2r0UjYZCfNNpHXjPjZEhHbLSydDbudJGimmoxrIQ9lTKxTmn4
         wzPJLNnSFLlYTa6Y0HYbF0E8qEReQHsqVJ+xactSv1E7exnbdVLlWFoisB2RR6oyGfN2
         12VjwexZykhOqNcXYf5UuKdEYURwxjgVAMvrYONxvR6YOv1D89jD4LVeon4NqZWGR+Bd
         utPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786804371; x=1787409171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rGXa9+fEFOBNrPTOFjL1GNNQ/ydcZrlZP2RFSrg+7+4=;
        b=fUk1U2sfDYxEWHODFiVq4x1NLGYfy5ISW8G9Bauz2ULg4gVPkoQxkZkzvod+aIxTKm
         nbt0ugfx64GkEPhreZylE7HeHa6XcJ46RasTyp2dkDbATl4gMFkSJ9ZlcPGQfhd+b4Hj
         JCzRmirWsLE+IZvvLPdSMVhLhXMJBTjnRRNDJzvTcON1Hh2p88Hvf5iBaspyLGr3ULgc
         g5Zmgxt61seS+FQvoy+jlhRs41r28BjwTDraLNwSem1+Fg3OUj6NwkNjzAdAtal4kMEA
         H4cmSOADx5ETdkdJ+mAxh1nP/2bcVLgAGQoiugxhp3bwOPt2u3MRGmKvsmNOve5sB2JJ
         MqFw==
X-Gm-Message-State: AOJu0YyRGk5SkR8aTt5fFuL2Y696RGdnceb6ZtKe7dlj1QKkcfPpLVO9
	t908MVwivyImV3FFcatsNvohWA4tZYdIVt3VSapeupFpWkUrYAHe5xw0
X-Gm-Gg: AR+sD13XnZ6HvCNN2Xn9A8oMD5kS7zbiNjpp0y8dzclpVLVHWFHuWWBaYC8dwuPfD2r
	v3TldPIBS58X9oHda7D/MlqxZYLK+h811q3Gl3IDoL82xyVpu39jKgWOcAqiK7CU3kxS/jOcb82
	fYiHRV5kigdLIGOX34eiMLbeLh6ucThvztELVSXAF0ZFqk/HXmkFvBNvo9S0+msOrw27BUEjNI6
	lLJZW1ISDLaI7zyVLhrXCMzLkDB4dyQOufMSpUonErfgL9LU1iSwpE1IQYdY1A7MPeURuzxUyC/
	7f2X6KlcCxv2vPeNPSGXenV8vkqid6nCSub12qXZ+HxfKSZULGeer/tq7vTcAL8U6u+YOvjbEdu
	ieoDG+u07CrNJKqwmDHoROd/2p3FFHWH781RcCulaSCSKWlv6RN1sDGWRA84qV2a9TK9b44oqpV
	D4+vuTIUm6mu9jF/r0J1OL6tSMfMIOmaILIRgtIesbvupjmO/P8NuhfnFJ+XU+VoTtOjD+3OBkp
	EMY6OCK3GyDOHyxYO5GoBSlYlkZIQX0NBZvOVTaeoz8NjHrhF8EDw==
X-Received: by 2002:a05:6300:670b:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3cc71a25202mr15834807637.3.1786804370950;
        Sat, 15 Aug 2026 07:32:50 -0700 (PDT)
Received: from deepanshu-Legion-Pro-5-16AFR10.. ([2405:201:682f:383f:23b8:ec2e:1238:f3ad])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d66e52d2sm16304068eec.13.2026.08.15.07.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 07:32:49 -0700 (PDT)
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
Date: Sat, 15 Aug 2026 20:02:41 +0530
Message-ID: <20260815143241.19047-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master


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

