Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8514A4CC;
	Wed, 17 Jun 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.54.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662023; cv=none; b=gld1+SzZZOtocSu9KqKqPU1Ma3fewFxgITR9z2FurGku7A+S9zBhxKJV3ihz8AeX7OENILeW92TVlfWT1RIFlyBBGnMuk+Jsz4DAuNh44u6jWmTrI9NmFHor9pmgV+TKMT61JbbY7Y2ditNLlLmZbZ0ndqRjs6rvqfFPgD0DYpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662023; c=relaxed/simple;
	bh=X+g+JVeit4gJeKbGcFT1nRqD5NehanzPQ2CNq2gEYew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8fIQv/twjhU8LzWZjdW3k8QJhW++muJ3azHxhewhmoRk5E55zI7dFSRmngPK2MZF84KYaMTPLQdkoLq+PcJsI2RoMJqlxmdRZBiBfCRR8+nqkgmZcLbIGNaaxGznvqaC8FxylcwZ0DCNomDgyxi2uxyrTyTQuxDrs15yIcRoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Q5p8OcWb; arc=none smtp.client-ip=43.154.54.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Q5p8OcWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781661982;
	bh=P6Z+NyPq9b2RGT7m9ogHlWJkSaawEe1//fKi08mZ44U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q5p8OcWbBl44uNFuLOGYGdOx5JiyOID42UGz0nCv+h9Q7sWt1z/q6vQQpdyzzTJR0
	 JUbUb2bOwLB8HLM2fR5Q1YFZbFAv3OhpESctRAlrzspvRE6shc6VwVT7HwhE3InBR8
	 FaIGnMKo+LAwvPjITwBCYgLKEicPiZfbn9eM8GRg=
X-QQ-mid: esmtpgz16t1781661977tafafaf74
X-QQ-Originating-IP: W+Bo16UM+4NvWFGSE3Vs3zXZ8Gqe9fgAooGpisVbzJY=
Received: from Shurima ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 17 Jun 2026 10:06:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8503985215154942650
EX-QQ-RecipientCnt: 9
From: Yichong Chen <chenyichong@uniontech.com>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org
Cc: i@zenithal.me,
	gregkh@linuxfoundation.org,
	zhouzongmin@kylinos.cn,
	mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenyichong@uniontech.com
Subject: [PATCH] usbip: tools: support SuperSpeedPlus devices
Date: Wed, 17 Jun 2026 10:06:13 +0800
Message-ID: <00C828F338E43447+20260617020613.199086-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfQ6P9s9cWJwk2B5epSA+7OH/2VOzgjjdcAJFltIGBKo4QOD4mWtvY4T
	V+nBVjMiHyZYA40oBU88akdLRvTmaMp0rnyqvrxd/elvt7Ue2HpodN96ciN2LeVIBloAd3c
	/yBMVu1AyzZ2P3+8SrHLSfmuqHOvN/4BEiCaBnKb5o+7c8rIpGSfQPnIDSWcAmtlvdxpH9F
	ad00jhKaeq8/6gula3BCJYWdCx785yR7ZVjHgcFWMGlTQ2d6nTf7sVwC+5ncN5tau56NV8O
	GYYzihuwwkqhhMEaZbSp4FALQ9GUt2FZYFpAyaVqZoyTWnAz28THorkYzWot6FeVWbdsz59
	uUEDw+mep7CYAwKM+dHePm5D8CXe1QDNEkzwKZtGGV3VNhSluLz2OLOPOLfmUc1cPkPoT6X
	ieESJNusakMI9UIVMNHVu2l0mtTUqqo6iN9rJx2O5d46bmcaJ8RWUo1waCEczAmijFwwBSt
	7BSu28Tz5p+JhN9UQPi0Kl2pJVAlYLDtIpSimiJNzza3Ib3SS+s8YWiFTz99UnxHSjfYJ6V
	64zC8v0iSrOeSDaiA5eiwBv9BeWi/lhmlsZzaKxcRbwAPCjEcBCjhHrOSiTmxgZDPR1OZ3h
	N35eLVXcqps9nxFWypppkNJjGdsS2Z5DCrCbSlcAlE91xwtSPTpxC+2Ebt3TTW3GVoqYvwO
	oaBil3mn5d3AtGOWyrwut5UYxjDb+3brh63agcVYwuSttz2D26Gq3RK05WuJn2y115toAIG
	QnEYL3RvaU4GMjfS4qR24BCOH/lYgPT3uL3WCNfugOwRaYT48VN31Yno8iGUbb6leGGDniy
	2K2f+4Ulv4RWr609XHsYY7z4XqzJneIxBQcrwe9pyVWxyOiWbKu0vAYkOeZEVbzdw+Xcejd
	lcnZ7W562MrCzQGb7smQSM6DQuV9xyr8eqwF0dsutMFcnXp1O/feq2K9pdy2Vqh2BmcJFh7
	6WyncQspkp5s2bq5WOII9ijUiA1ZbRSOyCqktDauzikGjzh6M5MBPGLmY45Sne0uqtsB0AQ
	g8RP0WplDnCDi80k4M
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

USB devices running at SuperSpeedPlus report "10000" or "20000" in
their sysfs speed attribute. usbip currently maps only "5000" to
USB_SPEED_SUPER, so a SuperSpeedPlus device is imported as
USB_SPEED_UNKNOWN.

The attach request is then rejected by vhci_hcd:

  vhci_hcd: Failed attach request for unsupported USB speed: UNKNOWN

Map the SuperSpeedPlus sysfs speed values to USB_SPEED_SUPER_PLUS, use
the SuperSpeed VHCI hub for SuperSpeedPlus devices, and recognize the
gadget current_speed string used by the kernel.

Fixes: b2316645ca5e ("usb: show speed "10000" in sysfs for USB 3.1 SuperSpeedPlus devices")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 tools/usb/usbip/libsrc/usbip_common.c        | 2 ++
 tools/usb/usbip/libsrc/usbip_device_driver.c | 4 ++++
 tools/usb/usbip/libsrc/vhci_driver.c         | 1 +
 3 files changed, 7 insertions(+)

diff --git a/tools/usb/usbip/libsrc/usbip_common.c b/tools/usb/usbip/libsrc/usbip_common.c
index b8d7d480595a..f4734f552d31 100644
--- a/tools/usb/usbip/libsrc/usbip_common.c
+++ b/tools/usb/usbip/libsrc/usbip_common.c
@@ -29,6 +29,8 @@ static const struct speed_string speed_strings[] = {
 	{ USB_SPEED_HIGH, "480", "High Speed(480Mbps)" },
 	{ USB_SPEED_WIRELESS, "53.3-480", "Wireless"},
 	{ USB_SPEED_SUPER, "5000", "Super Speed(5000Mbps)" },
+	{ USB_SPEED_SUPER_PLUS, "10000", "Super Speed Plus(10000Mbps)" },
+	{ USB_SPEED_SUPER_PLUS, "20000", "Super Speed Plus(20000Mbps)" },
 	{ 0, NULL, NULL }
 };
 
diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c b/tools/usb/usbip/libsrc/usbip_device_driver.c
index 1dfbb76ab26c..c9b3619d86f3 100644
--- a/tools/usb/usbip/libsrc/usbip_device_driver.c
+++ b/tools/usb/usbip/libsrc/usbip_device_driver.c
@@ -57,6 +57,10 @@ static struct {
 		.speed = USB_SPEED_SUPER,
 		.name = "super-speed",
 	},
+	{
+		.speed = USB_SPEED_SUPER_PLUS,
+		.name = "super-speed-plus",
+	},
 };
 
 static
diff --git a/tools/usb/usbip/libsrc/vhci_driver.c b/tools/usb/usbip/libsrc/vhci_driver.c
index 8159fd98680b..4ca3783ee5b7 100644
--- a/tools/usb/usbip/libsrc/vhci_driver.c
+++ b/tools/usb/usbip/libsrc/vhci_driver.c
@@ -338,6 +338,7 @@ int usbip_vhci_get_free_port(uint32_t speed)
 
 		switch (speed) {
 		case	USB_SPEED_SUPER:
+		case	USB_SPEED_SUPER_PLUS:
 			if (vhci_driver->idev[i].hub != HUB_SPEED_SUPER)
 				continue;
 		break;
-- 
2.51.0

