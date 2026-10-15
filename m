Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412F43BDA3
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053196; cv=none; b=F0DbTUdl0q4+8NQaPjaiVCxDgL9wsCcYhlIUBt9enFheUTd8tyV5AF0CkR1HQrw4+BdSXVefQhlRIWSwC6W6hvDokjI4DPjqKJ9emRhO7M+6B0R4t9SM1Xuac/cJE9zQwgLBDUW72somlowybTAjgtj8sOSgUef7UyOdlikS7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053196; c=relaxed/simple;
	bh=K/q5U+pGBe9FGuZYGOdKO4tB2k1MgK3HgbJ09Hl64sw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/IMNDpBTALEQxAnG7yT0N9dK4ZkYRVK/e3uKNMMRdXzYjQkdBBrMeQHbetIp/RM30FHJOkBqPqOW8lxnHZlQb0dInA4m+kxQUaKtvPZ8KIPoAGHuGHL9C+KjdmaN/faCffRo263atPSF9O2gq5kjM2hz5Rro/OC39upAKf+hJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0R3Iu4b; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0R3Iu4b"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so22434255e9.0
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792053193; x=1792657993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TYvKsnw/wo7FP7BSrciic/dcK/Yw81SsbNCEIrV3lTM=;
        b=R0R3Iu4bBtfvEtONOwmPz5f8h1t+gko0nL2i3DBmDtCJ1KInpyiWvkpwbKVpntbTqT
         W7zwSK61mn4vwlW73HQmhBG23MJE5vO9utJrx8kztus5O6rlSVqHkBT/XCeSWaM3uDkb
         BSpxrfImbQAPQsS+KZ8aRc/ni3o1N2714XTlGc+yKjVefrl0TiyBXu/Q/QoZz3Ywm7XP
         Izq7mp5eUQF0G7teHVRYo+bbfz9JxtD/h6QuKKP595kTf18ZEz7JaIE+X7v8xWR6v25m
         A97Qx4lfTVXKQL2IeJYhC/h40+lEPr6e+2FKmv6hsa2c9LqJ9UcjRbouke5Z2zzfOKFh
         Qi0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053193; x=1792657993;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYvKsnw/wo7FP7BSrciic/dcK/Yw81SsbNCEIrV3lTM=;
        b=tq6rucLoaM1HDv0mqpn3bL0BhAPLWVy7FE0ZgM3EFBmvlt8lbEFzU57BHAGc+UBjuF
         W4ia4JjdP+Zv4fo8yW8FNkSR10kQUEfe3Xnqimo9gr+raxCkvzZTiccDfe2v4MI858Kn
         xBhjvjZJtXQPNiB/8FfM/70mx+54N5wOVGaCcy//QD18iT/bLGo1JC3NtQGYZLO0f4ET
         A7EIOLV35BbVW56hZEN5pVArwGXnfbtF0sSFb2121TzSCWxiVn0LWGuBcdDbxO8gxml2
         vc79VtB94FP0F+OqM1ZDIZCQaBw6TGDt81RwmLgodj/fKZSF+yhbEQcQeqym+VLh+7+B
         SsVw==
X-Forwarded-Encrypted: i=1; AKwUvBwWkjL5Il7EWbxBRQiUlJBjEjvydTRmDA+Sqjo+uwoOAC0OxhHMJEjIALZ4IpS27IagSMYI9abJVNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdsZB6XKG6fN93bYNGMezh+w9+EpyvBN/LQTPvcsKXunWqObiR
	bK8Q3sYQeSTG8iJcebQPrHBLZUti+mGyuk62ObmXgGC9Lhv1n92sS0TV
X-Gm-Gg: AYBFou3VmOpZLos1aCk+aM8cwBkYLOeU5Ad1U2SbMdyQRtN3oXuDYXOWUzJm0pW+TFX
	BwMTv8jvEfL+BU8Yidok5Hlliy47B0AAOxLGcqa2DozLjqA5l4Qh/rJCh3j9Rc/Ff4Ia2+YTgoJ
	xCxLEnENxvKscGVHuQwV3NjwZ1dXTxTm0CbvTcRvibDJsP/3G3t5RYdCf12tfFLy145KvgzLzcV
	vgffO1xyAsVIW/Xa337p5qMIjnA9WxOGtbu/PHQ1o7xLJjAreh1fqe/4cqU5q37V1rwS8jG6pTI
	QzJy7P3LBZYS6oZv9EKQGkKocSMwiMryEMuzWbRc0vrImMoCMgcrlenndfBbl9qaIqXyKFahZs0
	LX7L8TWVn3yYUyljwU6+3gIfgq2K1iSXMZnlU60wnF0QJluwIXi1iL8bE66KDTtUQK+3gopQJuV
	MKbmugZGM85bbj0t3tTveEgAxLpvEo0pklG8WFLKvyxuwAf0cgGzhvipbTYSHq4VpI+QzRUao55
	2qqZceIQA==
X-Received: by 2002:a05:600c:6099:b0:4a0:1feb:de6a with SMTP id 5b1f17b1804b1-4a18e4e7a85mr348692075e9.30.1792053193202;
        Thu, 15 Oct 2026 01:33:13 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc506asm17881280f8f.47.2026.10.15.01.33.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 15 Oct 2026 01:33:12 -0700 (PDT)
Date: Thu, 15 Oct 2026 10:33:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Wen Xiong <wenxiong@linux.ibm.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, wenxiong@us.ibm.com, Brian King
 <brking@linux.vnet.ibm.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] xhci: Reset controller on xhci shutdown
Message-ID: <20261015103307.3ba25345.michal.pecio@gmail.com>
In-Reply-To: <64515dfd9a6cd8c3f5665e72a6bf6b81@linux.ibm.com>
References: <20261001222527.11742-1-wenxiong@linux.ibm.com>
	<20261002102931.3cb06009.michal.pecio@gmail.com>
	<561d22493c3d078b26f547dd8f6f6f46@linux.ibm.com>
	<20261002161828.365ff859.michal.pecio@gmail.com>
	<55a53022d1c6f671a3ed549d8cf7cd1a@linux.ibm.com>
	<20261006125546.10471489.michal.pecio@gmail.com>
	<64515dfd9a6cd8c3f5665e72a6bf6b81@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 15:32:22 -0500, Wen Xiong wrote:
> On 2026-10-06 05:55, Michal Pecio wrote:
> > Are you able to capture the original kernel's dmesg (through serial,
> > netconsole, etc) and see if the same "Host halt failed" is there?
> >   
> Below is xhci messages after executing a kexec kernel. This is dmesg
> for kexec kernel.

OK, but I asked if you have means of capturing the old kernel's dmesg
*before* the kexec kernel begins running, including any messages from
xhci_shutdown() which may possibly be logged. This can only be done
with a serial cable, the 'netconsole' module or similar tools.

But maybe don't bother with it for now. Instead, try if this modified
version of your patch works or not:

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 34f342d2c7d7..977b2b42bcfd 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -749,6 +749,7 @@ EXPORT_SYMBOL_GPL(xhci_stop);
 void xhci_shutdown(struct usb_hcd *hcd)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	int err;
 
 	if (xhci->quirks & XHCI_SPURIOUS_REBOOT)
 		usb_disable_xhci_ports(to_pci_dev(hcd->self.sysdev));
@@ -765,7 +766,7 @@ void xhci_shutdown(struct usb_hcd *hcd)
 	}
 
 	spin_lock_irq(&xhci->lock);
-	xhci_halt(xhci);
+	err = xhci_halt(xhci);
 
 	/*
 	 * Workaround for spurious wakeps at shutdown with HSW, and for boot
@@ -780,6 +781,8 @@ void xhci_shutdown(struct usb_hcd *hcd)
 	xhci_dbg_trace(xhci, trace_xhci_dbg_init,
 			"xhci_shutdown completed - status = %x",
 			readl(&xhci->op_regs->status));
+	if (err)
+		pci_reset_function_locked(to_pci_dev(hcd->self.sysdev));
 }
 EXPORT_SYMBOL_GPL(xhci_shutdown);
 
---

> [root@ltc-boston11 ~]# dmesg|grep xhci
> [    1.085853] xhci_hcd 0005:01:00.0: xHCI Host Controller
> [    1.085992] xhci_hcd 0005:01:00.0: new USB bus registered, assigned 
> bus number 1
> [    1.144472] xhci_hcd 0005:01:00.0: Host halt failed, -110
> [    1.144518] xhci_hcd 0005:01:00.0: can't setup: -110
> [    1.144571] xhci_hcd 0005:01:00.0: USB bus 1 deregistered
> [    1.144778] xhci_hcd 0005:01:00.0: init 0005:01:00.0 fail, -110
> [    1.144842] xhci_hcd 0005:01:00.0: probe with driver xhci_hcd failed 
> with error -110

What about 'dmesg |grep -i xhci' (and 'grep 0005:01:00.0')?

You are likely getting errors from quirk_usb_handoff_xhci() as well.
This reminds me of a similar issue reported earlier this year:

https://lore.kernel.org/linux-usb/69fa1c3f-3ea9-42cb-a49a-7da39f72806e@molgen.mpg.de/

> This is the reason why we can't see usb devices after a kexec kernel.

No doubt about it.

> > And if you enable dynamic debug before kexec,
> > 
> >   echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
> > 
> > what's printed by the debug message at the end of xhci_shutdown()?
> > 
> > Do you also get errors from quirk_usb_handoff_xhci() by any chance?
> >   
> After executing a kexec kernel, is the control setting lost?
> I didn't see much useful information in control after a kexec kernel.

Yes, the kexec kernel starts with a clean dynamic debug state.

> Probably we can resubmit the patch with mathias's suggestion.

We could also try the approach in the test patch above, but doing it
properly will require a few more changes. I haven't bothered before
we know whether this helps or not.

If it doesn't help, it will look like you have something (machine FW?)
monkeying with the chip during kexec. Then we could try fixing some
known bugs in quirk_usb_handoff_xhci(). Maybe this will be enough.

Regards,
Michal
