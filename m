Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9CD360745
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410610; cv=none; b=EQ8MDe9UT0RvJ4LXWm4i3mkPY9fVF+pNEWI0/tmjPiy22Bn+MJWvePLsOOoUE8J6H7MPjOME4QF26SD+2TbZwRxIr+LG7GfSCRexIFd8kf1baU/zJZue7lPVdNyv1jc1ClVhhdmNT1lSNcpWfSh4Xfx+pTbwG7rdmJF87FBbSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410610; c=relaxed/simple;
	bh=6Cl/HUdwjBu7h+DF9NMHuCalt7QXfzGmzPgeIn7To6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdeB5L9O4uFxxsRgYm9r1rMCHmjvvI2K7pcjYwoNLWEMIKdfmzugYOTHBWJhO4jMAMg2BPMitazpVCtylpOlkcguPvP141TLG7FpispWDoDyKmaE2CvquiYWTTib3iyODJb7AGWmcq4SA4Mf9BRcRBANmn4awGYkXZrhAzwSzu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E7T2pZui; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E7T2pZui"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf18ef922so46767666d6.3
        for <linux-usb@vger.kernel.org>; Tue, 02 Jun 2026 07:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780410608; x=1781015408; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LHe8y8YQdchVIYSL7xdgz4Vu/wRZj0mJWgDbRik2L/Q=;
        b=E7T2pZuidHpmH/VFUtoulmVOMBsMfsisDLakjzaP4CXKAXYWvAT+Da3KZ66aK9jGHx
         wzyppECVgdhRiG+ZJUME/q9skFx2va+WuhEm+hHiYVW8OleAx1VFk/ZS7XPBQEZ59/jH
         1XQmH4JkWOAgfddDfIfJwSqvaMlszeV+weerd5h1419B7bBIROHkmEHIMhNr1hMSFyRj
         82dDtz3zGHHJ13GHnTUhHapXKODsy1zTUAGCuftES3k49xRFd0PTKfORpNzruzXbi1fQ
         fH7/67+A/92bVxN2XeLXnbP12fb+dy2y7u+7gXBJDKc0Grn6U8VECuEC/qx0xF6vadkU
         lKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410608; x=1781015408;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LHe8y8YQdchVIYSL7xdgz4Vu/wRZj0mJWgDbRik2L/Q=;
        b=A/ACzn3EE9bkIbFhdYXlPfWHMELdsqq2vn1v6yYqaDjHU9emsYMt4C6GoEdA9PXWIW
         0tqxzJp3QJelYeiKQ8auU7lFqmkxVqZL5/8wwAxEHUzJSnStrEhiddX2Y6IVy5BoxuBa
         LgEoysLj4QBSzF42mM9LPSTYNGQemuGUASaodYT9YmRkK/8yt4Tzlp+LM1my2ZmAmtPf
         nUezrHLJPlKzH37hxTl4Oiu72e6SZMWolxKObERxllf9eYG3H/DYeY9H5wgTZiu3xVQp
         X31fUWDFTmzE5OdwZzKKOaddTsYyMIchWP6BNOs43T7QsxBXXvRyYK93BnhEOcmUNxby
         3kUg==
X-Forwarded-Encrypted: i=1; AFNElJ/c75UAGak/hkesS9P3VYBlPoXh0/Ug1gtr5F6iulhB1B0PkrLqP+zIcgtiZsy6cYD1RCkXUWkmwFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMg1c96z55U6ZMFvJxGqMc/MLWT/GojG0/70QUvtzBi5QIl+4x
	0NLekHVyRxXXb+BfqNSvcy+/0XmMD4/33NDUhURILKDw+KpdgRKsC5d2hehb+ASPEg==
X-Gm-Gg: Acq92OGk4ItYrV8JiUw1kcwxoIYX+M+Y2DmvJFLgXAjIDdIJWqSSOlqo/FOwG5hE3Pa
	T4dIyNXU0YV1WMziIkwhVTEgAtOLyxPkW+bNulcS7tgrXpZ/iOvQZPrU1KM7LzodhDqH6LGReof
	g06nOAnY4Gg1lIlZl+RpWxDMlugCyO4XYh5Kmn4aCoiuhF8iLOOKpk4aEQp0EmRon55+gS168p8
	+l09J9skSxLceWKwga8IlgD8NgsrWzP3eVqmbAmdFs2xbUZsnSf+uvbfqr3ZXDaZrk0kO4Rs5uj
	Uq+STsPtlFJlOsSNmuuLBvrToNo3R4sAr/25y7bqmJjF++Ob+E+FlBPkzBUrecuIxTjW5yZx1Mh
	Z8whPKIEmWuahYTle/H0JqZQ7SrZvWZn8ssBO8swsDKsbu04wVEKZPEw4zdWwwrPlAHy2lwl1j4
	pu80bOCucgmAPtGrLj5ryMI7ZDa2M9Spoi27gwg2+U9/pHsG5h5tExfg==
X-Received: by 2002:a05:6214:5343:b0:8c9:cb98:5fb1 with SMTP id 6a1803df08f44-8ccefd4ce75mr252266376d6.12.1780410607839;
        Tue, 02 Jun 2026 07:30:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea23e115sm120741666d6.42.2026.06.02.07.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:30:07 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:30:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "Jimmy Hu (xWF)" <hhhuuu@xwf.google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: Fix NULL pointer dereference in
 gadget_match_driver
Message-ID: <d0042def-a513-479f-9742-12942346cd5a@rowland.harvard.edu>
References: <20260526070635.839701-1-hhhuuu@google.com>
 <1f7a7bf2-4d21-4944-9da0-36082d052b25@rowland.harvard.edu>
 <CAJh=zjLLrY-NpV-ZcmH0V6q8CjNuKt7CmW-GEFQ8_y3zm9v1yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJh=zjLLrY-NpV-ZcmH0V6q8CjNuKt7CmW-GEFQ8_y3zm9v1yw@mail.gmail.com>

On Tue, Jun 02, 2026 at 01:34:07PM +0800, Jimmy Hu (xWF) wrote:
> On Wed, May 27, 2026 at 2:00 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Tue, May 26, 2026 at 03:06:35PM +0800, Jimmy Hu wrote:
> > > A NULL pointer dereference occurs in gadget_match_driver() because a
> > > race condition exists between the DRD mode-switch work and the
> > > configfs UDC write path:
> > >
> > > 1. The DRD mode-switch work invokes __dwc3_set_mode(), which calls
> > >    dwc3_gadget_exit() and subsequently frees the UDC device name via
> > >    device_unregister(&udc->dev).
> > > 2. The configfs UDC write path invokes gadget_dev_desc_UDC_store(),
> > >    which calls usb_gadget_register_driver() and subsequently
> > >    compares the UDC device name via gadget_match_driver().
> > >
> > > If gadget_match_driver() runs concurrently during UDC unregistration, it
> > > may access the freed UDC device name. Once the freed memory is zeroed,
> > > dev_name(&udc->dev) returns NULL, causing a panic in strcmp().
> >
> > I don't see how this can happen.  gadget_match_driver() runs during
> > probing of a gadget, which takes place only while the gadget is
> > registered in the device core.  But usb_del_gadget() calls
> > device_del(&gadget->dev) before it calls device_unregister(&udc->dev).
> > This means that at any time when gadget_match_driver() can run, the UDC
> > device name must still be allocated.
> >
> > You should run more tests.  Add debugging printk() calls just before and
> > just after the device_del(&gadget->dev) and device_unregister(&udc->dev)
> > lines, and inside gadget_match_driver(), so the tests will show
> > unambiguously when these things happen with respect to each other.
> >
> > > Fix this by checking dev_name(&udc->dev) before calling strcmp().
> >
> > Adding a check like this will not fix a race; it will only make the race
> > less likely to occur.  It won't prevent the name from being deallocated
> > between the check and the strcmp() call.
> >
> > Alan Stern
> 
> Hi Alan,
> 
> Thank you for the review. You are absolutely right about the TOCTOU risk;
> the simple NULL check does not prevent the name from being deallocated
> after the check but before the strcmp() call.
> 
> I will submit a v2 patch that uses get_device(&udc->dev) and put_device()
> to increment the UDC reference count during the matching phase. This will
> guarantee that the UDC device name remains allocated and valid throughout
> the entire duration of strcmp(), eliminating the race condition structurally.
> 
> Does this approach sound reasonable to you?

No, because you haven't addressed the issue I raised at the start of my 
email, namely, how can this problem actually occur?  And you didn't run 
additional tests with the extra debugging information that I asked for.

Alan Stern
