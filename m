Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5414DC551
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 21:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286708; cv=pass; b=ajQPPzbVM4BD06vAE+Kj6XrOPIi95iJFnWIz6eiTYiMzaUMUOREqmUHZ0YRxVSzZagzxl+U1kdAzLTgAlqkL+/qOY3zlKgS2JMvZaNX+fw5hHdEJHDFzg1NCoVXIrBJlTIKUULbNZY2m28UhKrnzaS7XBnqYPMJr7c3zOJI5tl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286708; c=relaxed/simple;
	bh=vwIL4Z9WhDilYVKgXK6Lo2kf/q7i4XxX4sVI/yy9z8o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zwcb/tJm/jEymCKX36ByCtAPoGbVNCjrj4CUexxxSWi1SG2hEnijKtLNcUcGx33Fs6AXy/oi0vPEAnWTaeUQdqhHHtJaLCvSGWLxX+Q+3uYs6WmLS5AYb9Nvuf8A8ATdHbF8/+XV5C+DB+vZ9FY1LVFfwHyADcI5V85pfSuD9Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0Ib9wJV; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0Ib9wJV"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a4fbc5586so36945266b.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790286705; cv=none;
        d=google.com; s=arc-20260327;
        b=FJFubnZGJ6JlmMnWgYx22GlbzGk5tdB1txpsSALc6ZkJx8FMxhtoaa+g4naytrMg3m
         SxyuGgYlN002y+fS6XM/0//9tbJLmyVeHViyMDbvBIO2kux3Ueo9Jiq8PbBNT2BPjhvu
         EeiT4S+DBg73/C6E0wlWpC6lSLWzfIB4g2INY8dTHys5wd2vzvtVo6F87DxlVsswLWyi
         YS7o1BhWLGhxZjCwEBT8gVjkkRumJo0MufD+2edSSts+fybmS5Wm0JG5SU2gOchdre7G
         kEPVCNYpyNeovLtc3BBiB3DRXVBFy34LjREnayEy4b4XWRM+8/Ax/vwXkXDsQcCLDAzr
         ofeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        fh=T0yoMWoWwKa4tDLzLWU24kR88XAKN93CAwOUu9wdsEE=;
        b=San2MrPEHLEudyh+emdLepmXBjBkUsl3wjWlEy2YedOJSalxxxpc84a98oDQGif0q/
         lzk+YuHIfISu2aOeLyHhkHzWcJ51VRJg6xVKPuV7Xc8zXnKN8FGJB/EOdXLBAcyGIXXC
         drqwfwUaU7iDlQzwnkdRifiWe1B/ocluRVuu05QHkP4hFSFxztD2u8OkKZOk3WuU8ycd
         uJ7ZnCozfLhjZklcoz9wikXvSCSkGM2mrMp0jckpyXfIrs2zGppS2gN92fk37DM9Zp1p
         cMwijIQV6S/gF0eUgVDoLmF7vVQEyE+bpr6EfYrdlnmTlwkZ4UnUHxfNYAJjdWxMCH9C
         XfFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790286705; x=1790891505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        b=m0Ib9wJVOpgOXhNz+/LWE73H9/n9f32eS3bTHMzTlICqb13RX7e3pT9/W8BtTNtrBD
         XysOwGhuQXdUSyHcsO+ZC6Pi9ZFyMgQpY+ZstwoWn9qdo5P8/8JPMM4cZ5RKpI6cR+vc
         gdJjMaEtfXcSTTsxE/eAe9DE/sG7I32kNX5dm/OzaDJwpIFKeTF5wgiLoKzZeH7MqsU+
         8L9r8ckypusVwRgzHtUJV042Cb+ysoFg//jxypA2n845fhOQj+Q7fGjb2c4Sqk+EJRqf
         hPauHJJxSWCQECGCLmGk2nMv7OAX9AFJUIXV5a7m8xJrkWt9cMePzCmRh4Ja5OAXFtbj
         ij9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790286705; x=1790891505;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2wsrM4rfWmZ2YkyAaS9ur4eVUQUqD0HI+yn9LbwtrMI=;
        b=zmGJ6xtf+fcrh4znetpo120AFnZKvjw1CRiY8mqqzXiqPHOn7so+HHPesUAoPdv8Vc
         w4JAMKo6R5IpWmSVnzRC6bcfl4fmiUQdpEjn18k5TveR0p+BBMPbB6N3a71ZRcHOoaNA
         wzLo19jYcS+bjpe4r+U/F9sjlNsnSDnLfmpvd4igp5ZLQSgxKUSaMLGhhIJrASdW/CCs
         KwfIvuckwTiQxLmy0dJOFWbBLQSy4Lx5s1STb2AzvbudtNpFgZ0e47g2lPVka/U57yOB
         x9f782zxNSynH4PcLoNUSjvV67TohcQ3uz1aKnJReRwGFdXKdjS0nyRsOjaL+WMRCY6+
         UuFw==
X-Forwarded-Encrypted: i=1; AKwUvBxFF8kFrjOgpebp+0hepXdMByOgMHUi5pGAO/obzCzvfHJCh0NipDk78svLSg5XMEHrg5kzDJoQP2o=@vger.kernel.org
X-Gm-Message-State: AFuF++kHJ9Ql6R4W7KNEbcqRalJi4P/j675GPYLxw+Qno8HTmGWF2JKJ
	x2qyZLUSoCVsniSeBp1s9svUyDOqL8dtQBRz4peH8xvE7HA1bJ1zcQr4HWRJfojtKV6EQ+gpW9Y
	FSV9CNjp5NYQZqVHbUwkXoaSkWl7TVg==
X-Gm-Gg: AYBFou1BSoDaoJ0L00581Y07upfIC2rfwBgQDqUu6GM6v9HqdwzfQrsBTuoqXAhMDVP
	cvG5NCYvvJppAtyjJzBMDzNG/g96mkMNmAPEmgjnMhMbjeXBSPeVGmNtB359Tk3FPJv2Nz5NgYX
	c/8fuh3B2l5BC+nO3QNHnq+uNqD9hr30+k8wbFcToJbe2hLDsLSAcd4YCxEDaj1zxheBzusXB2M
	+Ue4XBuHeaMh1ygjyhrgWcl9f3s6zc3c8gCGVsVDFzrONAGZgIdWk/mSbfZ3+uBhODIsqHunanR
	autgMcXqU3TGWfF3XEkSMiVAau9YhA2zQqHNzSAe03wqkDJiUdWRNJy01tGSKNR1zqnOtfxjvp2
	BM0I+Wa4DT1JBVYO9ducd9gN+y8ll5yOLylFIRwUri0CdrdEYVDLhMmp+qqL+F0HE
X-Received: by 2002:a17:907:868c:b0:c29:4490:50c8 with SMTP id
 a640c23a62f3a-c2ac20ab6f6mr335227266b.8.1790286705286; Thu, 24 Sep 2026
 14:51:45 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:51:44 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 21:51:44 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 21:51:44 +0000
X-Gm-Features: AclHuK9j7u3HNrpkxbPfkJEXXgXPzlWkFF26AnQbZD5u6GM81J290RQpiIihOgA
Message-ID: <CAGEsz8Gwh=Y31EuTJLUp_jq3HhiizHxt7_ivOuytyZZH06mycA@mail.gmail.com>
Subject: [PATCH v3] usbip: vudc: Prevent transfer timer rearm during teardown
To: valentina.manea.m@gmail.com, shuah@kernel.org, skhan@linuxfoundation.org, 
	i@zenithal.me, gregkh@linuxfoundation.org
Cc: ae878000@gmail.com, michael.bommarito@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition") deletes the timer before
usb_del_gadget_udc() stops the receive thread.  v_kick_timer() can rearm
it even in VUDC_TR_STOPPED, leaving v_timer() to use freed vudc.

Use timer_shutdown_sync() to reject later rearms.  Replace the
inaccurate blanket lock comment with __must_hold(&udc->lock) on
v_start_timer() and v_kick_timer(); v_init_timer() and v_stop_timer() run
unlocked.

A KASAN/DEBUG_OBJECTS_TIMERS x86_64 QEMU harness binds g_zero to
usbip-vudc.0, sends CMD_SUBMIT to usbip_sockfd via a socketpair, and
repeatedly unbinds/rebinds vudc.  The unpatched kernel reported a
free-active timer and a use-after-free in v_timer(); the patched kernel
ran 4000 iterations without either report.  No physical device or
remote client was tested.

Fixes: d96209626a29 ("usbip: vudc: Fix use after free bug in
vudc_remove due to race condition")
Link: https://lore.kernel.org/all/20230316180940.1601515-1-zyytlz.wz@163.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Describe the harness, test scope and lock annotations (Shuah Khan).

Changes in v2:
- Drop the lock-held comment and mark v_start_timer() and
  v_kick_timer() with __must_hold(&udc->lock), on the prototypes and
  the definitions (Greg Kroah-Hartman).

 drivers/usb/usbip/vudc.h          | 6 ++++--
 drivers/usb/usbip/vudc_transfer.c | 8 +++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/usbip/vudc.h b/drivers/usb/usbip/vudc.h
index 5ef0e7d9b23a..c129f4c56e8a 100644
--- a/drivers/usb/usbip/vudc.h
+++ b/drivers/usb/usbip/vudc.h
@@ -157,8 +157,10 @@ int v_rx_loop(void *data);
 /* vudc_transfer.c */

 void v_init_timer(struct vudc *udc);
-void v_start_timer(struct vudc *udc);
-void v_kick_timer(struct vudc *udc, unsigned long time);
+void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock);
+void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock);
 void v_stop_timer(struct vudc *udc);

 /* vudc_dev.c */
diff --git a/drivers/usb/usbip/vudc_transfer.c
b/drivers/usb/usbip/vudc_transfer.c
index d4ce85c4c6a2..ba625622975e 100644
--- a/drivers/usb/usbip/vudc_transfer.c
+++ b/drivers/usb/usbip/vudc_transfer.c
@@ -441,8 +441,6 @@ static void v_timer(struct timer_list *t)
 	spin_unlock_irqrestore(&udc->lock, flags);
 }

-/* All timer functions are run with udc->lock held */
-
 void v_init_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;
@@ -452,6 +450,7 @@ void v_init_timer(struct vudc *udc)
 }

 void v_start_timer(struct vudc *udc)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;

@@ -470,6 +469,7 @@ void v_start_timer(struct vudc *udc)
 }

 void v_kick_timer(struct vudc *udc, unsigned long time)
+	__must_hold(&udc->lock)
 {
 	struct transfer_timer *t = &udc->tr_timer;

@@ -490,8 +490,6 @@ void v_stop_timer(struct vudc *udc)
 {
 	struct transfer_timer *t = &udc->tr_timer;

-	/* Delete the timer synchronously before teardown frees udc. */
 	dev_dbg(&udc->pdev->dev, "timer stop");
-	timer_delete_sync(&t->timer);
-	t->state = VUDC_TR_STOPPED;
+	timer_shutdown_sync(&t->timer);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
