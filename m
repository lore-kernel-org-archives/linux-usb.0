Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE7F46C839
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305641; cv=none; b=Jq49+NWF1YenMvhvKsieBsvMbHPeKPhSvXUlU3/v1vVnHDsmSLH/r0XM93NSo0/rF3D49nIbgkdNOLXMSJ0A+ZIqROX3m2RlSgVaHLPsBqRIlkIIw32HzlkEJGDoIcaXt/WvVU0ypIwu3qij0GwsiZa90ROdr69rD5D0Inbjg6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305641; c=relaxed/simple;
	bh=+i8zcfv9G7jMIdJJ3y0jvnysGQTVTauR7LX5aufUXuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ococjkpn/okVKLozgasYqWFDaEUiiUZHjCdA7p5qQpZkn6wfKLYwP2y7fz+UB2v3NAV6Xm/u3nFFDiQ0A75GMOpUZEWFsagTIR+Qs1U0nK0LzLlLoZ5Ui0frMTxeDNrFRWdP0xFFKVGkwHJFqYDF6OyuwXMtoGenVGE+Y7N02po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHU043Ss; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHU043Ss"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c1712a04ddaso134988566b.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787305630; x=1787910430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOWTr+15MOM7A+CsDbkp55jjN+CwEJBKz9AocimZBr0=;
        b=hHU043Ss97llaKM0acRdsvhQ4f+EzkDYrQaNF3UW9oFC3ENm1gpWJ+qaoYmu+5HsQ2
         BqTKVjEda34CGQh5f5NGEPUtnDDeydVQvu/dl/ju5kxwHBjIbgG9vzzoFsNhsPrtkC3c
         5Y8Vb+i6Mz3jisjO3LEqC1HJQXwudVdtFiK4VRMhLkQlw6jk/m1/GwqhB1Lz8asJp44G
         fg32lVIhp2bAosjQYlXEjCfJ6ysjLJ+WJxX+Nqt29AUJzs4mvhxP0sCDEIPZK9Zw63u8
         /kqOTvzpH+EWrixxEH9oODuzlih+7Ho+ymwNdbLEOaTStjrUwEgGKb8dzcHq8UWKrz8f
         GtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305630; x=1787910430;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOWTr+15MOM7A+CsDbkp55jjN+CwEJBKz9AocimZBr0=;
        b=gVSi2xGanjYtrZ9e9uQ65BxDet+JQmqOLenRjXeO0mX84FvOuQnJp521gQaKHbMPQd
         GhJLmAXXX3g3PhLcvcuF+V8WqnL6QClhYv2+sNdISD3FsQCj19Pfz4F5nR7AMAAdHETB
         WTrdr0opi4pQ+8IZliplhqmPq818Sq9mANS54YO/vNA41rtA1xPTdAM6vL03SQvqpc6p
         C8bwBsnZnT7Ishy+BVhoGM1xoH4TJS8rX4hLlUqNzShdL5vzqebp6+XV/D05fre8IlBU
         k8e+NlHJU4c7minCr3/ZR/Uq7z0IwpDJG4u+U97eV1F/qkQt7pul+2yG7DxndpWAZwBE
         dO5Q==
X-Gm-Message-State: AFuF++m29etLqvAAoYqReK5jy4PtR45gLgE/WiM1mfOrjqXjBbMzJkkE
	Bpp+y5t9GuLi+Ue/UnxBiqDBIjEQD1N1fScjuGr6clq4EO2w6XwHNTiS
X-Gm-Gg: AR+sD12j7kF6Pms5T2keaTWF06s0T2ivDsRv8I8pKh09FG27f++//Cco+31+QQzm6fj
	d5Jef1crtfb4Zskb1zntOQ/H9e7siOgppsKQGw0INxr/EIJ/gKVIkbqmlPywrknOGKm00CkL2Vy
	dGCOkTdY7AKiNacoyeucSovWjYUX7XxySPLelwpwJBT6Js1Oxrsjv7TfrRRTxa3w0xneqgqiD8I
	MD6JkkLkMPco2KRTfiHrkrH/1HE4V42U7FJHwjjx4zUMVC6SZKqd6TWEyQFnAQk7GldXL7pyZdZ
	ncCNQCLkCYHKVL88WipvOP021OdUYkfUaQoaNgwHpYw2BI4w0kJdcNiAHvzeEHqfKgBDqxxxl7/
	WoIHb1Jj3ycJ/ineYOKFlIIukwDhsRU0TpzTnBLWtcKCpNg48guFn6AUhdeeNIxaNTKMvCajAo1
	Eb3EX07jupNkCAe6RVtWD3MLq5VQpk/i5lehZeBM0kp0cxXyVBsZHIl2JG0cYJ1GP8EDqnKG1Hp
	gyWfw==
X-Received: by 2002:a17:907:e1c9:20b0:c20:768:af62 with SMTP id a640c23a62f3a-c246b4bd167mr386763066b.22.1787305629809;
        Fri, 21 Aug 2026 02:47:09 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c245921e4f5sm398756466b.55.2026.08.21.02.47.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 21 Aug 2026 02:47:09 -0700 (PDT)
Date: Fri, 21 Aug 2026 11:47:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <20260821114706.34b095b1.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

An isoc URB without URB_ISO_ASAP should be scheduled immediately after
the previous one, unless it's the first submission or prior URBs have
completed without resubmitting and the endpoint became idle.

An HCD_BH driver must consider URBs pending completion in the BH queue
in addition to its own queue. Regrettably, core doesn't provide much
information, we can only know if we are being called by completion now.
This issue is as old as HCD_BH, affects ehci-hcd too and has no known
reproducible impact, as drivers generally resubmit from completion.

A recent patch tried to address it by looking at xHCI HW state instead.
Obviously, HW has no knowledge of the BH giveback queue either, and the
whole solution amounts to testing whether prior URBs have been unlinked
instead of completing normally - then a new stream is assumed.

This leads to false negatives when a driver simply allows the endpoint
to empty out and begins a new stream. New URBs are scheduled into the
past and promptly fail with -EXDEV status, causing data loss and worse,
because drivers get confused by premature completion, particularly when
multiple endpoints are started at once and required to stay in sync.

snd-usb-audio underruns the OUT endpoint when userspace fails to supply
playback data in time. If this is detected in duplex mode, IN URBs are
unlinked and both streams restarted. OUT underruns again before IN even
begins, another recovery is attempted and the cycle repeats.

Fix this by using the best criteria we can muster, taken from ehci-hcd.
This brings false negative rate back to zero and false positive rate to
less than ever before in xhci-hcd. Traditional logic was equivalent to:

	if (list_empty(&ep_ring->td_list) ||
	    GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
		// consider this URB a new stream

While free of false negatives, it had easily avoidable false positives:
* no check for completion in progress when the list is empty
* the ep_ctx check doesn't make up for it at all, but it adds a race -
  EP state can remain "stopped" for a while after the first submission

Link: https://lore.kernel.org/linux-usb/20260813005635.34750f8c.michal.pecio@gmail.com/
Fixes: add8469b3e00 ("xhci: fix frame id calculation and checks for isoc URBs")
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f27bc132d0e9..8b0c27d6f12d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4311,10 +4311,11 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	check_interval(urb, ep_ctx);
 
 	/*
-	 * Check if this starts the isoc data flow. Relies on hw setting ep ctx
-	 * state after doorbell ring. Consider adding list_empty(td_list) check
+	 * Schedule the URB discontiguously if all previous URBs have completed.
+	 * XXX core can't tell if completions are pending but not running yet.
 	 */
-	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
+	if (list_empty(&ep_ring->td_list) &&
+	    !hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep))
 		xep->next_uframe = -1;
 
 	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);
-- 
2.48.1
