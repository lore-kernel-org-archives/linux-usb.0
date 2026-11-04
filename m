Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792570;
	b=GpqWGP8/UQSLmGg5eTHnHedSpjHNHvtgu9Ju+IwAgRv8H8TlNNQh3TQltN87xkvVIMlE
	 /zEMnOal11HsbuJbGUvAquTwU3ooScXEIc7zsDo/SDmTNBVevYgwb+lQJu0kCaAbImli0
	 3fJ4IBuRPOnqe6esqRtJaJpHov+tiCyA1tLI3BcsD80zNXM7CH7Sy9YOj3zZcbSeQ+IKG
	 jfDz7dBzR+WaBULWh29fuztGsTr1+tIpETtIcqPxSX1UoHSjUSn3wKLP55AtFiqCmkCdO
	 qz5uTrgSuBxCKO7xIE9rQyluVcsNacvWtGdGV/fT69HlkRJfrEuEWYSUj96/nDJfSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=;
	b=hjUMDvs9L6mugClYzz3SKEcJEnUGKNTOntVfEiVA3UbaBg2bpsMfw3AWhNFwTZaHh00q
	 GT3Rru/9zQlrPBQmvmT/EcWQjEsMYn3XMv5APP1A44BJrgaZZxs+Fii/ikgLwdEgjyH88
	 d/aEN4UWMbge5fPAi19DB6pYZpTkLVnzoJYr0ls/FtnubS4CUd5JnW+wELllEmx6VauCr
	 FG3FuEvg7+3euBw0Ls7Yprb5JmJUVN3qacKY+OZnfENFNHmWnRzG7rIPJ3gRxbkdIGtOu
	 qpX3NIlE28sy/T47PzXw89gENh7GCbHDFxwDyT0k0UiRsXu10LQd8uDDXrO7ZUeAEKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vxq50WYg;
	arc=none smtp.remote-ip=74.125.231.131
Received: from mail-oo2-f3.google.com (mail-oo2-f3.google.com [74.125.231.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD31606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 11:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD31606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vxq50WYg
Received: by mail-oo2-f3.google.com with SMTP id 006d021491bc7-6f4cc0bd537so138437eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792569; x=1794397369; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=;
        b=Vxq50WYgGsTUXBFOSzPxBqJPhWt2Bq7sYhyd8/yPt130upAsPr43WmT4y+J7JGTk37
         5V32/PqQvtdMPHyQe0pd81JMCBJGkxJmRSIx+yQeXQLauSR3nUOiWk9muCqGoYG5eLDP
         8gmNUe7WiFGKVX/L+nRjXQiqFXDtRHXP46jthYOZmOmPKLVR55LyqZiqkEMZ9CDm0hqM
         qYgKXQNcuWcNKeVsMpJAQRgjia7Rqni7rw7Fep9XEboI2SnP6XrAIUigWe8NDPGDH+tZ
         88zx6bkN2G75DHG9tFXZxUuOnNcxTvfQIEw3/6RiGUM7OZ20iIqyMJBv362MNAxh+qTc
         t/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792569; x=1794397369;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ntkvK9vArmmau6WntPJJCQysHHMrqtIZmeCGFS6XyDs=;
        b=lwcvaSUyN5yj0xVBoUPzcN9Frr6ANi5cXtLIrYg3ZIaPaWxWwDNWn88zuYVv9y6XJp
         HmZsRUBnCYbjHdgaQB/pHwscvMXlgzaZzgmaQnLmcoBhKQ88HpaAXrdjHbQo2kPDYdIP
         wRqCObw9DaXvFT03tNVEdXcKTBb3Lm8UeoAa1ySmQyZtD6TD0H0oY9n2vzUauN3jrwyH
         QwoHh4ccp+9LzGl7S7ln5qptQqG24qv+fNhpJY4It73S8sNejLeJrNRVLkY9nt0olQMT
         9pVSlFABt8HPvihvPHh4w6LPlkau4L6e8+rNPwtXhDYQxNNbwgyY+cK9xwheuzkRII0s
         1O5Q==
X-Gm-Message-State: APuU4Z+S/PpyC6l7SqA3iVXraEUzG8bvaO8WrD+y1AJmck0so2HcIM6k
	ZZaYtnE3Xf/Gzixh+iEHdpsdXDcjuTcKzahT7cI4pcYXwOyttKL/WLkn
X-Gm-Gg: AYBFou0KSaw0HB109iWEaFOfqoi7eTS+bWHgu+pA3wOzvwVBiLukpzO+EUPPduv2Ljz
	b8xkW5SepNlDVxY9+syo9d0/L6ndU2Id4OynvFlk+Etaq2Zc3Zfb6SP+NLgq6l1LuA2MY6o/wRp
	kZbCttCKBADhSK7h/DW604AU0iAuZ6DpV4KUz6Vms5Pf+Cpro9C2Bwd9afTD7qK8KHg4uTa3nwK
	m+lBXCY5gIbDNZK+Mow1ma1g7HWVE+/nE0izc9e2nb1kHWkpsd8kntULP0mOEf/wl9c/q73oF0b
	YnellaSCgV+7W9JBMZr0VqZa4kis+DRhefCLaUg/3Kmm30421dVRq4VXF2x0/jf2OTl8zFaY+xs
	KglcUv9yWvI88alEvm/1FZv8zY8MMJQOoN9bCshQqw8LknT6ankrjF6RB6RAiEe5vHXhC7bt744
	GX//QFOUoEURcxlUcpKksBUWEcCb4haI+8RtwQHWKeBYipN4hNyHmXHgeNN1L8Z4Z4bYtAMfX3s
	NEdIsC6N6Az+d42wWQXdCC1L/owm7EeiF06B6VnhASgfVmaOtBUBaI5rO7X0ovD3h+MKcbejpu7
	hcQzUzylh8P25cPsp0lvHqSQLQ==
X-Received: by 2002:a05:6808:1806:b0:4b9:a88b:888e with SMTP id 5614622812f47-5640dd023c6mr10688054b6e.36.1793792568941;
        Wed, 04 Nov 2026 03:42:48 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9fdc42dsm1443858b6e.14.2026.11.04.03.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:42:47 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 04 Nov 2026 05:42:37 -0600
Subject: [PATCH v2] usb: mtu3: disable bottom halves in the threaded
 interrupt handler
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
Message-Id: <20261104-usb-mtu3-gadget-completion-callback-fix-v2-1-2769533a39cb@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQQ6CMBBFr9LM2jEtJSKsvIdhUcoAo0BJWwiGc
 HcDnsDlT17+exsE8kwBCrGBp4UDuxEKkVwE2M6MLSHXUAhIZHKTudI4hwqHOGtsTd1SROuGqaf
 IbkRr+r4y9o0Nr1hrnTYZ5blRGVwETJ4aXk/Ts/ztMFcvsvG4P4iOQ3T+c6Ys6uD+ty4KFZJO7
 1LKtKFEP9rBcH+1boBy3/cvTtkLYfAAAAA=
X-Change-ID: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793792565; l=4420;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=YKrWQc6X594nxsi6j6O7RkIqP4KUVuw16YHFth6q4aA=;
 b=kplKluc55m0ByUTEidjz+o5BPLPKs32RJFwusMLDnxrxB+Jj6Dr9y/he45mi/xR8jzpbfVMHO
 U0XTYhmgwiZAXt6/F6OextvdklivIZ3FMwQGkfV8KeBC0kS0DFH/xVd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

mtu3_irq() is a threaded handler, so it runs in process context, and it
takes mtu->lock with spin_lock_irqsave(). mtu3_req_complete() drops the
lock with a plain spin_unlock() around usb_gadget_giveback_request(), so
the gadget function's completion callback runs with interrupts disabled,
as the gadget API promises, but in neither hardirq nor softirq context.

That breaks any callback that reaches netif_rx(). netif_rx() disables
bottom halves itself when it is called outside hardirq and softirq
context, and enabling them again with interrupts disabled is not
allowed:

  WARNING: kernel/softirq.c:453 at __local_bh_enable_ip+0x128/0x134
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

Do the same: disable bottom halves around the lock in mtu3_irq().
netif_rx() then finds softirqs disabled and leaves them alone, the
completion callbacks keep running with interrupts disabled, and the
softirq it raises runs at local_bh_enable(), once the lock is dropped
and interrupts are on again.

Both reports need lockdep to be seen, but the context violation is real.
The fallout on a PROVE_LOCKING kernel is not cosmetic either - copying a
21 MB file over USB ethernet hung and reset this board repeatedly. Once
interrupts have been left enabled while the thread holds mtu->lock, the
tx hrtimer softirq on the same CPU spins on it forever, which is the
"CPU0: lock(&mtu->lock); <Interrupt> lock(&mtu->lock);" scenario lockdep
names. The same copy is reliable with this change applied.

Fixes: 13118959cb1a ("usb: mtu3: register mtu3_irq by threaded irq")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
v1 took mtu->lock with spin_lock_bh() in mtu3_irq(), which left
interrupts enabled across the gadget completion callbacks. Sashiko
pointed out that struct usb_request's @complete must run with them
disabled, and that u_serial's console relies on it [1]. v2 keeps
spin_lock_irqsave() and disables bottom halves around it, as dwc3 does.

This patch was developed with the help of an LLM.

[1] https://lore.kernel.org/all/sashiko-outbox-193807@kernel.org/
---
Changes in v2:
- Keep interrupts disabled across the completion callbacks: disable
  bottom halves around the existing spin_lock_irqsave() instead of
  taking the lock with spin_lock_bh() (Sashiko)
- New subject; v1 was "usb: mtu3: don't run gadget completion callbacks
  with interrupts disabled"
- Rebased onto v7.4-rc1
- v1 was resent on 2026-09-29 and 2026-11-02:
  https://lore.kernel.org/all/20261102-usb-mtu3-gadget-completion-callback-fix-v1-1-93c3a6dda31f@gmail.com/
- Link to v1: https://patch.msgid.link/20260913-usb-mtu3-gadget-completion-callback-fix-v1-1-e3480004fe23@gmail.com
---
 drivers/usb/mtu3/mtu3_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 990e2e8e6bc2..3127709acc22 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -793,6 +793,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 	unsigned long flags;
 	u32 level1;
 
+	local_bh_disable();
 	spin_lock_irqsave(&mtu->lock, flags);
 
 	/* U3D_LV1ISR is RU */
@@ -815,6 +816,7 @@ static irqreturn_t mtu3_irq(int irq, void *data)
 		mtu3_qmu_isr(mtu);
 
 	spin_unlock_irqrestore(&mtu->lock, flags);
+	local_bh_enable();
 
 	return IRQ_HANDLED;
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260913-usb-mtu3-gadget-completion-callback-fix-d334f7e99a17

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

