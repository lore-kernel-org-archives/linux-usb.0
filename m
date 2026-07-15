Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F5E3B42D8;
	Wed, 15 Jul 2026 05:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094671; cv=none; b=HuBUiTa7tk8oGNYrTAy1KBCWYdH2iGiGBKqYwTpe6sd6to675d8Vx/Ss1QtfvdKWE/5NQXOt5YmT9vkQqB378sUFtLVbyEqpbnNA5/PAq7H4mNyjCskC4qWeDIx4QCC1Qi1ao7pE87bboRj2O+UvhWNsjc8O6u8nT9MH9SouxFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094671; c=relaxed/simple;
	bh=72wDjIEO90hX5dbR8nrzM4YshZz0nUG9T3MaZH5rvJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/4LqMseJ8i6mH4SORhYbKsbp/udtPohYbM2SwvwWuVWxcuZpAq3xRtzRO9YCgczrIxy+T3VoVd1/IiFl2l3S+cbJFw77/ZgNjRM5wBJVjdm1mommntAH7OuZgqlFBnU8r1H/1RgnOrOkHRsV/f67c7cnuHDtLvhPu3KB+bMK7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7HEj0dG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7HEj0dG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A521F000E9;
	Wed, 15 Jul 2026 05:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784094669;
	bh=5Uhm9WL25MHP7FkVScViCtVhbXA1uyH+iIfdkQB+RMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i7HEj0dG/1KzjYBdlVTC4xDg2SsUGQCzXHsR5t6BMRhwYMXhhXDyHwBYDWTdGJxXi
	 BPwDmoTTp1Hp9cLaI6k7oJg65LID79ZvfQtAqnHo24kdloJs/nXBmTD46oODrhYHFN
	 oYsuwEeBGinWGJ0cyeS+b75bsZDWEvpwUcWVF0yDX1fhjMoGoDkqy0bzaEpvjV0rMI
	 RnE6PkpzoMs8e+SL57VQRn5bhZS0KbUfj9XysWPpVXkSFK0gCgsYv6n8OekF9aoFyr
	 kbWx8hYlzUVbiGfTE2PRcuz/YJ9Uiid8MkWiRlxkmkdmvoqtxx8xx9mHQv33CpS1Si
	 nVMdp05WyT0eQ==
Date: Tue, 14 Jul 2026 22:51:08 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Daniel Palmer <daniel@thingy.jp>
Cc: gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: Re: [RFC PATCH 2/2] usb: chipidea: use the generic ehci_writel
 override for i.MX28
Message-ID: <alcfzDBAtuSZG3pq@hu-petche-lv.qualcomm.com>
References: <20260713122205.1350933-1-daniel@thingy.jp>
 <20260713122205.1350933-3-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713122205.1350933-3-daniel@thingy.jp>

On 26-07-13 21:22:05, Daniel Palmer wrote:
> From: Daniel Palmer <daniel@0x0f.com>
> 
> The EHCI core carries an imx28_write_fix flag baked into ehci_writel()
> that special-cases the i.MX28's need for a swp instruction when writing
> the EHCI registers.
> 
> Now that the EHCI core provides a generic ehci_writel override hook,
> convert the chipidea host glue to install its own writel via that hook
> and drop the i.MX28 special case from the core, keeping ehci_writel()
> free of SoC-specific knowledge.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  drivers/usb/chipidea/Kconfig |  1 +
>  drivers/usb/chipidea/host.c  | 17 ++++++++++++++++-
>  drivers/usb/host/ehci.h      | 19 ++-----------------
>  3 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> index bab45bc62361..5bada84943e2 100644
> --- a/drivers/usb/chipidea/Kconfig
> +++ b/drivers/usb/chipidea/Kconfig
> @@ -29,6 +29,7 @@ config USB_CHIPIDEA_HOST
>  	bool "ChipIdea host controller"
>  	depends on USB_EHCI_HCD
>  	select USB_EHCI_ROOT_HUB_TT
> +	select HAVE_BROKEN_EHCI_HCD if SOC_IMX28

Is the SoC you are trying adding support imx28? If it is not, I could not
understand why you add this patch.

Peter

>  	help
>  	  Say Y here to enable host controller functionality of the
>  	  ChipIdea driver.
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index ced6076a8248..820bdea5da12 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -117,6 +117,18 @@ static irqreturn_t host_irq(struct ci_hdrc *ci)
>  	return usb_hcd_irq(ci->irq, ci->hcd);
>  }
>  
> +#ifdef CONFIG_SOC_IMX28
> +/*
> + * The i.MX28 needs a swp instruction rather than a normal write to the
> + * EHCI registers; provide it through the generic ehci_writel override.
> + */
> +static void ci_hdrc_ehci_writel(const struct ehci_hcd *ehci,
> +				const unsigned int val, __u32 __iomem *regs)
> +{
> +	asm("swp %0, %0, [%1]" : : "r"(val), "r"(regs));
> +}
> +#endif
> +
>  static int host_start(struct ci_hdrc *ci)
>  {
>  	struct usb_hcd *hcd;
> @@ -150,7 +162,10 @@ static int host_start(struct ci_hdrc *ci)
>  	ehci->caps = ci->hw_bank.cap;
>  	ehci->has_hostpc = ci->hw_bank.lpm;
>  	ehci->has_tdi_phy_lpm = ci->hw_bank.lpm;
> -	ehci->imx28_write_fix = ci->imx28_write_fix;
> +#ifdef CONFIG_SOC_IMX28
> +	if (ci->imx28_write_fix)
> +		ehci->ehci_writel = ci_hdrc_ehci_writel;
> +#endif
>  	ehci->has_ci_pec_bug = ci->has_portsc_pec_bug;
>  
>  	priv = (struct ehci_ci_priv *)ehci->priv;
> diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
> index f592cc26e494..616b01314bfe 100644
> --- a/drivers/usb/host/ehci.h
> +++ b/drivers/usb/host/ehci.h
> @@ -218,7 +218,6 @@ struct ehci_hcd {			/* one per controller */
>  	unsigned		has_synopsys_hc_bug:1; /* Synopsys HC */
>  	unsigned		frame_index_bug:1; /* MosChip (AKA NetMos) */
>  	unsigned		need_oc_pp_cycle:1; /* MPC834X port power */
> -	unsigned		imx28_write_fix:1; /* For Freescale i.MX28 */
>  	unsigned		spurious_oc:1;
>  	unsigned		is_aspeed:1;
>  	unsigned		zx_wakeup_clear_needed:1;
> @@ -778,18 +777,6 @@ static inline unsigned int ehci_readl(const struct ehci_hcd *ehci,
>  #endif
>  }
>  
> -#ifdef CONFIG_SOC_IMX28
> -static inline void imx28_ehci_writel(const unsigned int val,
> -		volatile __u32 __iomem *addr)
> -{
> -	__asm__ ("swp %0, %0, [%1]" : : "r"(val), "r"(addr));
> -}
> -#else
> -static inline void imx28_ehci_writel(const unsigned int val,
> -		volatile __u32 __iomem *addr)
> -{
> -}
> -#endif
>  static inline void ehci_writel(const struct ehci_hcd *ehci,
>  		const unsigned int val, __u32 __iomem *regs)
>  {
> @@ -798,13 +785,11 @@ static inline void ehci_writel(const struct ehci_hcd *ehci,
>  		writel_be(val, regs) :
>  		writel(val, regs);
>  #else
> -	if (ehci->imx28_write_fix)
> -		imx28_ehci_writel(val, regs);
>  #ifdef CONFIG_HAVE_BROKEN_EHCI_HCD
> -	else if (ehci->ehci_writel)
> +	if (ehci->ehci_writel)
>  		ehci->ehci_writel(ehci, val, regs);
> -#endif
>  	else
> +#endif
>  		writel(val, regs);
>  #endif
>  }
> -- 
> 2.53.0
> 

-- 

Thanks,
Peter Chen
