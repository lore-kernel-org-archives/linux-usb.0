Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75FA3EFFDB
	for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 22:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787006841; cv=none; b=DrIY2kBNExI/jwI1KOxQakXJV0TyumlvsFqfWSWlbYGnfn3yspucKaHNFm3irdKcnhjbkrYqfVf53DGIhqaygjyLj6IfaAzlo1vDrDP0YrY1lVRmytrWplpYDw2OBLXBnsan6cgYxVB+apbr+TugyrhDs56mOFgcrd/Wz/kfU3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787006841; c=relaxed/simple;
	bh=EP+yxTPOIz1QSumlTe0xp87OTwo2p72cmKAtXEgHQTk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GTPROckE7FPcwrvwEgmJBGWevat9H57zD8zXUye/6NIF9jOJws/BPSRZKphMFQ7pa2Rw7Y24IsBiqI0v1EiPSEMywa3JQQQeaVDPI2P79/I36wEMyD6zFrxfma9NEjJkmzsMIN/uPkI/8UV+2IdqflpnEA7hVB6T9mS4A0dhlfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTuQpPSH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTuQpPSH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4994c49f588so4349875e9.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Aug 2026 15:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787006838; x=1787611638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0z7Xo0UuPTvX3yBrI8N3pHDEyeicsgIOG0vrqeVPkY=;
        b=aTuQpPSHrWSf5NiHa2L0Y06jPwPhj3il8qnckCBGNV3MsJ7AbHlElTYcVPu5+mx4+F
         D3+/dmh5pQhn0WN+GfbtLLo0eCiWOIiCrseH4E03+WEKVw1xKNdV7Bot3L7hnSFlzFfC
         j0VHmRVeYF3ujMBeKvQsY9LciKCBRusYKmMhelu4WUO1HdKb/7OONW/f56NLIoEJaq/N
         bF5Plx2CZf6lVS1CZs9eNXb+n4bsr6l875qxxr3QV+s6Nx9RMorOe6I+0RZZZ6sbyeof
         nzdma/aW2Fdv8KDhF5tHuJH5lkdjdvbCm3J54hC/4Ug8171t7YG1cCp7depZUImrG3x8
         OSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787006838; x=1787611638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0z7Xo0UuPTvX3yBrI8N3pHDEyeicsgIOG0vrqeVPkY=;
        b=dftQEJKall3tcbFuEEGBzq0xxRFVurHf90RMAxpFOPj/8ZmPRe/ZEdpcwqTOc2y9RC
         nM90HYNRhg7+TD3VwFCT68mTjh2j5HUcq3oGdfAcHOCTn4SP0KbaE86DQIP0J5il7wf4
         YOJoZebXMySt299qIniaKoEb9IueYvAaIpRKdLyuWAH4dkX9T7Vr4/8fmeHb2bzk6DFI
         qFz6rEojilwktGtr54IGQyg6Od8daCDqSIqP03Kh0fOrCWrqo7DCtiItw/5Oy1S2zKx7
         bbzfjW1lLvpUCKw2l1uVgtqa2cNCMnpZQHZABPo6ycfX5R3wul3wasM86KOMJpVQi/pX
         /UjQ==
X-Gm-Message-State: AOJu0YzNicCBS/MgRym+Ayf7rJd+beS8QxfpgUJfgWw+3g9IBtMW9f92
	1PdYH8p7I+pV7fonVioegb2KWBI8jq0bGNfqJ6L4r+T71pMXJ7JXdpoA1fFDtg==
X-Gm-Gg: AR+sD11r7KNDkWLKRoAF6H2TGVBa4k23PopV8RKn19fEClsV7DWOUC7PzqBKn7Fcn/m
	LyuhzWNsjspc0RkM0RXEOrDqoTGz1sCiLRrXgHgZoDMOCGtAqWq5UBf4umgaN3gCkaKxJ3R669B
	zmFYHyd3592jvKbove7IF33D+VPiZ8Vvs0hrTdRcXDZPbdAagyC8d4VPEvDISfKvHUexQWgM4kF
	yM9+z93GwHG2iq6OwmGbo5c7203hXFofXJgNsRHZ5TQEJMn9Qow/w905oFPmjZrBtikFExlVUfo
	HaGQ9qL601ZT7adr+2L6MVUz0/tMRl8KsUSAU3NbJTbCPumZBdyuqlSuGn4cJ6nYA7LyKmO4UxF
	XEuVcSBlCynrtxbsvWgxslZIvN6tyhQT18zo7x1H1i4wVWgVWY23f7Pmt+m7XHdw3vK8GUSXWJQ
	kdB+xwdVEg8V3VkhXaiNRLvON5GC2H6HSrofg5WzHp6WFccWm8GaklFasA7kxyTBKxsDE=
X-Received: by 2002:a05:600c:c04b:10b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499a1f81c6bmr10691025e9.0.1787006837697;
        Mon, 17 Aug 2026 15:47:17 -0700 (PDT)
Received: from foxbook (bfg7.neoplus.adsl.tpnet.pl. [83.28.44.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499906aaf1dsm187789915e9.4.2026.08.17.15.47.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 17 Aug 2026 15:47:17 -0700 (PDT)
Date: Tue, 18 Aug 2026 00:48:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Arthur Gautier <baloo@superbaloo.net>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v2] xhci: fix lost bounce buffers on TDs spanning
 several ring segments
Message-ID: <20260818004828.1d6e1c76.michal.pecio@gmail.com>
In-Reply-To: <20260812002554.1166712-1-baloo@superbaloo.net>
References: <20260812002554.1166712-1-baloo@superbaloo.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Aug 2026 00:25:54 +0000, Arthur Gautier wrote:
> When a TD reaches a link TRB with data that is not aligned to the
> endpoint's wMaxPacketSize, xhci_align_td() stages the unalignable tail
> through the bounce buffer of the ring segment holding that link TRB.
> xhci_unmap_td_bounce_buffer() later unmaps it and, for IN transfers,
> copies the data back into the URB's buffer.
> 
> The enqueue path records the segment that was bounced in td->bounce_seg,
> under the assumption that a TD never spans more than two ring segments.
> That assumption does not hold: a TD large enough to span three or more
> segments crosses several link TRBs and can be bounced at each of them.
> Only the last one survives in td->bounce_seg, so every earlier bounce
> buffer is neither copied back nor DMA unmapped.
> 
> The URB still completes with actual_length equal to the requested length
> and no error, so the transfer looks successful while a wMaxPacketSize
> sized hole in the destination buffer silently keeps its previous
> contents. It also leaks a DMA mapping per dropped bounce.
> 
> Any sufficiently large and fragmented bulk transfer can hit this. It was
> found with a USB mass storage device behind xHCI backing a dm-verity
> target with 512 byte hash blocks, where the stale data is detected rather
> than silently consumed. The device enumerates as SuperSpeed, so
> wMaxPacketSize is 1024, while dm-bufio issues one 512 byte bio per hash
> block. verity_prefetch_io() makes the block layer merge hundreds of them
> into a single request of up to 512 scatterlist entries of 512 bytes each.
> At 256 TRBs per ring segment such a TD spans three segments, and every
> segment boundary falls on an odd multiple of 512, i.e. unaligned to
> wMaxPacketSize. dm-bufio then caches a hash block holding stale data and
> dm-verity declares the metadata block corrupted:
> 
>   device-mapper: verity: 8:2: metadata block 10850 is corrupted
> 
> A reproducer running this under qemu is available at
> https://github.com/baloo/xhci-verity
> 
> The bounce state (bounce_buf, bounce_dma, bounce_len, bounce_offs)
> already lives on the ring segment, so there is nothing extra to track.
> Keep recording the last bounced segment in td->bounce_seg and, on
> completion, walk the segments from td->start_seg up to it, unmapping
> every segment that still has a pending bounce.
> 
> Stopping at td->bounce_seg rather than td->end_seg matters: a bounce
> implies the TD continues past that segment's link TRB, so bounce_seg is
> always strictly before end_seg, and a later TD may already have started
> in end_seg and been bounced there. Walking that far would copy a foreign
> bounce buffer into this URB and unmap it twice. It also keeps the walk
> correct if a TD ever wraps the whole ring so that end_seg == start_seg.
> 
> Changes since v1:
> - Walk td->start_seg -> td->bounce_seg instead of td->bounce_seg ->
>   td->end_seg. end_seg can hold the start of a later TD which may
>   already have been bounced there, so the v1 walk could copy a
>   foreign bounce buffer into this URB and unmap it twice.
>   (caught by Mathias and Michal)
> - Keep recording the last bounced segment. Also handles a TD
>   wrapping the whole ring.  (suggested by Michal)
> - Test !td->bounce_seg first, it is the common case. (Michal)
> 
> v1: https://patchwork.kernel.org/project/linux-usb/patch/20260811033508.1050148-1-baloo@superbaloo.net/

This should go below the --- line.
Patch revision log is *not* meant to go into the kernel changelog

> Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> Signed-off-by: Arthur Gautier <baloo@superbaloo.net>

This should still have the Cc: stable line, just no need to actually
send email there. OTOH, this email should be addressed to Mathias Nyman
and Greg KH, not only linux-usb (but don't list them here).

I admit that I send patches manually like a caveman, so I don't know
how to configure git send-email to get it right...

That being said, I downloaded and applied this patch and it does seem
to work. The bug is easy to repro by setting TRB_MAX_BUFF_SIZE to 512.
Before the patch, reading a 1GB partition gives different md5sum each
time. With the patch, multiple readings are correct.

And I think we can agree that the risk of unmapping a later TD's bounce
buffer no longer exists with the revised loop. I know I said the same
about v1, but I think this time it should be good for real.

> +	for (seg = td->start_seg; ; seg = seg->next) {
> +		if (seg->bounce_len)
> +			xhci_unmap_one_bounce_buffer(xhci, ring, td, seg);
> +		if (seg == td->bounce_seg)
> +			break;
> +	}

You have removed protection from infinite looping. I think nowadays the
driver has more loops without such protection and everytihng is fine,
but I'm not sure how it was in the past, and this patch goes to stable.

Maybe let's see what Mathias thinks about it.

> @@ -3674,7 +3689,7 @@ int xhci_queue_bulk_tx(struct xhci_hcd *xhci, gfp_t mem_flags,
>  						  &trb_buff_len,
>  						  ring->enq_seg)) {
>  					send_addr = ring->enq_seg->bounce_dma;
> -					/* assuming TD won't span 2 segs */
> +					/* a TD may be bounced in every seg it spans */
>  					td->bounce_seg = ring->enq_seg;

This comment looks a bit odd: you know that this may execute multiple
times, but you overwrite all previous pointers. Perhaps make it clear
that this was intentional:

		/* remember the last segment bounced in this TD */

Regards,
Michal
