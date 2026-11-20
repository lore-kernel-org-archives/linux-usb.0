Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191219;
	b=vgUkyR2ELHcvjy+ebzHrZgzv7miKQrLjuDix45RNi3+ztl4ZQRw9wAQe5m9f5Q9WOmIC
	 Zt4NoNMTfg/1zugt5OiPxRMTY4wW9A837XLfsR6mR+BkVjlDEBNdAtrKCvERLMBZmWkLQ
	 zzoOE2KqrKMBgmUyT+Wso1SpIk506Iz8dzsjgLAIdWIM7nBVorlnHOyFYN00DDjHHw4VT
	 Wy7vx34PJZikK24MgHv/JPM1jFEaoMKM+oyu3Dk6LXD+LneIO8QzPYnl27BoRv3/aXl+m
	 EKzfOx1vBX+w5sO9hFGOy2lruYUOBv4u4vpzs2h8N8aQHo/AkiJffFomy75ro+vG4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
	b=Bsj4U6DsSvHrw1XQQnr9zMw8N1V9YU80sfR90aAUINZ4NKq19Eh+NY8HfkGkgErln5Il
	 IK/WQCeTPdETaeCGwqZOdnZR4Mv+91C1QntZNNQvv2cbbeUP/BZM2ctVOOHoyYei7R94R
	 Z7YF1oLBLR5OJZUjCUJcO09W1MswFqgAfXFiczXpwfJP1dDOOqzTUaBHPMp3YH6sChAya
	 d6U+h3VfbRvhXhFRNmZGZc0OphruqwCgUeZvjb+na9R1xEB7Ft9HcdjA0QOO6gBl+BFJ1
	 leqPEAZggbpe9FpQtn2PJkF1CxSIYeN8rFWKFIOHYZ6y5Xw2/03MhlcsONIZqFJCMyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=DVTGNfn0;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E172360A2606
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 16:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E172360A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=DVTGNfn0
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9495e8ae23aso92122585a.2
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795191218; x=1795796018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
        b=DVTGNfn0RcRD8xfB+MwwKXCzdG/2IJTQQR9aTVOkOmsK3ahaMAX0zhRCFOIygzDqw9
         f3lz3ZzXi8QI3ehzyGCslUcbAG/gxV+tGhZ2KFcrn0+zcIopkJ4NNcm7Xoo7X9OmJfoL
         jVuQ3eimiXdBh2Ma/je3e2nCkdrkPLU8V5x5rwXabvZ+6TiAfOX0/74y3dTxKkn4KPzE
         bktoH0I6MrCWADpcafmc+zr6zdmWr0G6JB/wYAQMl08Glz5W8nAdMN0os9EN4/U0JaEn
         AYvjOMByY49vLrNOZiK51nREyf43nfkrxaHvZc8Iyd00OjdfpqYCqcwhg+MuZvgqpiLy
         KIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795191218; x=1795796018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ske43Fh9A8yW85CHf4qvTL9iEMX6C/Nlv/vlJ5RihTM=;
        b=zGzsTkCC1Mztcg/X00J9O2dfH17Gbv0yIi4YYFK/A/aQEhBQKYglv8RHZzd/wISfr5
         qMtsX2Y9ZO5QHAuAE99a6efdNFdp83L33Whsl2iCZxrv9sKPancENFNvXjRx/ejST6XF
         1Rpwb6OPjfBr07kJJn77Unjcdbg4fFm2K4LB0GspCdZlGpVJlJWsV+O//8iT0p7sr1cS
         Vyn8rp2F2dSvyXneFwQsE1sZpj1FNpiB77KLRXpnVf5EhYNFkDjlv1N/tAmBNvKlL4RY
         O6lZH5rGfEVVeAnFrsF2XqdqUvVMO6LDjOriYp9zDIvxOBrKsrItBOPEpHCAlPRpvW4e
         fzVA==
X-Forwarded-Encrypted: i=1; AL+hErFgKVteInccCrns+YeYE6fabhQISy8fpUYvTPXP6dznVqCg0cssn4nm3y7OLXfdOn1htEP8SheG0Sw=@vger.kernel.org
X-Gm-Message-State: APuU4Z97tQTaP5y/Ku6MWJ94ZcM8x2IXS7WF7DceBLwNUrW16BYnqxTf
	GE7YIjvC5MIm6LUTP4y4YXVRlVhBym2heryhTZOusXlDfOwPCBLPfOB3l5QzXPUZ1g==
X-Gm-Gg: AYBFou2mPAj/G56zHjyt+vvOh7rO/LEfGlqAZi3avJLXQFSwu589uOBBh7trSq/3yMz
	6QTPtkSEMhQaBs9QGcXFoJlt2406cAHJhxdfhjFgGYmpin57cLeynUoZ/2+6NHygHd/cd0XjqxS
	ghdnzt9Dz4KZkLM/CdGiIwgFky7kXM9Ju6oGoranuDxphD/FrpcZ1TGJL8ZyCmnj9Tm1rj5ugwI
	YQuFlE2L34GNjqNoPlhvOn5G1gCCbRoP/JwpNy34Vi9lF3uNm7XOPsXT2e9DNJhlaLU+JU7wMvc
	of5No4toME7QkOAGuYXP5p9UVhxcLk0MhRl3JXH65X+lnHMrgV4INncGjZ4P94KbVSGzt9pOA11
	YgFFJq8+txBVWKchjOOGY9i3hTQA9ZhGrzls0xl7VraWPP9PEBFykxH9sWxFD58TjhfZ3h5G2Rz
	fyeyPoStZOaw+lnzO9FwRVOREOuigqa7B/6SJc1eUMCAmy5Ge3X7GpWdZ06vau0Ju0Z69LMKORh
	/yLm7hmUxZjg0nTZy8bJz4oJuX/kyGIKCfYNA0aDfhY1evk53h1CETXL0EcL/POkxhUYSbmgCh/
	EDpOkszRx4cxD2Cro93uHg+QbS9Y7Q==
X-Received: by 2002:a05:620a:4488:b0:949:91c6:973e with SMTP id af79cd13be357-949bab66f99mr562619185a.65.1795191217744;
        Fri, 20 Nov 2026 08:13:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41c105sm217536885a.39.2026.11.20.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:13:37 -0800 (PST)
Date: Fri, 20 Nov 2026 11:13:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shihuang Liu <shlomojune6@gmail.com>, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>
Subject: Re: [PATCH v2 RESEND 1/6] USB: add usb_make_subpath() for formatted
 device subpaths
Message-ID: <c3579747-1dce-4444-8635-5c3e836afb6b@rowland.harvard.edu>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-2-shlomojune6@gmail.com>
 <2026112032-pecan-knoll-4f4c@gregkh>
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
In-Reply-To: <2026112032-pecan-knoll-4f4c@gregkh>

On Fri, Nov 20, 2026 at 02:13:53PM +0100, Greg Kroah-Hartman wrote:
> On Thu, Oct 22, 2026 at 03:09:24PM +0800, Shihuang Liu wrote:
> > USB drivers often build device paths by calling usb_make_path() :and
> > then appending a subpath. Several callers use the deprecated strlcat()
> > API for this.
> > 
> > In preparation for removing the deprecated strlcat() API[1], add
> > usb_make_subpath() to format the USB device path.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  include/linux/usb.h | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 1da4ad1610bca..c90ccea0cdbf6 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/errno.h>        /* for -ENODEV */
> >  #include <linux/delay.h>	/* for mdelay() */
> >  #include <linux/interrupt.h>	/* for in_interrupt() */
> > +#include <linux/stdarg.h>	/* for va_list */
> >  #include <linux/list.h>		/* for struct list_head */
> >  #include <linux/kref.h>		/* for struct kref */
> >  #include <linux/device.h>	/* for struct device */
> > @@ -987,6 +988,34 @@ static inline int usb_make_path(struct usb_device *dev, char *buf, size_t size)
> >  	return (actual >= (int)size) ? -1 : actual;
> >  }
> >  
> > +/**
> > + * usb_make_subpath - returns a stable device path and formatted subpath
> > + * @dev: the device whose path is being constructed
> > + * @buf: where to put the string
> > + * @size: how big is "buf"?
> > + * @fmt: format string for the subpath, without the leading slash
> > + * @...: arguments for @fmt
> > + *
> > + * Return: Length of the string (> 0) or negative if size was too small.
> > + */
> > +static inline __printf(4, 5)
> > +int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
> > +		     const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +	int actual;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +	actual = snprintf(buf, size, "usb-%s-%s/%pV", dev->bus->bus_name,
> > +			  dev->devpath, &vaf);
> > +	va_end(args);
> > +
> > +	return (actual >= (int)size) ? -1 : actual;
> 
> -1 is not a valid error number.  Please use a real error code, AND spell
> this if statement out.

Also, why is this an inline routine?  Why not just make it a normal 
subroutine, and put it close to where it gets used?

Alan Stern
