Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EB38736E;
	Tue, 25 Aug 2026 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648974; cv=none; b=MCOA40ftias8jJnbAHSGCPbteDXpPMzvr3KQw9UT+PM+rO9f9hqYcuQGywKQwREXfxUcnJvEjuaX5Ul6yk+PzeT2pchnQLLtGjwDRtVwfV3unoRFm6/tL06jNUH7+n4wmjz8EtAdBWEjQQU664wLTkQ7SmonYYmVGdur07F8oag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648974; c=relaxed/simple;
	bh=CkjGispeNeATmQv6Xi2E8JuUM/PZSRCjFjw3y9D6BVA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=l1ixgUn2CgJ7dx9L87Mf+SrdPVGhC9hJU9uGeo5lOCZf/e7wRHBMSsvHqy+gxtosdILJjsqM/Jh+QxBmBLLlp4UEeAgfGSzzo7zg+xJrDCU0rl9cgKqqYfodz9IxuEHwL0QEuYSiqujO6JlwTBcKaXwMweYoPEf39cD05DjWdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BCALfqP2; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BCALfqP2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787648962; bh=CkjGispeNeATmQv6Xi2E8JuUM/PZSRCjFjw3y9D6BVA=;
	h=Date:To:Cc:From:Subject;
	b=BCALfqP2vbIhClaX7zj1wTl3ZYCRYTNjxr9qQv7U2HTO/d1LjENGnQe4p79GJXyhA
	 Y3b3OZ5MZToXhZKuU0x1w0UJ3ARdLE+vU+cwYKoVNsS7jjRjdq7WRV4bu8V6x+BCR3
	 QMX5wQRKuAPvB4Kg5bN5bpyWlQRrG4Ekvgs0PG3k=
Received: from [192.168.255.10] ([111.206.145.19])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 254B40F8; Tue, 25 Aug 2026 17:09:20 +0800
X-QQ-mid: xmsmtpt1787648960tu4luly1m
Message-ID: <tencent_0F874E79839C91CD14A58265BF7B6D89850A@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25G1B4NRc14k3FrqnI2CHxVBIriFmfn/o48iNol2hRC1Is6Gb/VDR
	 K00i3wgfIL4X554ikRxU1aqvPJd/3ScsA6XpQvH/hytEAtpa0XMgEQqxVLACRlDAwxfSjGoPgqD0
	 qYPBc+3hhvLRjkEwLu4FlQV0mqclohscnoSbgGy7IEdc5UgTJ0rWGRWu3l+6j6hdoebN893bTEkD
	 cU7NWcbYhQLBiUj9LmAoxmd9JkOcNS3RpYLkZqXS3yVimUFkETmcSalhEQbVG2oAsnRFrQUmWscJ
	 95zBfpIgUTNsOrkyPmnWsI1T57WyFngD2DdcoFodAn1VaWPoYQeOj2+sOYnaB/3418IcAPPVR1K5
	 G17a61PuPw8FqWC18NFJRzjg//z3UF+0n3HC4190CEU9HTiVPtkk4PHS9vo+joSj6sXRyUeAE/uS
	 c3TGlLjpUAYkx+EPABiZWZa51ZAoCXSipyLz906S5BREylbLFV+poZ88qkYFvW0cSevSt8D7fhTQ
	 8xYLK1qkL0cP4QMIopaECSEJRx6t2OXMIuK7wrM4LTsiQwwxhu9TdBNhc8rA6L+z3Dzhc4YP61TC
	 FL39omy5S2VMKjj6zOxGpi3dWsMRyqfFUH0wkYogKZG9+bmpAMerEJj6sJAQn771e9+PAnhadRZk
	 hUnrygd5e1HTsFRZ5C9ETowBbzQd5SJ+vEdPKcOlxyleUnHJJsw/kHYqwAMND4g5SJE0hAi3pVll
	 3vHPXCQRVYR0fW3grO6afCSuMQgYKxJlaLYuWYYXt8d1V98Td8kvLvHkrePIUA87yWaL03RPniLw
	 AbvWwDfavlekFRd+gd3hJ1fCLjZnPio/P2wi0x3XxjejD7E5HQQA+1NP8LoGSfdv8cKwRyaV21R6
	 EmVOYNxFG2ExxA17m+DZKABBU3XRcFm2ycSADY7hra8/DcpkM368knby2AGNF8lbWiRGD7EiAF0G
	 nj3uNfwIQAtn02+hQ1LSOU7soZR2SAXKSCRQ5/Ea9UTzkEwjIJdSnLxknEQzmITkVQSI8N+4neix
	 r1DxvVq1suQp55fVaqRP67g7s2+zq+ocNvaqVpb2H7Ga6rBmCvjjMuM2xR7dbxP8RWKy48o9Mau+
	 /jXt2nkPU7a3aT5BwykutwlY39+g==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-OQ-MSGID: <f865a9a9-7f9c-4a6a-a1be-b4a4203d7c26@qq.com>
Date: Tue, 25 Aug 2026 17:09:19 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
Subject: [PATCH] usb: xhci: Fix lockdep warning when entering test mode
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xhci_enter_test_mode() and xhci_set_port_power() are annotated
__must_hold(&xhci->lock), yet both drop the lock in the middle of the
function: xhci_enter_test_mode() around the slot-disable loop (because
xhci_disable_and_free_slot() takes the lock itself and can sleep) and
xhci_set_port_power() around the ACPI power-state calls.

xhci->lock is also taken from hardirq context in xhci_irq(), so it is a
hardirq-safe lock.  Dropping it with spin_unlock_irqrestore() re-enables
interrupts while the lock is still held, and lockdep's
trace_hardirqs_on() -> mark_held_locks() then records the lock as
HARDIRQ-ON-W, which conflicts with the IN-HARDIRQ-W usage registered by
xhci_irq():

    inconsistent {IN-HARDIRQ-W} -> {HARDIRQ-ON-W} usage.

Fix this by releasing the lock *before* re-enabling interrupts (and, on
the way back, disabling interrupts before re-acquiring the lock), so the
hardirq-safe lock is never held with IRQs enabled.  Also drop the
incorrect __must_hold() annotations and pass the saved IRQ state by
value so these helpers cannot clobber the caller's flags.

This patch is tentative and needs maintainer review.

Signed-off-by: Yang Zi <2959243019@qq.com>
---
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index b0264bd8577a..c28d278f45b0 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -638,12 +638,19 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
 
 /*
  * xhci_set_port_power() must be called with xhci->lock held.
- * It will release and re-acquire the lock while calling ACPI
- * method.
+ * It drops the lock while calling the ACPI method, which may sleep, and
+ * re-acquires it before returning.
+ *
+ * The lock is released *before* interrupts are re-enabled because
+ * xhci->lock is also taken in hardirq context (xhci_irq()) and must never
+ * be held with IRQs enabled.
+ *
+ * @flags is passed by value: it is the IRQ state saved by the caller's
+ * spin_lock_irqsave() and must not be clobbered by the lock/irqsave dance
+ * below, so the caller can later restore it with spin_unlock_irqrestore().
  */
 static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
-                bool on, unsigned long *flags)
-    __must_hold(&xhci->lock)
+                bool on, unsigned long flags)
 {
     struct usb_hcd *hcd;
     u32 temp;
@@ -665,13 +672,15 @@ static void xhci_set_port_power(struct xhci_hcd *xhci, struct xhci_port *port,
         xhci_portsc_writel(port, temp & ~PORT_POWER);
     }
 
-    spin_unlock_irqrestore(&xhci->lock, *flags);
+    spin_unlock(&xhci->lock);
+    local_irq_restore(flags);
     temp = usb_acpi_power_manageable(hcd->self.root_hub,
                      port->hcd_portnum);
     if (temp)
         usb_acpi_set_power_state(hcd->self.root_hub,
                      port->hcd_portnum, on);
-    spin_lock_irqsave(&xhci->lock, *flags);
+    local_irq_save(flags);
+    spin_lock(&xhci->lock);
 }
 
 static void xhci_port_set_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnum)
@@ -689,15 +698,24 @@ static void xhci_port_set_test_mode(struct xhci_hcd *xhci, u16 test_mode, int po
         xhci_start(xhci);
 }
 
+/*
+ * xhci_enter_test_mode() is called with xhci->lock held. It drops the lock
+ * around the slot-disable loop because xhci_disable_and_free_slot() takes
+ * xhci->lock itself and can sleep, then re-acquires it for the remainder of
+ * the function. The lock is released before interrupts are re-enabled since
+ * xhci->lock is also taken in hardirq context (xhci_irq()).
+ *
+ * @flags is passed by value so the caller's saved IRQ state is preserved.
+ */
 static int xhci_enter_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnum,
-                unsigned long *flags)
-    __must_hold(&xhci->lock)
+                unsigned long flags)
 {
     int i, retval;
 
     /* Disable all Device Slots */
     xhci_dbg(xhci, "Disable all slots\n");
-    spin_unlock_irqrestore(&xhci->lock, *flags);
+    spin_unlock(&xhci->lock);
+    local_irq_restore(flags);
     for (i = 1; i <= xhci->max_slots; i++) {
         if (!xhci->devs[i])
             continue;
@@ -707,7 +725,8 @@ static int xhci_enter_test_mode(struct xhci_hcd *xhci, u16 test_mode, int portnu
             xhci_err(xhci, "Failed to disable slot %d, %d. Enter test mode anyway\n",
                  i, retval);
     }
-    spin_lock_irqsave(&xhci->lock, *flags);
+    local_irq_save(flags);
+    spin_lock(&xhci->lock);
     /* Put all ports to the Disable state by clear PP */
     xhci_dbg(xhci, "Disable all port (PP = 0)\n");
     /* Power off USB3 ports*/
@@ -1463,7 +1482,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
              * However, hub_wq will ignore the roothub events until
              * the roothub is registered.
              */
-            xhci_set_port_power(xhci, port, true, &flags);
+            xhci_set_port_power(xhci, port, true, flags);
             break;
         case USB_PORT_FEAT_RESET:
             portsc |= PORT_RESET;
@@ -1514,7 +1533,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
             if (test_mode > USB_TEST_FORCE_ENABLE ||
                 test_mode < USB_TEST_J)
                 goto error;
-            retval = xhci_enter_test_mode(xhci, test_mode, portnum, &flags);
+            retval = xhci_enter_test_mode(xhci, test_mode, portnum, flags);
             break;
         default:
             goto error;
@@ -1581,7 +1600,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
             xhci_disable_port(xhci, port);
             break;
         case USB_PORT_FEAT_POWER:
-            xhci_set_port_power(xhci, port, false, &flags);
+            xhci_set_port_power(xhci, port, false, flags);
             break;
         case USB_PORT_FEAT_TEST:
             retval = xhci_exit_test_mode(xhci);


