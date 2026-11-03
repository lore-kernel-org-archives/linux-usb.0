Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695653;
	b=3up0QG/sLEDAC1C0wRx7UuHl261A1WGeKR32wmqLvLZfFT6pFuOhU07BnYeQI//hyO9e
	 3YIrmz0DoYkiqSBrriepHgilct156fVxKHHGPHpvu8PNBIGOM4xSDhRWhvsi2EbBRmJbd
	 /lQHSSkZlUbQE9E1rKombu5cMXG258xP2NvQVYxqCf5+9lMMsqHNN3IJrzfuardW0wvhX
	 wpZ/JwjhJo3YT6X8VkQLVaxld/wFuLmyDtMoGFJrMYQSkCu38V0NkmuwtmvN1GoVjZerd
	 M8P7eaAESlZxQ6wB8if2RdD4qfv0LMfWwzNHuQcfymJq5rWd5N3DUjH14Fy3TxMEl3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
	b=4y78yKKQ5KBdH5p1C1jgssFdVEa/2Tr9aux9XU0jX+sgrlJquakSJRbx30hoWQ6XXW4Z
	 5rm0pfAHFHbPp+jQbYMs3cPk868BrsHBu0bb2e6/oDjEOvLBxm5DFmIZHWkcggCmHULi9
	 vkY9aHR+vI3wOibo7pqzdcyR9BEBh2Z7GWEcq2foo+iLLK1QrIWaVUlJsMwmJxHgW0ZiZ
	 /0OAzijC4vmj3z2a8KyOg1UCIMDDBBOMIEJa1jXShK7v8NABqp1NgWcnLQLMfRVXNK4e8
	 c/bem5R3XTMRIebeC/Flw5bOUmRLwNxPvv8OB8Es3VBXauQ3W8H+CIiYHjVb5jzwgkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WeI/PAMh";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743E606A327
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 08:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8743E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WeI/PAMh
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1898281a91.2
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695652; x=1794300452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=WeI/PAMhpY6ElVATxqJzgVu3Tvz50yNK9Mtvb0jpEhROSFUKak1i9ybMTlBzKA5whc
         H3oJfPliaqhT5UOmk3LO/ZpJ7jbeCP5z5xo4PZO7HB8ogQrBN0ozoiT5gf0Or2bmfAhJ
         y54kdg9c2zPBpztYQ21x1A6cnAQKechI9efPsSFGYmdgmX6n615wxC5JTxtHGkcaAkp6
         Gq1yHGQpIzojAVWYkF6u9oT5W1Lctw5gPpwYUDwPUAi7zKghOiscZSFVSGfPpAWvekYX
         5c/VMOrFzi5Yf1yy3AjkUim90lI715PTUEBDA5BbI+7KOYRSq6UNnLFBLJG6rg7ERn+/
         5H8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695652; x=1794300452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4tKXObhoI+fdUM+1l8D4TYSSuaXMy7Ud+cPi9l7w0w=;
        b=B7GEeBygN9yujR/lumydh3Tg1Rm23L82cDVwXvXXlWj4/KkHIxJbsPy/w24iWd4nZr
         WCArmt0UELi0zON6D6cIwh8J/ETpkrOnoll3KoTCS7XnG2pk1YeuDKMEI7wqd+AfoMpU
         i5ZU+BFkvMDLCWl2DeVR60H7+0Mqocj2otmwE4VatesoeVdaAEuGJkCOzyI4NtLFKBrG
         EjvN9guHRyxQ3g0MVCQu1lXFULMkmvfFSUPLQUz6KwtgqH2whCzuQwZ3Q3wThuQNEttl
         D+FhuQsj3bVLYkxfCtx9jgNT3tFrrJ8lckkjN0SxlKSo2iHPkDb7lA7v+wqUjKuMWW0p
         7eGw==
X-Forwarded-Encrypted: i=1; AKwUvBy7f0QzVUPGIDEvMGA+fdBNo5LxzKUZ/hC/iGzVqx9SYpCODHNMDj3//MEs69gGgrAYfDXV4YMidOk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MIiiXP77BQZmw964+5EAph+tystLWksmipUPehG8O9anHY+nO
	cFHsLm4c1ZJWB1ekt147PSeLMJzYnpmghbWuNB/s1uFSmg5a0nldQuVM
X-Gm-Gg: AYBFou0N8IPFPRE11y8MNN01TXXahYmNlwObqyIBCY0//L9H8Y3usm7yNL2F18Gk+tA
	1F6Kj7MV6M8USoz8uhuR+I9z8j5n/uSMyoDJvkBTo9fPXu5ap6WD5End/B9nosHXBGK9lW+m+7m
	Mn/1QiBq40/DvdAHUK+VwMhEsF7f1PXlDwCz6vMb29gL2vK51lbFSEN1ZF57e9/4/cufBeqtFEl
	8whD4nL2eRlt8Cd+37L99MFz+uVZqkqn9uyCBdpdTEZtpTbADZf8AwlYXRIwi6hLyGVwOP5dtWZ
	6m927dPbRU650xi33/5jSokxSc6L5SYP9PcayAP0jPMVe6iP5MOOCKyMNA7Fxf74rk6Nl//OuLM
	dl0/C/lW9JjDk80I/M0oHvWkuJYkzT9++XPjh8ls8+dMmuaZzOvql5wfsk2OIPRTYI/yu+mearf
	QBhfmhiEtOFXNTWrr8xPwfsMWDNFhx+beeNSbM4+k42VpRX7bUvPgvezMI0Teey8UOpvbJw4viH
	GtSFbw2rCDipAlhiIojABMlf9uQIBmuNl1Ovne3oOJWdrs6noyWXVy8u7Klf3qingarP2SNNVhQ
	CCKz+f85DNq6Cc4PDGnX4m0PwIc4O/kOwPMrLP5IR5wWw8jO
X-Received: by 2002:a17:90b:2fd0:b0:3ac:af8b:6f3 with SMTP id 98e67ed59e1d1-3ae898149e2mr9319285a91.52.1793695651757;
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3294725a91.10.2026.11.03.00.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:47:31 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>
Cc: "S M, Suhan" <Suhan.SM@amd.com>,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] usb: gadget: udc-xilinx: guard EP0 dequeue against empty queue
Date: Tue,  3 Nov 2026 16:47:22 +0800
Message-Id: <20261103084722.1821982-1-lixicaicai@gmail.com>
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

The EP0 dequeue side, xudc_ep0_out() and xudc_ep0_in(), calls
list_first_entry() on ep0->queue without checking whether a request is
queued, while the enqueue side __xudc_ep0_queue() already guards the
same queue with list_empty() and the non-control endpoint handler
performs the same check before its own list_first_entry().

list_first_entry() never returns NULL on an empty list; it returns the
container_of() of the list head, i.e. a non-NULL wild pointer into the
enclosing struct xusb_ep. Switch both functions to
list_first_entry_or_null() and return early when no request is queued,
making the dequeue side consistent with the rest of the driver.

This is a defensive consistency fix found by static analysis.

Fixes: 1f7c51660034 ("usb: gadget: Add xilinx usb2 device support")
Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023073131.637062-1-lixicaicai@gmail.com
v2: refactor the commit description as a defensive consistency fix per
Suhan's review (the originally described bus-timing trigger is not
reachable without software first arming a buffer), and add the Fixes
tag. Carry Aldo's Reviewed-by. No code change.

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
