Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A29495048
	for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 22:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786575118; cv=none; b=tQkdE1+BQXpeNfT45fXxVPngn5R/Q5hYHvIAwm70GhAHu+ec21Wqc8I4v5K1ej6E3AX849aggQ7SklbhT597TawxVfZQ/j9BpEoQR42Ey+7qBQLWNU053GzS45j+X1f1zffEbOaKiiE02zJkdiDCNqbqQzJCTSyqFDInWRSfme0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786575118; c=relaxed/simple;
	bh=N04PVWfy57hvS6v3skK+UM6pB81qFkW3Lc4nNYMPvzk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+/AFi46VwWVvYJkxFLskWBmgpFxiULdoqOfulK4F7svt4nvTf9RGCyVGpktAf6ujy7Or9URYmJPmqWZwdEHTw2p2A/6CW6g2NXxNU4sYBjXhaMQFJ+NwuJcoMZMG6JQfqu9/hh+c4OEk7zpJh96MNRUGJyGS0IsrZOwIWfDC+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBXVkLyx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBXVkLyx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4956242332dso13268555e9.2
        for <linux-usb@vger.kernel.org>; Wed, 12 Aug 2026 15:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786575115; x=1787179915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SAn5Fpr2HiBs1ThvJhTtiIwuqFlbFsiKhKVHZQl7vVU=;
        b=bBXVkLyxS+YsvgBTsRdW3Bd3CzSnMJlqFMUC5M0R43exNiEYvE30QWEg29xkX3Ak9k
         ik0Liw+r2kaZDVBzIonF99MQqS/gEU8VkEgkV6WrsxVWKFMFZ/IiZWg2ytvbJtKNqnuP
         3AouJLLDqDJYLUnnIIvbri0DYWW6d/J+JCastP0mJR77Z68W6n9TfLTPF27oN9UrnX8+
         0OAsXbSQVdH9JFpwx9p5A1EloGrmjL/KFe8nFcJuSZufX9jiR9eL+J2Kqr2o3G5vH1EL
         JbTQMlUuBCSbb6s1XcHCGUzU+BflOBxDCGl8ArNmzDN191WuxMDQqR+z2+11AKkCvKeU
         McPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786575115; x=1787179915;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAn5Fpr2HiBs1ThvJhTtiIwuqFlbFsiKhKVHZQl7vVU=;
        b=AIEc4VIekNkaVtMXrkJ7IIaf28uWsJSF1DfFJyajNL3qkuGLIQ86dPMdd0N+gvxn0W
         pNiD8JyuY+ekWIlOvQTRRmM23WAcqhjlxPWSziKnBdpP3di1kvqM3As+cs7Ho+YnzuMT
         7YyNbaRVbyepznaDFKVMw+DWC5ixcI7ZOQbUuC4rE8HaAvqf8iabGPy4vSikIWtjokA7
         Y4gjQU4cXd87kMDM+PhxyE/5iQfeA/Q8NrlOboHfLAXJDS+uvW8ts2tgqbZ3nadQ0sHi
         oRO/zCiQ9r+GWzU5KaZUuZsplRN/iZQ6AciBUWeMBt+gkXpqcSBISNvvXMEuOUM2L76o
         lYjQ==
X-Forwarded-Encrypted: i=1; AHgh+RoQQEoVrPTkBE6aTh095V+plfA9Gg9d5Gie4AUL3jnlMzvDOZ3YFH35QsVH7Q8qMza+bM6zKm5nnHc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOEUFpi8Rj/5km7F3wIujvf7cywR004DMEthSbFwEbd9wJbIvp
	DczhZFOPIKFuQ32xVycRijax8QtlBARHwVaSI1O4H2WeV4N7GTlGO2ha
X-Gm-Gg: AR+sD13YY6My6E/tGB7yfnMYnep9uvnk2BL6+9AtnrOyM1WXddFYDDiREptSHM1K7tU
	QJ6XhEFc6GA2zdh4P6UBZv7S+GOao+rZuzBMLX8jmAmr/igfXc1+vO+7gm2Vd7umJ/fbqS/Pxe1
	crrSsaoMR27+YcfU4DXhVCsch4T+z5THNeSeP46NyG6UTfbiqo4blCeCUkKwlyHsbI6X82qNX22
	YD0CAunLusnOlUbKZvlBr4hCEQmLbEki5WqbYuSQB9T+Hkt29xPv8tLnE1U4lNKRkZ/gaJjc+Ha
	X9Ch4yaDYlwmRs6Qf+dobYqqUIun3ExoYfJa9JMJF7QEK4NcHWbdHFR39Z+zi3XAYDGK8rp9N4Q
	R+y23hFUgdylas6Z5PAFY6kZkFiWBfVo8apvnwoACiW4tk3pJt20T+QB9kqWqBUJnt9wD22dujj
	Q80WYM4WfY9xLdf0YKLhj83Kc47t38tJA36+x2MM4bMfVNzvVmXyTXs9/LGjkgYPPumFc=
X-Received: by 2002:a05:600c:19c8:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-499821ca34amr9964245e9.10.1786575114662;
        Wed, 12 Aug 2026 15:51:54 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982129643sm10959165e9.4.2026.08.12.15.51.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 12 Aug 2026 15:51:51 -0700 (PDT)
Date: Thu, 13 Aug 2026 00:56:35 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCHv3 1/3] xhci: fix frame id calculation and checks for
 isoc URBs
Message-ID: <20260813005635.34750f8c.michal.pecio@gmail.com>
In-Reply-To: <310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
References: <a67e11d4-6c80-4043-9f60-ae42a15ed0d3@linux.intel.com>
	<20260521152715.288995-1-mathias.nyman@linux.intel.com>
	<20260806101706.72a8de47.michal.pecio@gmail.com>
	<0e2f28f5-aa38-4401-8287-b55aab577243@linux.intel.com>
	<20260807000155.2960c741.michal.pecio@gmail.com>
	<e3c66325-0291-40f9-a87e-1bb337ce4427@linux.intel.com>
	<20260807102604.5f649db2.michal.pecio@gmail.com>
	<310ccfe5-0212-4c8b-9213-891a7340e2f4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 7 Aug 2026 14:10:35 +0300, Mathias Nyman wrote:
> I'm doing exactly what kerneldoc and comments in bugzilla state.
> If queue empties out we schedule the next TD based on URB_ISO_ASAP
> flag.

> > "If the queue is idle" means all completions have already returned.
> 
> That's an odd interpretation of "queue is idle"
> 
> This would mean that an URB queued after "queue runs out" (underrun)
> should always be treated as USB_ISO_ASAP case, making the flag
> useless.

Well, there are HW queues and SW queues, and HW and SW underruns.

If the HW queue underruns but the SW queue still has pending URBs
(not completed yet) then we do care about URB_ISO_ASAP. If the SW
queue is completely empty (all completed), we aren't expected to.


This does make a difference with snd-usb-audio. If I run

jackd -d alsa -d hw:... -p 24 -n 2

Ring Underrun and Missed Service are reported every now and then,
sometimes repeatedly, and it doesn't take long to enter this loop:

1. playback Ring Underrun (xHCI EP state is Running)
2. capture URB unlink (xHCI EP state is Stopped)
3. multiple capture URBs scheduled to the same start_frame before
   EP state becomes Running
4. new playback URB is scheduled into a distant past due Running EP
5. 2 uframes later OUT endpoint reports Missed Service for all
   those misscheduled TDs
6. goto 1

Changing the condition from "running endpoint" back to "empty list"
breaks this pathological cycle. Experimental patch below.

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 1ff84ab9955a..8e380d1c066e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -4303,6 +4303,12 @@ static int xhci_queue_isoc_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
 	return ret;
 }
 
+static int _ep(int ep_index)
+{
+	ep_index++;
+	return ep_index / 2 + 0x80 * (ep_index & 1);
+}
+
 /*
  * Check transfer ring to guarantee there is enough room for the urb.
  * Update ISO URB start_frame and interval.
@@ -4348,7 +4354,22 @@ int xhci_queue_isoc_tx_prepare(struct xhci_hcd *xhci, gfp_t mem_flags,
 	 * Check if this starts the isoc data flow. Relies on hw setting ep ctx
 	 * state after doorbell ring. Consider adding list_empty(td_list) check
 	 */
-	if (GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
+	bool running = GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING;
+
+	bool pending = !list_empty(&ep_ring->td_list) ||
+		       hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep);
+
+	if (running && !pending)
+		xhci_info(xhci, "ep %.2x running without pending URBs\n", _ep(ep_index));
+	if (pending && !running)
+		xhci_info(xhci, "ep %.2x pending URBs but not running\n", _ep(ep_index));
+
+	//if (!running)
+	if (!pending)
 		xep->next_uframe = -1;
 
 	return xhci_queue_isoc_tx(xhci, mem_flags, urb, slot_id, ep_index);

