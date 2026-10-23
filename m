Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740701;
	b=YqTD7CmGaN/QSrIcRAKnOtcVTDpszQ4v4v5CLSVq11DgX0IwkbVTG19VX1irMOuCa8Nr
	 RxdutL1fwSarxs3gX8oFOWPJFzHMhABawYiO3vdwAA+nmIEmfp6tZLFR5n1CDZ5h/NI2O
	 O2Cyviw6yh8piDPQOtiU5mV3kEOiHiBy70yY/d5yJUEgUScypY6zQiEM6Wh7Xt0MiSY6p
	 AEdPA+qYCA6ZwyRiBGIzWgTcNM07g/BCbCvZ7v+rYZCRyXAWJxGIoIkYpQgpEJWz0tmz9
	 O1l6ykQlXuc5zGKLZQMVLifYnAvBuGmRXhaOgBtEn1Zs7m8sarzvzXbIh6Kv+ctDJwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
	b=E9PTam8n801Okc/YBnN3FNzfOsAVeNaEBxXgYeun3uANB0FDLxumT3oBBkJxeD8LOXER
	 vcEMqK+5E0/W1tXiCoZ8alzpHjADhIwdbVgapMtdqui97jjDMT4zXsFDqDgrm807zMmym
	 ientGADDgEq2O9gJqRvkU0naxdrOkH2bwJBik71DLvA0HZBTNB49g2WmEe3kTgELfYNyD
	 5BP9NXzVosQjjYM/d3guY3p4txAvtt4+UvGxsoM6BJ9M6bSbsCCneNJWn9AZAmOZmvLWJ
	 V4oJAmkEwkqbFSTq9D8ifNJ3O5gzPWjDMbMI+bB7WES55KoIuqPrI+3sbXY4Rd7p+oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhnaBkfU;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B62D606A31B
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 07:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B62D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EhnaBkfU
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8b20a899fso3163455ad.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740701; x=1793345501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=EhnaBkfUxu2a2jxX+TtWEz+UgIZ7+ZyB0oJNNgr68myThRbWH31oPmFPeN3lhqCGwl
         VG3aJXlTqaK37+5XOu3lzKUSL/PelZFY2AwlBWZ5x1ynFFNvre6vQyVByO55Rcz7QK0+
         j9z6Hq7WqyATfPmr+FmfH935aLKefYrGSuLgiYl0gUh9uqegq7l4sOSadVk4JMiaicGI
         1slIm6tYKkE78bH3oQy42Zar6fs91KXmeCb6GiOIjfol9AR30BhoN0RcVH0qbWp12vv0
         dX79EEYD4ZJtEbRShO3hjV+izmmOwetrp98TryFECNtuSWa4oZ6Hvunub6N76lTemDJe
         N5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740701; x=1793345501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqy5QIw1/kas6DX7rXU+qCiDfbpbyVW/9On/rw4UvY0=;
        b=azjZzjH9YdkVNKaLaOfgkv3tiftuHd45IeVJPCB0RRe66kikk+Q7mIH3bRbG5gflIK
         EnVVZWsPa/VMxDeeOWyw5AyjqY6lMhYauyRduE9hFf58glfse18XR/ZoA3CLBSeP++8R
         4zVbdr85jzkN8AHJFe9QiT6o98WOMqcQzUDtRAV3yn/K6X/TdeDHORO34FDQk634UOlk
         5af5oyD0ilPn2yXfHqGwYnPw6belU94+iTw3L/6mZ7rEKNsamoxKeHaPkHkeBVgTCOjc
         9kAz+2Jdaai2HQyHkRbHrsxcp6KJMGRYSQ0G5Kvoeq9x/MZ1lMBFSILid2gNSffNoiy+
         YPZw==
X-Gm-Message-State: AFq9FYJqzk6pzJ6dLnWaTdtg+i77PCK+s6ZDAV42FMlm3DDXDIHYbjAl
	sj8YZE9EGE8RGOGV/70dOc9raYekUUaEhqjodtlI3b/TFn9Sp9uvMev9
X-Gm-Gg: AYBFou3v6oicMNDE37Zbl17U5+Y/hzPRBnfHO/XWuU5LAiU+LvOkU1w6l/ooahlzkvI
	lnuQmeJwqOl/OPhGjFBcsj5FTFh5uNteHz1JxsfLcSqKnC2B2tAr7hjUauPjVwEWTnFS0Rwhhgh
	BpexdcfTAAVc7Uby/IjCBHBqk8rp3yekPCXHw9XmbFi2lhJtZ2SbkAnlo35nuxG+O4oW0deBDgB
	rsTon1bP8QXNa9/wRsoi94aT9Ytksg7YefmjnTGQXJiuHneNEjoNXsuaoOh+kfY2pKzSfhzhbK1
	vr0VqGgE1yXiwYYaW4dEFaj+KG5M0stSw1aX2M3YOfY+O3s8zx+H9bPtcyllgZAEGAGUe25E85I
	h5PwQH68pGUAM/G1F/JpuDEBnHfoj9T7ZnbkOJ7BjN2jzbdCyR4sanfB7bxVqirrscLjzIsrztG
	UY+RTOrKnLUdoACLls7BNNdZJiI72CRNOX4nAVDWHjF8NPwb/94vqcLznVbMdXXqAkVwpPgvbTe
	HObZq8xHA+UhRz7SqTjRIs+sZqrblKBfBuc68hfqc6mwDmjnAHsKoMF1AIgEYdUgDy0psamzrUv
X-Received: by 2002:a17:903:190d:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ea7c33245emr14654155ad.40.1792740700661;
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eed2sm6766545ad.7.2026.10.23.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:31:40 -0700 (PDT)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Fri, 23 Oct 2026 15:31:31 +0800
Message-Id: <20261023073131.637062-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a non-NULL
wild pointer pointing into the enclosing struct xusb_ep rather than to
a valid request. This was found by code audit.

xudc_ep0_out() and xudc_ep0_in() are reached from the endpoint 0
interrupt handler xudc_ctrl_ep_handler() purely based on the hardware
FIFO status bits, without checking whether ep0->queue actually holds a
request. The queue can be empty at that point: the gadget driver's
setup() callback may not queue a request for every control transfer
stage, and xudc_done() removes the request once it completes, after
which bus timing can raise another FIFO ready/free interrupt. The
unconditional list_first_entry() then yields a wild pointer, and the
subsequent accesses to req->usb_req.actual, req->usb_req.buf and
req->usb_req.length read or write unrelated kernel memory, leading to
memory corruption or a crash. On real hardware this is triggerable by
an external USB host controlling the token timing. Note that the
enqueue side __xudc_ep0_queue() already guards the same queue with
list_empty(), which shows the queue can legitimately be empty; the
dequeue side was simply missing the symmetric check.

Switch both functions to list_first_entry_or_null() and return early
when no request is queued, mirroring the existing list_empty() guard
on the enqueue side.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe75..032d9f04f 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -1822,7 +1822,9 @@ static void xudc_ep0_out(struct xusb_udc *udc)
 	unsigned int bytes_to_rx;
 	void *buffer;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
 
 	switch (udc->setupseqrx) {
 	case STATUS_PHASE:
@@ -1875,7 +1877,10 @@ static void xudc_ep0_in(struct xusb_udc *udc)
 	u8 *ep0rambase;
 	u8 test_mode = le16_to_cpu(udc->setup.wIndex) >> 8;
 
-	req = list_first_entry(&ep0->queue, struct xusb_req, queue);
+	req = list_first_entry_or_null(&ep0->queue, struct xusb_req, queue);
+	if (!req)
+		return;
+
 	bytes_to_tx = req->usb_req.length - req->usb_req.actual;
 
 	switch (udc->setupseqtx) {
-- 
2.30.2

