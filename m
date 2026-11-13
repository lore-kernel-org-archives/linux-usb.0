Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551682;
	b=kISpBoi/BRzJK1uQA9TizJcNNTg12SRyFQ981mNhOTahU3JrMlSS5h9ZSjL+O5L2BI8d
	 nUo3J2Mgai0I+W+wU0ViBX7wAwKi/kBT6SC2LYabHZvVd6mur/M5dWlaImphT+h4TXLTN
	 gkn7fGgE6c49hM1a7Z4p8H9rRC+Jnga+ZrZ+tN7xWgdcMGA3Ex2FB9MgliwQ9juY3e4zn
	 8HhCzeT2GL0lkl41jcYM7sF7zFmbMkpPiy0O1M7CmxO3Cl9d2Mxtl4lQCIoHAjY5byzDw
	 Bmt822XkJF6QoZvDEtK/G359IFGCMdrx1thRelOe0nUAmbN9vF+gv7P2JV5Vb4wGp/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=axXbVbTMs8zsZ3lI2s9N/4Jxd4kEwJx28aoWH25x+cE=;
	b=BWsnCqC68fvxmSA5M9DqxxXKIRcB6PRzt14ThLweadXVfOyy9JgNlU3f2/nq50kGjIeX
	 jRJ2a10g98WD8mp4loDYS309APennf59ER2gt48epFDdxkbfW3OeFrCstI5QmFTzFhePL
	 lZVHG9L4LFFtewvQKmhkUq8U0dqd00R37L+EAzFENsoGEhTAAzI1K2vnj6mDRtYxSDX31
	 ggfPuXjP9fMBn2rRkeWQL6VoqDpyUFLlmNOUYanp833wVBHFG+K6ff2yVK+wsMvsR/BTv
	 clX5zLi9ixa8HNH5mVjEgJaf/EwIpWrQJFHL/9hd3fEk4uC4HXO5NcZ+QL2V7zIuZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKPme0Av;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40386606A321
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40386606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AKPme0Av
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3719e3cb82bso78115eec.3
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551681; x=1795156481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axXbVbTMs8zsZ3lI2s9N/4Jxd4kEwJx28aoWH25x+cE=;
        b=AKPme0AvXK7JzQlo+nBWEoXKS4bY86V2/qGYM1ZoBLB8APsem5UDhO3yhfRwU0UFIb
         gxItqkm7SCJlF4x4IuHd2s3D3NafGW6E+BRCCvswEwUGmNbpOxtuuN800UpkU/uCNo82
         h7KLW546ooD9Cz+mZ8Ce34GRKXBv1hwznBC/t7xtF/Hrp+5CNrS7xL4ODiQ+aTWqPaEk
         5Q7I4Oae6btd2Lu8hY3hs3oWQYoBkAn4+wjW13uBdvAhz6fCYNlLVSZPzSW9J6pTdNHM
         ZrRW+aqilWB1rhUyX1IBdJZ0C9I24qrqWQk76pC2XNpQEaRpH1IYWKXwkCDgH+K4y57V
         NFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551681; x=1795156481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axXbVbTMs8zsZ3lI2s9N/4Jxd4kEwJx28aoWH25x+cE=;
        b=L1knTyHsH0kxbwKSEwZcRkcDraX+VRicX7jLSnwFVavNX1RSSpMuN8tBA9FmOdFJIO
         /ilxL5CK440ffn2w0raXpsb8RvLP3yJTf1dTVgPKLFXroEErCRJcHokmbgTF0qvCorQn
         zg0IP4Pxge0DJAHCDuObysteA2qhUZtPpmF5kSKh+wN/w8X8pAB/DEGMpAcfetuqnrbA
         DE97fzFUMiLwjW7C7dNmevYZXeT3lNFCGxzxzVspWj4+NZnlXoN8t1Gh1HAnru3p4vcB
         L8iRL+2k1HLrts85iiMoehu2wZXu1cx/AvD9vKSXx/FVVEUtybTCaoaPrH/FEwwemcxf
         PPsw==
X-Gm-Message-State: APuU4Z83iIwCcsaM11q/lVWxEoyf94Lltr6jyXRo63/9MiTIzXPV76xr
	0JMSbrIifmICxQubIlmvF5Otw9tX+G//8CTXHwFocSnwNiFqfwwHH6blvyCL9CuU9G0=
X-Gm-Gg: AYBFou37AeKhRgBG14uZ9cUp81sf570BXx+NEGKi9Ukl3qXNc7sYzU8Lliu5o/WE2zR
	OWJtpAvdLiF3ozpTblH7XPggUUUqrpOPag07Bq7bCSCDMrzn3+ajiDDKyRAg8Mv3BDorhJTIfr7
	dbhO5G0x1nY1fECyGGj1G4CZsHuv1MbPWeshVU7QFBWlPsuzzSNWIMH2QrFSHtV009rPswsYHTC
	TRFZiLop/2at30OOk/QYeu5Gfb+409IO4buUNFJ4en1kiwadg7FTBBfzMDAZTbe4aR4uN94BCGV
	35IVQPb4VGjL4v+GPXvsqSFSec21bLpRY67YOjhd704yV5joFdXSrKezqAQ4XeWkfJm7fkCZb6G
	Iq5HH8/i7fghf4WjdSJCrgpPIxVZob9Ho1iqR4CJMie+l6IdYiwQnfIAPONEkmQeN4S2XnXo61V
	u9Oj/wOyehMO1vqREIJSF+UnNB6WKsL9hd9j6Vfx0ell5pPcWPTq8kbDwsI0BZYhFpkqKaVg8h0
	vjg5/cIprk5GlRL/Zi2q1qtiGhqcmGpq4EzIYb2ylEuxFEpggFmuQ1FGVl4D99Qipsl/M+SZ/Jo
	akrZUitM6pzujZNUmyJG96QStjbdVlotqxWqyP6jAA==
X-Received: by 2002:a05:7301:a0a:b0:375:f846:5b3f with SMTP id 5a478bee46e88-3796057e734mr1831234eec.0.1794551681320;
        Thu, 12 Nov 2026 22:34:41 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm6745027eec.25.2026.11.12.22.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:40 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: linux-usb@vger.kernel.org
Cc: b-liu@ti.com,
	gregkh@linuxfoundation.org,
	nkapron@google.com,
	tony@atomide.com,
	bigeasy@linutronix.de,
	balbi@ti.com,
	shimoda.yoshihiro@renesas.com,
	robert.jarzmik@free.fr,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] usb: gadget: r8a66597: free the IRQ before deleting the timer
Date: Fri, 13 Nov 2026 14:34:08 +0800
Message-Id: <20261113063409.47485-4-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113063409.47485-1-lui2012qwq@gmail.com>
References: <20261113063409.47485-1-lui2012qwq@gmail.com>
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

r8a66597_remove() deletes r8a66597->timer while the interrupt is
still live: the IRQ is devm-managed and only freed at detach, and
r8a66597_irq() re-arms the timer when sampling VBUS (VBINT).  An
interrupt landing after timer_delete_sync() re-arms the timer, and
r8a66597_timer() then runs on freed memory.

Store the requested IRQ number at probe time and free it before
deleting the timer; freeing also waits for any running handler, so
nothing can re-arm the timer past the delete.

Found by static analysis.

Fixes: c41442474a26 ("usb: gadget: R8A66597 peripheral controller support.")
Cc: stable@vger.kernel.org
Reviewed-by: Neill Kapron <nkapron@google.com>
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v1 -> v2: no code change; collected Neill Kapron's Reviewed-by.

Build-tested on x86_64: r8a66597-udc.o compiles clean
(USB_R8A66597 + COMPILE_TEST).  No runtime reproducer: requires
R8A66597 hardware.  Fix written with AI assistance.

 drivers/usb/gadget/udc/r8a66597-udc.c | 8 ++++++++
 drivers/usb/gadget/udc/r8a66597-udc.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/udc/r8a66597-udc.c b/drivers/usb/gadget/udc/r8a66597-udc.c
index 469075b064ba..bfccc6565e0a 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.c
+++ b/drivers/usb/gadget/udc/r8a66597-udc.c
@@ -1810,6 +1810,13 @@ static void r8a66597_remove(struct platform_device *pdev)
 	struct r8a66597		*r8a66597 = platform_get_drvdata(pdev);
 
 	usb_del_gadget_udc(&r8a66597->gadget);
+
+	/*
+	 * The interrupt handler re-arms the timer on VBUS changes; the
+	 * IRQ is devm-managed and freed only at detach, so free it
+	 * before deleting the timer.
+	 */
+	devm_free_irq(&pdev->dev, r8a66597->irq, r8a66597);
 	timer_delete_sync(&r8a66597->timer);
 	r8a66597_free_request(&r8a66597->ep[0].ep, r8a66597->ep0_req);
 
@@ -1896,6 +1903,7 @@ static int r8a66597_probe(struct platform_device *pdev)
 			       udc_name, r8a66597);
 	if (ret < 0)
 		goto clean_up2;
+	r8a66597->irq = irq;
 
 	INIT_LIST_HEAD(&r8a66597->gadget.ep_list);
 	r8a66597->gadget.ep0 = &r8a66597->ep[0].ep;
diff --git a/drivers/usb/gadget/udc/r8a66597-udc.h b/drivers/usb/gadget/udc/r8a66597-udc.h
index 9a115caba661..08acabe02421 100644
--- a/drivers/usb/gadget/udc/r8a66597-udc.h
+++ b/drivers/usb/gadget/udc/r8a66597-udc.h
@@ -110,6 +110,7 @@ struct r8a66597 {
 	unsigned char interrupt;
 	unsigned char isochronous;
 	unsigned char num_dma;
+	int irq;
 
 	unsigned irq_sense_low:1;
 };
-- 
2.25.1

