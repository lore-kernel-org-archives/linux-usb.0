Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC5F42B301
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783953453; cv=pass; b=QE6AteMAtHJHwU8bBJFIuXukXK8shu9BmCaSOYnAts3SVet3Uw9Wue5hgnOMYsqytwSbpMuABEx3oiZ+I4j05OD3mjWkSVjsh/98gzP8xrVRLJwscULR80ckIOK1nK0UArqAqGgAqD9x65Fufr34bS5VRTUvfv96Z0QjBsLRfTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783953453; c=relaxed/simple;
	bh=Mez6Ip8rvCKwfsvQEYAut+MTHWLr7vbxCMZhYbll2e0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNq85zFXWuH/x54Zo9lM+6rsMr1dKuFzBQPb6X27eqx2vg/JbMwa0O/tFndWzbWD+wAco2jk7VsmMVs8N5CltRsARinA4lTmz5YFT+V4veRwDv15VSMbzeQWe9E2YVlE7Hha6JFtXEM+W7CtcsrUCBNdYr4RDQcUiEa11nTs5ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=AA6iZnz8; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="AA6iZnz8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc73e322dbso36021925ad.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783953450; cv=none;
        d=google.com; s=arc-20260327;
        b=S7WewX8+Yx1WaHvMt55olorh9z6kLYSuNks2x/1EJXYDLywdW6FBgk2R7j9FaJMzn5
         YdEWtzUOnKAdbmWvn5eT6E3MyJA8cLN2gJIWtDcXk0IaDYd4Yw0BCed+AUSVOF2J+Wb5
         7wyI6zvkId5a4hdYuwy1gSGW7t/RA4/FaMTYwz0drj9VBJ1OGaym9oNUdzhTcw3h0npH
         GyfqTvJ0oSnOfziiHcwCKz/B4GvNqYPlnxiwhAAM+fYCTZJ59ntqjQO7TBGQfTe0DkiX
         bwa3rMWsNkDlOb+zR/D0lTdHYcQpLQp2gnTxzVyzr29pvzhcYUc7xWR8+RHbHhY7NdaD
         suMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KfRHvHH9EJRvQ4B5WOryXvviFLBTX8AS9BvPRb8qx8s=;
        fh=zWC16+A6eIOy7/L+sEm0sipg985C42Y6lemjznyTKZA=;
        b=ZRXBwil2lI/7sEi+KkdiZvG+ep7QycVH3GHSNTjH2sDHzvsGnY4EGzgII0M4Jt8HPK
         XnO1QytJQ5tTotE5AVC3mWXFG7qNmSEgcmdb6xky0Hr6qz/ek/++mFvT9mab9NaYQbz/
         XYJzQeea1QQjrWzKhQy/anJjUGe4gIpZfoWZMALOwirvoNv8g0aa4lkRF7zt9A/RJ9PD
         Tm3/2qlcbFsoV/ge7fjeaHR0JqTMRK7w/X38bWZQ+kk1ht62sr/22x2vrses8el+WSxa
         SJbbOFcTGJkgzfwyMu+POLYRv8a9HG2sAU58Eo6mKvOL5fD/dyAVThHjtLKYd7BN3KNv
         J3uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1783953450; x=1784558250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KfRHvHH9EJRvQ4B5WOryXvviFLBTX8AS9BvPRb8qx8s=;
        b=AA6iZnz8t4/Pify28/aUsrWSxMyr8Y1ijka0iD3U6PJZh3NF2qg4vYwOGrhNz9ieNv
         scWJJx9kfe91VqAP60riu8RQuTS3/NnLr0Dq0q0tTIQNgMXs0Ih4dymwLGaWUQboFUr7
         DGK2255/1Q9E6ryLlkJbQQMhJiK6aPouGV1Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783953450; x=1784558250;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KfRHvHH9EJRvQ4B5WOryXvviFLBTX8AS9BvPRb8qx8s=;
        b=LhOosIvkVg55Dydq7dPn0w/BMEPfsMNqEBGeP/TjS2sRFLtMQsxCpM4/1ev7dbeAZh
         PTCSL8uPAFQ3CfGIaTL+7CvYk4nu9sxWlP1e4MIx3KGs5hk2k0mmOf4y/bgA+BuITYqL
         6e46I3QI8BmcqCIuTZnvRj7ZgTFU+4TzhY8e87cS4HOdsziiYiTWHwG7wEt5x/iWQ/hn
         RbQfMa0dJWM2fkBzd7bNy0dRDBOSxkPgED+IadhFEVAof+ePQP3i9O0PHyxe6WOMnTlv
         cm5e9SH06SqvvK3G797AbAncV0Igoe6HRLRSIZ/YJlGaKG8qOM9BK0FJtOUO1MuPyfoL
         t3cw==
X-Forwarded-Encrypted: i=1; AHgh+RpOglXmBDMEVHtEF6ryX4gAPbe+M7RE8jEUeT7sq7KzgHnFUpG9EINd7y/fk3wc3nPftHOh8Mqml7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmMjetPq73eqwkwNxpjr4vmbER4IQ/CcP4zXThQwBrwFIGvhzQ
	iMpKf8hdHcHkZrfZbHFO+17CsxscL0Hy1yBrCUFFJHeFirCtgWKzg5c9CEFug4JslJke5cZo9ag
	y8lkHHCJI/MmYCObvOEG3LPx2fMCYluD2545ZLo9IAg==
X-Gm-Gg: AfdE7cl6iRAEaFm1w1Q8UNmMJpoStw+N5rJAZHe/66trgXMwYBJg6PkdryOkNpQy4So
	+9Pk0XiKj8mT+lrZ+HZgAokhl8FoMHOBeNAD9nZJ+4ks6VQVzC/k49NtkCeQJVUv3waLAcPubL5
	69KtG0+gEpM7S7QxWiBAeSMnWsnn+wEIdgUgrDP0TYbHN6oa5XuA2DbTrQyqjZ/LU1y16HOf6Xh
	VsJTIfkzicqeE6Bj+py3ZzuIc877Cbg+0q6XF23LSVajtNPr1b7ATwTXDtC9tq4NrGFK05rOr0x
	AOEp57GqeYa4cv5pjNvFNavJj4r0FFI=
X-Received: by 2002:a05:6a21:3995:b0:3bf:82b4:4b47 with SMTP id
 adf61e73a8af0-3c110776c3bmr9441779637.18.1783953450587; Mon, 13 Jul 2026
 07:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713122205.1350933-1-daniel@thingy.jp> <20260713122205.1350933-2-daniel@thingy.jp>
 <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
In-Reply-To: <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
From: Daniel Palmer <daniel@thingy.jp>
Date: Mon, 13 Jul 2026 23:37:19 +0900
X-Gm-Features: AVVi8CfZaa1m-ZL0-1K2jeOn6D9BnupqeggpWwHq3iKCHhDebiwRISjIfdhv4cs
Message-ID: <CAFr9PX=0Bx7OBzbUXXZPsXdXyCV0NPqi4YaJ1DCeMXGk9UDQKg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] usb: ehci: Add option to override ehci_readl()/ehci_writel()
To: Alan Stern <stern@rowland.harvard.edu>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alan,

On Mon, 13 Jul 2026 at 23:21, Alan Stern <stern@rowland.harvard.edu> wrote:
> > +config HAVE_BROKEN_EHCI_HCD
> > +     bool
>
> That is not a good choice of name; it's far too generic.  EHCI
> controllers can be broken in so many different ways...
>
> How about USB_EHCI_MMIO_OVERRIDES instead?

Noted. Based on that we'd have a config for each piece that needs to
be overridden so drivers can pick the ones they need?

> Also, the way this is implemented below implicitly assumes that the new
> CONFIG flag will never be set at the same time as
> USB_EHCI_BIG_ENDIAN_MMIO.  That should be enforced here.  Even though
> IMX28 doesn't do it, someone else might do it in the future.

Sashiko picked this up as well suggesting there are some pre-existing
issues.. I'll work out what to do here.
I think the situation sashiko was complaining about was imx28 running
a big endian kernel so its workaround never gets applied but I think
that might be impossible. :)

> > +
> >  endif # USB_EHCI_HCD
> >
> >  config USB_OXU210HP_HCD
> > diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> > index d7a3c8d13f6b..f592cc26e494 100644
> > --- a/drivers/usb/host/ehci.h
> > +++ b/drivers/usb/host/ehci.h
> > @@ -258,6 +258,14 @@ struct ehci_hcd {                        /* one per controller */
> >                                               /* us budgeted per uframe */
> >       struct list_head        tt_list;
> >
> > +#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
> > +     /* Overrides to fix up broken implementations */
> > +     /* Broken IO */
>
> Similarly, the comment should be improved.  "Overrides to fix up broken
> MMIO implementations".

Noted. My intention was to have all of the brokenness inside the
single #ifdef and then have a comment for what each function pointer
allows you to fix up.
If there is a config per workaround I'll put a comment in each saying
what that workaround is for.

Thanks,

Daniel
