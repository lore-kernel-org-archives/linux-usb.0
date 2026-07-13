Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFC37BE93
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 14:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783952476; cv=none; b=DqAXgC6jsR2moB3DVqo/AoUroWlt0AVKFP2sE2GiTHAcY2CZuljmUH1xwZDmsG8rPUIf3r7qgqs94NhjfByT6xV52P+UoSZkq4x/AxQ4/pkWJ4NOXvWaKA/vMCSvLyRjnP2AN1DocfwIuskOC5WIHviKJQlUMkjH4FEoG07GLSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783952476; c=relaxed/simple;
	bh=noicdIPB7UN3jYremr0MeEkyOtbVOxbH8MhO+MfL2kM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ocUQPTGBtD4jurpyjk/myPu81GF92m0TUrGP7o9m7KDmXidasNPNTA5vyWbfHHutD15HvWgEthWO/LbWySxwlW119aTocHPMFCSMmuPjn6NDrxkmoYLKT/iVw0g4NkK+hj/yVwJ+28TyidKNByNS+QeuyizvizvgyW+tIDKP0uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wwAhSt5Z; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wwAhSt5Z"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-92e7c6ec9dbso127080285a.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 07:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1783952474; x=1784557274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NzlJnNd1dpCMoNK7zEV9ee+Bl6NXJqdnMFYtEa1io3w=;
        b=wwAhSt5Z9if+HyWHGSNRgWtUjNyHC49n/SGGSpyC/vJ2aEto2LH6qb78DZclRaMz9M
         Qbp1V5+/5kWngTxos9DIgTKCk5wBeOkOzpGPdbbNAfvbWvhkb3MeYmde+omNKcnjUlXV
         NnP2SCfOlmJD+hBTyyB5QAs8RZRKOZIgUszt4vNnGRu0GDk2EzpVDA/sRgRXkSXPqtzB
         DLpM4Ef3LFgl/23H4k8gfngVpjm3yrxOVAt9VKNNxIMFCpx0fSBNMQCZhahPMejCDwEX
         j5XYGJXZ+rXU6Zmqc7Ay7cQFQzzlA5Fn1HaI16gwvqWEKoBKr4Y/rOU0h0Z0mlljZHXi
         Xt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783952474; x=1784557274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NzlJnNd1dpCMoNK7zEV9ee+Bl6NXJqdnMFYtEa1io3w=;
        b=IX1kbwbn/N71ssAMn94YkAxoSfh3E9Jlsvyiizi3C/CSgxEmrRGZmiN5zYm8wOvOZT
         c9xR/i5TByf+ZK5tihi18e5fRq6C1Oex9UuKwJR2c4KJxZrQIO2HDoTMnQEcTUccoQAn
         gWSv9sG4DF9rmGFP++5sAQeO2IGN3eujzaQmj+J3FFXYQofij+hIPF9rSfXKjMtGkSay
         Yg5l2RoOLFBsE0vQmifp4r+1j31eVDW61Qap2yfct5gTIdHUJ1REuMkG7V0QcUmldTcF
         ACGmZ28pg9gsGxtouJy+ncYiQ7UsIlBJHKL1ZepdMFakEzs+PHtFa72menkmmGKMMhP1
         oV1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpiN3pfXJiGoPdxRkEZA9aZGkMMYyC7e+5k6gRTVjWwU1utRdzI0DakghMKJEcjCvknn6gc82QS/Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPkictKOL0Z1e4cMz9aNRH9B4QeOdPOc4VAVpEDJwc1zNWbwc
	rCj7eYVH7mRZLRdx1GAg9NWtEmLNl+szCMPIdA9RXr53z35Gi0diacdoiPKh4B3sFw==
X-Gm-Gg: AfdE7cmstVjC3fHe6GlNgPIvO81k12bnfXig628Zrv78ET/BP5NQa3lT4LlGNY9V+TL
	4yTOnwCYoH4Qyr++ckxZ/bpqpJB5NoXVZ82SzcgMIpRHKNuFs6d2Jtad8AB4BQaeMdRtdGkqEaJ
	A2nu4zyqGQSm0Jp90ZeRyw4S2oXJMJwE8RYNB5Gcm4hn5v+LaJG2mXwosZTD7uZd8t4DjPvUUkZ
	06G0WfFOwm5NeFNNsl+Mgmp9IAv6sDhvV0t+Y3XKJYAnN6Abi5u1my5N1J9AdJQsYEGSyE/rTUv
	xqjLc+OLMZFtKF+gHrXfuC8nh7FPSPYJZg975veIdioGW2Exn7tYwhd/cWWu8nFIL9SeZx79pQc
	Cst6YTEN3X3HepHhFUug0K3sPtwQkiO0uCEpFjDLJujWGj1N5QNNC3n1FFF4txLSz3lvCJmD9Q/
	W/jdBi+VW8bBIDb5izKMIuiQk9jXzWSq4=
X-Received: by 2002:a05:620a:2414:20b0:92e:e6e1:d083 with SMTP id af79cd13be357-92ef2c6ebd1mr643279185a.52.1783952473714;
        Mon, 13 Jul 2026 07:21:13 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4920asm1045143485a.4.2026.07.13.07.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:21:13 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:21:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Daniel Palmer <daniel@thingy.jp>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: Re: [RFC PATCH 1/2] usb: ehci: Add option to override
 ehci_readl()/ehci_writel()
Message-ID: <02d6c843-6606-4f67-aef7-3a88846d6388@rowland.harvard.edu>
References: <20260713122205.1350933-1-daniel@thingy.jp>
 <20260713122205.1350933-2-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713122205.1350933-2-daniel@thingy.jp>

On Mon, Jul 13, 2026 at 09:22:04PM +0900, Daniel Palmer wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> There are EHCI-like hosts, like fotg210, out there that should
> be able to use the shared ehci code but can't because they need
> to override some parts of the ehci code to work properly.
> 
> Let ehci_readl() and ehci_writel() be overridden first.
> This allows the ehci code to be used with hosts that need
> to do special dances when accessing their registers.
> 
> The change is hidden behind a boolean kconfig option
> so that the extra function pointer NULL check and call
> only happens when a broken controller is enabled.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  drivers/usb/host/Kconfig |  3 +++
>  drivers/usb/host/ehci.h  | 16 ++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index b3b1ec696bf5..8c88354e91e5 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -362,6 +362,9 @@ config USB_OCTEON_EHCI
>  	  USB 2.0 device support.  All CN6XXX based chips with USB are
>  	  supported.
>  
> +config HAVE_BROKEN_EHCI_HCD
> +	bool

That is not a good choice of name; it's far too generic.  EHCI 
controllers can be broken in so many different ways...

How about USB_EHCI_MMIO_OVERRIDES instead?

Also, the way this is implemented below implicitly assumes that the new 
CONFIG flag will never be set at the same time as 
USB_EHCI_BIG_ENDIAN_MMIO.  That should be enforced here.  Even though 
IMX28 doesn't do it, someone else might do it in the future.

> +
>  endif # USB_EHCI_HCD
>  
>  config USB_OXU210HP_HCD
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index d7a3c8d13f6b..f592cc26e494 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -258,6 +258,14 @@ struct ehci_hcd {			/* one per controller */
>  						/* us budgeted per uframe */
>  	struct list_head	tt_list;
>  
> +#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
> +	/* Overrides to fix up broken implementations */
> +	/* Broken IO */

Similarly, the comment should be improved.  "Overrides to fix up broken 
MMIO implementations".

Alan Stern

> +	void (*ehci_writel)(const struct ehci_hcd *ehci,
> +			    const unsigned int val, __u32 __iomem *regs);
> +	unsigned int (*ehci_readl)(const struct ehci_hcd *ehci, __u32 __iomem *regs);
> +#endif
> +
>  	/* platform-specific data -- must come last */
>  	unsigned long		priv[] __aligned(sizeof(s64));
>  };
> @@ -762,6 +770,10 @@ static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
>  		readl_be(regs) :
>  		readl(regs);
>  #else
> +#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
> +	if (ehci->ehci_readl)
> +		return ehci->ehci_readl(ehci, regs);
> +#endif
>  	return readl(regs);
>  #endif
>  }
> @@ -788,6 +800,10 @@ static inline void ehci_writel(const struct ehci_hcd *ehci,
>  #else
>  	if (ehci->imx28_write_fix)
>  		imx28_ehci_writel(val, regs);
> +#ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
> +	else if (ehci->ehci_writel)
> +		ehci->ehci_writel(ehci, val, regs);
> +#endif
>  	else
>  		writel(val, regs);
>  #endif
> -- 
> 2.53.0
> 
