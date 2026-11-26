Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701194;
	b=3u6lU6r9AVjiwb3OAHaxmFqL+KSgG5NxXgg973yvlpsICpCcQYqIf3CSfo+/EOS7aA6l
	 FVIrn1bMr9o5r/uxhzjRtCY1OdR0WoKwvbPsWjb8o0SSqrXVUyG/SwV1+5Kk3zXXDbcMg
	 5gkG4F9vhODbXB9loIwZZ9+IZUk/JPuRikrvz8HTUD93V1pyODxfUCHueYC7Zl/BWA7v7
	 6rua6yMW2jxH3CQ0TmvenfSJ7EBKSi4f8c6vMTkXUu7fCU2yvXBYF/iCmoGYDVwOINdLY
	 KXnUCQyV+JV2ctBv8mAkzIONWDb5C8Qa3ctFaiJ0eVHqzb3NZEwpFwTEIgA0f8DBpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701194;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qPMaAqLcG/iqmUlSJ8jiYApihQzYsA/5A7Wr/u2o2Ro=;
	b=O4vppOcNEQ9WE8GaYM5dWok7tBNHIO1b3WR/i+PZIzzOGOCVVBDd79YG52e8VEWpzyUS
	 ewLL15cDVUo2nXbxr0CH/+P2ikCDfk/Yuh3hdVeitKoCrmmovdOtgARBn9vt0BwdI0Zuq
	 EIUSx3TdtdOVyQbkGwAGSrCRLs/DtriR7Dm31wM2IWhw2w9lAYb54N59TQyyJ9dEii4CM
	 GhDZtkfhCFG6EOcRUAndvu05GGk5XIwZoPABRbriwYcNlUdcqo7+5T9xlNop9KqyWSXY2
	 E/y7x2H+y4EGnmMkxvXvbxfOwYbyiaiunzToZDSrU5tHmOnJS26Rtn8c3hYkjGCXT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859AD606A32A;
	Thu, 26 Nov 2026 13:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859AD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: b5820fc2e9a011f19a56ed5b684f684d-20261126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:81ab290a-16ac-48ef-8077-1c22f3fffe39,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:71d12a0e270c2bdd07bf44e0791b3936,BulkI
	D:nil,BulkQuantity:0,SF:81|82|102|850|865|898,TC:nil,Content:0|15|50|99,ED
	M:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b5820fc2e9a011f19a56ed5b684f684d-20261126
X-User: shitao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <shitao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 705664564; Thu, 26 Nov 2026 21:53:07 +0800
From: shitao <shitao@kylinos.cn>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: davidm@egauge.net,
	eeodqql09@gmail.com,
	linux-kernel@vger.kernel.org,
	Shi Tao <shitao@kylinos.cn>
Subject: [PATCH v2] usb: host: max3421: fix the SPI thread teardown on remove
Date: Thu, 26 Nov 2026 21:52:22 +0800
Message-Id: <20261126135222.1428623-1-shitao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126121148.1021526-1-shitao@kylinos.cn>
References: <20261126121148.1021526-1-shitao@kylinos.cn>
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

From: Shi Tao <shitao@kylinos.cn>

max3421_remove() stops the SPI thread with the HCD spinlock held:

	spin_lock_irqsave(&max3421_hcd->lock, flags);
	kthread_stop(max3421_hcd->spi_thread);
	spin_unlock_irqrestore(&max3421_hcd->lock, flags);

kthread_stop() waits for the thread to exit, so it must not be called
under a spinlock.  Worse, the thread takes the same lock in its main
loop (in max3421_urb_done() and friends), so it can never finish its
current iteration while remove() holds the lock, and remove() ends up
waiting forever.

The interrupt is freed after the thread is stopped, but its handler
wakes up that very thread, so an interrupt arriving after the thread
has exited calls wake_up_process() on a task_struct that may already
have been freed.

Free the interrupt first and stop the thread without the spinlock.
The thread checks kthread_should_stop() at the top of its loop, so it
exits without re-enabling the freed interrupt.

Fixes: 2d53139f31626 ("Add support for using a MAX3421E chip as a host driver.")
Signed-off-by: Shi Tao <shitao@kylinos.cn>
---
Changes in v2:
  - Full name in the author, From: and sign-off, as requested.
    My name is Shi Tao (surname Shi).
  - To answer "how did you test this": compile-tested only.
    No MAX3421E hardware was available, so the unbind path
    was not exercised at runtime.
Thanks!
---
 drivers/usb/host/max3421-hcd.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 73e76d0e6973..20e458809ac6 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1936,21 +1936,16 @@ max3421_remove(struct spi_device *spi)
 {
 	struct max3421_hcd *max3421_hcd;
 	struct usb_hcd *hcd;
-	unsigned long flags;
 
 	max3421_hcd = spi_get_drvdata(spi);
 	hcd = max3421_to_hcd(max3421_hcd);
 
 	usb_remove_hcd(hcd);
 
-	spin_lock_irqsave(&max3421_hcd->lock, flags);
+	free_irq(spi->irq, hcd);
 
 	kthread_stop(max3421_hcd->spi_thread);
 
-	spin_unlock_irqrestore(&max3421_hcd->lock, flags);
-
-	free_irq(spi->irq, hcd);
-
 	usb_put_hcd(hcd);
 }
 
-- 
2.25.1

