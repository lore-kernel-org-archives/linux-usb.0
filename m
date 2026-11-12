Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499519;
	b=4PNgl+x48pnXFRGWD740Alu265v/nEQ32NnwxzHqohAbrzvMGPnpFgV3DJAKQii2CU71
	 mnqnyPK9pcXp64Lju7F2LG9e7642QPOMB1oHt5m/Q85KiNH+IWIlXqo/1vMyZAe/yhO/F
	 j7WSbLDJwWT0p27jCIyzvNQz7RxgCd/dDumX9wvMrLTdHcVyrDFK/5FQrwEOrqWW9lI/r
	 ylZDVwrvlhoR3dc58SuXRZblMJXRWcqZiJIJOI5Y9QeZ72Kl9vyChE33EZQ5E3V2hLm3B
	 CKHIUIA+NKWDZCV/saa2YgtFz5cJSxTxQrieAtIoXelvm+V6ZM+oOsen0nsInEdjIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VirwsWcUGB+wftXqJRXa0lz3ydc4K0zhD+XqX/ctFlE=;
	b=XdSQbRUWheg6Qfdu0H2ot7zns67HDtUCvOAim0I9+eIzGQRSErjeJs1zgoXv09j2rysS
	 e6f5M9dlsMEVzhl7C0yFtuAWOFMKhPHpDBuklLGTOoBu3/Ydlg5snShi2at55Fkz/63SD
	 scuJOtEiyrJSbKqRVnhp3mUZuFSl+wMun6ts9OWnYqzI3W/vXVAkguMVQQQECOn1jXiU+
	 DqYQPCP/2wY4Uhqi0AzaYGdi3EAgmSFws/sNkgzVRpHd04EXe6qA+ha3BtAv5fxaCB2bU
	 qhKVEap13wKp/K8EsaO4+176TH4dirRZ7WA0+2fBhAjxr8KM9vAhkFFrelqpDO6PVzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lbtqx6Wn;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E615A606A32A
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 16:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E615A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lbtqx6Wn
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-370f4e5cfc9so3997eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 08:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499518; x=1795104318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VirwsWcUGB+wftXqJRXa0lz3ydc4K0zhD+XqX/ctFlE=;
        b=Lbtqx6WnoZZ4GrZkjqNDkqtKMu4Kf04rdxL3HRa2UyzFiubru0ZQ0AF4hszqZwGKat
         1DeXVciKbWge2j09D7H8ZD2JJxAAMgwdSVzr0XEVDCFy6wfR1/i+F2eY4oGJYoyUitp7
         FZm68hwwLtuRZ8jw7O1yLjl+32OKpKSV12fW1twpEdkbPVtiqcnpE93D2RCTneiIJDtF
         lRLbum0Fx64UHvMwCiLz9fvcT5dGHLQsGLYx+8wH5eTuLq/NEyXwntvp1SGLh0vCr+UQ
         hEqBK5wZ69KR3D25qCp2sjel0+wSZm3PbXiRX+ooXjlQgr5pExSiaiOANgJO7/TYwf1I
         vVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499518; x=1795104318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VirwsWcUGB+wftXqJRXa0lz3ydc4K0zhD+XqX/ctFlE=;
        b=uZdnZU30azw1PmXCru86/iiNSoT26aEJBldsp1zVQOp/z0f7FJaarGvKS9MKUpLuSs
         x+wX6+n2O69zwwb3oD/zMudnJnb5WD8XogkN0bNTTZbF4+7HCLrAchb07ENV3757E9fR
         CFXFUjv/Ea3PMPUEPW2h6sJ4cbVJV4AVaDNTuMSaNBOHzqdpRqr6VEXgCc4cLxJgZIld
         XhGATSXKBkiMfMs3APcBOFX+iY1tSh/bbXMBobzSi3ixg7QoxwMbgXJyUkIdhwiDzFcx
         /bo+LX7F9LnXFbEya8qCALI9xcJJqOCr5rUB+5vLAWYbS05g/dBZV5dGkNCxcenEl/Lc
         T9Cw==
X-Gm-Message-State: APuU4Z8E9QsccXG9/zALiQwSQDOTKK0m+lPI0b7AzVxJIaJaTNnfg0/b
	eJ4bI7iWW1AlvUER2qLl41QEUqmV7LjNBuM7+XSS1Q03S96MKZ6YSeGjZhqoz0z0kLQ=
X-Gm-Gg: AYBFou3ngCFTUyDCRcRpGrZr6qSyyATt/pXYKRdtVrA1Z77nZctnAaA11YZtnJpfQiY
	omCDYkHXLdkKPDXzx4ekcdU11WETmDqgZISvP+Fn/TMGLJZE+77Srtn0ZGCAj0zCDvuj9uXK0nf
	rJaZ4aKVBLtyszP+7QjRG6MCNbw7ZwjSxYC37vV/+fTuuPfx1ohj+zb2q38vU9o+SNlggt2fCv1
	k+FB3JhAZmLepmRmmo3MYJ13Hj7rhSUEV9vTz0UnatK9HzlZoTnsGhPVV+NNFlvxWwB6KQyaU4U
	yP4CvLkPNbmvTUGsX9OVEyrOIIALFKzUa65AZgn7Vcw8bA9coA5fQIPHi4OZZ+xvyeJwQgN6zXl
	F+iuYFfKi8onl6GFWFRcBgYAp8562060LZSgfY5BAPUJtfPyFrhLEnrSQaDSPLG6DKclFfRBeiK
	5dA2dm7ShRExRHd9MNNzpzLGEEv29DV6sZeMy4fygRLCj2pPCaAlC3223/2WRKYbpK+i20rBeka
	F+W35jvl3xh3npARk5imkLUQ5ykSeXhxxvYpiGE8/FoI71tuwmxwhniYsadDGsZx7edJzGHkaoL
	LygTZvsqXh234Yw+QkpPPART6Nw0lAGIDzHkmcV+cm4=
X-Received: by 2002:a05:7301:4d10:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-377d6e5e7damr4248214eec.1.1794499517613;
        Thu, 12 Nov 2026 08:05:17 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922d49049sm613673eec.1.2026.11.12.08.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:05:16 -0800 (PST)
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
Subject: [PATCH 3/4] usb: gadget: r8a66597: free the IRQ before deleting the timer
Date: Fri, 13 Nov 2026 00:04:47 +0800
Message-Id: <20261112160448.41566-4-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261112160448.41566-1-lui2012qwq@gmail.com>
References: <20261112160448.41566-1-lui2012qwq@gmail.com>
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
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
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

