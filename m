Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AD13E0C67
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 22:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785191312; cv=none; b=FlwvcZQC+NnIio2tBn76wqugFaXpRaYpFvxYK3CdcUUEsp0RqpSE4xv1TAc0RtnIXmVcoOkMCREWHJiCXe3x63/glbZJZMxxtWxbG2dzO/tJHj2qYooMHC1HDdBxPK/oi0D9/6aMOMVLd/NfDQDqyMGuROEz3RLUF0vfUFwZmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785191312; c=relaxed/simple;
	bh=fmBby+j7vqUnhnHT90DY1Oyy++yHey2NEwWypi48XCg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBYjuKGiwHl2nGTFTxm5QapmX0AX3ueh3x3LN8R37XQtyt88pHrJkgoyUbGp9P7sqIHPoaB0ihHXkwWhEAlVOVFbfle59Icin+JpKGPYymapZ68z5q7T07QHh40tCDYZrzHDIeVHxG+EJHWSkIpQpo/KPoG0VsZGwuxZO4YkzuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci9jdmQZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci9jdmQZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1890405f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 15:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785191309; x=1785796109; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaVs4MRBs+CoMFWSDY+BDZbxmcERjicLr9vSXImNabA=;
        b=ci9jdmQZ/vBmxUV0zPZDuKi6iGoJg2g+3kR+ASm1wK5r8p1daXq8BrJTGqt4rtWLpe
         WfwE4NRD2wV1aW8Bw2kKFbRngO8i832TIs64oM0YhJeIC54ZH1tiBvFKzBy/zEKFOO+n
         CKwj5Mh9mMhKBCFZEaNMdqZCpvpazxDkFIMEFs72SJmbSDFX1czOuH10ga7OWPLBC7sI
         3WhnSwSs1qbTvH1+bRg7ZoJyUcFH9Jqz/orWXLgKHyZ+6mc5HG3y/z0iuT+3OOpjoQdz
         wZGfG+wBAhIXaVFPgsoJDguFCjyohCSX3K/iJPreWTkvm4TEEORUAYzTFVffbq7+IaPK
         pBOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785191309; x=1785796109;
        h=content-type:mime-version:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaVs4MRBs+CoMFWSDY+BDZbxmcERjicLr9vSXImNabA=;
        b=PNCba9QXCS75OFowsT8AE+bJYXK7fvg62SSsOfYtgIop59RSXcf6e3FLDYBHG0axQu
         Nu2VuOYGnwTtrfO5Vreb/ZbWUiLsIekR4ee39XSPEwQ4fZCYblD+jpKJMbE7fmuynxCS
         VUFn7W5GyrpaBtoOWhGCo2hzlceURxIRVywxAgL4iw4QX32gR2+Z4TG71QbraOdPxPyr
         y1UzMU80slMYaXmnxGAl/fcP3HSxqrWJr3wAHs2ynsi45Xci/2vdWMmiTU8koKKKwobv
         NSk6T200JA9bYclUi6rRMewuGPvLKZNnYFsRPpc5NsAE0Ht0PIPD5sk107gbxVTiF1Rs
         h7vg==
X-Gm-Message-State: AOJu0YzVp2W27/23ugLhittSY3Oc7r2AghSMy4/6gbmvyvWSNCg6UYxK
	NNa0fgLitGfJBy23aZaGIRP65nvS9wV7zMMtZ775G9FbQ2HXAObJn4Y2
X-Gm-Gg: AR+sD12peMQ8yCSg69RbHGURz0l56M2iyZqJ6aOmsnJiIAM5gbL4JRf2XLXI9mhlP/i
	1AEEgZJCY4M8tSmsSMEX3S2WYl3Opw59IS2bXdrBGppaPhX7CLPjtmDYk+HuLmR4LXeSw5Nv9x5
	nNIeCyqpVXt4unmvhPO802gYe7X8cyU+rUmx9VgSnWan1Ri3eiY8QJzE2pqTyUo/zYH8FSqiOV5
	q5SxP+8iKV/2dDyGdy6yDWHxDtjdvVo/cQUiCJ9URERwFufYl+qkOhR1lzAD6/d4bgwc4fPXv4T
	FPG9EAr+q5B44Aq0TAGCUSwAy+cuQiHjqMeCnhsRxyJ7eGC77Lae2folyN3NddCTgDbWSZqsPXk
	lMJMfVekHlBK2b+5VpZ1jdwqgifYVYHs6JXqww1RTWzfF0LKN0wTKcjcoxnxvTRww6lzU+ZQKCN
	wy/Kst5dtTEX0=
X-Received: by 2002:a5d:64e8:0:b0:47f:8191:1467 with SMTP id ffacd0b85a97d-47f9fc8fe71mr12282277f8f.16.1785191309155;
        Mon, 27 Jul 2026 15:28:29 -0700 (PDT)
Received: from foxbook (bey56.neoplus.adsl.tpnet.pl. [83.28.36.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a596sm51290791f8f.4.2026.07.27.15.28.28
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 27 Jul 2026 15:28:28 -0700 (PDT)
Date: Tue, 28 Jul 2026 00:31:31 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Bart Nagel <bart@tremby.net>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <20260728003131.085171ee.michal.pecio@gmail.com>
In-Reply-To: <ame6T_LjiJBeJ2W3@spiral>
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
	<20260723081440.0228c59e.michal.pecio@gmail.com>
	<amJ9jAtK8rNWDO7V@spiral>
	<amKUdIRBrsFiDTiV@spiral>
	<20260725115956.321185a1.michal.pecio@gmail.com>
	<ame6T_LjiJBeJ2W3@spiral>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/4_ydBRYfQaQYwP6ReGraQdz"

--MP_/4_ydBRYfQaQYwP6ReGraQdz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, 27 Jul 2026 13:23:48 -0700, Bart Nagel wrote:
> At 2026-07-25 11:59:56 +0200, Michal Pecio wrote:
> > What happens differently in absence of CPU load?
> > - no Missed Service Errors anymore
> > - ep_trb_dma (see below) becomes always zero
> > - no obvious change, somehow the kernel gets more lucky  
> 
> The log is a whole lot quieter. With ffplay it appears that no
> uvc_v4l2_poll messages are produced. I ran for a few minutes and was
> seeing no missed service errors at all.

OK, no MSEs so no failures, that's obvious.

> OK, I've done this. I disconnected all USB devices but that webcam and
> my keyboard, and the hubs those two are connected through (otherwise
> would be a pain but let me know if it would be helpful).

Thanks, this dump is good enough, no noise from other devices.

Let's see if the attached patch fixes it, it will print BAILING OUT each
time the failure would otherwise happen and it should prevent failures.

I think the problem occurs when a Short Packet event is generated for
the first TRB of a two-TRB TD. The TD is completed and later a Missed
Service Error event erronously points to the second TRB of the same TD.
The driver can't identify this TD (it's gone) and goes nuts.

I can't explain why we aren't getting a second Short Packet for the
second TRB before we get MSE. Your HW does generate Short Packet for
both TRBs in other similar cases visible in this event ring dump.

I suspect that all those non-zero ep_trb_dma in MSE events are more or
less bogus on your hardware, although obviously not all of them are
instances of the aforementioned bug, because then the driver would
malfunction on every such event, and we have seen that it doesn't. But
let's start with testing if my guess is anywhere close to correct...

Regards,
Michal

--MP_/4_ydBRYfQaQYwP6ReGraQdz
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=webcam-crash-debug-fix.patch

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 24fde00fbb3f..89adf76e43be 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2683,6 +2683,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	if (!ep_ring)
 		return handle_transferless_tx_event(xhci, ep, trb_comp_code);
 
+	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
+
 	/* Look for common error cases */
 	switch (trb_comp_code) {
 	/* Skip codes that require special handling depending on
@@ -2779,8 +2781,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 		 */
 		ep->skip = true;
 		xhci_dbg(xhci,
-			 "Miss service interval error for slot %u ep %u, set skip flag%s\n",
-			 slot_id, ep_index, ep_trb_dma ? ", skip now" : "");
+			 "Miss service interval error for slot %u ep %u ep_trb_dma %llx td_dma %llx, set skip flag\n",
+			 slot_id, ep_index, ep_trb_dma, td ? xhci_trb_virt_to_dma(td->start_seg, td->start_trb) : ~0);
 		break;
 	case COMP_NO_PING_RESPONSE_ERROR:
 		ep->skip = true;
@@ -2822,13 +2824,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	 * We wait for the final IOC event, but if we get an event
 	 * anywhere outside this TD, just give it back already.
 	 */
-	td = list_first_entry_or_null(&ep_ring->td_list, struct xhci_td, td_list);
-
 	if (td && td->error_mid_td && !trb_in_td(td, ep_trb_dma)) {
 		xhci_dbg(xhci, "Missing TD completion event after mid TD error\n");
 		xhci_dequeue_td(xhci, td, ep_ring, td->status);
 	}
 
+	if (ep_ring->old_trb_comp_code == COMP_SHORT_PACKET && ep_trb_dma == ep_ring->old_td_end_dma) {
+		if (trb_comp_code != COMP_SHORT_PACKET)
+			xhci_info(xhci, "Event %d for old TD end DMA %llx after %lldus\n",
+					trb_comp_code, ep_trb_dma,
+					(ktime_get_ns() - ep_ring->old_time_ns) / 1000);
+		if (trb_comp_code == COMP_MISSED_SERVICE_ERROR) {
+			xhci_err(xhci, "BAILING OUT\n");
+			return 0;
+		}
+	}
+
 	/* If the TRB pointer is NULL, missed TDs will be skipped on the next event */
 	if (trb_comp_code == COMP_MISSED_SERVICE_ERROR && !ep_trb_dma)
 		return 0;
@@ -2937,6 +2948,8 @@ static int handle_tx_event(struct xhci_hcd *xhci,
 	} while (ep->skip);
 
 	ep_ring->old_trb_comp_code = trb_comp_code;
+	ep_ring->old_td_end_dma = xhci_trb_virt_to_dma(td->end_seg, td->end_trb);
+	ep_ring->old_time_ns = ktime_get_ns();
 
 	/* Get out if a TD was queued at enqueue after the xrun occurred */
 	if (ring_xrun_event)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3ce71211ee6f..b508904b34ba 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1363,6 +1363,8 @@ struct xhci_ring {
 	union  xhci_trb		*dequeue;
 	struct xhci_segment	*deq_seg;
 	struct list_head	td_list;
+	dma_addr_t		old_td_end_dma;
+	u64			old_time_ns;
 	/*
 	 * Write the cycle state into the TRB cycle field to give ownership of
 	 * the TRB to the host controller (if we are the producer), or to check

--MP_/4_ydBRYfQaQYwP6ReGraQdz--
