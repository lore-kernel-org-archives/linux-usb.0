Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83323A5E90;
	Mon, 10 Aug 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786353216; cv=none; b=Gt+XELCRxWc84mh6XBqNJbxGFIq6SZoyQPgxiD3B+rr/g50pqPUzPoOWremnWwxfez5ZyCXLhx19yH3fYoYgP3n9ho7U6ixq2QclTQdPiQ56r13OiSLOAfqD+MnpXZpmq9F7OG4d2qOnpYzysCVdE0voWHynjPoMUM4BFuTbCHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786353216; c=relaxed/simple;
	bh=Vb3NXcTQRAkKFcgFCFkOG3bhf5Sc9dSTDY1AALnTmmo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o0/gj3ziC5bHOT5JUBPZ9hLoBcddUpfKyfl3DBwVVzvgTS9lVUozbEMX70ao0KaFcQvNXiNYFtYNLnm32uN0lm9uzUdQWkXaksmywgb7tQGsyAjXD6OWjM3E1Mw4izwoQztIvtgaQrHQbbGb1oewk63C4lQC7xtSW4YfUwZjDk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bf7cc1fc949b11f1aa26b74ffac11d73-20260810
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e72e2f1f-e13c-436f-b196-5e025e2fa407,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:5041d7f0ad6b33509600ccab2cef84d1,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bf7cc1fc949b11f1aa26b74ffac11d73-20260810
X-User: huangwei@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <huangwei@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 146873037; Mon, 10 Aug 2026 17:13:27 +0800
From: Huang Wei <huangwei@kylinos.cn>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	leStoppe <lestoppe@gmail.com>,
	Huang Wei <huangwei@kylinos.cn>
Subject: [PATCH] USB: serial: simple: narrow OWON match to avoid breaking VDS1022
Date: Mon, 10 Aug 2026 17:13:22 +0800
Message-Id: <20260810091322.2201740-1-huangwei@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 4cc01410e1c1 ("USB: serial: simple: add OWON HDS200 series
oscilloscope support") added a USB_DEVICE() match on VID:PID
0x5345:0x1234. OWON uses this same VID:PID across multiple device
families (HDS, VDS, SDS, PDS), so the overly broad match causes the
owon driver to also bind to devices like the VDS1022, which previously
worked fine with the generic usbserial driver.

Narrow the match to use USB_DEVICE_AND_INTERFACE_INFO() with the
Physical Interface Device class (bInterfaceClass=0x05,
bInterfaceSubClass=0x00, bInterfaceProtocol=0x00) as reported in the
HDS200 USB descriptor. Devices that use a different interface class
(e.g. vendor-specific 0xff) will no longer be claimed by the owon
driver and will fall back to the generic driver as before.

Reported-by: leStoppe <lestoppe@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220193
Signed-off-by: Huang Wei <huangwei@kylinos.cn>
---
 drivers/usb/serial/usb-serial-simple.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
index a0afaf254d12..82509669347e 100644
--- a/drivers/usb/serial/usb-serial-simple.c
+++ b/drivers/usb/serial/usb-serial-simple.c
@@ -100,9 +100,15 @@ DEVICE(nokia, NOKIA_IDS);
 	{ USB_DEVICE(0x09d7, 0x0100) }	/* NovAtel FlexPack GPS */
 DEVICE_N(novatel_gps, NOVATEL_IDS, 3);
 
-/* OWON electronic test and measurement equipment driver */
+/* OWON electronic test and measurement equipment driver.
+ * OWON uses the same VID:PID (0x5345:0x1234) for multiple device families
+ * (HDS, VDS, SDS, PDS). Match on the Physical Interface Device class (0x05)
+ * used by the HDS200 series to avoid binding devices that use a different
+ * interface class (e.g. vendor-specific 0xff) and may require different
+ * handling.
+ */
 #define OWON_IDS()			\
-	{ USB_DEVICE(0x5345, 0x1234) } /* HDS200 oscilloscopes and others */
+	{ USB_DEVICE_AND_INTERFACE_INFO(0x5345, 0x1234, 0x05, 0x00, 0x00) }
 DEVICE(owon, OWON_IDS);
 
 /* Siemens USB/MPI adapter */
-- 
2.25.1

