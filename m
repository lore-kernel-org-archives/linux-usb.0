Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776094;
	b=BSRehF5DBBt6NKtoBmepNQlwrhKb80XP1NNp4lqQN2kXXLWEfV5+zDvn+HECLVGSsBsY
	 9CKkNQdMjQAqDahJ/WMaAwo9a2FVictNcXYWV6aVxxvL0gnYSh/hjLrJRaNNtzqGb0xMD
	 OSr8JPMHZs3BOll9R0rkax8UFnMauluTSzXHETyizYFO/keNPujGnEGDWWX6L/uQr+LLO
	 WXS89FQ65T+81x3Js3pz4ziZIHpSX67LqOm5+wn//AgUQbtX//CVz8fkICXMbx1JXU5d6
	 BIZQ4dMbw/+OGyf7VkGC37eim+cGbLO6OB2U+dt1eIqZTcec/8oE9we1ykZCw+GLEvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776094;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
	b=ZVct0arEp4JFiEH/gP7qAQ6kJdP90ouOje7kUZSM51WdYNTdvEOyp2UR+7cUZ71pxc9Z
	 sIQCksGZLcwe6x6dY3HDJ00WL1VDjplTdmlCpoORBATHg7nflVTx0L/pdhMvhzvMdk9Kc
	 wZAHfbK7bX8IlF3we986qT1pq4r3nCuu26IGWF5lKvgaNOArgNkrZoszRL9JXzS9drr1a
	 ixSFOCyzjdE9oKCypXIda6x6PujSovgiGhXkfcKBNy0qlaqigWhLxB2H+lr4BNsdb3dBv
	 YAcDWpmQ5QI55lGaR7yr0cQ9sRKo+MUXpSxLTjq80pfNbp7WIWLzRh/LLLws1Gxsn4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=PdYVAMIY;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F71606A32F
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 20:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F71606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=PdYVAMIY
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91eb53957cbso61474296d6.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794776093; x=1795380893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
        b=PdYVAMIYU0pKToo8n9Ju3bpTwraMraRAbuOWH3KoYoaUS7aL2L3bu8B2UUoQWiGhZX
         e3lc6HjxpWwcdp1quooLJWSYm1FrCGGCwjJgq9TauBYww/zfdBhCWNSmbUxfiqirrZBT
         h3bmEOFtjLUhpfqyXOc4LSNPZpDKAHy0qT8OfyEPkq+98/hfKFNbkZjhXiKEWJmOnurz
         XYjZ4OapSqpzTviifa5FdHnvwMSEYHLhzj8XmbfN1bmNxfS61+lVdfXwjc0igkiFP/6s
         vKYMo8zpOTXx9neVzIPDKsoyOj+baai5mAr6mdAXJddEP6UIH/jNjcwfzozGHK4h9l2m
         i8uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776093; x=1795380893;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wFpVgBaX15hNB+JUEr5KOqaRCNt7BuzJdvHmQYhEuw=;
        b=hfw2aWpcXTBB2xH1kaGtJ0a1OXSRG0t8JmNqjfFvlDDOHNy+aJ69H/3LmZM9Q3uXFI
         sM+h1eia/MzjZjaK202G0M3uKsdA2sXarDcI6LsRVv8hZaHI5D1YkAOTQsbhgszJQciI
         +YlH7CWoDYT6otxldY/B3paMPnTuFt8FGpAPoEEu1X2iWnsUJXslU8o8ZX2Tk6EnU33c
         ZmtJeOXrDph5UYxsV5z6J7iWJBpNpu2Z2QTB9lMvrRDs5/ud7N2EuREUE4Z3H/VY0jea
         J1ScPTEQ6sexwLh7x8hbU46k9KW+izY+OhOWt0iD9IM5jW8cfvbxKm5i7xe0j/dkAHn0
         5pwQ==
X-Forwarded-Encrypted: i=1; AL+hErGqS+YKA8tr06nUBmVTbwX4+ETyOOgb/aezQgbLSLRslY7Dg0pdnr3cC2KzMCBAdFWC7lWonCc8ho8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dIL+1PhsLCVDWrwlXmTFV/ibtW9y5O65kDcNbfecivQ88KlZj
	SaQtkpiB2UxJFjZ8pAtN9WFPTChnpSaq5F+ULzLp1HM3Dx1ntJ9wTwH7xe5f+snpVrk5/1KrvEn
	qoiDjuA==
X-Gm-Gg: AYBFou0yI7EI8fS8o97DNKpdnwCWqfORi0vo5Y/kjtlRBwU7bwUQY3XGKYcbCcIvDGm
	zTjjNlTKvMAGr/v7lovlau1PwkUsHQdWponJobtlbgDwsIpucW0BxyZgEpd51Yf/z1GljkBkj4K
	YHznbzBOgYBu7FRr3dRH+udTIDVKfqwfX4UF/50juzIt+3lykm8qYcU6a+Ks3udS8zBqU7rDO+g
	ObcZbGDdtADG0GSoAY5yPCa+few6DA58xlMp7uiKhlTmP3pkviG8bNTgdzwVRvPMwJ77htsxfRE
	JAfKpybHSaAl6erdWROOHQvwbS7UwQv0/Ckj27/vNby63VDHYqJCu6UYLXYNW0uZZeHO/jeGA/l
	ymJXUW/OswM/LFpO7bL81ra55W89LIxuoOjTSoFOPLpBETQFM7VNWy5EcBUroKTX2gCQp5TC6w3
	QfYqFx4t9m3+zxdIhXwgvdUjnocirlhVpMVl7oD3vdBb2nt2CmZWDA80QCwFg5jxwsP0GkXSF0I
	Ff/nKdVwoSQnaDgS6BzxosxFLEeh50Qoqs65tLaZ9HmQHawnc5kVN7ChwTdDgcHg4dIewF4ozvY
	IhrbjXP3ALK3pmWO/oqe5nXW8uZQtw==
X-Received: by 2002:a05:6214:5409:b0:91e:ee6d:753c with SMTP id 6a1803df08f44-91f2426507emr136814886d6.41.1794776092947;
        Sun, 15 Nov 2026 12:54:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9ca2esm70627266d6.6.2026.11.15.12.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 12:54:52 -0800 (PST)
Date: Sun, 15 Nov 2026 15:54:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [QUESTION] usb: usbfs SETINTERFACE during a runtime reset-resume
Message-ID: <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115163709.226641-1-teel4res@gmail.com>

On Sun, Nov 15, 2026 at 08:37:09AM -0800, Cheng Yongkang wrote:
> Hi Alan,
> 
> I have a question about usbfs and runtime reset-resume. I am not sure
> it is a bug, so I would like to ask before sending anything.
> 
> The kerneldoc of usb_reset_and_verify_device() says:
> 
>   Locking exception: This routine may also be called from within an
>   autoresume handler.  Such usage won't conflict with other tasks
>   holding the device lock because these tasks should always call
>   usb_autopm_resume_device(), thereby preventing any unwanted
>   autoresume.
> 
> (usb_autopm_resume_device() no longer exists; I assume
> usb_autoresume_device() is meant.)

Yes.

> proc_setintf() runs under the device lock but takes no PM reference.
> After USBDEVFS_ALLOW_SUSPEND, the device can be runtime suspended
> while the file is open. If it then resumes through reset-resume,

More to the point, if the resume handler in a driver bound to another 
interface in the same device calls usb_reset_device().

> finish_port_resume() sets USB_STATE_CONFIGURED before
> usb_reset_and_verify_device() runs its restore loop. A SETINTERFACE
> issued at that moment passes checkintf() and calls usb_set_interface()
> while the restore loop is still reading intf->cur_altsetting and
> calling usb_set_interface() to put the interfaces back into their old
> altsettings.
> 
> On v7.3, with dummy_hcd and a gadget that forces reset-resume, I saw
> 1097 SETINTERFACE calls complete inside the resume window over ten
> rounds, all with -EPROTO. There were no KASAN or lockdep reports, and
> I did not see any corrupted state afterwards. I know 7794f486ed0b says
> that I/O to a suspended device fails with an error code, so -EPROTO by
> itself may be expected.
> 
> My questions are:
> 
> 1. Is usbfs expected to follow the assumption in that comment, so
>    that proc_setintf() should hold a PM reference while it changes the
>    altsetting?

In theory, it should.  On the other hand, a bunch of the other proc_* 
routines in usbfs don't hold a PM reference while trying to communicate 
with the device and owning the lock.  (Of course, they also don't try to 
change any interface altsettings.)

I suspect a better approach would be to have the routine fail 
immediately if the ps->suspend_allowed flag is set.  The kernel 
shouldn't be obligated to resume the device on the user's behalf if the 
user tries to do something at the wrong time.

The main thing that concerns me is the possibility of contradictory 
usb_set_interface() calls going on concurrently.  That is best avoided, 
even if it doesn't end up crashing the kernel.

> 2. Or is it up to the program to call USBDEVFS_FORBID_SUSPEND or
>    USBDEVFS_WAIT_FOR_RESUME first, so that this overlap with the
>    restore loop is acceptable?

Well, yes -- user programs should be aware that communicating with the 
device is likely to fail if it is attempted while the device may be 
suspended.

> 3. If it is the first, would taking usb_autoresume_device() around
>    checkintf() and usb_set_interface() be the right fix? In my test
>    the ioctl then waited until the resume finished and returned 0,
>    which changes the current behavior of failing with an error.

If we go that way then yes, this would be the right approach.  (Except 
that I don't see why the autoresume shouldn't occur until after 
checkintf() has run.)

Sorry to be a little wishy-washy about this.  The whole topic of how 
some of the more esoteric core USB features should interact with usbfs 
is not very well defined.

Alan Stern
