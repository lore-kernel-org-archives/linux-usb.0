Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EE43F23BB
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 16:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959522; cv=none; b=p5nwOtD8V6n8nPv7Q/mwGJXOGrDR0frRsvxKzvoBAHoPtR9h8iMER4dUpi4MDS/tiP5KURKGrINPrhNSQutXnVqj7CsHsvYRYidZ4shrRXovXIwv6VZ/ECGT2wZ6z8CSeWFslLYBiMV7eucN/BElXcg/CXkBs7ZA0JTJRfTsOLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959522; c=relaxed/simple;
	bh=haxd4O6V+TI9jDLsgc+doKxsf03eQ5I0orjrxwHZc/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt+5rNxAlgyCGWnb8PktPyeQ1+Ub6//EMyubrCmH8czwTogU76CnGILSIFyrnyXPCChNfwnRE022y7iwoRwHTEGsRpnIC4PG9MuHAOnViao8uXMmVm/JtR44+XHYJSMHCFvnFiGVbvdWrjLJn35tkLDXSObmnllZSAXL6ZTzvqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BgS0l4wK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BgS0l4wK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c928bf172so21845631cf.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783959520; x=1784564320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OS0p695GQ5r6YP4KTIFxBxaeL+B94+nd/zPa5V1Vkfc=;
        b=BgS0l4wKqB+YXffsUwGvJpALR58hWhkE2jDEtrncm0KQad3v+GV5g1Jl/A0QvdCdUn
         NaV3S1LSD96Q/LSvfx+hOJmqe18/R3Ga0+jtq9E8SNSeH6d/BJRz5sRpiMm0EQn1M+vX
         jVTNmOGkgqGBIEDfUy7wkcRfYyiwSCOKAWjjjnE2o71HE9mdwtDKcKHXZ+hwnz9kxgCW
         HLr30qs6DawALt4ENA+XJFsn6pDw7bzRVAiijAEyWw7c95TadbjtmjdC0W7RO3ZI/Nzq
         qFr6GcTbQYdD6AA260c6AZF1oSa7zjsN9V/jrpThkJrInCo+1wzRvNiyrVK4XUHiqpGs
         dyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959520; x=1784564320;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OS0p695GQ5r6YP4KTIFxBxaeL+B94+nd/zPa5V1Vkfc=;
        b=c5rX6u1T2zDEzAUE6BVgNmdGpwQViopEEgWH9F9D2qAc7fjXolhRdx9PRObNGLvVp6
         vvywki7Yu+yHvFHhSh15xOYz53or9kYUN9kKGE8Oi3wmnzzL1/hSt6Q5+iiazCclEhb3
         DGBFMoKbqcT3lDPFYorkMJwGlSV51uQj2eVm2deSJs+f6iDX3HOnCuItNzz8dfXREbDS
         e/YBsHzZSYqu+jhEacu9407XkXQ4fBJ/zp61mgUcmltT9uGuGo6GrLoc7UzZEWS2wW2V
         JT7GoBi4zkpuGqFUCYjFo8szSs1/8SFAqjdDURsmpfn+RwvfgCDwQxo1AMku/RoMZIyj
         E6Lw==
X-Forwarded-Encrypted: i=1; AHgh+RrOywaEPEYUDVaSVyQxnjNi/9zuguRPGFhZbNY+SWBD28v0SPQvE4nA7iANKRm8SjlY2DkI1GFlHmI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8/ggi8/yYYMdvyNYA39Bawq/AYsoDyHp7G+WL8p2LLgtAxFCO
	gK7vVaZTz9ioK0m/4zcTwwhSqSzE5NE12ZZTXL7LTBzDMem+oqqg2Y4JHvvqpsVuHA==
X-Gm-Gg: AfdE7cknPRyavR2XVFvSBiZ29Fq161SNRUnieIiNdqmmLtW35LzZDG4x7wakbDtVQie
	ACKHn6rS+h9I4SyEN0TM6xuxv03KAysuaEz82B1Z/PAwbhRQkgkKPcKcUjfPSfv2lbcw3y1FwUT
	RRyR5J9tt7TdHosWmZOMDSz7NAfyXEOSf35yLE8QuMROgi5G3iIvzvUv3UA9/bfaTme6JXwbew6
	cN3ENmW90LQ9So/bj43TpT9ZFdcq/uhii2uqhWtqSsHeG3h8WlYWl799q0wm2HF/xsbGyTltNWD
	N5cebOonst92duJ0DLAaq6ZMD7ONEKHdCrTt0DUG1RhgX1JPk74u+uU8jAd58sAE7q5NfOflc1U
	XchgADXNx9a7Jav86EFRYRgLCCZpX02CYwj7XkbpG3Ehj05NRfKPhrhiTWsJV013OTghJrq16Iv
	r4fgWFba6MzY4jID6tglICIf57dyeJG3XB0k/lNsfn5VlK6DAL2V1yifcux9fQnoAKBRo=
X-Received: by 2002:ac8:5cd4:0:b0:517:7d9a:a88 with SMTP id d75a77b69052e-51cbf125697mr99928211cf.37.1783959519643;
        Mon, 13 Jul 2026 09:18:39 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6d574sm86871981cf.3.2026.07.13.09.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:18:38 -0700 (PDT)
Date: Mon, 13 Jul 2026 12:18:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Daniel Palmer <daniel@thingy.jp>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] usb: ehci: Add option to override
 ehci_readl()/ehci_writel()
Message-ID: <6883bde1-e2f0-40d5-8f98-1857073ec9ed@rowland.harvard.edu>
References: <20260713122205.1350933-1-daniel@thingy.jp>
 <20260713122205.1350933-2-daniel@thingy.jp>
 <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
 <CAFr9PX=0Bx7OBzbUXXZPsXdXyCV0NPqi4YaJ1DCeMXGk9UDQKg@mail.gmail.com>
 <a4fbe866-397d-4fb4-b4d4-e71e7771931d@rowland.harvard.edu>
 <CAFr9PXnBqdbM7gNBpBoq2F2bM+yRrP0HzR6EL1niG9VHsW=sQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXnBqdbM7gNBpBoq2F2bM+yRrP0HzR6EL1niG9VHsW=sQA@mail.gmail.com>

On Tue, Jul 14, 2026 at 12:07:11AM +0900, Daniel Palmer wrote:
> Hi Alan,
> 
> On Mon, 13 Jul 2026 at 23:46, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Jul 13, 2026 at 11:37:19PM +0900, Daniel Palmer wrote:
> > > Hi Alan,
> > >
> > > On Mon, 13 Jul 2026 at 23:21, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > > +config HAVE_BROKEN_EHCI_HCD
> > > > > +     bool
> > > >
> > > > That is not a good choice of name; it's far too generic.  EHCI
> > > > controllers can be broken in so many different ways...
> > > >
> > > > How about USB_EHCI_MMIO_OVERRIDES instead?
> > >
> > > Noted. Based on that we'd have a config for each piece that needs to
> > > be overridden so drivers can pick the ones they need?
> >
> > Maybe.  What other things will need to be overridden?  It's hard to tell
> > what you're planning from just a single sample.
> 
> For the fotg210 at least the location of the port status register
> needs to be overridden, it doesn't support sITDs so that has to be
> blocked, and the hardware has a bug where the length of ITDs is broken
> so it needs to have a workaround to write the value it wants.

Okay.  I think it makes sense to have a separate CONFIG flag for each of 
these.

Alan Stern
