Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214F83DDAF6
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958238; cv=none; b=W5raFrvIjbeblxFmyHglZCoWhYqv47L9dr3H2z4ff+zJU90hwd6T+iPAJc6QS7VGhwO0YDWUf5oS42WPFvWKj9QjjR8tUDXT/PNShxBM3g20SNocKPe9O7wH6pZZcYUQE92ZRf/bhMTEXHHvAVxzyJGNKCgP6E/mXIXTPOxAzFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958238; c=relaxed/simple;
	bh=qP90LjnYjcbNXwsq4bpo4wHG6D5gXo9q1JSBlGYF7DM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=esfIQtHIXgXfSvpf6RshlmB8bbme+PE/+el6Zx9Yk7S/AeaU0gT6dIvJBBNzDNxMTyTQduKLT2NvdriO2FeZjO8OB2ikyOglUvG+sOrWyZQhDID347N6DEikYo+g3dLtrvlOD550KaYUR2yre7xZSVgnUCLwec0fdViKBNmH7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHr74DtN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHr74DtN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954d29264cso7340365e9.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 12:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785958232; x=1786563032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8uNFjnERC71GdQRR4FsLrL8NCbN0y3m9FkUu6/3RoGQ=;
        b=KHr74DtNoMLIVeDj7/j+vwrt5TVcDruLP6RVaRAGWm/rIPkGv4YeW6LHb4xYNgujD3
         Apjnksy98NnLWT34e81BOUrj0jI3FUlDsIblsV/7uZlQqGAFOOw6IJZffxFz7Tf4LPWI
         vXnCAW9U1AZSBTFhHriOrojExYybpVHjqr8Zd0xDjuTvpP0cDcRupLeEJKvKWQyR4zBU
         JMcqt5+fMhyFM7g7xHir9F1LWH4MAT0qOU0RB4m06l/HneBm/IgUw8nonHO9geWISjn5
         48f4P7X7bRnIUIZrb11N/NJEMzUsLYswAfSBRpmQx8CAM0slekcGzzfz1+Iooqsfz9K6
         bzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785958232; x=1786563032;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8uNFjnERC71GdQRR4FsLrL8NCbN0y3m9FkUu6/3RoGQ=;
        b=ppg0jZRaUTCmkeHNIfueVQ7Gxj0wk41S9+uA9AJL1G/ZNaG/OvfVi8DwRdkjLWNM5b
         ev2ESAnubXF5lnSPfPAf5LPxuzEJ4Gr0DsULcdQOMm2Uc6w92zNpazODoN3ZrQUglbyV
         K6xrumZxy3Guy9lGhMuCkjdJrQe0mQFlrC69U+ndeARS383GB8XvFxdav7R3ILwDfTc/
         OIHEEulS/1c9gT6wIb9JsKto5HJwjWBEXdWX9IeKv9OSAmhCFbokKMN+GquVG/Qasrys
         sVlJIrgf/ABCi4pNTBWjsV196uPJQmvVFHrBe/Q/g0oWk4bIrEGh8L4eSyp5m+Ye30wo
         4YaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0nn/rUSEvpyFIQxFNi2WZzSIYTHYVUS0CHfL3Df46LO3XV7V0MwV1O/RGTAhDoHB1b50H9+qhejg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOq8B4SBSSvkCgqS1oVp0Ho+zs6FpmKljoGIz3AC5kW73zu+3w
	xhH/TRY9RBKGwe+XtjVfnfHcVexgoEppeVFLx1lA8jBDev5X4aWqfo7u
X-Gm-Gg: AR+sD11PAXP6I8fKDFRo23WahkSuhfZULGotktbalUvngkWgQ0Z+tnIANjPwimB3Dm3
	xRqaYWlxWjxVEYiKrefdPVBbO8onmkaUl/mR2fjJYTvHfImMP3J2Jw98oT08+Ywd80eY64UxgZr
	PA4rnbPOA5nBRe9MdOmaTpH+sz38RyfROm55Hd5QvFOk6eh+osn02zfHxDi3DNgtnOz/0pHoK5+
	OfviL1zQCpi4llxODfyrxzqrnecT+Gtp50j4FxfVBDuDB4O9DMSCpAYkrFfX6BF3qj7Xwf5n6f7
	IzE/FTqqbmEbu8FxlAPVrCXdA9U/oR3oiDIujMtmo0UjVmaKTTnzLYjnR+qcQYKGMz5VozzIGdG
	4OWQxGoCqSpMw3O1GpsjV8R82X03xPdqT0oSiyLy4JtfAzloCN5Jboc8huqvbGk5J8tENwVO7gS
	GNw7Ms5q6/IMeyaV00+ygNSjlunLiNQbsyY+Nr6j3YRA5RZW+9ILaUTUjNbii5qnBVxuRiCwO5
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr112714995e9.4.1785958232336;
        Wed, 05 Aug 2026 12:30:32 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499541b525dsm4411445e9.0.2026.08.05.12.30.31
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Aug 2026 12:30:32 -0700 (PDT)
Date: Wed, 5 Aug 2026 21:30:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Bart Nagel <bart@tremby.net>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] usb: xhci: Rework and improve the TD matching and
 skipping logic
Message-ID: <20260805213028.78a73f18.michal.pecio@gmail.com>
In-Reply-To: <d017215b-3e91-4786-9c41-f5685e5c19e0@linux.intel.com>
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
	<20260804120537.5c30554e.michal.pecio@gmail.com>
	<d017215b-3e91-4786-9c41-f5685e5c19e0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 5 Aug 2026 20:39:12 +0300, Mathias Nyman wrote:
> On 8/4/26 13:05, Michal Pecio wrote:
> > Matching events with TDs and giving back missed TDs is carried out
> > by a complicated loop. Replace it with a simpler linear logic:
> > 
> > 0. Having verified that 'td_list' isn't empty,
> > 1. Scan it to find the matching TD and count missed TDs,
> > 2. Perform necessary adjustments for corner cases,
> > 3. Give back missed TDs, if applicable, using a short and tidy loop,
> > 4. Check if the event refers to the expected TD and proceed as usual.
> > 
> > Besides cleaning up the code, this provides a few improvements:
> > - when the skip flag is set, no TD is given back unless we found a match
> >    or otherwise know how many TDs should be given back
> > - when the skip flag is clear, we know if the event refers to a "future"
> >    TD so we can log this in the Scary Error Message to aid debugging.
> > 
> > While altering the error message, drop a pointless goto.
> > 
> > Signed-off-by: Michal Pecio <michal.pecio@gmail.com>  
> 
> How about modifying step 1 a bit and store the last passed td instead
> of count missed tds?

End result would be about the same, but I think counting results in
the simplest possible giveback loop. And I can easily log the number
of dropped TDs, which is something I was sometimes curious to know.

> If the event points to a valid trb ahead of last trb in td, but
> before the enqueue pointer, then we know hardware has passed this td
> and we can give it back.

I mentioned possibility of such change in the cover letter, but kept
it out of this patch, because it's something that has never been done
before and, like "Expedite skipping missed TDs on modern hosts", it
could bring unwanted side effects on less than perfect HW.

For the record, I know that ASMedia can sporadically generate Stopped
events with semi-random, bogus TRB pointers, at least with streams:

[ 4541.443642] xhci_hcd 0000:02:00.0: Transfer event 26 for unknown stream ring slot 5 ep 6

But not sure if with streams only. Without streams, the driver has no
trouble finding the transfer ring and silently ignores bogus Stopped
events. If they (hypothetically) accidentally match some TD, the only
result is updating urb->actual_length (which may even get fixed later
if the TD receives a proper event).

> This should work even if event trb points to a link trb or no-op trb.

Counting could do it too. I consider the two above issues separate.

> It should also cover the "td->error_mid_td && !trb_in_td(td, ep_trb_dma))" case

Now, that's a third separate issue :)

I had this idea that isoc error could immediately give back the TD
to minimize latency, and only keep around enough metadata (basically
td->end_trb) to recognize future events and confidently ignore them.
I even sent a patch, but it was dropped due to last minute conflicts.

> something like:
> 
> static struct xhci_td *find_td_by_dma(struct xhci_ring *ring, struct xhci_td **passed_td, dma_addr_t dma)
> {
> 	struct xhci_td *td;
> 
> 	if (!dma)
> 		return NULL;
> 
> 	list_for_each_entry(td, &ring->td_list, td_list) {
> 		if (trb_in_td(td, dma))
> 			return td;
> 		/* event points to a valid trb passed this td */
> 		else if (dma_in_range(dma, td->end_seg, td->end_trb,
> 				      ring->enq_seg, ring->enqueue))
> 			*passed_td = td;

This could equally well be (*missed_tds)++.

> 	}
> 
> 	return NULL;
> }
> 
> static int handle_tx_event(struct xhci_hcd *xhci,
> 			   struct xhci_interrupter *ir,
> 			   struct xhci_transfer_event *event)
> {
> 	...
> 	struct xhci_td *passed_td = NULL;
> 
> 	...
> 	td = find_td_by_dma(ep_ring, &passed_td, ep_trb_dma);
> 
> 	if (passed_td) {

This seems to be a fourth independent change - getting rid of ep->skip.
Not sure if worthwile, the cost of managing ep->skip state is just a
few LOC, and it provides some degree of sanity checking.

It would be sad if an avoidable SW bug went unnoticed until it causes
a "user impact", because the driver silently ignored obvious problems.
Tolerating bugs that don't exist seems to invite people to create them.

> 		struct xhci_td *tmp_td;
> 		list_for_each_entry_safe(td, tmp_td, &ep_ring->td_list, td_list)
> 		{
> 			xhci_dequeue_td(xhci, td, ep_ring, td->status);

On isoc, you can replace td->status with 0, it will be ignored.

Non-isoc - is dropping TDs like that a can of worms worth opening?
Also, this td->status would be assigned to urb->status, so it
could become zero, EINPROGRESS, or whatever the initial value is.

> 			if (td == passed_td)
> 				break;
> 		}
> 	}
> 
> -Mathias
