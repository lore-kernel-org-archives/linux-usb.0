Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087822C324C
	for <linux-usb@vger.kernel.org>; Mon, 29 Jun 2026 05:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709753; cv=none; b=PpU8wfpb8Z/3dGPlPlZnSYDtKdTNB5ZiyLR6eVpG6+h9uybSugMtAYIeyVjPE/QG9Tm+RekvOFQPHla5FKSLFVxSslqs9PKkRS8MAQXFfMc7M7GJVlT+mjKk8l8N3XBLG+6r7c1fwI9c+wosW1Nd4fwZ/Ds9EnHBO5sVYzklu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709753; c=relaxed/simple;
	bh=OpZDIxmT4tyvY+jqNo/Ihr4kIhSVQJd+lLeKHTXXaEs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AArtno1X+ip+pOsJ/gIfeupYjaDbh3rxOesFjxxNx6bxEqjPMBWBbQIB6cXBCWeUTVwiDZWRSO1zdZ13L4Yh9wUfnFf1x7mJejRHsHrH3k5vOZQIsJSLCwyY52+bALTsOfmaXP2AF+HrTEwvc9EQmakPYCIsXOoxw2BL5dCefY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OK3ZcX+s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OK3ZcX+s"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-46e4764ca48so2724549f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 28 Jun 2026 22:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782709750; x=1783314550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6OKDAmxvRGxTewczytplZi38XRSpEi2mkwnsgdP2A4=;
        b=OK3ZcX+sGiVgE2sidqPP/KJIunEtx4vV6SxSCAWZSXkRMyNjUEV7K+blOhb+j09vJH
         6uk7cF/kh8BsSZlV784WEWl7toyHnFns15idM6RSGdsWzFUL3I2aIVK8vEM5kDWQmQ9U
         vgcFWiFY7ZHntrt9NVmMAEmrzqObkmXKVAzWZ6kV61CrAynuNxha9+mazrqBxVHoF2LK
         /1nwcCsEayWm6zF0axLOIZGgRM+w2L4DeTAkwrOnEAYhj8Fj3VKgQ1KwEENftZssEjHz
         un94K+bNf+2aAAkxq5YFZRoN7O5Mqq2ag/Q0naVYZ3T5EXkJu8JAT0K3vSgdGrcFgQqj
         7bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709750; x=1783314550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6OKDAmxvRGxTewczytplZi38XRSpEi2mkwnsgdP2A4=;
        b=FpdDHsozQ4et2T1aDfGyA5PFcxdm8tWiYbJmzLzwsZ8hgnVJ3TP4mWsP7SxQHDUgh9
         kyf5XAsx6GSl5TQWyswupf6w6y6AMOzaFf0GZes8lFmeqDa2fCDiIlIdnkZtOXukL8oP
         LPvGabOA7OQ8Y/wVnMV9k6zxDBCAPDj0Fu1m9xeX8MXq/aeCwdYzivF4WSig8EsaWeur
         5GnfnadOFo4jtVRhpwRlBj4SZiiEeRJGnRC1QNThcGasldYmowm/Dz5c8trrTpKitpnh
         XN6FhXmi//0PMe3oXr3oR04conxCfwCPac5h3t1wtaxCJ39BtAuHT5Y+SNldSoTBj/we
         GBxA==
X-Forwarded-Encrypted: i=1; AHgh+RogU06FMkaN4rwfc+wwMKAu7V0M0FgtPQ6YYLa5fAXedSAG8NTQGoBR2VYN5K/zWaq6t8ZukQARZqg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2lrJ3I2nLUJGip4uCUM4cMszgunoAnb24SujMTXbCtDKqBz/t
	n0JNhI6ehYR9zlroC3mCv88s27kaYswq10nNEWbK6QNngKAsDKf+P7J9
X-Gm-Gg: AfdE7cmmXrgnJhojP1G5MBL99aOkKS8CDRA+FHktP+7PbdT6UosZIOwqKD5dwlYsSix
	v4Ld1+V9YTymyhlc7gjdt25osujBmwagrdtSsTjAK++8zbyn+7v95YY1+OaR22U54akatTj2RNx
	ON5yUWvFFVYpWw66L3Xx8PLxxwvPk4wfdSz86yYN2KnUBXsrRKMsij5GNaCbULbUkmXOOxEUpKE
	u7U1jVJnNSts/bX4dcBYKkznnB0ffByHWGD+w7Whqt6+BhUhCVBFZUD0P8xf80TBBoXC3tlB4oo
	tU5RhLUE/TdUPdwWQ4L5IPlH2mfikdjnsMQxHZcUqzc+d/gCrdyyuIJYY3bX6ZSIPp0or94tznN
	bhWs/wPFkT4bTRV3fi5ChBiKdat92nipLwrIThZtvkUIVBNfq0/CnlXKS04E8MacYYbMg0o4Pia
	oWlfrFhRC4jAzGMgMJXTec29HK6PT/DWnbJ40=
X-Received: by 2002:a05:6000:4304:b0:472:c587:1a2 with SMTP id ffacd0b85a97d-472c58702c1mr6548383f8f.16.1782709749908;
        Sun, 28 Jun 2026 22:09:09 -0700 (PDT)
Received: from foxbook (bgu190.neoplus.adsl.tpnet.pl. [83.28.84.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46efd7ee1c7sm36827265f8f.14.2026.06.28.22.09.08
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 28 Jun 2026 22:09:09 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:09:06 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Xincheng Zhang <zhangxincheng@ultrarisc.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Forest Crossman <cyrozap@gmail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: xhci-pci: Limit VIA VL805 DMA addressing to 36
 bits
Message-ID: <20260629070906.37320541.michal.pecio@gmail.com>
In-Reply-To: <20260629-xhci-via-dma-fix-v2-1-380167319652@ultrarisc.com>
References: <20260629-xhci-via-dma-fix-v2-1-380167319652@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jun 2026 10:48:13 +0800, Xincheng Zhang wrote:
> The VIA VL805/806 xHCI controller advertises AC64, but fails to handle
> DMA addresses at or above 0x1000000000. On systems with large amounts of
> RAM, this can cause USB device failures when the controller is given DMA
> addresses beyond its usable address width.
> 
> Do not use XHCI_NO_64BIT_SUPPORT for this controller. That quirk clears
> the cached AC64 capability and limits DMA to 32 bits, causing unnecessary
> bouncing for addresses between 4GiB and 64GiB and hiding the controller's
> real AC64 capability from code that may need to distinguish register
> access width from usable DMA address width.
> 
> Add a separate xHCI quirk for controllers whose usable DMA address width
> is limited to 36 bits, and apply it to VIA VL805/806. This keeps AC64
> visible while restricting the DMA mask to exactly the range that the
> controller can handle.

This may turn into multiple quirks differing only in the number at the
end. For example, ASMedia chips appear to be limited to 48 bits and we
don't even know if these two are the only bad vendors. I briefly tested
Etron and NEC/Renesas, they seem to be OK, but there are others. 

The driver is getting dangerously close to filling quirks bitmap and
needing changes to support more than 64 quirks.

Alternatively, I think your 'dma_bits' variable could be allocated at
the beginning and initialized to 64, then passed by reference to
get_quirks() so it can tweak it, and lastly clamped to 32 if the AC64
capability is absent or disabled by quirk.

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Xincheng Zhang <zhangxincheng@ultrarisc.com>
> ---
> Changes in v2:
> - Replace XHCI_NO_64BIT_SUPPORT with a dedicated 36-bit DMA mask quirk.
> - Preserve HCCPARAMS1.AC64 instead of clearing it for VL805/806.
> - Limit VL805/806 DMA to DMA_BIT_MASK(36) instead of 32-bit.
> - Add a stable Cc trailer.
> - Link to v1: https://lore.kernel.org/all/20260623-xhci-via-dma-fix-v1-1-3f12c81a1cf8@ultrarisc.com/
> ---
>  drivers/usb/host/xhci-pci.c |  1 +
>  drivers/usb/host/xhci.c     | 30 ++++++++++++++++++++++++------
>  drivers/usb/host/xhci.h     |  1 +
>  3 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 039c26b241d0..e5618551e022 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -448,6 +448,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	if (pdev->vendor == PCI_VENDOR_ID_VIA && pdev->device == PCI_DEVICE_ID_VIA_VL805) {
>  		xhci->quirks |= XHCI_LPM_SUPPORT;
>  		xhci->quirks |= XHCI_TRB_OVERFETCH;
> +		xhci->quirks |= XHCI_LIMIT_36BIT_DMA;
>  	}
>  
>  	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 6922cc5496c1..fa546e5cd300 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -5506,13 +5506,31 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>  	if (xhci->quirks & XHCI_NO_64BIT_SUPPORT)
>  		xhci->hcc_params &= ~BIT(0);
>  
> -	/* Set dma_mask and coherent_dma_mask to 64-bits,
> -	 * if xHC supports 64-bit addressing */
> -	if ((xhci->hcc_params & HCC_64BIT_ADDR) &&
> -			!dma_set_mask(dev, DMA_BIT_MASK(64))) {
> -		xhci_dbg(xhci, "Enabling 64-bit DMA addresses.\n");
> -		dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
> +	/*
> +	 * Set dma_mask and coherent_dma_mask to 64-bits if xHC supports
> +	 * 64-bit addressing, unless a controller-specific quirk limits the
> +	 * usable address width.
> +	 */
> +	if (xhci->hcc_params & HCC_64BIT_ADDR) {
> +		u64 dma_mask = DMA_BIT_MASK(64);
> +		unsigned int dma_bits = 64;
> +
> +		if (xhci->quirks & XHCI_LIMIT_36BIT_DMA) {
> +			dma_mask = DMA_BIT_MASK(36);
> +			dma_bits = 36;
> +		}
> +
> +		retval = dma_set_mask(dev, dma_mask);
> +		if (!retval) {
> +			xhci_dbg(xhci, "Enabling %u-bit DMA addresses.\n",
> +				 dma_bits);
> +			dma_set_coherent_mask(dev, dma_mask);
> +		}
>  	} else {
> +		retval = -ENODEV;
> +	}
> +
> +	if (retval) {
>  		/*
>  		 * This is to avoid error in cases where a 32-bit USB
>  		 * controller is used on a 64-bit capable system.

I'm not sure if we really need this second call to dma_set_mask() below
when the first call fails? This code was added by fda182d80a0bf and it
really should have been an 'else' to the check for AC64 capbality, not
to the capability *and* having successfully enabled 64 bit DMA.

OTOH, one could argue against cleaning this up in a stable patch.

> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index d02046a573e4..e737ab36d0a3 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1647,6 +1647,7 @@ struct xhci_hcd {
>  #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
>  #define XHCI_ETRON_HOST	BIT_ULL(49)
>  #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
> +#define XHCI_LIMIT_36BIT_DMA	BIT_ULL(51)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> 
> ---
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> change-id: 20260623-xhci-via-dma-fix-c563b889ea54
> 
> Best regards,
> --  
> Xincheng Zhang <zhangxincheng@ultrarisc.com>
> 
