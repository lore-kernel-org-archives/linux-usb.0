Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551673;
	b=n03Bso5yM5nfndCSaweGdPGtD3KbLesuNDPzLx+Wh5WS4AlndlzpI6yj4UIjtBHoytyE
	 YoRrgJVCsxZY+N+IFyZGAdev+Hz0Z2lj2GD139/e/8YxstAKxcs5FvSslmTnGF7gdG1fY
	 +z92J4QLu/XWewElBKmVESn4Jwf2uVsBE7gYI3+T7lcLNgxBBLOkLg4fsEIe63R+EodM6
	 9fj15VG0ti4mpeJrKwUQEF3XVtVb5hRDn+kKmsKTDeycRJ5hAI9DbVD+GdPJJ7h/+fchk
	 SSMeGHOAMhD1F9lJZUCH7XwN99tXlUmceK+1rZjKPLABa3WdQ8tcLmS/6yYEf7khYDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YofMid7RpzpBeuOJEqJTlM4NYFRjnqyXKJCv56rsYTc=;
	b=vDkRTN/tuq9/K4PWCy2u5XHc+S/irkX78vTD/sqGYunFBhfAHHxxN/rBKYfPpFPBJSzo
	 YPnQHy6SL63ABLoh6wwT0IR8o5GrF5yMf7ye5WpzhMHBlwG18/cOW9KZhiaIF1zm+n8Vg
	 IB2S/lgeI5p3JDRfqcnmYM3knR+A1osAPx8fKkkWqkxPnykPy2xECzJwUwR5Ry+Gib/XX
	 Rr42MeQL0CVWNgFc1T1L8v/rSLCfZl60lGvHmvLDqrXgO8vH+SvUJZ3qgs6rwTV7I0dWK
	 WvM4c7PtMP1xvMlMu9BQYFiq8uV/D7+CJOTqB2jNP3aGOlMg/EabcEtAuqPlqske2oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqRBi2bH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B471606A334
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B471606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EqRBi2bH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36e2b1db9bfso73113eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551673; x=1795156473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YofMid7RpzpBeuOJEqJTlM4NYFRjnqyXKJCv56rsYTc=;
        b=EqRBi2bHbscU7Sn1G8o5z/iPY/BRg6yYR3WwKQ2FCgy0LUd85YrE1JZbxjmrsAAclI
         OYw9FBCaGCg5jTuxUwmLGc0gm+8XEFHEZOxtTrQ0/cJq+WS36HKewvRUdPy8CGOsXhrN
         1nKMoDOxAd7Ahc9SMBHLMP5Q9rWEoKKIDhnulBxXc8ADBaK76a7gRt2IHBTyiI86+cGd
         4j8DKaSqiwYBVaaoKVTUPg1ETEJeWCe3inTqp7YZhDp9qZNUezx/rCFyzDlB3aP0o6vS
         dWxtC9qbF7oXPCwmSdMcMwItrlGcQvAW7i0JvEaG2Z/eKad7KyzcMNj+eNhdRRWtyZzC
         9nwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551673; x=1795156473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YofMid7RpzpBeuOJEqJTlM4NYFRjnqyXKJCv56rsYTc=;
        b=s6CjU60ds4uqz5cjOJq7tD7fTDsEKEu/XstntDXkm1Lhh4eHoaJN6qeMjA3prk8QIj
         67HOnvkRil0NwUYEx1PEfUJc62CatiOof8fljCq4enGqaj9GeYfeh9fgHFyFeWJ1//HW
         C3SRriSlTT61PQNWLiqXdwpwMg8nSpS72TR/kFKAGqPkMSPkoPk8SqOncVG0e8jTmKcZ
         oyzXZTYgS0OiQpsXZoRBeDm9oMjs3hTKbh1hAeXzH9DwtL5sbAZ2Mae/k+uYE0WDQFSt
         CRRkKUyfGrcORr+IKcFCZlKeJhMojqdHEFC+FMgjS2UGxnHzZDthVE+OuTbYrXOJxW2t
         bIpw==
X-Gm-Message-State: APuU4Z979nMLk5lUE0rnd1GiPDUDflooZ9PhqYsOWQk/aY57EBL+MCZY
	4xppmJtpPC/gPZkHgAKjqVWpIHRiCN/dOz+C2xtfqdGWN62N64IOph9ql30E3+yl2nw=
X-Gm-Gg: AYBFou0OtfzB69k3GuTVe+Kdu59ikM/7c1jhAYVDUbmnI5c1K/vQ2i6AJlE2knNl+1P
	6p3TlJq6v29G1mD+RH5blNTuLIinq8pGLzHCr3H6fyKJD6UyJ8L0poTmX/cMEVwbjdZzkU6ucU2
	/P/4BrAbDwAEDI1sfyWGiIevNUIyvjLiilxtDOuJoNi8nwfywvGOWhWKOQFuTOJwLf4KDHUcx5b
	EDKuUOY4jj/SUSC9oNNs6idznFE01dTwK4IX+e2NsuO9YlI2cOAMqYJa65brndkaxa2H/fBAbWW
	9qZ5EY9fsEpxgt2y2DvX/DO6N0Do9yAF6FnjJ58F3WmWnJ/OKoDhe/ZYByuM5yw4phz0uKKTqAM
	UagZsmiZWUusmpJIG1U5i+nmrU8hzhdmhWNbpQMZdjta5cE7J5tT4LbY2ciQVHoCD07+bbmpQRh
	Bw8E8vnLjs60Hki05RVemxpTeyoVi7IJSWSReN8+ITW1QeFAdHMZZ18rq4vDd3TBxqiub2WV4kp
	8o0XCe3uLVFLOhytV6gt7GEkAjWDMZWO/8ztzIMtkwauo1YhHHdAdNW1W7/atKE22rxz9TVzeQe
	Pi5JFi30w6Lhw7K0hG6Tlz+3qFEzoNOyDu1MdZNrfA==
X-Received: by 2002:a05:693c:83cf:20b0:376:6ba5:6090 with SMTP id 5a478bee46e88-37964e03109mr2624201eec.1.1794551672482;
        Thu, 12 Nov 2026 22:34:32 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm6745027eec.25.2026.11.12.22.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:34:32 -0800 (PST)
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
Subject: [PATCH v2 1/4] usb: musb: cancel the delayed works after quiescing the interrupt
Date: Fri, 13 Nov 2026 14:34:06 +0800
Message-Id: <20261113063409.47485-2-lui2012qwq@gmail.com>
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

musb_remove() cancels finish_resume_work and deassert_reset_work up
front, while the interrupt is still enabled and the root hub is still
registered, and cancels irq_work only later.  All three works can be
armed past their cancel:

- musb_handle_intr_resume() schedules finish_resume_work from
  interrupt context (RESUME in OTG_STATE_A_SUSPEND, via
  musb_stage0_irq());
- musb_hub_control() schedules finish_resume_work (ClearPortFeature
  SUSPEND -> musb_port_suspend()) and deassert_reset_work
  (SetPortFeature RESET -> musb_port_reset()) from process context,
  and the root hub is only torn down by musb_host_cleanup();
- musb_stage0_irq() schedules irq_work, which can also re-arm itself
  from the session recheck path (musb_pm_runtime_check_session()).

A work armed after its cancel runs musb_host_finish_resume(),
musb_deassert_reset() or musb_irq_work() after musb_free() has
released the struct.

Tear down the host and gadget sides first so no process-context
producer remains, mask the interrupts and synchronize the IRQ line so
no interrupt handler can be running, and only then cancel all three
works.  This also restores the pre-f730f205cc51 ordering, which had
the cancels behind the interrupt masking.

Found by static analysis.

Suggested-by: Neill Kapron <nkapron@google.com>
Fixes: f730f205cc51 ("usb: musb: Split PM runtime between wrapper IP and musb core")
Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
v1 -> v2:
- also move the finish_resume_work and deassert_reset_work cancels
  behind the interrupt quiesce, per Neill Kapron's review:
  finish_resume_work is armed from interrupt context as well
  (musb_handle_intr_resume()), and both it and deassert_reset_work
  can additionally be re-armed via musb_hub_control() until
  musb_host_cleanup() tears the host down.
- correct the Fixes tag to f730f205cc51 (the 2016 PM-runtime split
  moved the cancels ahead of the interrupt masking)
v1: https://lore.kernel.org/linux-usb/20261112160448.41566-2-lui2012qwq@gmail.com/

Build-tested on x86_64: musb_core.o compiles clean
(USB_MUSB_HDRC).  No runtime reproducer: requires MUSB-based OTG
hardware.  Fix written with AI assistance.

 drivers/usb/musb/musb_core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 9b63b56edc45..25115217e0af 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2630,9 +2630,6 @@ static void musb_remove(struct platform_device *pdev)
 	 */
 	musb_exit_debugfs(musb);
 
-	cancel_delayed_work_sync(&musb->irq_work);
-	cancel_delayed_work_sync(&musb->finish_resume_work);
-	cancel_delayed_work_sync(&musb->deassert_reset_work);
 	pm_runtime_get_sync(musb->controller);
 	musb_host_cleanup(musb);
 	musb_gadget_cleanup(musb);
@@ -2642,6 +2639,18 @@ static void musb_remove(struct platform_device *pdev)
 	musb_disable_interrupts(musb);
 	musb_writeb(musb->mregs, MUSB_DEVCTL, 0);
 	spin_unlock_irqrestore(&musb->lock, flags);
+
+	/*
+	 * musb_stage0_irq() arms irq_work (and finish_resume_work on
+	 * remote wakeup) from interrupt context, so the works can only be
+	 * cancelled for good once interrupts are masked and any in-flight
+	 * handler has completed.
+	 */
+	synchronize_irq(musb->nIrq);
+	cancel_delayed_work_sync(&musb->irq_work);
+	cancel_delayed_work_sync(&musb->finish_resume_work);
+	cancel_delayed_work_sync(&musb->deassert_reset_work);
+
 	musb_platform_exit(musb);
 
 	pm_runtime_dont_use_autosuspend(musb->controller);
-- 
2.25.1

