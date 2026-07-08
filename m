Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E027F37DEB9
	for <linux-usb@vger.kernel.org>; Wed,  8 Jul 2026 13:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783517981; cv=none; b=EulAZ4D84OLF67Nfv0Wbag7zgEVFmP3XU/JEKxW8OlHTVIGWgmZnO29cW//iT/RWmg9FVAiUNpGCJBF4LbYdtQKY/S9Ji2x/Cr0fBZnjgfDWy9M03SiT3AP96EQJ+qMBzM74fmMZKAAxosl61DBW4f2i0RG9bZQi9C17CuWlNYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783517981; c=relaxed/simple;
	bh=4s8nR35vQyB1XDrCZ/pxxMbQEb33oVtZJ0ySWsm/CGI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pJZs3A9f06j+n+NUNRgz9eI9ETYp3hTSFVuMD3NhRneExkCSm2lBj9vk5WsDbmyR/k93JeyiCHTblG82myhQauba9O8Gc4bbtKVsdSI+SklTRloFNVMuuf8cpqLy6qyPE4e9MOzb/j3SWQs+uW0L8gPHuGZhe5fJ9QbhfF0tk1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym5PHESs; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym5PHESs"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so2404301fa.1
        for <linux-usb@vger.kernel.org>; Wed, 08 Jul 2026 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783517978; x=1784122778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vw3XAudObNmPhki/xMj0cQEzDrcxJAiJ5mU4ifGvXCE=;
        b=Ym5PHESsNefGQ7lhBIIwjrwTlFrnbZHPdU/4rxfCpTs83aria3rcJywH+mTh5MS1nK
         2RQBr5F4xmigxsM4SuQzMYsZV+pFpGHYStffKG8TzkSVPDcPFM3D7hKhd5UwIoN9PGGZ
         JOxu+3w34k7Wr+kQPZXUlyTZy3aRzZNx6ayGDT2JGhoHt7IT9zUqYoKCwd8iTmltHETP
         0jDUIWIWKr4JHLTNI5XVg1fwFeiujRMdotuWTlwR7MoY3mz1OwvVKv09AX/Xw3k1Dez+
         ZDndu16JCE977Cht4QF4BenOFMeEpu9AIjX3qStvqDMouQMHgIFxLHArS5kGAq1EAeHA
         c5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783517978; x=1784122778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vw3XAudObNmPhki/xMj0cQEzDrcxJAiJ5mU4ifGvXCE=;
        b=Hu4mqcsRKRc8WlhJANOycPC1D2v0UyEWrKub42K3HnUgxuGDw3d0dkr9Jr4NtMmE+f
         6y9S974fVGr+pA7wTa/YEYm56xnLRJLFm89fRx0fSu1TmFoSH0cng/JaQX9xcUTMEWTH
         jEynAm3vzUjk/vcJdFCX1IzZuf2iUvfQwB0H+asJm1MLfHaWv0p3YqTlF7FQmgqg5O3t
         kb4RTA4MmofPySXkjJGUOq0mSEdTpZJKg9F/OHRgM2EM9R1J6a9ZnIzD+LAD+1/NhPqK
         X8GUoe4Iza85+x0L6K9r5R8witp1XxFVbmK6K8KoVfQ4IBjgUtPr6OI+/GkWionL3CP6
         8Gig==
X-Forwarded-Encrypted: i=1; AHgh+RqESX2tso/gyEuNgafq8zXjBCVgcPShXShd+4Jf+eu08QLgzR34xKN/JP9omMCMWJpfbuoepXeM13M=@vger.kernel.org
X-Gm-Message-State: AOJu0YycT/+Bid9U4DXCVbXvQWyBCdLe8X02DLubZ4LCIECjLBCwiHzO
	1UogaHdYVFyWILZWVt6CiOtdn5yDe3WKLsnURO2v3YEPWhiGNfBMGnvk
X-Gm-Gg: AfdE7cltnIu6b45E5CH4SPDBLb7I4M57ZSooN2G8uqh0gPJgH/nPuL+pX8xalufPmCT
	MqVZKc9vCE6fXSVFQro5wSyUS8Pnh10HhC71lOZ+IZqMFmD/9V+ZHhr9VJVs1W6KNw2OxaJtlkx
	wJk0t1YcFpye45MpuwOf0vXEBRtPyCL/DZFXSJQHfh1ZPt5am2/O4ZAPVfd/WZatHwTwJeTt720
	cS8FpYUFx6yNY7HfSTzOPg4Ym0j3wxvx/zbiv0mWL05KkqRpUg38m2BQeA9ctJEgHmVBVmLuRYt
	0cRYYOaqTpuDu9f9MCGVobLswth5BUHHbBLXH92xBJe31GYx0BVt7rjBPUUGgftrlefCYyM7BTB
	m+4IyntP8IIilq4tN6irBX0cSbnLgq4fCiqR0nIy3advIi1a2P0MYiw0tonGcEPFR9jQlkp+t6H
	CLuQ==
X-Received: by 2002:a05:6512:65c6:b0:5ae:bf3b:cb3 with SMTP id 2adb3069b0e04-5b011471fd0mr580895e87.4.1783517977715;
        Wed, 08 Jul 2026 06:39:37 -0700 (PDT)
Received: from lgs.. ([118.193.33.13])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb417sm4428357e87.50.2026.07.08.06.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 06:39:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kuen-Han Tsai <khtsai@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: u_ether: avoid NULL port in TX wakeup path
Date: Wed,  8 Jul 2026 21:39:27 +0800
Message-ID: <20260708133927.771430-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The change referenced by the Fixes tag clears dev->port_usb at the
beginning of gether_disconnect() while holding dev->lock. This lets
eth_stop() see a disconnected port immediately and avoid using endpoint
state that is being torn down.

However, eth_start_xmit() still checks dev->port_usb under dev->lock and
then drops the lock before calling ether_wakeup_host(). The wakeup call
passes dev->port_usb again, so a concurrent gether_disconnect() can clear
the pointer after the suspended-port check and before the unlocked
wakeup call.

If that happens, eth_start_xmit() calls ether_wakeup_host(NULL), and the
wakeup helper dereferences the NULL port while deriving the USB function
and gadget pointers.

Snapshot dev->port_usb while holding dev->lock and use that snapshot for
the suspended-port check and the later wakeup call. This avoids
re-reading the shared pointer after it can be cleared by disconnect.

Fixes: e1eabb072c75 ("usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/gadget/function/u_ether.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 59d85d6a84a8..ff3ed7e3467d 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -463,22 +463,24 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
 	struct usb_request	*req = NULL;
 	unsigned long		flags;
 	struct usb_ep		*in;
+	struct gether		*port;
 	u16			cdc_filter;
 
 	spin_lock_irqsave(&dev->lock, flags);
-	if (dev->port_usb) {
-		in = dev->port_usb->in_ep;
-		cdc_filter = dev->port_usb->cdc_filter;
+	port = dev->port_usb;
+	if (port) {
+		in = port->in_ep;
+		cdc_filter = port->cdc_filter;
 	} else {
 		in = NULL;
 		cdc_filter = 0;
 	}
 
-	if (dev->port_usb && dev->port_usb->is_suspend) {
+	if (port && port->is_suspend) {
 		DBG(dev, "Port suspended. Triggering wakeup\n");
 		netif_stop_queue(net);
 		spin_unlock_irqrestore(&dev->lock, flags);
-		ether_wakeup_host(dev->port_usb);
+		ether_wakeup_host(port);
 		return NETDEV_TX_BUSY;
 	}
 
-- 
2.43.0

