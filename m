Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F5F3F9F3B
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402195; cv=none; b=UH0RredxM4ZaiOehwNV/Nacq/AMeprnSXNomaxm40ZL0bE2StkvrF1La0tvkPO0aRQktf7wkhSDgjFbOEHiSGu+c8wsoRVPGIz/nJ8n8RIgi91ZxkGmuG1HuRuXifSLeDzjABJc9CrPdbN7fmwhe/wG/FTEeaV6xjAaa8I8lxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402195; c=relaxed/simple;
	bh=K2iH79EzKHfcKu5xkEsN9g7kyrqwynurQYgfqPqmzoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rdtIPIFoIfU2ph2DpLVs/SjJm8oOFqdv6gkfn3HV+p+nYG/F9Ojm+NqlEdSWLQYukmZFfFYFxVcJ/LJPu2cEMeWJqrgNj5ZJZpdWCRdKJKMjKKb5grai96+ofuATY6shuKQatj7zV8Ho4NWVbm2q/Cu1Z8p5A/tp41p+eYlhe/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEvfPvra; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEvfPvra"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954aff6088so17309955e9.3
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 02:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785402192; x=1786006992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRXD2WzSYUWU1zxNTR+e3C1lqeHDNkKPz1cLzijpZqQ=;
        b=oEvfPvra/FaRXmLFj9lqWZHXLQwCS7QJP0yda5aqIjoLL+DCO2f193Qm+jUs59YXbp
         4HbO5Zer21xQVmyNbCT3IfHZScXn+2g19afMwss9QzaxMiN+d9bIpEksuanD4D2wB7ZF
         nUHrbTLYJD7TbqfLdwZlL4Tf+tHyv40IB52//hA2/DdoPRy2l5wdNznCCyeH9aVppFhn
         b8ujbSYUYd8WuitkUsdTlrnEDJOm0mTpMnjdtIgh1t4nC15+KzE/b//NSJFueyjMeLf2
         lglIqWQhEqN7ZSrgfe6FtHGAtbgk0Of1HiaAEDcz8Tad1rIUiJQnkFKGdmVKyJ1jTz2C
         dNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402192; x=1786006992;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mRXD2WzSYUWU1zxNTR+e3C1lqeHDNkKPz1cLzijpZqQ=;
        b=B0geJ6q1sg1sT29+3LA7J9UG5JX+LEzvdeECUWV4jg4+GwJPDitJKeIOsgyp2KnHO9
         lz2N0O/UUv3AkGCqAFhiDGVqOPS6Z5Ef/D8KvrEvLk/hp0bRIAzWR8DQrC9Xlr4shXEy
         TRov/UdYaOlsU8dBunV3jsBCwxvuFAtRFbIpPy8aUMxpO54Fm9h1zsbXLG2ne50p0T/x
         mOB/zBCqWbE0KtxBVD3RTG8kCToSO3Ty/A3oD3C89V0udNJJzWqXKZOZjrj7xzeJrINW
         wxyIJVDUNu9eE0SApXnq0CKqu9Qn+jxmj7KUdOYl1I3umKkwQ6wpGzimkiJFCBzrsXnF
         zuLQ==
X-Gm-Message-State: AOJu0Yy0tGzpi5T7V7sBGxKvGkFNDHIESq/IG7f0t17MX5udz5YFoy5Z
	36vSmtSfeMIx7JJo0cKd9EVmOrnNVpuIczPVZXxqSMtsUhYEY41Cnm1D
X-Gm-Gg: AR+sD12/n03aCLSCOZnMkKYZzY3Xv10uUpzvut01fR/j5ZmWgKjQR2iMOoGx8BFn5UQ
	4d4Es1mgo98Q0xACr4JEoVGgGM85Q4X/VQc7uehTgDYoQazwr/w4GFtjPUy28BqG8hJhJYRyAKt
	o6PUfHr0v4EQgYBoMnyVUWtB+myfuI1psqdaK6B8eEu0jVIcy56TT+XFnYMiMi0G+qhJIFgFv6S
	WWkgD191du0bQ/d6fNberzFQNo9u0ZF9C1CNXVqDSyoZ2GvQoM7pYpmd4kRcMAUqDyeZ+xdh+I0
	7Z+raMVU917vcFzsb9sB9FIly3fYCZNSIgdEXwFcMM02tEmiTM4T761WlbXzcmXwuVC+HNpPhHU
	JsVNc9S9F8AxZwmKsvCnMV9Qdn2fja5YHKQsANjoJn/Y0ngxNoF/Toc0Mg/wSnpqHlfoXg+WKD7
	TJh4MDwvXcjAIoJFmK16wlRNCdcnBbIVM39SrTOxr6ECOSX0tAsz8W2iBaSBFYnutox+S5fA==
X-Received: by 2002:a05:600c:1f90:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49800e74e48mr21056985e9.9.1785402192001;
        Thu, 30 Jul 2026 02:03:12 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88d6f4csm4955011f8f.2.2026.07.30.02.03.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jul 2026 02:03:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 11:04:30 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Slightly simplify xhci_set_cmd_ring_deq()
Message-ID: <20260730110425.67cd0f9b.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

There is no need to clear the cycle bit after adding deq_dma, because
it's never set there. Clear it together with the dequeue pointer.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index a58a9a5b487f..dece11ffc0e6 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -495,10 +495,8 @@ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 	deq_dma &= CMD_RING_PTR_MASK;
 
 	crcr = xhci_read_64(xhci, &xhci->op_regs->cmd_ring);
-	crcr &= ~CMD_RING_PTR_MASK;
+	crcr &= ~(CMD_RING_PTR_MASK | CMD_RING_CYCLE);
 	crcr |= deq_dma;
-
-	crcr &= ~CMD_RING_CYCLE;
 	crcr |= xhci->cmd_ring->cycle_state;
 
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init, "Setting command ring address to 0x%llx", crcr);
-- 
2.48.1
