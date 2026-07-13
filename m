Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C3B4307B5
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950509; cv=none; b=TGf1pcyXLgvr3QspHLA7NMcslfneOxTaKaELDmIk/u/amR9Xu/5HQJn+8N1c8I3OL2pbK5F++Rm+36NkdxMYKMmQSyYWbunlEFa42GdHcpo62zsJvLlP54MYI0cSe4a7pEGQHZUwoVVU53N4ASXUHeogy9qluhbgNHnukfS3xSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950509; c=relaxed/simple;
	bh=84FxpU2/gyV8xaiaD+BzrP/d5u/BeSlopPpstfK636A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DVQMQJmGCDFmawTA07h6zC0HvqmTfs/ZHln0BTYsuIDwAHmFt7mo06PgOozFsu17YvRsFKr+erpbSf1+Q83EduYQ0QWWjVyWhNTdMjQyK9+R1yD/bXjtoCOl+Xw0dFqsF/zZa+pCAR/QE9CjHmkXaToltjF2o68FklEYvIF8k6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Yla5rlPK; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Yla5rlPK"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9034b6b7674so18783626d6.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783950507; x=1784555307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nv4xFj2wiB/D2E0PvNnjSvWXAQQKVCoOB9PUL4rGfhI=;
        b=Yla5rlPKVGmYOrADGPGQB0FWbfuehUN23/AVQA6Sm566aZU9bozI2unZVhqscux4DP
         zY5ekKO/DbKw5L4cYLF8O9HINjBoOlpU4wyiCvAghunHPfAy7dLi9SwG2v5vs3cyBts8
         wqVD1/4lbSQ4QRh+HKjmXcw1ODoIUM3KxSRjvONoG0P426hwBVMpzUskffS8dLeZBgkJ
         eImx2HLZC+DGY6Jmgf4bULVDWRVuCyjfh3mSjoPUetydYzLdiesHs1XHJpI8KKWKz18b
         qBkqNOX0fOqm3pllnrHVyQcfGj2kPeIE58XAd9Y2h8K2i06QSmKLdSQV4Gl/ld/NgwvJ
         59+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783950507; x=1784555307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nv4xFj2wiB/D2E0PvNnjSvWXAQQKVCoOB9PUL4rGfhI=;
        b=TxXoKEBshbLJO9Zs+C7u22w7XbIfp+eEs8wAV8XwEl9rzbpIZGjBKfq/LruE/ZxEuo
         cDXvNli3IWW+CN13wL+Unoj+oNwGADbbd1YkwlsNzZ/tyPU+e8I+FFZzaPVqUC+n9ZEE
         ouGMA/98wGjUcc7hqO538GyC4kpe1J3iN8RuBo2g2QFZ2pAlDNpubbRMyqeqrJbt+M4p
         ucyv2Ak4mEQace/Rw0K2OYdzNYO9gRNqH2qgIi4jQtltMOx7Q4llf4woCMO1BA4b6ICP
         rTG6MnXCLK3GyJjo1Pmz+u908eeZ2cWveS2JDMdRG8zSiYHN/vVc1mSLORzmybckGVii
         N79g==
X-Forwarded-Encrypted: i=1; AHgh+RoFEuqrFAlGz2b3yy5bVx+Kok385e0oMdqzcg7QPQNEtJh4gA7358PKj8kc7mx3SySZ9kLukEcdSko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTU+R6FMcVNy/eSH+uc60tn3qwYzI4UFLEudDCeYeaaM7kijPB
	nQi3kl8VKP20vbZ5FaWwmr4qHwkiJagxeFVREAWlhbGKx667q0o8uXBauxbQcadK2hL1oZ/r2V1
	0cDi46Q==
X-Gm-Gg: AfdE7ckNIQk0Ihd7cgBB8miPh9+7R3oKE5b18IuLdL8KeEyCeUyRacmIWTxidefg4mh
	QWBQjvXGhdPgirEt4qsZw6QBTcvW3JZZY4aCMP5ZI/pJFf9o3lD9rqYukV7PbQ3U+xWmyIKHSgE
	KH7CDzGoSkkIrBn+wdMU7GGczGm/7ohXq4UQjCDngAbKETPClTzBvRMrrDApBV8t0uiPh/WepkC
	4neESQbpAqoEpdWnH1DTGnOtPCX9u15kWus3R/YjjHb7wPYLgijbelv57/LyTM7xA5ALvOst36m
	S177af4DGunBPt2iNrfvArBcJ5SjRID4S+NAdbFYw2judrHvmLYfOB33JVJ9Du6UuhnsJd/nHa1
	ZZkhfvQmP4XdW65OhqSdEZDHCb+k3kbs2bMWWxAAbmY/5/L64n7K95Be5Z4BrV4gvEzPRBqJZHt
	e9DBsyjLt8VtujcA3UIlPfW/3oY7C5ARA=
X-Received: by 2002:a05:620a:3941:b0:92e:5856:bdcd with SMTP id af79cd13be357-92ef2c37a92mr1081457985a.53.1783950506510;
        Mon, 13 Jul 2026 06:48:26 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf78a5sm1143121685a.31.2026.07.13.06.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:48:25 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:48:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Kanishka De Silva <kpskanna1915@gmail.com>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: adutux: take buflock when resetting
 read_buffer_length in adu_open()
Message-ID: <2deb91cb-1b9a-4e74-92b7-0bf1a1f95c24@rowland.harvard.edu>
References: <CAKJ0_Ldatt+6_q_Sudg8nCnJLz5Vc8eihK9O6mwKh7tKBZm8iw@mail.gmail.com>
 <20260713075616.1625-1-kpskanna1915@gmail.com>
 <2026071330-amendment-glamour-b6e4@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026071330-amendment-glamour-b6e4@gregkh>

On Mon, Jul 13, 2026 at 02:03:03PM +0200, Greg KH wrote:
> On Mon, Jul 13, 2026 at 01:26:16PM +0530, Kanishka De Silva wrote:
> > dev->read_buffer_length is otherwise only ever touched under
> > dev->buflock (by adu_interrupt_in_callback() and adu_read()), per the
> > locking scheme documented in the comment above struct adu_device.
> > adu_open() resets it to 0 without holding buflock.
> > 
> > In the current code this is not a reachable race. adu_open() and
> > adu_release() are fully serialized by adutux_mutex, and
> > adu_release_internal() calls usb_kill_urb() (via
> > adu_abort_transfers()) before that mutex is dropped, which blocks
> > until any in-flight adu_interrupt_in_callback() has returned. The
> > write in adu_open() also precedes the urb (re)submission in program
> > order, so the callback cannot observe or race with it there either.
> > 
> > This change brings the assignment under buflock purely so the
> > field's locking is locally consistent with the driver's documented
> > scheme, making the invariant easy to verify without having to reason
> > across adu_open(), adu_release_internal(), and usb_kill_urb()'s
> > blocking semantics. No behavioral or functional change intended.
> > 
> > v2:
> >  - Retitled and reframed from "fix unlocked read_buffer_length write
> >    in adu_open() (data race)" to a lock-discipline consistency
> >    change. Discussion on the RFC (with Oliver Neukum) established
> >    that adutux_mutex serialization plus usb_kill_urb()'s blocking
> >    semantics rule out any runtime-reachable race here, so this is
> >    no longer presented as a bugfix. (Oliver Neukum, Greg
> >    Kroah-Hartman)
> 
> Version info goes below the --- line please.
> 
> > 
> > Signed-off-by: Kanishka De Silva <kpskanna1915@gmail.com>
> > ---
> >  drivers/usb/misc/adutux.c | 3 ++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/misc/adutux.c b/drivers/usb/misc/adutux.c
> > index 1111111..2222222 100644
> > --- a/drivers/usb/misc/adutux.c
> > +++ b/drivers/usb/misc/adutux.c
> > @@ -337,7 +337,8 @@ static int adu_open(struct inode *inode, struct file *file)
> >  	file->private_data = dev;
> >  
> >  	/* initialize in direction */
> > -	dev->read_buffer_length = 0;
> > +	spin_lock_irq(&dev->buflock);
> > +	dev->read_buffer_length = 0;
> > +	spin_unlock_irq(&dev->buflock);
> 
> This makes no sense, the single write here isn't going to need a lock,
> it can't "tear" and if someone else is doing something with it it can
> change right after the lock is released, right?
> 
> So what exactly is this supposed to be "fixing"?
> 
> Ah, your changelog says "not really fixing anything", so then it's not
> needed at all, so why add this at all?

A better solution would be to leave the code as it is, and change the 
comment instead.  Say that buflock protects the things touched by IRQ 
handlers, but only after they have been initialized in adu_open().

Alan Stern
