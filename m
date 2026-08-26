Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823523822B1;
	Wed, 26 Aug 2026 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734785; cv=none; b=FCLZxBCC9EBnTRwTy79+dCGGgGod1Ufh83pUCpuPLjDq3ct7FiQzn0sfgFuoHitN/NbU90ugsucVZ7OPGPHANn1okUSrCJocq4u73RG6oHHIkti/qNHcW5M0kW0yPLCspJM/8IFRLLufNAzwH8SKG35tmkrktXowODVHSVEUKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734785; c=relaxed/simple;
	bh=AqBVwdExD0vBEXXdbAOAWtw/zVnUr8eBQmC0hW2f9X0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VqbMWmpLPdcDa96Dh01PTg5cpykORJpnmbOrjbZPOB08S98aLxuz5NpfxlQJ/QM8niqKJXdTZFLJZSxZFXp+BuU9VrgjLKu1GQidgJRl8rHbzToNx3OrUVcg+CQzhWSBNB3QVrghWwIImFNHwoXQsRamsOVYZMf6pyieu2lepWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 753e36dca12c11f19a56ed5b684f684d-20260826
X-CID-CACHE: Type:Local,Time:202608261653+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2d3924ee-0e59-4cc9-ab54-0ba8006190d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:074f485fac49b0734e9a3dd889a43fd6,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 753e36dca12c11f19a56ed5b684f684d-20260826
X-User: dengjie03@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <dengjie03@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1501693354; Wed, 26 Aug 2026 16:59:34 +0800
From: Jie Deng <dengjie03@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jie Deng <dengjie03@kylinos.cn>
Subject: [PATCH] usb: core: Ignore remote wakeup for Fintek ttyUSB device to fix S3 auto-wakeup
Date: Wed, 26 Aug 2026 16:59:24 +0800
Message-Id: <20260826085924.2083522-1-dengjie03@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Fintek ttyUSB device (VID: 0x1934, PID: 0x1202)
has wake-up capability enabled by default, and changes
in the RTS/DTR signals can trigger a remote wake-up.
This behavior causes the system to be automatically
woken up from S3 (Suspend to RAM) state unexpectedly.

To prevent this unwanted auto-wakeup and ensure the system
can stay suspended, add the USB_QUIRK_IGNORE_REMOTE_WAKEUP
quirk to the device entry in usb_quirk_list.

Signed-off-by: Jie Deng <dengjie03@kylinos.cn>
---
 drivers/usb/core/quirks.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index b5b577f0b931..b0856e05580e 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -528,6 +528,10 @@ static const struct usb_device_id usb_quirk_list[] = {
 	{ USB_DEVICE(0x1908, 0x1315), .driver_info =
 			USB_QUIRK_HONOR_BNUMINTERFACES },
 
+	/* Fintek ttyUSB Device */
+	{ USB_DEVICE(0x1934, 0x1202), .driver_info =
+		USB_QUIRK_IGNORE_REMOTE_WAKEUP },
+
 	/* Protocol and OTG Electrical Test Device */
 	{ USB_DEVICE(0x1a0a, 0x0200), .driver_info =
 			USB_QUIRK_LINEAR_UFRAME_INTR_BINTERVAL },
-- 
2.25.1

