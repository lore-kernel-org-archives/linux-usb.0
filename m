Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FE42F7EF5
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780428965; cv=none; b=iEYxWmzlXSf1BpIh/FLAGzzK0K27NZL3/PPAM+ldQdTXzqA8fxs9awSvujPPNjBTHg6gO1VEDkRYaWPYBH7Jz803swNH4pUJ7xQEIooNo2oR5emHlb8iNgZae+tLNzLaHIoFXeYPkBT8d9L9DK7hpd4R8cobFji4Vpq38mXR/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780428965; c=relaxed/simple;
	bh=VHaZE1Jd8geqVgIiWiWLQgcWOt7ZhcLOIE1fcmDAiGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAcUw+1Ep2PG/YEfXeWyTatzsYxpVwCSVUqcYQ9o3gln05PYDI3goRzTNSB/T0Xa8SMRXpQFWQkFuCql+F+vewWt1iWZrbq33SINUjVW7rzYFW/xmc4ToPGVqYymkVbVUU6N1H6ANkctNmlo6mVkAS8r2IQhXWdDePavfewV1QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j5b2vhTg; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j5b2vhTg"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccef25789fso29419976d6.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 12:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780428963; x=1781033763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hoIRPFtQ13g9TK9uwK6XyK2HuMPpvHIYT9Hx0/jA94=;
        b=j5b2vhTgFyf0U+C5tf/SYLWwkh+VVdBeHO1RoIsJ1GpTcYs8Kw0W6A2WBOW/2mnEPS
         q2goEA+09SXfN4j6Z2q1xx/IdVfxTzU0MO3r+rTIzE/ZvUBKPs+jPabRa2QvsAOJhlWJ
         M0iy6JcPSbrzxJ25Icb0HVsnqQs5B34gH3DqOap4IYL/gDGp5vZoUMNh0UIQSy387CEq
         cEzX+xxxvm0dAEMH6SQ3BKpg4qT/2I/MIo/BSyLO1AbEpjjn7eW9UQc+k7rA44JK9mmj
         LU6kjAuVHEWca3M1JhzBhgKt+mpNohHZiCu4jNogfoFTRXJ9MEDt6JOO4c4vdsv1nF9K
         2DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428963; x=1781033763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hoIRPFtQ13g9TK9uwK6XyK2HuMPpvHIYT9Hx0/jA94=;
        b=KvaA1OiOZ0QaQT2YgA1+zmRimEo/O9KHABVZHE0DT4Assfhb5nXbhARzIxDie5Fi/i
         ILfhFG0Qlh0jqyB6jEg7L+KtO2cmo940wMRHtbrPObvvIcGDX6XdcKHhap73o+tbaokG
         PS9wj6LXORSbqxCHslypZJom6UuCWzNvTmZ55AepzgqXoL3Aoj6tJTIzmww/LhWOFG/i
         7+Sr8F1H+Gb6WS5NCAdM5suLrIu9Jk6WJO3UwMqMWJJV3I7aOeHEhsTHyTVR/rnB7hs8
         eiqvRqJhcaBRZZpJbtif+ppV6YKRaZ5VNemnajLShhs1U2ORem+OODGuKqTaaVc5iQQR
         Hu+w==
X-Gm-Message-State: AOJu0YwuJXJV9LoSNgxLyPc8CRVvi9fusncTElJgfGB4XypaEu1yvZ5r
	KuGGU7vBmohShc1+vyetjTl+dLv+i4mcVYR7ipCrOOEoIh9i5sq1WoONsBmNQbsD5PWNulyP58P
	cO/E=
X-Gm-Gg: Acq92OGqvHS8MWAb8PLhmjs/6XpXPXGLwYyxjKp7kUYK9EoO4oTmXltbwvxkRnf7NDL
	mr21d8O9digwus5j6SZbLlSSp2e4B/dVOgr65XCiYSoiI/WSaFWMBLwDF4zuwwYivIzBZxbLAjl
	fCNLo/moXE86/kDUB5lZkv0r6z4qSlr2N85wDB92MkGAx57JWPTcUjfB7PqkUtR+kBrehE4dbkl
	h4PZNelZ5eXV+nKNh0lTcBaaQOvoAJ99TYNAHf6D4aESqTPeCcU3o9xvtvrKtnXlUnYY48qohzG
	EAcmpWGa6qZEd5yOzaIHRdjxlti6UaY2Kx09q95EM9E7PeDjWMKaSR/Y1CLw6/K6ufXvSxZUQae
	6yFcaaEBdHlIZmMeoLjY1IV0kGRD/h6BbAgX81nBubmomMvMMZP0ntwVd0kDhYwfgYedXyA4XJf
	7HiRZ7wH55+t7jIsvwUBnl7pfPLC01Qokd5Qh2fRJcSLd7ErA6j5B80MDcMn5wieSF
X-Received: by 2002:a05:622a:6106:b0:516:585d:d1c8 with SMTP id d75a77b69052e-51778683516mr6839711cf.33.1780428962694;
        Tue, 02 Jun 2026 12:36:02 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775d8161csm6309861cf.17.2026.06.02.12.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 12:36:01 -0700 (PDT)
Date: Tue, 2 Jun 2026 15:35:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brent Page <brentfpage@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] inflate max_tt_usecs and implement sitd backpointers
Message-ID: <0c2fc88b-eec8-4267-b6df-99c62f4d5229@rowland.harvard.edu>
References: <bfdd7729-be9a-4014-87bc-7b7a5b393980@rowland.harvard.edu>
 <20260602064201.84065-1-brentfpage@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602064201.84065-1-brentfpage@gmail.com>

On Tue, Jun 02, 2026 at 06:42:01AM +0000, Brent Page wrote:
> ---
> This is a version of the patch with new formatting; the content
> otherwise is equivalent to the combination of the two prior patches in
> this thread.  I ran a number of tests of the patch's functionality for
> iso-in transfers from a full-speed peripheral with a single endpoint
> with a wMaxPacketSize of 1023.  The transfers themselves were 1000
> bytes.  I tried bIntervals of both 1 frame as well as 2 frames.
>   Setup 1:
> - configure this "main" peripheral to send (48x 1s followed by 32x 0s)

You mean six 0xff bytes followed by four 0x00 bytes, right?

>   repeated 100 times in each transfer (1000 total data bytes)
>     - "transfer" here means the data that is sent in one frame
>     - the 48x 1s will require substantial bit stuffing, and the 32x 0s
>       will require none; the actual number of bytes will be something
>       like (7/6*48 + 32)/80 * 1000 = 1100 bus bytes
> - on a single USB 2 port going in to the computer, plug in a USB 2
>   one-to-four splitter

The correct term is "four-port hub".  "Splitter" implies something
different (the same signals going in and out of all the ports, which
is not what happens with USB).

> - plug in the main peripheral along with a wireless mouse receiver,
>   wireless keyboard receiver, and a high-speed webcam
> - Result: for both bInterval=1 frame and bInterval=2 frames for the main
>   peripheral, all four connected devices function well
> - notes: the main peripheral has to be plugged in before the wireless
>   mouse and keyboard receivers; otherwise the main peripheral's
>   1023-byte endpoint is rejected

Unfortunate, but very difficult to fix, as I'm sure you're aware.

>   Setup 2:
> - same as Setup 1, except configure the main peripheral to send (72x 1s
>   followed by 8x 0s) repeated 100 times in each transfer
>     - ~(7/6*72 + 8)/80 * 1000 = 1150 bus bytes
> - Result: for both bInterval=1 frame and bInterval=2 frames, the main
>   peripheral's 1023-byte endpoint is accepted by the computer, but all
>   attempts by user space to retrieve urbs (ioctl-REAPURBNDELAY sys
>   calls) yield error code -11, EAGAIN (instructing the caller to try
>   again).

Why is this?  What goes wrong?  That sort of issue should never arise.

> - notes: if the data transfers are instead configured to be (64x 1s
>   followed by 16x 0s) repeated 100 times, then an occasional urb is
>   successfully retrieved.  So, it does seem like the bit-stuffing
>   requirements are an influential factor
>   Setup 3:
> - same data for the main peripheral as in the first bullet of Setup 2 
> - don't use a splitter; plug the main peripheral directly into the
>   computer's USB port
> - Result: for both bInterval=1 frame and bInterval=2 frames, the main
>   peripheral's usb connection is robust

Why does this case behave differently?  Does the computer have an OHCI
or UHCI host controller in addition to EHCI?

> Test summary: the patch works for iso-in transfers that are
> - 1150 bus bytes in a frame if the associated peripheral is plugged
>   directly into a USB port
> - 1100 bus bytes in a frame alongside transfers from two full-speed
>   interrupt devices and a high-speed webcam, with all devices plugged
>   into the same USB port via a splitter
> 
> Weak point: The patch doubles the number of sitds that are allocated for
> any given urb.  This is true regardless of whether the urb's transfers
> require frame-hopping CSPLITS.  I figured that the memory in these
> structs was negligible, but I actually get ENOMEM from line ~1400 of
> drivers/usb/core/devio.c in kernel version 3.18.120 when I tried to submit
> 4x urbs with 33 transfers each (requiring 4*33*2=264 sitds for this
> patch's code) on my 2017 Android tablet.  Things work if I only submit
> 100 iso transfers instead.  Also, submitting 120 transfers doesn't cause
> any issues on my 2022 Android smartphone.  Maybe the extra sitd
> allocation should be done on-demand instead of by default?  So, start
> off by allocating an sitd for each transfer, and only add an extra sitd
> if a transfer has frame-hopping CSPLITS?

Yes, that is the approach the driver uses everywhere else.  Not to 
mention that it's foolish to allocate twice as many sitd's as the URB 
will actually use.

Alan Stern
