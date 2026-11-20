Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155680;
	b=r3XY5BMgYnGgwXUZTdlo9LZWIClr9pNHnkGizzk0LlQzcT6wc5cFnLnLUoqOviwS5Z5O
	 8TSgSd5TOnAI6WvoQRe06akWzYqHtae+K07ULim5ZgsZE5h1IdR8zTMq66te+yPX76YvK
	 SIYo7M47iByvvlQ+hwuBOfKIf+Itmmjlh3a7v4hox/AOsLjoG8r9/FQkxR+1JZiXppYsr
	 hmcFPLLPjjjW+pMl2eI3sJAmxNQU+cXuuG/lsGItf7JnldWQD+4bNfql/+FHCQasqt6Eu
	 tkOnpZPzgogmEr6YrPXurpiTxODja94orijDmCwkOLo0HkNwdwilyOGK2v6rqQFdEdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155680;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m6LbVGYv5C1JcdgzXj0UB6NhLrcNiHaEyWtKc9ZFY0k=;
	b=GG1l3z6ultxT5NSCUxCRk3ilg4rrtoKXD73C1Fj28/TSFOKAB6W0bPBQzQx2nTffv9LE
	 vr69Fg7ghGKyUxBDZPLsk3SjE26SJkcPv0qkJc7vOhiL5rLOWEzekVDLNoLSYMOY2+JQB
	 zNk+dl0VssV46rxeunC4c6M0RpEVV3H72OSEqW00EMp7C/QkZhJS6PYRkz78Molhlhz/c
	 z81+rQoci+le8nASoYyNHq2TJlMIbKXZSVaJy2kKY73LNo0Dex4/dWnhGHLSPPDTU8P0r
	 //2urv5qvtAPiopx7CH6bE0QfHc+j3PzbangrBwfc3alVLaF2NSzqTIGFt5PSp2qKAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=E0syLR+x;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0674760A2602
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0674760A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=E0syLR+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=E0syLR+xKpv1EQhtiq56TsezVqNXMOw89oTUmSIon1MOedhXRo4Gn8Tf6W4VNOdkr/VAi2Ms3oV15
	 JI4fugzpVCesN4SJIZVHn7q5hXlSOc+PaU1p+yrZRKUyghsdG0IhB7Q7fOe77u0zK6bH2DuISAh2ju
	 6is0g7Pv5xe1jvkE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16affe6d70a4-00c78;
	Fri, 20 Nov 2026 14:21:15 +0800 (CST)
X-RM-TRANSID:2ee16affe6d70a4-00c78
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86affe6da2c5-80dea;
	Fri, 20 Nov 2026 14:21:15 +0800 (CST)
X-RM-TRANSID:2ee86affe6da2c5-80dea
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] usbip: tools: Release udev references when refreshing devices
Date: Fri, 20 Nov 2026 14:21:14 +0800
Message-ID: <20261120062114.98435-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

Device discovery creates a udev enumeration and a device reference for
each entry, but releases neither. Successfully exported devices also
retain a separate udev reference that is lost when their list entries
are destroyed. Repeated refreshes therefore accumulate references.

Release temporary device references on both the normal path and the
exported-device creation failure path, release the enumeration after
scanning, and drop retained device references when destroying the list.

Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_driver to libudev")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/usb/usbip/libsrc/usbip_host_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_host_common.c b/tools/usb/usbip/libsrc/usbip_host_common.c
index bec6c42e29c8..a0df0a57b38c 100644
--- a/tools/usb/usbip/libsrc/usbip_host_common.c
+++ b/tools/usb/usbip/libsrc/usbip_host_common.c
@@ -143,13 +143,16 @@ static int refresh_exported_devices(struct usbip_host_driver *hdriver)
 			edev = usbip_exported_device_new(hdriver, path);
 			if (!edev) {
 				dbg("usbip_exported_device_new failed");
+				udev_device_unref(dev);
 				continue;
 			}
 
 			list_add(&edev->node, &hdriver->edev_list);
 			hdriver->ndevs++;
 		}
+		udev_device_unref(dev);
 	}
+	udev_enumerate_unref(enumerate);
 
 	if (hdriver->ndevs == 0)
 		info("Please load appropriate modules or export devices.");
@@ -165,6 +168,7 @@ static void usbip_exported_device_destroy(struct list_head *devs)
 	list_for_each_safe(i, tmp, devs) {
 		edev = list_entry(i, struct usbip_exported_device, node);
 		list_del(i);
+		udev_device_unref(edev->sudev);
 		free(edev);
 	}
 }


