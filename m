Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93733090E2;
	Wed, 24 Jun 2026 03:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272148; cv=none; b=Jm7lg8ThewccfyppGV5XcIA/ZbuxQWiJb3i8YcGQvyhgyRLtPL0EA65uXesxnUf5L4YeaXE57XcINDIBS5SJRqv1aAalhFOgP+r73ViYwie4dVTMhOcJLbx5/9iH24zzvlScvu/jDwd9QKQgtjrmohogjN2bWCzaLRYLQ3Y92YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272148; c=relaxed/simple;
	bh=byOosBhSN2QNf5hc/Bkc0ikQUyeTeLQqqNJyG/MyG0c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=fSVUPcqOOz5Dq03IrLD2AdKtwKUyz7cLvlbo4KUAJ2twkiHS9dMGKZ6BiDiJl2/+3U6reA/qVfaPkRisA8kih2WsNfOreSY53kgQkDThJOv+GyJlJyZrlKopI7H6GPCfuGdjNCXZdGc7RUCc4LB5iRJ9X3sw8lfhWBn7kUaC+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JcItMTpH; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JcItMTpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=dfiwsHWWFpYomJv
	fuQbmZXfYGgC7dSA68LzKVN7xnv4=; b=JcItMTpHGWrPuKpna91zM/Oml8RRmGR
	/wPEvBowGTH9/4EwpqOUItJqLjVklSgqGX6AjnfRHMm7qqn179ZjjT/7PGkHvPKN
	bE8VijIveuN0LcD8iE0wqj9368wOyGwPCak49FZgdk23fU30EVuvqwyOagy5nqSz
	Nw4hOP6ybRdY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXhcp+UDtq+OWGFg--.148S2;
	Wed, 24 Jun 2026 11:35:27 +0800 (CST)
From: yangsizhe <18392868223@163.com>
To: johan@kernel.org,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yangsizhe@meigsmart.com
Cc: yangsizhe <18392868223@163.com>
Subject: [PATCH v4] usb: serial : option: add multiple MeiG VID/PID
Date: Wed, 24 Jun 2026 11:35:24 +0800
Message-Id: <20260624033524.7913-1-18392868223@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wAXhcp+UDtq+OWGFg--.148S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17XFyDZFW3ZF15Kw45ZFb_yoW8ur4UpF
	18KryY9rZ5XayfWr4fJFn2vr95uanYkryakw43Jw4aqr4xJr4Y9wnFyry7tryrGr45W3sF
	vasYyrW7Gr15JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRq0PhUUUUU=
X-CM-SenderInfo: zpryjmasywmjist6il2tof0z/xtbDAh+cdGo7UH88mwAA3s
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Add the PID and VID to facilitate the binding of our company's module

Real name:MeiG Smart Technology Co., Ltd

Signed-off-by: yangsizhe <18392868223@163.com>

---
Changes from v3
1.Resolve the issue of compilation failure

Changes from v2
1.Adjust reserved interface mask,avoid conflicts with RNDIS driver

Changes from v1
1.Add Real name into commit changelog descriptor for device identification
---
 drivers/usb/serial/option.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index a34e79cfd5b6..1bf37df4493d 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2459,6 +2459,25 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x40) },	/* MeiG SRM813Q (AT) */
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x2dee, 0x4d64, 0xff, 0xff, 0x60) },	/* MeiG SRM813Q (NMEA) */
 
+	{ USB_DEVICE(0x2dee, 0x4d23),						/* MeiG SLM868x*/
+	.driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d62),						/* MeiG SLM820x*/
+	.driver_info = RSVD(4) },
+	{ USB_DEVICE(0x2dee, 0x4d30),						/* MeiG SRM813Q*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x2dee, 0x4d50),						/* MeiG SRM811x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d51),						/* MeiG SRM821x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d52),						/* MeiG SRM810x*/
+	.driver_info = RSVD(0) | RSVD(1) | RSVD(6) },
+	{ USB_DEVICE(0x2dee, 0x4d57),						/* MeiG SLM770A*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x2dee, 0x4d58),						/* MeiG SLM828A*/
+	.driver_info = RSVD(0) | RSVD(1) },
+	{ USB_DEVICE(0x05c6, 0xf601),						/* MeiG SLM750x*/
+	.driver_info = RSVD(5) },
+
 	{ USB_DEVICE_INTERFACE_CLASS(0x2df3, 0x9d03, 0xff) },			/* LongSung M5710 */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1404, 0xff) },			/* GosunCn GM500 RNDIS */
 	{ USB_DEVICE_INTERFACE_CLASS(0x305a, 0x1405, 0xff) },			/* GosunCn GM500 MBIM */
-- 
2.17.1

