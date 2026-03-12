Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1A3B6C00;
	Thu, 12 Mar 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310907; cv=none; b=DGyqZG0WdMhjEbnUb2mceBeA/fuwEZceVmHELEt84m7/2N+IAOKXSFaBT2NwiJrP+ffLNSkj0QQoM8eOuvj96qBeG3gPkwtjLB2NfnDjlG84eJy2qBoopT9bu0t5ANqCz0yy2JVxeEEl8BFKcWSpYxgiSAFfwxrsA+Ca6TX//v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310907; c=relaxed/simple;
	bh=zbTl27wV5HeuwH5zVUaa9KiMquW/Szbs0K+fRXai0/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VORfALVjBfuzZ9oY0gickxVO+NdO4MI9Ze2Q9rkGMEjd9hclj4p6Hpt1u+ck1Y/KuKFT0H+gns8ZKmG85JN9bF2GadTEBMEVz9JrCTm5l5B7Wa7nIf9qC3qB7IZaZ4HFLsdbjm8LoFJFnOQrLVWJC2JZUbzGuEneT8I8/xUafoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RPrWI7y4; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RPrWI7y4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=go
	GS09xqTUU6YR9G8aJL6xMgSupRDBvPN0gU4EiALso=; b=RPrWI7y4YBrtfWReFI
	7Ru5uE/wcNNhaHCQNzeJYBnbsyGPvwD/bmkP2fdC4bAUvouQmNqcxQelS9lveHfX
	aNUcWiR30H0O6DbnjQ7vFdIoH7sivKfRqFxxDBGFnMuyjbBdSaj7Z1R4RyvFBixc
	RrzzU2tXOwoH/vfjNx/xAk6+c=
Received: from GHT-5854251031.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wBHtmSYk7JpnC0vAg--.7909S2;
	Thu, 12 Mar 2026 18:21:13 +0800 (CST)
From: zwq2226404116@163.com
To: johan@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zwq2226404116@163.com,
	"wanquan.zhong" <wanquan.zhong@fibocom.com>
Subject: [PATCH] usb: serial: add RW135R-GL (33f8:1003) support
Date: Thu, 12 Mar 2026 18:21:08 +0800
Message-ID: <20260312102108.13584-1-zwq2226404116@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBHtmSYk7JpnC0vAg--.7909S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFWkAw4UCFy5Cr1UAFy5Jwb_yoW8Gr17pF
	15tFW5WrZ8Z34rZw1UAr95uF95uayqkFy3Kayvy39a9F17tw1UK34qyrWFgr17Aa17Cr12
	9F90vr4DGw47G3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRrsq9UUUUU=
X-CM-SenderInfo: h2ztjjaswuikqrrwqiywtou0bp/xtbC0hkSaWmyk5mWZgAA3R

From: "wanquan.zhong" <wanquan.zhong@fibocom.com>

Add VID/PID 33f8:1003 for the Rolling Wireless RW135R-GL M.2 module,
used in laptop debug cards with MBIM interface for Linux/Chrome OS.
The device supports mbim, diag, adb and AT commands.

Device info from lsusb:
Bus 03 Device 12: ID 33f8:1003 Rolling Wireless S.a.r.l.

Signed-off-by: wanquan.zhong <wanquan.zhong@fibocom.com>
---
 drivers/usb/serial/option.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index e349ed66d2ac..abeeb7c66977 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -2449,6 +2449,9 @@ static const struct usb_device_id option_ids[] = {
 	  .driver_info = RSVD(4) | RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x0115, 0xff),			/* Rolling RW135-GL (laptop MBIM) */
 	  .driver_info = RSVD(5) },
+	/* Rolling RW135R-GL (laptop MBIM) */
+	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x1003, 0xff),
+	  .driver_info = RSVD(5) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a2, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a3, 0xff) },			/* Rolling RW101-GL (laptop MBIM) */
 	{ USB_DEVICE_INTERFACE_CLASS(0x33f8, 0x01a4, 0xff),			/* Rolling RW101-GL (laptop MBIM) */
-- 
2.43.0

