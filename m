Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375DB3DB339
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 06:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791612980; cv=none; b=YksEU6ZS1mjHtZeSC/xZEdLBvLVvnee5oKWet0uiQGa9I6R05ts6PlWVJ+zrAorVVNJMSciGKSl2RI7h8BXw9Q0uxAV+xg8j72dqbBTtGqgSNOLy451bhfWnF/MeWG24HbDuHB799c9iTYQU+DiMgRafE7laI3Bx0PguEaXqPts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791612980; c=relaxed/simple;
	bh=sAHBXblxtfvymj/r9WkO2Egl5vhjNGPwFcUu/Cwy5wY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJ5czwc5Oi+duqQQVtI4UmeVo5ocdD4DCeLYWzOg/v0/jqLUDvJ98+1h3DZrd7auPuo454IVUnNwcLXff7SRNStfsp95bfJv63fAtdR7d+kZ8Bp2+y9yxU3egAs9JIiMVIb3Lh4TSLeksv0L/07REhrRlDknre7l40Qa+sx5128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqZavRTC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqZavRTC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a171b677d2so2933105e9.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 23:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791612977; x=1792217777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Ai7DttukfcLAD0XsmKyzCj4bzA5dXPXWlklqadis4Y=;
        b=YqZavRTC8q6JM0zNcnvpONfW2ie/nIYptMZI9zEjjaqwEO7UsphQiwIqps2R9E1H2Z
         ZTmzWxg9x9BcZbYJF15jQUCAzVpPukU6Cp5Ny+zPvw6zVCsR2i01gn+a0hDm1cqhDgh9
         kMBuZaBTJ7b1dxVBYuWN808sSBN4X6Dz45DrKqN35U3YXWgNSD7kStZcLTDsLjIJS7Y1
         PepzC6EVCUA2UUCub5BrlvfyprFVEQ/BgSDtsLKzsj484h+ebusa2n1z76igm5xB4Ve7
         ivFBMhoQpglspoJe42s5YX+viL/V/Wzggdozmp/aWdUFci4BlGYO2ykVBTEhL1zjMxxG
         xkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791612977; x=1792217777;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ai7DttukfcLAD0XsmKyzCj4bzA5dXPXWlklqadis4Y=;
        b=W2E3rEHeqFuHcreYnZTFRq4O419TO/y1AThMQenobwwejhxh9TDfhWEd6LGMuvmbW5
         28y7RwNWDJ2icasBAx8+ZJS0UNHtbiuKTzfz/OluG2fBFT2Jd5Zb4IQqgYJ7RNR39SnT
         NUZeUsbDih/ZsM4xy7iei6UQ2wqsymfP7rZEsm09XgtRXqs29peszRLTYUtPhln6Nkz+
         e3d2XWdDORwf9L6WCcVdom0sT3mMpSxEwvNQZMiizV6rLq3F3UbigFGRESBr8w6Wor5y
         EbiB2VxTx6nchRo1J8CQGo0znn39jsaXrtPxAajtFMcjECoqVnux4xgu1AqTwONFQZDZ
         ZEOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhYTpiOxfONFAGMhxQPS0OlfPQL0LVnd0UWYvBBnKdNwttcUmEqX8urlsktv62ogw9xgK0jHpSfFw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKopLojO+MgB9nxvv8pCNmCwYXoWIElU8ohI4qOAqnyeiNLbHmh
	bq0UrFU8tBhBid+Z4/Wi8sO7i53dtFp9nMb16IaxIwP7h2QLLUxOfdN1FG6dRtUU
X-Gm-Gg: AYBFou0DcUtDpiwxoZUT2jO7N9tey2pfJFPxNzzGijUCjsJ6wYmWbDmn+eaM/4Es1w/
	ktvVykOjkXw4S8gkk9YUrp6GUYtrJJhONPKFI07d6C6iZbdQ/AKpnvqr0ua06AF1bmFHOerX8km
	ELURUgNqAi2RPLwxUcyPk5cJQZ92/e5KpHT8sxQt4UIKV47HISU+QxjA5pbwFCrwj9Xk7juL9C7
	/oJoH6U1V9REwKHmg/5WA7T/Bby2ct36sGqGgFc7dtg1fHJKEQejR7nMyIyWNd7tcMtknmnCwRy
	+gb+UeAhm8xkzqsLejXlrCTTYYTyoEq1iJf5ldwVH9MCROWPppNghojsAe8Jf3Dau1ZaQFnGRo7
	jyXCx0zOJku6RsMmn+nhhAK5aP66qyIsC+uGllOiVwQQHZc5xdt+gqdQ0GdQcL12VHq1PNFlQXJ
	hxusUX7g864N43dzT1SJjAA937jsCwpTk2LUO5a8im3ohNRqeeFr3laryLv0v8jMNgL1+PDIopK
	D4OYWA40w==
X-Received: by 2002:a05:600c:3510:b0:4a1:7703:e549 with SMTP id 5b1f17b1804b1-4a18e4c3fe4mr87840465e9.26.1791612977178;
        Fri, 09 Oct 2026 23:16:17 -0700 (PDT)
Received: from foxbook (bez186.neoplus.adsl.tpnet.pl. [83.28.37.186])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf214a1sm122983085e9.7.2026.10.09.23.16.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 09 Oct 2026 23:16:15 -0700 (PDT)
Date: Sat, 10 Oct 2026 08:16:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Mathias Nyman"
 <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 09/11] usb: xhci: Rework and improve the TD matching
 and skipping logic
Message-ID: <20261010081610.7e5b47e6.michal.pecio@gmail.com>
In-Reply-To: <sashiko-outbox-165778@kernel.org>
References: <20261009151624.618967-1-mathias.nyman@linux.intel.com>
	<20261009151624.618967-10-mathias.nyman@linux.intel.com>
	<sashiko-outbox-165778@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 15:34:20 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] usb: xhci: handle_tx_event() halts >1.0 hosts on bogus MSE pointers
> --
> 
> commit cc3554d902e447131e844c7826abc9b1b4f75f82
> Author: Michal Pecio <michal.pecio@gmail.com>
> 
>     usb: xhci: Rework and improve the TD matching and skipping logic
>     
>     Matching events with TDs and giving back missed TDs is carried out
>     by a complicated loop. Replace it with a simpler linear logic:
>     
>     0. Having verified that 'td_list' isn't empty,
>     1. Scan it to find the matching TD and count missed TDs,
>     2. Perform necessary adjustments for corner cases,
>     3. Give back missed TDs, if applicable, using a short and tidy loop,
>     4. Check if the event refers to the expected TD and proceed as usual.
> 
> > diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> > index 7597ef8105c65..243b1fd2b2f68 100644
> > --- a/drivers/usb/host/xhci-ring.c
> > +++ b/drivers/usb/host/xhci-ring.c  
> [ ... ]
> > @@ -2858,66 +2861,50 @@ static int handle_tx_event(struct xhci_hcd *xhci,  
> [ ... ]
> > +	td = find_td_by_dma(ep_ring, &missed_tds, ep_trb_dma);
> >  
> > -			xhci_dbg(xhci,
> > -				 "Found td. Clear skip flag for slot %u ep %u.\n",
> > -				 slot_id, ep_index);
> > +	if (ep->skip) {
> > +		if (!td) {
> > +			/*
> > +			 * xHCI 1.0 allowed MSE events to have zero TRB pointers. Some old chips
> > +			 * also generate bogus non-zero pointers. We know, don't bother warning.
> > +			 * Missed TDs will be given back by the next event with a valid pointer.
> > +			 */
> > +			if (trb_comp_code == COMP_MISSED_SERVICE_ERROR &&
> > +			    xhci->hci_version <= 0x100)
> > +				return 0;  
> 
> [Severity: High]
> Does this code inadvertently halt hosts > 1.0 on bogus MSE pointers?
>
> By restricting the leniency for bogus Missed Service Error (MSE)
> pointers strictly to xHCI 1.0, controllers > 1.0 that generate a
> bogus pointer for MSE will fall through and hit the "HC is busted"
> block below.

Nothing actually gets halted, only warnings are logged, as for any
out-of-spec event that isn't known and dealt with. Specifically, MSE
are being logged since 2025, as we began to process them more.

One HW bug has been reported since then, in old Intel chipsets, not
sure how many PCI IDs are affected. Hence no warnings on xHCI 1.0.
Otherwise, I prefer to keep logging anomalies because it helps with
discovering SW bugs and properly attributing HW bugs to xHCI layer.

Regards,
Michal
