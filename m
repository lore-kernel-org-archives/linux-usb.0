Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641212;
	b=EFNb1fhrXF9YdNCiTp8j/ZPCYWva9ccnZnCiA3D8W08+Pkojrqk4J5bJwhEc5ElnHQz/
	 SxDexncpUp/BtYQIuCucUmM/mYSBRxZMlP4Qx9ns++lLeol1eoRfx/icGtCSno/gUSspL
	 yBz0UVIxSl16H3l4PtDXCDuyZzrPpRir3CV3BA3AMZqtczCkyciJ7Of3fVlEZt1vFVF1w
	 BLHDVq3du49Z2XMN+OtsvfrkFDAzELBUnPEDru31PTlAZlg0z01UfAPFIXG1db5RasJoY
	 Yi2T2VquMIbs8t1cAGmyGP/ktz7JUS+iPPlnf1ZcwgCEQniQ7+ABnBL8SynBpkgW31w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641212;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=+9VfrWpCXyJqqanLYfDlYAazaI2y9OgYpPFZUs/AAaQ=;
	b=UoN2DfeC0RHt1RrPRv0bnhhy2IA9NLGMd1OyPvk+Vxi71V1aWIOgyTG3/t80bQKkfzE1
	 GjHHBpCvP3dh0fXNXvH5SY7o6C8QVJVDCYH8Kk27qKK0EkSWWcp7Oyljbdt/xai7ogdWM
	 xtDIANnHuivxwi7uKSXLEUCzEsFrZdUN4dFeXWX7w6zHsj2eTRtls3qXimVQH6Z6KOOhZ
	 vWowAsMDCyBh7XMLic8DeVokjJVL3wlP3ARLadUripHhGQL5FpwMAWT2Qc7oqwh0+Q96L
	 qpbLommUS3TTHuxI3z3PFveyjboFM0yagp+v/9dCqQ8B1KwIaZ9nF5iz5NO7BgiNi0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B03606A321
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so3872531eec.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 20:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641210; x=1793246010;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+9VfrWpCXyJqqanLYfDlYAazaI2y9OgYpPFZUs/AAaQ=;
        b=Pxxdi2jH1hXhMQfttZ43M/aWI/Jei7DGjqDnW/+kT0Jt8RlCOAtkfCYH0SM4q8fk6U
         acqFDKPC2/dvjCuZh8xTL2zuY+Q2e+kgYQ61kTQFHaM9KBTL9L5cx+VogWdwsPRCdyIH
         tk+8RYyt3lsT4PrH9HHIDpjyTdTQhxVOtEYopTlasnZfQpMGWNBiaCe+6NNQdTkcZnXh
         v8mcuD/xyk0ha50GkRGd+JOGzsUcmN01xKylAOKd/0uYzGzcIIMOiJcwiZzFXaWhBI5J
         VYE0dJUBGz2vaH4+c5KveuA8YViGACuvoeuBG+uPCMImy8m9D/bkV8FMqRugzzzMFK5I
         Z+lA==
X-Gm-Message-State: AFq9FYIiNCOWtKgwcVmPLhOjrYKfkf2yRbIfVDzE2yEd1Ypqb/NetbZU
	gj0NSHIuPrrt9V4UpcylZN68GKuxUQaaIVApCtl+5UC1t3jJTox7XsLjsNHQaA==
X-Gm-Gg: AYBFou2qrwBu1F6o7v9X+EhEV/+njLJesWAUI5WmDIewV9oDZTszch26zWMNfi7KmDV
	027pi4Mk/239fNJCkHLQga/YwxfH3AlpiZokdQ/2M6dFkz+xh7PmGkcEWzzjpNoCD0LnkuRXhQJ
	LmLwAoIXwTRFK7fEFejNyzsuff8mKicJ9BuT60pCg1NhByvlp58AbxhJudKpBCJu86y9XauacBf
	+85FbAtVNkOq384hC13P4+Ig4Af4na5CWu4svyocaML4Kh8buOf/zKB0Dwho5mq3F2PMgeWoWGO
	vnWYYCn4vCVI/zzJ+LOag64zeFU1785ukgaL6ZY54Ksu9Cn2mpYLhZjojM7Utg45E+di5WuNPEh
	jSQ43EITBiEggZc2O99asGF/Q9kisYNqk742gByVRr784uJjBy/7fs/d+j0mtJdovrlK/zsEG+e
	4nn2K2UB0iAiDIAYSFVdDk9plOQIB0bAvxpSmCe3rQ83AminbRbPDMF9ZVL3ctsl54dA9ILH3Nc
	TvBAm3Rju7JFaH1c3XH8qWsc3IvQGbSZyktELv/GmXcpUBhsCCZQOeqreHvhPwN4VooeZ2O9SOC
	AHzbg4CNf+lYFHrAlfcd+jDgwwTQwWZ9x9mTtWv/2ERigBCOX4LkX7T/l6g=
X-Received: by 2002:a05:7022:eb46:10b0:14f:5cd:f286 with SMTP id a92af1059eb24-190a61447a2mr5627852c88.34.1792641210368;
        Wed, 21 Oct 2026 20:53:30 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([185.220.238.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903e02901fsm10979489c88.22.2026.10.21.20.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:53:30 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To:
 Greg KH <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oliver@neukum.org>,
 Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: core: Fix use-after-free in anchor wakeup protocol
Date: Thu, 22 Oct 2026 11:53:27 +0800
Message-ID: <179264120769.17277.3664390143604314731@kylinos.cn>
In-Reply-To: <179264120148.17277.68253767316647311@kylinos.cn>
References: <179264120148.17277.68253767316647311@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The API contract of usb_wait_anchor_empty_timeout() and of the anchor
cleanup helpers is that when they return successfully (non-zero, for
usb_wait_anchor_empty_timeout()), no URB giveback is in flight for the
anchor anymore, so drivers may free the memory holding the anchor
(xpad, for example, embeds irq_out_anchor in its private structure and
kfrees it in xpad_disconnect()).

This contract is broken by two windows in which the waiter can observe
"anchor list empty and suspend_wakeups =3D=3D 0" while the URB giveback
path is still about to access anchor->wait:

 1. usb_anchor_resume_wakeups() decrements suspend_wakeups, which
    makes the wait condition true, and only afterwards calls
    wake_up(&anchor->wait), without any synchronization in between.
    A waiter returns, the driver frees the anchor, and the late
    wake_up() then touches the freed wait queue head.

 2. __usb_unanchor_urb() wakes up waiters while holding anchor->lock,
    but usb_wait_anchor_empty_timeout() evaluated the same condition
    without the lock, so it could observe the emptied urb_list in the
    middle of that critical section and return before the wake_up()
    (and the spin_unlock()) had run.  Reading the two condition fields
    locklessly could likewise observe a stale suspend_wakeups value
    after the giveback's unanchor on weakly ordered systems.

Complete the locking protocol that commit fbc299437c06 ("usb: core:
Solve race condition in anchor cleanup functions") established for the
kill/poison/scuttle helpers: usb_wait_anchor_empty_timeout() now
evaluates the condition under anchor->lock (a small self-locking
wrapper around the lockless check), and usb_anchor_resume_wakeups()
performs the suspend_wakeups decrement together with the wakeup check
and the wake_up() within a single anchor->lock critical section.

With the decrement and the wake_up() atomic with respect to the locked
condition check, a waiter can only observe the condition true after
every giveback that has incremented suspend_wakeups has finished
accessing the anchor, so the guarantee that the wakeup is delayed
until the completion handler has run also extends to the anchor memory
itself.

The race has been reported by syzbot repeatedly since 2019, most
recently as:

	BUG: KASAN: slab-use-after-free in register_lock_class+0x8d1/0x980 kernel/lo=
cking/lockdep.c:1333
	[...]
	__wake_up_common_lock+0x25/0x1e0 kernel/sched/wait.c:105
	__usb_hcd_giveback_urb+0x3ac/0x530 drivers/usb/core/hcd.c:1653

	Freed by task 7828:
	[...]
	kfree+0x14a/0x380 mm/slub.c:4390
	xpad_disconnect+0x359/0x490 drivers/input/joystick/xpad.c:2194

and:

	BUG: KASAN: use-after-free in register_lock_class+0xe6a/0x1120 kernel/lockin=
g/lockdep.c:1336
	[...]
	__wake_up_common_lock+0xb4/0x130 kernel/sched/wait.c:136
	usb_anchor_resume_wakeups drivers/usb/core/urb.c:958 [inline]
	usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:951
	__usb_hcd_giveback_urb+0x2df/0x5c0 drivers/usb/core/hcd.c:1674

	Freed by task 3889:
	[...]
	kfree+0x173/0x390 mm/slab.c:3786
	xpad_disconnect+0x1cb/0x530 drivers/input/joystick/xpad.c:1905

Both reports lack a reproducer; the analysis was verified by walking
the two stacks against the code, not at runtime. All in-tree callers
of usb_wait_anchor_empty_timeout() (and every driver which frees an
anchor after the anchor cleanup helpers) are equally affected; xpad
is merely the one syzbot found.

Fixes: 6ec4147e7bdb ("usb-anchor: Delay usb_wait_anchor_empty_timeout wake up=
 till completion is done")
Fixes: 51a2f077c44e ("USB: introduce usb_anchor")
Reported-by: syzbot+7f5e98b052c766f47f68@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000090170a0614431f47@google.com
Reported-by: syzbot+59d3714b44d79d02f944@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/r/00000000000038435e05e9f94cd4@google.com
Cc: stable@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Hans de Goede <hansg@kernel.org>
Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/core/urb.c | 51 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index c06b44ca507b..3afd184c9b32 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -139,19 +139,39 @@ void usb_anchor_urb(struct urb *urb, struct usb_anchor =
*anchor)
 }
 EXPORT_SYMBOL_GPL(usb_anchor_urb);
=20
-static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+/* Callers must hold anchor->lock */
+static int __usb_anchor_check_wakeup(struct usb_anchor *anchor)
 {
 	return atomic_read(&anchor->suspend_wakeups) =3D=3D 0 &&
 		list_empty(&anchor->urb_list);
 }
=20
+/*
+ * Same check as __usb_anchor_check_wakeup(), but takes anchor->lock. It is
+ * meant for waiters which do not hold the lock: the critical section
+ * serializes with the URB giveback path, so once the check succeeds no
+ * giveback that has incremented suspend_wakeups will touch the anchor
+ * anymore and the caller may free the memory holding the anchor.
+ */
+static int usb_anchor_check_wakeup(struct usb_anchor *anchor)
+{
+	unsigned long flags;
+	int wakeup;
+
+	spin_lock_irqsave(&anchor->lock, flags);
+	wakeup =3D __usb_anchor_check_wakeup(anchor);
+	spin_unlock_irqrestore(&anchor->lock, flags);
+
+	return wakeup;
+}
+
 /* Callers must hold anchor->lock */
 static void __usb_unanchor_urb(struct urb *urb, struct usb_anchor *anchor)
 {
 	urb->anchor =3D NULL;
 	list_del(&urb->anchor_list);
 	usb_put_urb(urb);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
 }
=20
@@ -827,7 +847,7 @@ void usb_kill_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -866,7 +886,7 @@ void usb_poison_anchored_urbs(struct usb_anchor *anchor)
 			usb_put_urb(victim);
 			spin_lock_irq(&anchor->lock);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irq(&anchor->lock);
 		cpu_relax();
@@ -919,12 +939,23 @@ EXPORT_SYMBOL_GPL(usb_anchor_suspend_wakeups);
  */
 void usb_anchor_resume_wakeups(struct usb_anchor *anchor)
 {
+	unsigned long flags;
+
 	if (!anchor)
 		return;
=20
+	/*
+	 * The decrement, the wakeup check and the wake_up() must happen
+	 * under anchor->lock: usb_wait_anchor_empty_timeout() waiters
+	 * evaluate the same condition under the lock and may free the
+	 * anchor once they observe it true, so this function must not
+	 * touch anchor->wait after that.
+	 */
+	spin_lock_irqsave(&anchor->lock, flags);
 	atomic_dec(&anchor->suspend_wakeups);
-	if (usb_anchor_check_wakeup(anchor))
+	if (__usb_anchor_check_wakeup(anchor))
 		wake_up(&anchor->wait);
+	spin_unlock_irqrestore(&anchor->lock, flags);
 }
 EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
=20
@@ -941,6 +972,14 @@ EXPORT_SYMBOL_GPL(usb_anchor_resume_wakeups);
 int usb_wait_anchor_empty_timeout(struct usb_anchor *anchor,
 				  unsigned int timeout)
 {
+	/*
+	 * The condition must be evaluated under anchor->lock: when this
+	 * function returns non-zero, every URB giveback that has incremented
+	 * suspend_wakeups has finished with the anchor, so the caller may
+	 * free the anchor, which is typically embedded in the driver's
+	 * private structure.  A zero return (timeout) means a giveback may
+	 * still be in flight and gives no such guarantee.
+	 */
 	return wait_event_timeout(anchor->wait,
 				  usb_anchor_check_wakeup(anchor),
 				  msecs_to_jiffies(timeout));
@@ -997,7 +1036,7 @@ void usb_scuttle_anchored_urbs(struct usb_anchor *anchor)
 					    struct urb, anchor_list);
 			__usb_unanchor_urb(victim, anchor);
 		}
-		surely_empty =3D usb_anchor_check_wakeup(anchor);
+		surely_empty =3D __usb_anchor_check_wakeup(anchor);
=20
 		spin_unlock_irqrestore(&anchor->lock, flags);
 		cpu_relax();
--=20
2.32.0

