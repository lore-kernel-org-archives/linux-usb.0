Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCF3DA5BD;
	Mon, 15 Jun 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516239; cv=none; b=MUpMRNpdf8jdrOiIGTLolXNBaVGps0CgeZs/FJFbRiLyWLdD2CbFaUlqirIGEVGz30JXJzIPpGFWICbHWEBxHEa/O4l7EwRmF/DetSVBZ853akWYw5Ogy4ATElwxDaAWSA4yIbdjNZhf8xRVLIwlKtfrk2hhxmJAQ03lQtxBBO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516239; c=relaxed/simple;
	bh=2ZcerHJBaMq2e/JMGr86nJo2ZzsoboFMfGwfCDcbVUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJ8AZD++2x/FIQYpy8sVweXoibA0+3ij0CVFVbP2vSrjMGcv2DtKGs4vL0rUXNF0OI6y+lCt54gQ8brL1djKyyqmXtjg5CLyvqxEYHdYMx2fzmlr25NtM19/oDJmaZ4WKuvS+IEpsFy8GJN2uCbfdaU5HKWDmfPRiPaUQx1lNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=jVie9gRN; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="jVie9gRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1781516198;
	bh=bH/3ksGMfagOroq13frQLZrH/1toIP3H6hqHcfqLuAY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=jVie9gRNOxdICkKx71+3MgC8yR+hcNh7DGyZRM+9Ai81i+zfjg1mQGOJwaWzt1fYG
	 rfq9TjpGCKZq0/HVVyzN448rvZdhumN5wnHb/dHCTBL9vhZ5s5ED98pozQjMRHSdtP
	 NBAbE6govq+TbrT2O6GIYs3XFNgYlm2neVvEShQY=
X-QQ-mid: zesmtpgz9t1781516181t723a726d
X-QQ-Originating-IP: w8VJb/HMorRi7A2ttqL4n/w1ZTbw4pwGr1vxSpdqH6M=
Received: from PEN202512010004 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 15 Jun 2026 17:36:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 13452823700449764752
EX-QQ-RecipientCnt: 7
From: raoxu <raoxu@uniontech.com>
To: valentina.manea.m@gmail.com
Cc: shuah@kernel.org,
	gregkh@linuxfoundation.org,
	i@zenithal.me,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	raoxu@uniontech.com
Subject: [PATCH] usbip: vudc: fix NULL pointer dereference in vep_dequeue()
Date: Mon, 15 Jun 2026 17:35:59 +0800
Message-ID: <18A5F3B379FB205B+20260615093559.3436095-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MglA7JX7t2v3MHF3FDNc4ckLBvLkPRfHaWWSqGSxGo9d8iO8EKBpBhGX
	WQg1wjgefAa+GgT8eh/mFJvJQ6SasMPfK6bpy/5YUFZQMv0tRAL2ZemHdhxEczKtfXiCdfq
	KwGRquUKGFHQZaRD9W54YQGtIHOaDt6eoXa3lxUwDcwpi3Gag1MaCCRNROO3m/mX9nQ/pzs
	4+y3LGatg28Qu/jCyqylKwAE9v6rUxesEZrN8OKn7Mn6p4z3CCsH32Od5vvC94qnGMvZJZc
	VTh8zfx7+fLhLRrAI6RMlaIKhMevBOlwqheNUmvjVs2aVmGmDZQR6KVbnZlMSG4hOmebxtq
	RvfJ2NrhkuDmXZZuu6V4CSLkHXjjPMspLw5+xXA2xQzhGQTbrtGw1EH68azL5rzxAoRmTOT
	dXzmVTI/csEsiQLaThbvQWzccGQGoHLebkUf2/FZEebrtmSZ6QNw8sUVot9iqZKfZdOH4OR
	/RrlBqHlcbNBuz8u2YWld+tx/GuPLIeAvSFa1Fi4OYJBZqmuM7hUL2Pcr3qJqm5X2vWcXmv
	EdNqTeT8cwSLEPx9qNJwhKYA6m2efPaYySYOVlusv96s0D9JERRr6xN+J6PsOrxUZ3+WHme
	p/6SiY2qx/2bA+D2Q4unkw2wZcj/1Qkc0h0HsRZ+LUmiIyoTJvLMJwVPd9iciw0THQlysI8
	himDlQjVhBarnnKd6xsuzZGcIpMBiS89N4RDoE0ohzaJH6TtcburJibJipqREeUBYUxd0Wh
	JkCAOGnxz1007LM9zFz2xMcrkrYlEoKLPoODHeCZLLtKxfUDcysIy9U6sCYNALtH03ngM31
	w9HWw4vPm+X0vmURiZx3DY99hyUpg7CEzR11dBYCtCH22oLXTq071ETxMgEkCiv2+REwh6v
	P7b6SvwnYm2UBEE1j30/suIplW1I4sriuXzENikFo/uzVOLyeME4rLNkbkWqfv7S9jheWQG
	GIJ1lpVbHtpD0ailEhqxb6xxMyUEqTiaQZZe2gGCMrbHm07ifYroYYa83OEU8DyBYM8lXHD
	lTkC+Y5MES+XhhWuKVN70uxwyvrhnoqxMJSmOdHUIRyiVlYSiTJ5wQa7VIimLdtLQ81wN9n
	Q==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

From: Xu Rao <raoxu@uniontech.com>

vep_alloc_request() zero-initializes struct vrequest but never assigns
vrequest::udc. vep_dequeue() then reads that field and dereferences it
while checking udc->driver. Consequently, any usb_ep_dequeue() call that
reaches the vUDC dequeue operation can crash the kernel.

The endpoint passed to ->dequeue() identifies both the request queue
being searched and the owning vUDC. Derive the controller from that
endpoint with ep_to_vudc(), as the other endpoint operations do.

After this change, vrequest::udc has no users. Remove the redundant
controller backpointer.

Fixes: b6a0ca111867 ("usbip: vudc: Add UDC specific ops")
Signed-off-by: Xu Rao <raoxu@uniontech.com>
---
 drivers/usb/usbip/vudc.h     | 1 -
 drivers/usb/usbip/vudc_dev.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index faf61c9c6a98..5ef0e7d9b23a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -38,7 +38,6 @@ struct vep {

 struct vrequest {
 	struct usb_request req;
-	struct vudc *udc;
 	struct list_head req_entry; /* Request queue */
 };

diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
index c5f079c5a1ea..5ef88117965d 100644
--- a/drivers/usb/usbip/vudc_dev.c
+++ b/drivers/usb/usbip/vudc_dev.c
@@ -333,7 +333,6 @@ static int vep_queue(struct usb_ep *_ep, struct usb_request *_req,
 static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
 	struct vep *ep;
-	struct vrequest *req;
 	struct vudc *udc;
 	struct vrequest *lst;
 	unsigned long flags;
@@ -343,8 +342,7 @@ static int vep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 		return ret;

 	ep = to_vep(_ep);
-	req = to_vrequest(_req);
-	udc = req->udc;
+	udc = ep_to_vudc(ep);

 	if (!udc->driver)
 		return -ESHUTDOWN;
--
2.50.1

