Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491B61AC44D
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 21:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791320535; cv=none; b=E1a0Zhm0/rw/LXw7A9bjUUqa6jHpjMh9B88b2mz2f0CQEJdS/wqSRzY4jIH9PZa/wjbuWIG30bvXz9oFfccn0CBPnFNaWQVqDptJHozR+H0GI481FHYWc+KlLMX4HdhXvYYSHMMMPyrlSkj919BUPMcAHZE1lsT3zA6HpUtdqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791320535; c=relaxed/simple;
	bh=pGyRwKFmLnbcM54/t/JDHpa7KiSLJgn/itGyfWxhCvk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IKAeC96OI5fHMz49GUp6HwrWLSCRqfrEKJSfl7SFuaCY+LXb4x7K2SPY/9SvjJbVuzh+8FuIps7+jD3kh9pZ0pLLvKsofGAjjMmzhi7ixJtfFdjHg0TfFZ3o8C9SS+C1z370qQWaTE1VBujucNuRvWoqmFZkbxvmBhsbuY53Rig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPuBSWuI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPuBSWuI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso14163585e9.0
        for <linux-usb@vger.kernel.org>; Tue, 06 Oct 2026 14:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791320532; x=1791925332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x+uep9KgNlXh8pG1NuwCjHy8uUzWOdIDPN9eEDl5s/g=;
        b=RPuBSWuI0MZ2/gYx2elY5hggHK9DrUn0ol1A+mFT2uuV0x4r2XXUCEH47Ttei2VUN5
         vp5hQ/qLlOuP5pLyWcCG2YJCHK0UsSswn7A99u/BSGdAATpQz0LgDQzDP+30KgYty2av
         6NVEcejTNYqQLAFTedF5k21W3a6Df83uKRKSsTEsh7T+G3EbJVPgS5rNhAHLrUmiDtA/
         r3QnqbW8IMCw0ZBEX0qMqJ7Z1D4Bp9wGr9L8CDJG2znF0jrZiQ1vSYFEtj2zAA4IJKLb
         2BbFQOGb6NZXEioRqXBgR/OumMwoLEt1e9sd8rdwvZvq1Ual0R++ZHzODR9oL9ax5ilx
         bjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791320532; x=1791925332;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+uep9KgNlXh8pG1NuwCjHy8uUzWOdIDPN9eEDl5s/g=;
        b=RUJmuuczSJx50xymmX82zZ8IlLWyzvtoz1m2KwfGrW8Qpifft2tapS7T3NccwitMg0
         asuDt9LMmQw3fi+UC2A/dQR+d3HdcLdAWMTvbtq1VJv1tz2qDtVZTzyNEAAxJnvMW60D
         X3uq83BJPamwzObogJiCQf6qWUST5O6+O35zd/g7dRdxm4W+DcPgKLe2Mu0WmFf6tVwf
         Dg67TzPpAHuTXmnJTAIig3URuqQ9mLz/e2dr6Wxm68Lfuj4aJS3I2QTnHiVffAjt+rbp
         M58yAgmbAx3UMxrcSWh4zBv2R94w6wTdcKKVMGK0yBUrI/mo59tLGIySfZhSRrX1OKZ3
         DPbw==
X-Forwarded-Encrypted: i=1; AKwUvBzvkE8eRfDKeg7I4PhoWKnuICfLRcuSjchddSLCntWlZ9xNKVXqwgM4SvHcY48gYXmI4RXz5nHVTxo=@vger.kernel.org
X-Gm-Message-State: AFuF++l7/Ub2xxla45Fqjy8roCElxs87VffMyc+x7saR674QNjUCKo9Q
	JgvCbBgZhUnrWxlouda6NQAQcPtBUJrxE13Lay7nI/p795HKeW+6nkHe
X-Gm-Gg: AYBFou37ib4n/8AJnhASP5mFRE6+9/WAEn+etN0TH6BpaUiskyTSCuZo5TthBULV0Nd
	rridQKmPTSXBcbGM30G7sCs2HSKMgoEJziFalOFcBx784XjPJfCr+jBswZKdbxwAm+TjAfTq+gN
	oOWjS48T85ReSl8i9JfGzZ+GedEBnlmCWpFr92R85l36D27ECIO/tmYByF38z+xpug2fPqo32fO
	C1K8haypcVKjbjbo/GTxdOq1qxTqSQH/F7XpPsy/445IzGjFXHcqnBlBCrAO34beqP9njxi5Cbv
	wlOELbCXK7crebMG90Yn9OSOoIxcYsWg9QJv+J1dsKVzVj2qEkaTLhLY7PkTXJNf1ztPOpIPe86
	AEsELzPABvMP0rbEpZrLZsL3NlH7Ym9aNzEdEhiB+6uohxYrmYB4jBug9EWSvr3SQTY2hMzzypI
	qRFhBXos9ELnremkpskE6982OQpvDSKQEY1Xsn2IGzWlI1Ko4uW7yPlYjXpKkGjFn0FL4s46FOU
	ukk+L2jaEWE7lS9y/lo
X-Received: by 2002:a05:600c:154c:b0:4a1:6282:1cf3 with SMTP id 5b1f17b1804b1-4a18043b284mr1142585e9.9.1791320532197;
        Tue, 06 Oct 2026 14:02:12 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180310c9fsm1692655e9.4.2026.10.06.14.02.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 06 Oct 2026 14:02:11 -0700 (PDT)
Date: Tue, 6 Oct 2026 23:02:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] usb: xhci: correct num_active_eps accounting on
 allocation failure
Message-ID: <20261006230207.0faaac31.michal.pecio@gmail.com>
In-Reply-To: <20261006183301.7a1875c3.michal.pecio@gmail.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
	<20261006152427.3735383-3-niklas.neronin@linux.intel.com>
	<20261006183301.7a1875c3.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 6 Oct 2026 18:33:01 +0200, Michal Pecio wrote:
> On Tue,  6 Oct 2026 17:24:24 +0200, Niklas Neronin wrote:
> > Some host controllers have a global endpoint limit across all slots,
> > tracked by 'xhci->num_active_eps' when XHCI_EP_LIMIT_QUIRK is set.
> > 
> > During device allocation, EP0 resources are reserved before
> > xhci_alloc_virt_device() is called, and 'num_active_eps' is
> > incremented accordingly. If xhci_alloc_virt_device() subsequently
> > fails, the slot is disabled but the reserved endpoint resource is
> > not released, leaving 'num_active_eps' permanently increased.
> > 
> > Decreasing 'num_active_eps' happens in
> > xhci_handle_cmd_disable_slot(), which is called upon a Disable Slot
> > completion command.  
> 
> Why is 'num_active_eps' not decremented if the slot is disabled and
> Disable Slot completion handler is supposed to decrement it?
> 
> Does this bug really exist? Can you reproduce it by forcing the quirk
> with module parameter and simulating vdev allocation failure here?

Never mind, the bug is real and reproducible. Still, commit message
could include a few words of explanation to prevent such questions.

I think it would be cleaner to fix this by allocating vdev before
ep0 reservation, because allocation is easier to undo:

1. we have a helper for this, no need to dig in xhci members manually
2. we are the only user of this slot_id, so locking is not required

Downside: larger diff. But less code in the end.

And there is another bug: disable_slot uses udev->slot_id, which is
uninitialized in this path. Should use the local slot_id variable.

So overall,

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index e5b39be04b92..9beb8b4b485f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4308,27 +4308,29 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 
 	xhci_free_command(xhci, command);
 
+	/* Use GFP_NOIO, since this function can be called from
+	 * xhci_discover_or_reset_device(), which may be called as part of
+	 * mass storage driver error handling.
+	 */
+	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
+		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
+		goto disable_slot;
+	}
+	vdev = xhci->devs[slot_id];
+
 	if ((xhci->quirks & XHCI_EP_LIMIT_QUIRK)) {
 		spin_lock_irqsave(&xhci->lock, flags);
 		ret = xhci_reserve_host_control_ep_resources(xhci);
+		spin_unlock_irqrestore(&xhci->lock, flags);
 		if (ret) {
-			spin_unlock_irqrestore(&xhci->lock, flags);
 			xhci_warn(xhci, "Not enough host resources, "
 					"active endpoint contexts = %u\n",
 					xhci->num_active_eps);
+			xhci_free_virt_device(xhci, vdev, slot_id);
+			/* without vdev disable slot won't free ep0 resources */
 			goto disable_slot;
 		}
-		spin_unlock_irqrestore(&xhci->lock, flags);
 	}
-	/* Use GFP_NOIO, since this function can be called from
-	 * xhci_discover_or_reset_device(), which may be called as part of
-	 * mass storage driver error handling.
-	 */
-	if (!xhci_alloc_virt_device(xhci, slot_id, udev, GFP_NOIO)) {
-		xhci_warn(xhci, "Could not allocate xHCI USB device data structures\n");
-		goto disable_slot;
-	}
-	vdev = xhci->devs[slot_id];
 	slot_ctx = xhci_get_slot_ctx(xhci, vdev->out_ctx);
 	trace_xhci_alloc_dev(slot_ctx);
 
@@ -4348,7 +4350,7 @@ int xhci_alloc_dev(struct usb_hcd *hcd, struct usb_device *udev)
 	return 1;
 
 disable_slot:
-	xhci_disable_and_free_slot(xhci, udev->slot_id);
+	xhci_disable_slot(xhci, slot_id);
 
 	return 0;
 }
