Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8943E073
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 14:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787323625; cv=none; b=iuI15rgIxsXPtgHNA8N3BpQQvJSsAqjULGtt/J8UY030LNqxKG/8cGOZiss7Q+yNS2VEXrGIcC+p1iMGAzTNUmQ/9k5L1IUE08BPWy/1SvGDmzvurh6C/3brFQM+ZF9FxRSDxujTmOX8dEv51D370XXBzzrd891CyBuoVnVkuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787323625; c=relaxed/simple;
	bh=GZyHcculU0gOJlIxF7dSpQxZvPDAWhhb+BKxeeo1dYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IJ8bGgHNQzggqZO0SmVPm/jwOouSbL11q7cf6engeJ2csUGPlQ7Cv1+TasmeqUX725/XsZRlIZt/8BPk137P3ap7P9Ala+c76trAQtdqMjeTsvAIu0ReouFbLKEdXDp/SIQSJT+//xRgCOl1vBF6mdTJE0sKpTfj8zYhAomCb7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6kHvkEc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6kHvkEc"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15b1da6b82so122921766b.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787323611; x=1787928411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UkCD9ip6gAVSYyBIpgV04TliVlZ8DLGdKefhjITe5Cs=;
        b=b6kHvkEcu3dGi+qjWIYBsyB+29AyWZ/9olX77Af3gtC2UgOsp4MUfdfaFQ9gR+2Mod
         WPGPMPGf+mCkhhsQU5FKinOJFvRd2ZY2t4+9Uj5htzZHD8TItBbmeTC7CstcTgv0qagj
         Qb0meCjxdsyWaRahWYvmfbq88aCKC63tB70sIcBj7ETltOAD4KqyF3cP0vfQMFDCjntN
         4xLUMrxmlpzaeenhkyh0eJq36o1S0F3h3hnpzyIpTALFJyX2ZVnSApQcxjzFxk4IvvBD
         cytoe9VwfP3mZErXTmTXTNWarKPcTqVt0/xobJTZd72g8KDyffDwaCCeajSX1kzgsGpp
         M0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787323611; x=1787928411;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkCD9ip6gAVSYyBIpgV04TliVlZ8DLGdKefhjITe5Cs=;
        b=okFWBOF3lDNTyBmfLt6kumcP1XrIZ6kn/6ujtcDzmnTSKKnHjssNZIF2TJ5z90F+bs
         Mkc2dNEMrG5nSXPUbofqwOfuYoaTAfUvII+OZcnwuZJ/8/cjwhJBMSykOGuD+HX9m8/0
         JCyrKk2x6Z8qs1wLXgP82yVGrKyniS0YiNj8nEuACQUwgUqbpYXU6afmsoApLOtW13zV
         tQdKj/Ux7Tis5bi7UMmjHwSViu49nGfymV6qRLNicIEqV8urKzgc2OK5yg+u4wFr1HzI
         G/YXh1ioRP9wIp+AaROxNVdDxXp+2U1GI0aTJIixoSEI6EykZCd4U6RfPE1YQsAWtYHV
         IyWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCRwZk4gss/SMpuCwBRnDvVMooJwvDLKLjEMpbQD5l6Ei/CUqBE2Vlf7L3k9wMRUk/oLbM0bxDttI=@vger.kernel.org
X-Gm-Message-State: AFuF++mzogmTvQZtk7EhiawSsylCZ1UhEwserBlN2dDxqcuvZz2Q4llW
	B6ATZB4kg6KcsaumSzKFo7OPC/F4V9Vf/OPsRzWzjiBx77Ia2QK1BNGx2PgJdA==
X-Gm-Gg: AR+sD12TYhQxyi1phQm6MKd7jJp5S7Va3Mt1B9XgTISBop+b3dfU9zqKywvbhzIQyIb
	QRLk6+52Z0UtPpNnBSNX2oT++JFxMeRJrMrmHEr13e6HWuMIeoKDYaD/gBjPcaoVuyOkgA3xw8w
	qjzgz8/bjYKlBN07ziJ5NIgJNw/SBMHLFmgDmMZeDABvogGvI/SI8C7OnuqmXikbrqZ6VbwD2gG
	1LEmAdF+0fYQGTdcW30YpC/BjY/EggusJ8qrrHYA/zMkPFmmctFtp4sunqWJawe3CHqK5ZKvVv0
	yvZX8mhmXTK+v//IjarFaYYgOAsi4yKP7jumD5Pkez9+HSI9h5AIJ0IkmGJ79kVcN8mXOkDwWcH
	KY2VD2hzUkx3F9gCvM3NKn904mN1w/FsXdVHjH8HmXGMm63jU4nBf2TDdRUOV1exADrUoUjeCk1
	WQBV8kF0cRCWWsErd36M0avvoazGP4F/rGRlp5TUHaguflg2/wcMhgZ6aB8XsgGPN/9G8=
X-Received: by 2002:a17:907:1b09:b0:c24:670b:7750 with SMTP id a640c23a62f3a-c246a60ca8cmr632531266b.14.1787323611301;
        Fri, 21 Aug 2026 07:46:51 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c245931812esm582462866b.60.2026.08.21.07.46.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 21 Aug 2026 07:46:51 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:46:45 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Fix isochronous scheduling regression
Message-ID: <20260821164645.047c9020.michal.pecio@gmail.com>
In-Reply-To: <6804ed57-8405-4310-a64f-20c400bffde0@linux.intel.com>
References: <20260821114706.34b095b1.michal.pecio@gmail.com>
	<6804ed57-8405-4310-a64f-20c400bffde0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 15:05:53 +0300, Mathias Nyman wrote:
> On 8/21/26 12:47, Michal Pecio wrote:
> > Fix this by using the best criteria we can muster, taken from ehci-hcd.
> > This brings false negative rate back to zero and false positive rate to
> > less than ever before in xhci-hcd. Traditional logic was equivalent to:
> > 
> > 	if (list_empty(&ep_ring->td_list) ||
> > 	    GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> > 		// consider this URB a new stream
> > 
> > While free of false negatives, it had easily avoidable false positives:
> > * no check for completion in progress when the list is empty
> > * the ep_ctx check doesn't make up for it at all, but it adds a race -
> >    EP state can remain "stopped" for a while after the first submission  
> 
> I would still prefer:
> if (list_empty(&ep_ring->td_list) && GET_EP_CTX_STATE(ep_ctx) != EP_STATE_RUNNING)
> to detect the start of a new isoch stream.
> 
> It has zero false positives mid stream, and fixes the "stopped" state
> race case.
> 
> I can't figure out when the false negatives it introduces is an issue.
> 
> If you can show me a usecase where a driver or specification is
> designed to let an isoch endpoint intentionally run dry, leaving it
> in running/idle, and then continue queuing URBs expecting ASAP
> scheduling, then we can change it.

Well, snd-usb-audio does. In snd_complete_urb(), in the
usb_pipeout(ep->pipe) case and ep->lowlatency_playback, which is
the default (controlled by 'lowlatency' module parameter).

It adds the completed URB to a queue of "ready" URBs and then tries
to submit as many URBs from that queue as possible, which may be
zero if there is no data to send. Then pending URB count is checked
for zero, which triggers xrun recovery in ALSA core.

I haven't dug into ALSA, but the observable outcome is:

snd_usb_endpoint_stop() is called on both IN and OUT, which unlinks
IN URBs and does nothing to OUT (zero URBs left).

snd_usb_endpoint_start() is called on both endpoints to submit URBs.

See dynamic debug below. Notably, "Setting usb interface" does appear,
but only at the end, when I killed jackd. And it seems suboptimal to
demand that drivers spend time on control requests in such cases.

[146029.539992] xhci_hcd 0000:06:00.0: Stopped on Transfer TRB for slot 1 ep 2
[146029.540031] xhci_hcd 0000:06:00.0: Underrun event on slot 1 ep 1
[146029.542857] usb 6-2: Starting data EP 0x81 (running 0)
[146029.542949] usb 6-2: 12 URBs submitted for EP 0x81
[146029.542958] usb 6-2: 2:2 Start Capture PCM
[146029.542962] usb 6-2: Starting data EP 0x1 (running 0)
[146029.542991] usb 6-2: 2 URBs submitted for EP 0x1
[146029.542996] usb 6-2: 1:3 Start Playback PCM
[146029.543799] usb 6-2: notify_xrun ep 01 from line 579	<-- my patch
[146029.543816] usb 6-2: Stopping data EP 0x81 (running 1)
[146029.543861] usb 6-2: 2:2 Stop Capture PCM
[146029.543863] usb 6-2: Stopping data EP 0x1 (running 1)
[146029.543865] usb 6-2: 1:3 Stop Playback PCM
[146029.543882] xhci_hcd 0000:06:00.0: Stopped on Transfer TRB for slot 1 ep 2
[146029.543886] xhci_hcd 0000:06:00.0: Underrun event on slot 1 ep 1
[146029.545849] usb 6-2: Starting data EP 0x81 (running 0)
[146029.545962] usb 6-2: 12 URBs submitted for EP 0x81
[146029.545969] usb 6-2: 2:2 Start Capture PCM
[146029.545972] usb 6-2: Starting data EP 0x1 (running 0)
[146029.545998] usb 6-2: 2 URBs submitted for EP 0x1
[146029.546001] usb 6-2: 1:3 Start Playback PCM
[146029.546793] usb 6-2: notify_xrun ep 01 from line 579
[146029.546814] usb 6-2: Stopping data EP 0x81 (running 1)
[146029.546876] usb 6-2: 2:2 Stop Capture PCM
[146029.546881] usb 6-2: Stopping data EP 0x1 (running 1)
[146029.546885] usb 6-2: 1:3 Stop Playback PCM
[146029.546903] xhci_hcd 0000:06:00.0: Underrun event on slot 1 ep 1
[146029.546909] xhci_hcd 0000:06:00.0: Stopped on Transfer TRB for slot 1 ep 2
[146029.557837] usb 6-2: Closing EP 0x81 (count 1)
[146029.557845] usb 6-2: Setting usb interface 2:0 for EP 0x81
[146029.558636] usb 6-2: EP 0x81 closed
[146029.558664] usb 6-2: Closing EP 0x1 (count 1)
[146029.558666] usb 6-2: Setting usb interface 1:0 for EP 0x1
[146029.559505] usb 6-2: EP 0x1 closed

0000:06:00.0 is ASM1042, USB 3.0, no CFC. Hence no Missed Service
before the Underrun. OUT URBs seem to complete successfully, but
ALSA apparently doesn't feed playback data until the IN endpoint
starts moving, which is scheduled to happen later, so OUT underruns
again and the whole mess repeats.

On CFC, all OUT URBs complete 1 uframe after submisison with MSE,
so it's pretty much guaranteed to happen before any IN is scheduled.

Up to v7.2, such xrun is only a brief audible glitch. On usb-next
it loops like that for seconds to minutes before recovering by
some lucky miracle (IDK why that happens, but sometimes it panics
and begins unlinking OUT URBs before the last one completes).

Hence the idea to not rock the boat too much and stay with zero
false negatives and only the unavoidable false postives which have
been here in HCD_BH drivers for ages.

The whole thing is madness. It nobody has issues with wasting 4 bytes
per endpoint, I think it could be fixed by counting all pending URBs
from submit to complete. Changes to ehci/xhci-hcd will be minimal. Or
add a flag which overrides this guesswork. But too late for v7.3.

> At least we should add a debug message so audio/video developers can
> find the reason for the glitches:
> 
> if (list_empty(&ep_ring->td_list) &&
>      !hcd_periodic_completion_in_progress(xhci_to_hcd(xhci), urb->ep)) {
> 		if (GET_EP_CTX_STATE(ep_ctx) == EP_STATE_RUNNING)
>  			xhci_dbg(xhci, "Starting new isoc stream on running endpoint at uframe %d, killing sync..
> 		xep->next_uframe = -1;
> }

That seems harmless, although the same information can be obtained by
checking urb->start_frame after submission.

Fun fact, I found only two in-tree drivers which do anything meaningful
with it. Particularly, if snd-usb-audio submits IN and OUT across frame
boundary, it can only recover by xruning and trying again, meh.

Regards,
Michal
