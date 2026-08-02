Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC9739989D
	for <linux-usb@vger.kernel.org>; Sun,  2 Aug 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672370; cv=none; b=Z9coruZ5eiS7Xum2x05UWr53FGATvp3mdk6deUfrYlt+i6HcImEwutESAv+wbHjQe3rwK318TB5W0w4QI/iUcnVd+6t+MVcIMQkWNjCaUfukCszpwwGUUjGTNo64mQTCvW5zsKzHkzzCYixLL5k2xxxAxkpERQuKnMoHJX34buM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672370; c=relaxed/simple;
	bh=ja9SEZY37py2LPC3UCzbojlbnwIXzxtJJQ0uGcIg/sk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nH7HAW+xAWS/zCpEl3rDlgOrrIPeCrBvCoExZqUuB5f7tcCOq0qRCoorcsE6RAqAFT0EGR7tHT9Tt3wXDjHibEOJaQRkuJhcSV76hUF74vLbj4tfvkAuY4Z6v9ezuEc4dhUhMhWWtM89jcv3B9Sy2ayWhBT3+XaqCY6YAMqlaeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=dgpKf/1V; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="dgpKf/1V"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so8938705e9.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Aug 2026 05:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1785672366; x=1786277166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YmI7MBDeloKectxU/BNiRN1jB4jCnA25xpecmEwYe0k=;
        b=dgpKf/1VX/V/XUhdm6FM3HK3/hMzv9nsCRIOy6R61ouRFAXv02jm+AyOcOJu87XgPd
         RpEixcxwjNs1eXFeMGUrHULio5bx7oNjwj0Vv8ut8kRDoDusqtrl7DTE3sbMNEKGzl6s
         T6d9CBEcGP2HoR/8Ov66/12Uu0hrIKHKDRmZEBPLng4QSi4Hr5CeXgK4kIzHOl9Vjm6P
         odcqZsrzPB6DzUWg2y+GN44ChXwp8eU5gXndFY7tZ/AI1PiaM9c+u+L+b2KlSJHoU7Va
         bXKpvLiovV5TWbh0E/YyvyzVXKDuOV/JquH/2ijGvuYDeMq8wRuWYjbCNmccWh5kyBla
         Ev9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672366; x=1786277166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmI7MBDeloKectxU/BNiRN1jB4jCnA25xpecmEwYe0k=;
        b=GMm1JaJMN4fGo9LgQNTcEIZakfn9kYKjRUcJ/C32s8czR3+Mj4g0O9wU1Cg6f5t5IP
         MhPiPNCY3XqbH0WK9T6zJngkBukYaKLsenR8swQmc55Xhj6rEn3bNBMemOb3tLFLgOXl
         e+AkIlplJIKslFdrFbyZgZmai20LgiUF+pMkAd2ihsKAidOF94ET21htDzDEiLaUz2mM
         lWLuSGDAXe0hF7rDG3+Y+9MrKvfnKwPTd3BBWXGquS0AUSzp2GOvNcFtU/ttzwdFbQ9P
         tilqMWUId56ME4KhoNOb1dYB/l4qAkvNU4XrP9dXTFS0hHTbJRB0ksA3DWpWjeFF0wO2
         6E3w==
X-Forwarded-Encrypted: i=1; AHgh+RpJiEsFZF7D6aNKTYKJbkcQYIulRKGha2lhBywbdPNxlZCNTeW9zwaNwl3aXbTr6UeWi6b2DU1phJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2B0ha36g5u/h7lls0gEtQ9kyU4P54hGsrUfXLAPinUYzvKsYW
	WaRRvNMEaDRKgXJ8PjZrCOgOok69U8OCdpaaPa9ARTP49h2Y73S6MsJ2YprKVP9KyYgOQlW70ZR
	ks3I7SA==
X-Gm-Gg: AR+sD109tVefFEQtFQntOy7D/rCmSo4XMywPjWLvZFBSn1n+8+udsqbMzyOksIAGJXT
	I1jiy5F/3gd7aW7cVpTIFrca5CA6C0qN1caNpoOjz1yDVe6q7DX7XnKAqnDKGanalS9SvRPpyIX
	oVxFgGq2Bu4pA4twrYnbTQwIGMqu6cnLhkKfgMsWetJ+iKaJ78bHY+OyQJ128q5IAfTzCXyfFYE
	h5V7mjeN1DralqN5YlUsAm7hmSZ7n8xREYLS3vH5aj8Jekony5Kr3svdE/KsefFaZmEh+0LlW1V
	yB7lgW3kniemIElpk9UttCwHwVUwUiTEN1/n1U8EMxzq5+vNm0CLAbTOFI1dG3nLxZPNGeee1wT
	SbN1K+VdxYy6z7Enjj3uvb1HHrJ72aKagyFGbbHbbSp35jCx/O0rJiW5VZ0hUdzRFFsPKVQSGQA
	m/NLCoYqLcFj7bGaxvqfl7dvRf2pihM1Elwc8gXSoMbTbXdXNLtIytHCwzn2bB0TAu5TjjvR8g5
	jv0XCs4mpulkDVcXKSAFxQvBdqjtzb8YWNY/6w/F+9OYxcCOdGMHilm9x7LVleV9GGePBZKqFRQ
	zW63m/u/g6nV/fMh+Q==
X-Received: by 2002:a05:600c:1f8f:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-4980eba0817mr106984535e9.7.1785672365325;
        Sun, 02 Aug 2026 05:06:05 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm175226825e9.3.2026.08.02.05.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 02 Aug 2026 05:06:04 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch
Cc: agk@godking.net,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net v2] net: usb: ipheth: fix carrier_work UAF on disconnect
Date: Sun,  2 Aug 2026 14:06:02 +0200
Message-ID: <20260802120602.42595-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipheth_sndbulk_callback() re-arms the carrier-check work on any
non-zero URB status:

	else
		schedule_delayed_work(&dev->carrier_work, 0);

Nothing ties that to the interface being up, so the work can be armed
again after ipheth_close() has already drained it, and stay armed
until the netdev whose private area embeds it is freed.

On unplug with a TX URB in flight, ipheth_disconnect() drains the work
through unregister_netdev() -> ipheth_close() ->
cancel_delayed_work_sync() and only then calls ipheth_kill_urbs().
usb_kill_urb() completes the in-flight TX URB with -ENOENT, so
ipheth_sndbulk_callback() runs after the drain and re-arms
carrier_work.

The same completion also re-arms the work if the interface is only
brought down while a TX URB is in flight, and
ipheth_carrier_check_work() then keeps re-queueing itself once a
second. unregister_netdev() does not call ipheth_close() for an
already-down interface, so nothing drains it on the later unplug
either.

In both cases free_netdev() frees the netdev while carrier_work is
still pending, and ipheth_carrier_check_work() dereferences freed
memory.

Tie the work to the interface state instead of chasing the completion:
disable it in ipheth_close() and enable it in ipheth_open(), so a
schedule_delayed_work() from the URB completion is a no-op whenever
the interface is not up. disable_delayed_work_sync() also waits for a
running instance, so it fully replaces the cancel_delayed_work_sync()
it takes the place of. The work starts out disabled in ipheth_probe()
so the enable/disable counts balance from the first open.

Reproduced under KASAN on linux-next (next-20260731) with dummy_hcd and
raw-gadget standing in for the device, driving the second path above (the
interface is already down, so unregister_netdev() does not call
ipheth_close()): 15 of 15 unpatched boots report a slab-use-after-free in
__run_timers(), freed by ipheth_disconnect() and re-armed from
ipheth_sndbulk_callback() via queue_delayed_work_on(). The
same trigger on a kernel differing only by this patch reports 0 of 15,
and the carrier check still functions across open/close cycles.

The reproducer needs an attached USB device that stops draining bulk OUT,
plus a link down and unplug, driven as root. It is not a privilege
boundary crossing and no exploit primitive was developed.

Found by 0sec (https://0sec.ai).

Fixes: bb1b40c7cb86 ("usbnet: ipheth: prevent TX queue timeouts when device not ready")
Cc: stable@vger.kernel.org
Assisted-by: 0sec:multi-model
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
v2:
 - Fix this at the scheduling site as Jakub suggested, instead of
   adding a second cancel_delayed_work_sync() to ipheth_disconnect().
 - Took the disable/enable option rather than a netif_running() test.
   The test would sit in ipheth_sndbulk_callback(), which can observe
   __LINK_STATE_START still set and then queue the work after the
   cancel_delayed_work_sync() in ipheth_close() has already returned.
   Disabling the work closes that window.
 - Now runtime-reproduced: 15/15 unpatched boots splat under KASAN,
   0/15 with this patch (x86_64, W=1, no new warnings). v1 and the
   earlier v2 draft said compile-tested only; that is no longer true.
   KASAN was confirmed live on both kernels via KUNIT before trusting
   the negative, and the two kernels differ only by this patch.
 - v1: https://lore.kernel.org/netdev/20260724134250.34360-1-doruk@0sec.ai/

Note for stable: disable_delayed_work_sync() and enable_delayed_work()
first appeared in v6.10 (86898fa6b8cd "workqueue: Implement disable/enable
for (delayed) work items"), so 6.6 and older trees need a different
backport.

 drivers/net/usb/ipheth.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index bb1364f85bd1f..2b490114d2327 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -490,6 +490,7 @@ static int ipheth_open(struct net_device *net)
 	if (retval)
 		return retval;
 
+	enable_delayed_work(&dev->carrier_work);
 	schedule_delayed_work(&dev->carrier_work, IPHETH_CARRIER_CHECK_TIMEOUT);
 	return retval;
 }
@@ -499,7 +500,11 @@ static int ipheth_close(struct net_device *net)
 	struct ipheth_device *dev = netdev_priv(net);
 
 	netif_stop_queue(net);
-	cancel_delayed_work_sync(&dev->carrier_work);
+	/* A TX URB can still complete with an error after this point and
+	 * try to re-arm the carrier work. Disable it instead of cancelling
+	 * it, so that such a schedule_delayed_work() is a no-op.
+	 */
+	disable_delayed_work_sync(&dev->carrier_work);
 	return 0;
 }
 
@@ -629,6 +634,10 @@ static int ipheth_probe(struct usb_interface *intf,
 	}
 
 	INIT_DELAYED_WORK(&dev->carrier_work, ipheth_carrier_check_work);
+	/* Armed only between ipheth_open() and ipheth_close(). Start out
+	 * disabled so the enable/disable counts balance from the first open.
+	 */
+	disable_delayed_work(&dev->carrier_work);
 
 	retval = ipheth_alloc_urbs(dev);
 	if (retval) {
-- 
2.43.0

