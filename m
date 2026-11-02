Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636988;
	b=pQcYmxLC5O9iNmidiqbOO2wUYYGzsYGc3Ie/JnRoYABQFB2Othc0cagux2IEb3f8VPaX
	 JjU1RhllVxK/pimepy/bVVzQWoOI+cq98gi2D8MkLQ0Ku+DibAlreQJZcWiNYcV6Iyn1y
	 2Q6nzzJn74zzF9QFVEmEDtPTEVYIyf/aKeHd7h/KV9KHPJ75qN9G1nd+MDNGC01CpbV8j
	 6H6LMRfX9xfgGtnMlq+YLxVjU5K2jA1+LM3/9/cKN7YR+siDGb9lgwKOmLdytgOHwrg8N
	 0ezi/EYMvoqFceQFsHmozbK9tOFLoHdes9siiZVo1GDWM1N5r/f1SAGIhMSEOPsP9eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
	b=1FW2nCLywGy/sCE8m/jUxKURpkYi/T980xLz79uiLc6kxrsiG6a7Z9uqSkzhBcWwHVQ8
	 xLMcWbmNnhX92ykF1JmqNIZJKltwfb1kHcVE1yrbZGyoOBjyGDT0cuUHCpD+Sc8dRUcoI
	 HZ7tbE19IQdSg7dKmBtv6DXamcOA+3S/FQLoLfOQRrZR6FViLV5jU4cD36R+RpgW9zIxv
	 H2F4QNlw6ZSuHANA4weRcpEyNqusleBN2ip8ynRQ0SRufe4MStUn+qF5JpzvIhrVWA/mS
	 G9hrlL/QNzcnzfRAKm3o4bRr25l8UuZyyjlII90B4BS+JoiqwGmQuRV+FOejBu5T1Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8zUtrMl;
	arc=none smtp.remote-ip=209.85.160.65
Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE78A606A923
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 16:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE78A606A923
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8zUtrMl
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-46556b9e02cso2582262fac.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636986; x=1794241786; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=v8zUtrMljNUtLz+CqlbFk+YIIGnWVX5EXDm4JNH+3L+QxCcY81FSHga8Vg1+k2gvVM
         XTnwRYpIV52ruhyIQCtA3oLzXLdGlt9WSDkChr7d15A/upKwvTycraCmbc6fXXR7p37A
         R9pe/oh8vfZzrjrumppNEsFY78SgXu4QK8jGdgvwRiYURyi0TH8MqJQrwBHE8gB/JAyb
         DeXACr7q14BBGSJaSCFSEzEVGiO+X4slfS5DXGkFJYJFAi5uODp0MFwA0WogoLxile8C
         h6JSdPdpBDNfbdGiVYXZWOcmWiGlfv7ZcvFE3+PrvB2BoEO0bbBwgKzsIyDFBbUvclau
         roHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636986; x=1794241786;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+edsoFX5PqL65dJFkIJ/uSxWsDbol4HH9AaqaASjRno=;
        b=HMdp/kFfn2BLl1G9szn4yDaCrjn7C6uI5T1QFkaQn5ZyqmGu3+eodvXPtrw6yvLBhQ
         46g1h6QEWbwqthhCK42Acuhn03Oqg+7Hhez7VdI9W8ixxyVOywHMJWzEo0rW+B1iWnkP
         4jEhB3mveb2LPt2LYmL8wMN6nvOq/4olXsJgBwHgYwaJAsKOUoMQF7uQ+Y0Qf6NX97Wu
         PtLDuswctpkaFSnaq8jGxl5FdGfIYsTE4pguUK0yIPGbIcOHF6cAU0NiQwvSGinDe+O1
         y0l71XwUhZD63648r7sSnlKHEFLbxkN8JKEqauGgysq65JytAQEOEkOnYN/H0dRaMqh6
         rhZg==
X-Gm-Message-State: APuU4Z92mViGpjPxdgGbQOyD04x1TA2Yeavyu4Qgx8Fye7Fsab565V6H
	RcS9wNM1FEhXHr1TaopVBG6jeXmMBuHOFuFUJPriu1kIaXPyxlTnhT6z
X-Gm-Gg: AYBFou2thy8lZJTKq9hKB1OsDfqDFOSWkDbLMvwOPvZPu0OnBu7w1q3Z4ZWB6r9HHDv
	/gUA3AeDV7eZ0A7JYQ4Rns8FYLceSmPW2vK2VAv980hyxenTY774fzQp5ifu43UlEOpzbEzM2j/
	laXcah0u9ThGEohvV0liq6fs42g4z6cYhspE39YCGX0j2ZHg2td3CdeyDIt1MSPzp88ksNbOmw0
	qiHiq8vOO64c6JathHEWsBOehqVy0esXkWW62+pyP9CCBC1rIyYyJsbkM2D0H12PSCxBWeoxAHv
	NoRGFLp5jRxUUQD81PD7TYo6GcpzC0niOuO6BEp/iha57yAAFu1cEq9c/i66QSoGTFtCEAlW0Qc
	3UNWIeEK4GDKDWdxvEANnAgxBocv8Tce36aXnXvmySdmbxsnReObPy54y3N98d73srMyi3XlXcu
	fTVkeFxJ814yg/AJjp2v73mtVDHEipf7Omd8EgsB85h2Fp3kbwrRaDAvKwZ7wIuHKutl//2m8+u
	AbMxWkhdx8AHcJntW0hS9Ikor8if9irgV+smobHdrA7Yojh/KohpyOixiuPPGkVPwwHyVKPMi4o
	X5L+x0nKOmdpz4ryHCuSgRcPpJJI0R6V8otVAb9XfOGKXd5Ys0SDiuY7P8m+iHi+YEMDZ9yjXk0
	MlHa5ON04EsGfdcCxeIciBv0TYplvkvA53DH2b6J4
X-Received: by 2002:a05:6870:169a:b0:470:e97e:8f88 with SMTP id 586e51a60fabf-4a8e099f2c1mr6622916fac.24.1793636986507;
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm7251024fac.1.2026.11.02.08.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:29:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 02 Nov 2026 10:29:45 -0600
Subject: [PATCH RESEND] usb: mtu3: don't run gadget completion callbacks
 with interrupts disabled
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793636985; l=3859;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ctXSxhL8cB96oM2LlBR4kk7hbE12PJXfiPWlYJLZFo0=;
 b=S9dPlOrGvAhCl5WVQYdsJfPpa5BoiRYpZW64kvQU0m9zClp2Ht7qcVyfHxTiljy/6ZkSqDgd9
 C0E4bVjxXGFAHGsSwhRgWmeoEriZ/yCXt7Q3nhq0zbb8GwVF2AQUwWm
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtu3_irq() is a threaded handler, so it runs in process context, but it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() then drops
the lock with a plain spin_unlock() around
usb_gadget_giveback_request(), which leaves hardware interrupts disabled
across the gadget function's completion callback.

That breaks any callback that reaches netif_rx(). Since the threaded
handler is in neither hardirq nor softirq context, netif_rx() takes its
local_bh_disable()/local_bh_enable() path, and enabling softirqs with
interrupts disabled is not allowed:

  WARNING: kernel/softirq.c:430 at __local_bh_enable_ip+0x17c/0x188
    __local_bh_enable_ip
    netif_rx
    rx_complete [u_ether]
    usb_gadget_giveback_request
    mtu3_req_complete
    mtu3_qmu_isr
    mtu3_irq
    irq_thread_fn

With CONFIG_TRACE_IRQFLAGS, __local_bh_enable_ip() ends with an
unconditional local_irq_enable(), so the plain spin_lock() re-taking
mtu->lock afterwards runs with interrupts on and is recorded
SOFTIRQ-ON-W, while mtu3_gadget_queue() takes the same lock from a
softirq (ncm's tx hrtimer), and lockdep follows up with an inconsistent
lock state report naming mtu->lock.

The locking was right when mtu3_irq() was a hardirq handler. It stopped
being right when the handler became threaded without a primary handler;
dwc3 hit the same thing the same way and fixed it in the controller
driver, in commit 84918a89d6ef ("usb: dwc3: gadget: Let the interrupt
handler disable bottom halves.").

mtu->lock is never taken in hardirq context: the only handler is
threaded and has no primary handler, so disabling softirqs is enough.
Take it with spin_lock_bh() in mtu3_irq(). The completion callback then
runs with interrupts enabled and softirqs disabled, which is the context
netif_rx() expects. The other sites keep spin_lock_irqsave(), which is
strictly stronger and still correct; several of them really can be
reached from softirq context.

Both reports need lockdep to be seen, but the context violation is real:
netif_rx() wants either hardirq/softirq context or interrupts enabled,
and mtu3 gives it neither. The fallout on a PROVE_LOCKING kernel is not
cosmetic either - copying a 21 MB file over USB ethernet hung and reset
this board repeatedly before this change. Once interrupts have been
left enabled while the thread holds mtu->lock, the tx hrtimer softirq on
the same CPU spins on it forever, which is the "CPU0: lock(&mtu->lock);
<Interrupt> lock(&mtu->lock);" scenario lockdep names. The same copy is
reliable after it.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/usb/mtu3/mtu3_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index a40bf5bad2d5..ed0e426645fd 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -790,10 +790,9 @@ static irqreturn_t mtu3_u2_common_isr(struct mtu3 *mtu)
 static irqreturn_t mtu3_irq(int irq, void *data)
 {
 	struct mtu3 *mtu = (struct mtu3 *)data;
-	unsigned long flags;
 	u32 level1;
 
-	spin_lock_irqsave(&mtu->lock, flags);
+	spin_lock_bh(&mtu->lock);
 
 	/* U3D_LV1ISR is RU */
 	level1 = mtu3_readl(mtu->mac_base, U3D_LV1ISR);
@@ -814,7 +813,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	if (level1 & QMU_INTR)
 		mtu3_qmu_isr(mtu);
 
-	spin_unlock_irqrestore(&mtu->lock, flags);
+	spin_unlock_bh(&mtu->lock);
 
 	return IRQ_HANDLED;
 }

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
--
Ryan Brue <ryanbrue.dev@gmail.com>
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

