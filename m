Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45D3EDE68
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145249; cv=none; b=htNrUNaZnOL3oqDwSYRLy41HAi8b3zdnvopQQ24H5kbj6U5tLBzvs5mkHj5g3JYQH524hQtdfHxumT8jyr8tAvWsODwRvI7IiikObEGpJa0YDpQEIRwgbDo1p1Jz7cxRfCaWpyVSily2gQhTNFw/s14iNLpJHRJIezb9zcUjTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145249; c=relaxed/simple;
	bh=zx+leNGUeBHEhm1JutOtvK/7cNMX6N7QAiE5RBgc+jk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NDY8b+1rfBFq2+xorklUfOMy0QdE2hCMWtOtsfbYA3UbhtD/zGu+oqSzhspWaeAXU1UYETML8I8GbuKvlvSyPKKRoQqaJlkY72kfzPbZBMWFq8p+NCVjjISfH6zc191LR/E044rnpxtIm8Oyucaf6hQFW6o/bw3p6C4URBWXi3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=odNI44cM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="odNI44cM"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487088510aso2015000b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145247; x=1785750047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4yKTzT/F5uTEtR3ntvrMcxd+akjSjIaIcKdNSZHGtug=;
        b=odNI44cMcPNdVi0hFSGpf9SPwZkw8bjPQ6gJeqbLxeOA/mI3C4OIAd+IuQryZAJMrS
         hfFxLjowU7NmRk+O20Zs17x1hMC8EkrJQ0k3IfzLpOnjJsG66ISvwfo70vJCrFS7DtAo
         WADfCk7eEkA+kEWu/9WskPVDpfT1e6f4lV9v7ul40RKX7UXaHFqBpaaNZFonMHDLYKou
         FKw0SHeSs1QIi1CeA4j9Y4cOa8lURcqWI3rIHGKRTQmIwjhU1+UAXuRnizx12fOlrQAK
         po9GoJTLJlbEdvwY+bvSlJ876MaN+HHYL04LysZJ56Ww5Lr+/fnxJwBTNVf11L/J8hpZ
         bUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145247; x=1785750047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yKTzT/F5uTEtR3ntvrMcxd+akjSjIaIcKdNSZHGtug=;
        b=qFVNCJoRsAi0CPGD1HbHkR8kGGuSy/7vGLO3YdVyaGoDXQj8PIf0l7O07nTruGL/i3
         MGgdn1JjS34+j9fw0xsbR5xFKt8OkbyU43LQSA8tsyRFvN/FwYgg2h7uur2FYno/JEKS
         /Bpo+j780TaOVxgYfQYqnEQVakB9ytgh9dI2R9kqgASEKc+B/s1ExW0xKix8SdPqhbCY
         w5i2jhKI5vu+CB43tpsuXMafe3n1YRgqQDJKRAObIFnn0Npd/xDkRFYQosYuwz6LwsAI
         bhoO0IHn74Pup0WKJaLNsu6g4EmJ0KJG8Rc9VVO+yt77F2OZjBdxNDM/lZU/mREe/wrH
         JrlA==
X-Forwarded-Encrypted: i=1; AHgh+RoKh0M7GVK0HQx1WVg2RtERvC+2bXLj7xI8ShixwSkN8UrhH7ab87vlKQ76axziry6HknUPuyYFF8o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/lPAhCydbjf0j8XgdukPN8IorZ3k6K8YG/LxpVIOiMUsCNTX
	dgAoXHgcRijiXWqrgb/y1KWMMs7ZYpJLTf22f1B19OLfRHW0nL2fSCxI
X-Gm-Gg: AR+sD10hCNlLoJN2d66hGa/M8Cg3p9qUfLpE1Y3N8m1aElSzCM/l5XxvgYlrN9d/QCx
	kN0dsC3uuDyjFGUWtFa+R0JOo6H/Qf+SwRwngTFNfbr0PT2V14WYI7Eu7dgN09SPKgbo7iXxCXe
	+C+fEADj35WwpFNLWe9BchJfRmnytI/ityCdSxzq9pvP+lOz1klqsM162Uq3s6P84yFu2MKLZRn
	fkgPWDtWzAeEDg+LmjQEEpSuYbegqRC9sdVDdxKVPLmr7cj7MeYBimpK7WQ8nPTep2B30lTmY+a
	vZVcVO4jUd5jP5/vbUTnLa3o3VNnQ1zDz25ix+/ULEcsk4IQ8k0uX5fHOp6r1XectXA9E85HTVd
	OY6M+xV7EdV2iGfDnwcAcevc+9Po18lnJAbn/iIaItFK7lvDUcSgA40f2XyC9IAugx62tqgOdjt
	hKCw8mtemWuo6ZOX7r2np684787sgW68uR6ON5GvEMUugG4TFkmtTYgYWYVDyrJ6pw5UiGMmu0p
	QQdaNU9rStZlk9jU94=
X-Received: by 2002:a05:6a00:1703:b0:848:19f4:3b52 with SMTP id d2e1a72fcca58-84e59554a26mr6005631b3a.38.1785145247554;
        Mon, 27 Jul 2026 02:40:47 -0700 (PDT)
Received: from 7cf34ddc0813.ant.amazon.com ([54.222.46.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341d68asm2737232b3a.46.2026.07.27.02.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 27 Jul 2026 02:40:47 -0700 (PDT)
From: Jiazi Liu <jiazi.liu1984@gmail.com>
X-Google-Original-From: Jiazi Liu <liujiazi@amazon.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jiazi Liu <liujiazi@amazon.com>
Subject: [PATCH 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event buffer count
Date: Mon, 27 Jul 2026 17:40:15 +0800
Message-ID: <20260727094015.5101-1-liujiazi@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When dwc3_check_event_buf() reads a GEVNTCOUNT value exceeding the
event buffer length, commit 63ccd26cd1f6 ("usb: dwc3: gadget: check
that event count does not exceed event buffer length") returns IRQ_NONE
without writing back GEVNTCOUNT. Since the DWC3 interrupt is
level-triggered, the uncleared IRQ source keeps the line asserted,
causing a tight IRQ storm that accumulates 99,900 unhandled interrupts
and triggers spurious.c:184 BUG -> kernel panic.

The resulting call stack:
  __report_bad_irq+0xac/0xc8
  note_interrupt+0x340/0x468
  handle_irq_event+0xac/0xc0
  handle_fasteoi_irq+0x120/0x228
  gic_handle_irq+0x68/0x108
  ...
  kernel BUG at kernel/irq/spurious.c:184

To reproduce, write a bogus value exceeding the event buffer length
directly to the GEVNTCOUNT register:

  devmem <DWC3_BASE + 0xc40c> 4 0x1004

Write the bogus count back to GEVNTCOUNT to clear the IRQ source,
consistent with the stale event clearing pattern in
dwc3_event_buffers_setup(), and schedule a soft disconnect via
softcon_work to recover the controller state.

Fixes: 63ccd26cd1f6 ("usb: dwc3: gadget: check that event count does not exceed event buffer length")
Cc: stable@vger.kernel.org
Signed-off-by: Jiazi Liu <liujiazi@amazon.com>
---
 drivers/usb/dwc3/core.h   |  2 ++
 drivers/usb/dwc3/gadget.c | 23 ++++++++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 608daeb7ef10..0881ed7e956e 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1004,6 +1004,7 @@ struct dwc3_glue_ops {
 /**
  * struct dwc3 - representation of our controller
  * @drd_work: workqueue used for role swapping
+ * @softcon_work: workqueue used for soft connect/disconnect recovery
  * @ep0_trb: trb which is used for the ctrl_req
  * @bounce: address of bounce buffer
  * @setup_buf: used while precessing STD USB requests
@@ -1189,6 +1190,7 @@ struct dwc3_glue_ops {
  */
 struct dwc3 {
 	struct work_struct	drd_work;
+	struct work_struct	softcon_work;
 	struct dwc3_trb		*ep0_trb;
 	void			*bounce;
 	u8			*setup_buf;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index fa0f16ffafef..9b24259272a4 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4669,7 +4669,18 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (count > evt->length) {
 		dev_err_ratelimited(dwc->dev, "invalid count(%u) > evt->length(%u)\n",
 			count, evt->length);
-		return IRQ_NONE;
+		/*
+		 * The DWC3 interrupt is level-triggered. Returning IRQ_NONE
+		 * without clearing the IRQ source leaves the line asserted,
+		 * causing a tight IRQ storm that triggers spurious.c:184 BUG.
+		 * Write the bogus count back to GEVNTCOUNT to clear the source,
+		 * consistent with the stale event clearing in
+		 * dwc3_event_buffers_setup(), then schedule a soft disconnect
+		 * to recover the controller state.
+		 */
+		dwc3_writel(dwc->regs, DWC3_GEVNTCOUNT(0), count);
+		schedule_work(&dwc->softcon_work);
+		return IRQ_HANDLED;
 	}
 
 	evt->count = count;
@@ -4729,6 +4740,14 @@ static void dwc_gadget_release(struct device *dev)
 	kfree(gadget);
 }
 
+static void dwc3_softcon_work(struct work_struct *work)
+{
+	struct dwc3 *dwc = container_of(work, struct dwc3, softcon_work);
+
+	dev_err(dwc->dev, "event buffer error: performing soft disconnect\n");
+	dwc3_gadget_soft_disconnect(dwc);
+}
+
 /**
  * dwc3_gadget_init - initializes gadget related registers
  * @dwc: pointer to our controller context structure
@@ -4772,6 +4791,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	}
 
 	init_completion(&dwc->ep0_in_setup);
+	INIT_WORK(&dwc->softcon_work, dwc3_softcon_work);
 	dwc->gadget = kzalloc_obj(struct usb_gadget);
 	if (!dwc->gadget) {
 		ret = -ENOMEM;
@@ -4868,6 +4888,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	if (!dwc->gadget)
 		return;
 
+	cancel_work_sync(&dwc->softcon_work);
 	dwc3_enable_susphy(dwc, true);
 	usb_del_gadget(dwc->gadget);
 	dwc3_gadget_free_endpoints(dwc);
-- 
2.50.1 (Apple Git-155)

