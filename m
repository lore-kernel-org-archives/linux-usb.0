Received: from mail-yx2-f0.google.com (mail-yx2-f0.google.com [74.125.224.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9E4499B9
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783973023; cv=none; b=l6li0igNWyxsTo3R4iwaxfIMa5fr3GsQkZLlZAkj9wSCGBVGyXj36n7qXw00aapSKmgEAm0w1jKAFiprxzC/P8iqpD8s96imyacEq6hpHUKz3iZWgOo/mtOCprwk5xpqix2sK/HMS7L796b6+nWVuIRL4Iv4GiF2h7wB1h8TGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783973023; c=relaxed/simple;
	bh=lNq9HbHx84bO0jNzQuDP2EuhbElpWCYOSVhU+wGOVjw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6yBJDo9S3LOU2tsz1oYQwXaORNMGLZaUonUt0u7yVTDUVwxVKYpdU5CgIjh28D47GYACAZIcGDBMrVXXFZ22l00WHV6zSIwbXKD7iOi9RjgalMQunnyjU+rrzUllycD/hILTWvi+KMGu+MluinZZEanjf/E+jNDdiPyNux/8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGi5Mj2V; arc=none smtp.client-ip=74.125.224.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGi5Mj2V"
Received: by mail-yx2-f0.google.com with SMTP id 00721157ae682-81e7a64294cso707797b3.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783973021; x=1784577821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=OGi5Mj2VyA8svzmhqWbXBJC9SfhEe6eSbp2k7zPV/jOQ3ucKH82EezhbS+nB994lMz
         KzU2sg4RfYxe6qVnXzEjgIHsvQhzrBXw5RhM2lczZGJB52LujnV8xubGt5Z+nf86bZRC
         4WVjkEoCFMCPU07rl+V0nPYj37b8Xo0tvZefvgpFOw6Gf7lH4amwKKQ6L/X+Y4UdFOD4
         hVdURCVxqrM33AxmM1erYI96Dnh29vD/bkKLsVuZlzntHg115f7VOysI+p4RC/dL4LEd
         UTxrQko/b5eZ36UH+G20xQ/ny+GkCYvdn9E+s94fucSK9ksh/KUVXlp5iRoiW3deIzsq
         nFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783973021; x=1784577821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ/EY59cpu1jkc21PGftgoguMZtfT9udSMBKlCW2BmU=;
        b=fErGOCt1msoHmkRIZTDNIx8vIsHdzc2GyuhKViDC8ORNjE8Fbgw840VTA/yZ93psBA
         6qMmSf2YLvHR81f1ZRai7eWG+u29DTTAg1CmZin1TJTvuGMBG5d3MNvZ/HtuO7w54XfI
         Q+f/dDpAm/27+f/NqzSBm/9/iGof7WcwdW26kzXD8y/NEawPH2Kh02r22Oe1s+NfjT4m
         RhB0ohxB5ApVyD8sI3vGH2Vwlbnfxy45dQZ0mq8Uel0pDrfzOPihPyZNdPZesPnBd2cy
         mlu6AD9hJM06Rp8DjF8TU9rQewHvuNCWKdj1/fwS7TTXn7R0OEKmsagNcA6I3mpByeGl
         c/eA==
X-Forwarded-Encrypted: i=1; AHgh+RrBv8Yv5LotCC7Ef3/xXNc7YQXou5aIiybkYa+NOVljJC6/sK2AUesy/6oQgM0gl/dzIKEyCztMwzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyehHU4TAPqPR60GNQYFKANTxHwV9+ltW2xjoUBeWYFv9JCBm3T
	1qngJphdahy9BtRibO0L+TEmydMpJ9piGVQ9Gt1DBxTGXqyntKhlrL1f
X-Gm-Gg: AfdE7cmrT/v4EEhI/qlqLaxwBUxBeqDTT+ENIN0x5VaN1zPgm8utnWCpUZeDZlOY8bk
	CzsEAal2ywMXOA6Fvp4p9C4LN+KpFEn0jm9sLr+6po8BVMwLK63G2Ga4JfLnXM+go/zmOeeRPPr
	ofo6r07YVS1hwaBq8N7LYKPBjCstXEUDiV1XEc7/baZ+LMbk1x3jMPXEXKqQtAU0Kzmw6rOdmMI
	wQjo7Iaga/QAy0rJMuMieWaQTqLkvhphRdw/0zpQMP+nwWmZIP+rmxq65q+LPzrlQgetxjNexew
	KhNh0gkU45acNbrLZJV/1G7bUzBitv7GQ4aGuWKPcuO3vAko8b4K33wvogfdr37luignMkmuo7D
	GcSs8bkwUDyB6wxLyMZa52DKS+5TE3kDuxq/Oo62bX+q62vkXf0KkqUVihTej51c5FhY1I8v8sb
	ZfPBOW4BqpzTxqVDhxLuEjZpofIJoAjOQ8T0Zn5LywjCnt9sdI8QEouJfNF10r9EJ6IkkSwh54T
	zmjnw==
X-Received: by 2002:a05:690c:3344:b0:814:5840:2f92 with SMTP id 00721157ae682-81e9014da15mr83359257b3.48.1783973020642;
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
Received: from pendragon (76-234-45-214.lightspeed.cicril.sbcglobal.net. [76.234.45.214])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm123926137b3.46.2026.07.13.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 13:03:40 -0700 (PDT)
From: Colin Braun <colinbrauncl@gmail.com>
X-Google-Original-From: Colin Braun <electrolitic21@gmail.com>
Date: Mon, 13 Jul 2026 15:03:38 -0500
To: Danilo Krummrich <dakr@kernel.org>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-media@vger.kernel.org, Colin Braun <colin.braun.cl@gmail.com>, oneukum@suse.com
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <alVEUR0JrF1ga3S8@pendragon>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>

On Mon, Jul 13, 2026 at 03:22:33PM +0200, Danilo Krummrich wrote:
> (Cc: Oliver)
> 
> On Sun Jul 12, 2026 at 11:07 PM CEST, Colin Braun wrote:
> > @@ -382,8 +556,8 @@ fn as_ref(&self) -> &device::Device<Ctx> {
> >      }
> >  }
> >  
> > -impl<Ctx: device::DeviceContext> AsRef<Device> for Interface<Ctx> {
> > -    fn as_ref(&self) -> &Device {
> > +impl<Ctx: device::DeviceContext> AsRef<Device<Ctx>> for Interface<Ctx> {
> > +    fn as_ref(&self) -> &Device<Ctx> {
> >          // SAFETY: `self.as_raw()` is valid by the type invariants.
> >          let usb_dev = unsafe { bindings::interface_to_usbdev(self.as_raw()) };
> 
> Please see commit f12140f21acb ("rust: usb: don't retain device context for the
> interface parent").
> 
> We can't derive the device context of a USB device from a USB interface. Please
> also see the device context documentation in [1].
> 
> USB device drivers are separate from USB interface drivers, we can't assume that
> a USB device is bound to a USB device driver just because a USB interface (of
> that same device) is bound to an USB interface driver.
> 
> The same is true from the Core context, which means the device is in a bus
> device callback, where the device lock is held.
> 
> This is also the reason why I keep proposing to only expose simple forwarding
> helpers on usb::Interface to implement URBs (see also [2] and [3]).
> 
> An URB requires either usb::Interface<Bound> or, for a USB device driver,
> usb::Device<Bound>. But since we can't derive usb::Device<Bound> from
> usb::Interface<Bound> a simple forwarding helper does the trick.

That makes sense, thank you for pointing this out. I should have taken a
look at the git log for that line to try to understand its background.

I'll remove the usb::Device<device::Bound>::set_interface() and
usb::Device<device::Bound>::control_msg() implementations in my next
revision (since they will no longer be used) and just implement them on
usb::Interface<device::Bound>.
