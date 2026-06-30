Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5F3B27D9
	for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782793049; cv=none; b=GVWBUSXSfR2/IRA9playvYno96tJC4spoBeZT67Ew1vgfvOJFKJXlhDbjmC08Ay7TgqKjeyv1v02ElZcxXbeyxdHh0y94mILHd3vsDBOapwfmgRNdlbrQMc5w3Bcuq0YOGuyKBnb6In+7yGE5+ONUF0hWMbjyZd0ooJtmTPOLS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782793049; c=relaxed/simple;
	bh=8u5uZUMqhrL/gnN85tqtWF3US52t+rBo+R6AWDwO5ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NUW+S8E52Z/t3fdT6ZbUiPFZIK9B10uR8oWNazPhct81cPRYWo07BYiuuItWzQlRpzDwNSwL4FapMEr0UvMshVhWPPvHd5TD2vrWCeKbDgLXdoiLO5Gsj6IeX4BEYK/wUtG6SC7PN0xtNQQ2f5xWxuFjW20I95P5WGpbWS5KZa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O323CP3q; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O323CP3q"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-139edc6bfc0so7642619c88.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 21:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782793045; x=1783397845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OjgHD+veL6Mrs93d7R3aSe1UX0mQg1cLxReyF2YhYPw=;
        b=O323CP3qFts6eay/77P5Bgbp0JoTIDQIXpTbAo5xG4OQTLtykzxJcwieKuJM0e1n/J
         4JHRHXVin4N8vfSQgj73907E9c/HawBqTLJg4mC0c571T7L6J5j/c+DJQEK1wdErE8IH
         Ahu+GHiD/KbCy2CLZFAszbcdQ29yWRq5nj+csx5CPpWcjWtxr3/UhpY/Nwz27FaisPgt
         2RaVmtSvHZQbDBZLPq/PrzIjlnVaj1aneagwCJSCLIsI8MuMtsUOBv81kAy1rZYAngIF
         axj2u3IfLqnQt7MmnKbjuCC3JLd35YjvptO7+XTYwKrmmgRMa/0cv074haxzdd8MNW5x
         GA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782793045; x=1783397845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjgHD+veL6Mrs93d7R3aSe1UX0mQg1cLxReyF2YhYPw=;
        b=GO0NFR381hfWNBERV9ZDVOnM9yQZvesG70tXJs7XWGRtDo4tMOsU+U7jw62YQCVqd7
         AftO+v0RD3FLSEJoF8q+G5xupBMIVxNMrqImVB9caYIKlMujUwQhuEWYCbVs48PkzmdR
         ArVMcM4Gnumm+o4quXjj5sl7lCmQ1TXFSE55VNNiL7gC38cUy0vk9a18JXHytif5d+Fe
         +xGefc/9UpkGGrfbWzLDaO2cXsgVuM9QoaZYUOpQYy5VCIcXv3l4wNSM53xSnzyJyl9o
         4GtVkvYNo+jqS1Xbq2+emzuLXfYy4s1uPPGAHOKO54/CTVBEoKkGSFB6qQCpYBNAZ5wd
         +QdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9NxTz847pp7qOGpGyMy61PTZ5eQrtfOr4Spunb/WUdprPONeTu5kRPIlnI4kb8wOZQLgFJiDhAUDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHJvPwp+smOD1aVao1fymbujlBV7PI2UuCtPftbClKAWoZ06s3
	QMAQ883OJtBEb+CFk+oJMhWFGqHJD6t54Drz1s3r+4quewyczXWh6gAU
X-Gm-Gg: AfdE7cmCFjcWeWyyzvBzO7gslAWoADpnBdJGU8JXQWHwyGfiFnmQ9KnozOduhc2c74d
	qA+XLeF2HfHtOuF1+GBkLctX6aaSKpyWYIS4kDGk16k9jVqQTslySuK/24qRbEZThElBhIvRE0i
	8M0up72ghVF2m4dtkPa3LZSnb8c4oZ9x/6rG76Mu5xieQlBoS68r8ZZ3PBe3f2nH+12OT3def9k
	a/HPZQ5DnCWrlMaZrpRgzJ6JElvu8v3ibmectIC80HXrKNMDBGS34vHUFK6krz78Q6wgw+3Q0xu
	wlbC7NLFt7CGEYScHtqzN9+Xhjo8PVGnHjgYXMlq8kdxd60CeBdakdai9TjfruVUC+zR3pRs5HP
	sE0skuTcrTnBpKsf1v7qgZq89cbdQj/ZPAqBI4pbOHC2gyHov0ClsNH4EZRzWymRXe08nOjDprK
	U5x10zopciNXAt5/8NEv0wdcxuBL70mxAdSXIJfXIaU7k7D7OG57U3HG3O1lBoCtAH1OSQ
X-Received: by 2002:a05:7022:fa0:b0:13b:20ad:b96a with SMTP id a92af1059eb24-13b2a1dd575mr1300904c88.50.1782793045226;
        Mon, 29 Jun 2026 21:17:25 -0700 (PDT)
Received: from deepanshu-kernel-hacker.. ([2405:201:682f:383f:bf30:8dca:9d63:c0de])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2a9b425asm3891062c88.0.2026.06.29.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 21:17:24 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: castet.matthieu@free.fr,
	stf_xl@wp.pl,
	3chas3@gmail.com,
	gregkh@linuxfoundation.org
Cc: linux-atm-general@lists.sourceforge.net,
	netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	syzbot+3d45d763d18796f97412@syzkaller.appspotmail.com
Subject: [PATCH] usb: atm: ueagle: fix use-after-free in uea_upload_pre_firmware()
Date: Tue, 30 Jun 2026 09:47:16 +0530
Message-ID: <20260630041716.97102-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

uea_load_firmware() calls request_firmware_nowait() passing a raw
struct usb_device pointer as context, without holding a reference
to it.

If the USB device is disconnected before the firmware workqueue
fires, the usb_device and its usb_interface objects are freed while
uea_upload_pre_firmware() is still pending on the workqueue. When
the callback eventually runs, it accesses the freed memory causing
a slab-use-after-free:

  BUG: KASAN: slab-use-after-free in __intf_to_usbdev
  include/linux/usb.h:752 [inline]
  BUG: KASAN: slab-use-after-free in uea_upload_pre_firmware+0x8d/0x640
  drivers/usb/atm/ueagle-atm.c:598
  Read of size 8 at addr ffff88802b0710b8 by task kworker/0:2/1664

Fix by calling usb_get_dev() before queuing the firmware request to
pin the usb_device in memory for the lifetime of the async operation,
and usb_put_dev() in the callback once it is finished with the
pointer. On the error path where request_firmware_nowait() itself
fails, drop the reference immediately since the callback will never
fire.

Reported-by: syzbot+3d45d763d18796f97412@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d45d763d18796f97412
Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/usb/atm/ueagle-atm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index d610cdcef7d0..686cc58fb89f 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -663,6 +663,7 @@ static void uea_upload_pre_firmware(const struct firmware *fw_entry,
 	uea_err(usb, "firmware is corrupted\n");
 err:
 	release_firmware(fw_entry);
+	usb_put_dev(usb);
 }
 
 /*
@@ -693,12 +694,14 @@ static int uea_load_firmware(struct usb_device *usb, unsigned int ver)
 		break;
 	}
 
+	usb_get_dev(usb);
 	ret = request_firmware_nowait(THIS_MODULE, 1, fw_name, &usb->dev,
 					GFP_KERNEL, usb,
 					uea_upload_pre_firmware);
-	if (ret)
+	if (ret) {
 		uea_err(usb, "firmware %s is not available\n", fw_name);
-	else
+		usb_put_dev(usb);
+	} else
 		uea_info(usb, "loading firmware %s\n", fw_name);
 
 	return ret;
-- 
2.43.0

