Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4880175A5;
	Wed, 19 Aug 2026 05:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787116170; cv=none; b=Q/KdsdrGp5sqpe8t0/F3TVYSWHzcRx1/sHvmCOSL2T0OO0Rd8Wm5g7ebamAGN2iy2aBpQSCpZwtnDRy1ADM1SbBLmwumYlx8J+nwbVrEC+oDxxB6PAytfVkQaXKvAItJsiYuG7FE/onnQoP45tFrEa9UwYNK4emd5RKwXGjh19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787116170; c=relaxed/simple;
	bh=JPXdtqMu22uFwnuZsjhWQJdzApS20pf3kMJK44VeXLk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=I8kNaaVFuVwxlZfxc3H0huESCJUHhdUKfWdKWc7k3BJag1ij7DpdEmeGEkuLTV57PPpTOChk0bQRggSaWCt5Op1cLJXFdCc75hQRoOlhV6uC0KkYwG1GqPUZba6oT/TP7B/O/vYtHIM2mUD0nzduBA9lZK3JrDoyY/OmQ5B/bis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=NI41IFw/; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="NI41IFw/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=5wmjtrd6iYNg+RU2M2pF4ctlA1uYz5d+LSAqHfjsyFE=; b=NI41IFw/BG4N3WD9DDTXsBuNy7
	w05htmUJAfnmD/mr4jaGAL0VVz/BHuWfjLKx5UU8SHTxTrUeMfWGX1WWDR76qWTpvOgL+ojvP9BVA
	zNhF3Qd41IudBRc5XoH12gqBH8V7daqTs8uacL16YmqGjCb7WKfJ6UCiQSESeab6DJjZMWJWTFiG1
	4Q3LziJAM7GG9jfKZbwqajlfmRcdFSFgr9QeFXfWer/tvopJPaBmx6PVmCA8mDZOyA5rwVu6jONO+
	cMxOG4sxqcuVGv6VyeZtevqHFZTukhc1LK4cRozDZkO71REpWhgWIt0+KQ8QfCHbxOtLNSCoyoRum
	7fKaWUvQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwYY8-005wPB-NB; Wed, 19 Aug 2026 07:09:16 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wwYY7-00DhhL-0U; Wed, 19 Aug 2026 07:09:16 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <uajain@igalia.com>)
	id 1wwYY6-00000001ySA-403q;
	Wed, 19 Aug 2026 07:09:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 05:09:14 +0000
From: Umang Jain <uajain@igalia.com>
To: Umang Jain via Kernel-dev <kernel-dev@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi
 <demarchi@kernel.org>, Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc
 capability
In-Reply-To: <20260720191249.1272328-1-uajain@igalia.com>
References: <20260720191249.1272328-1-uajain@igalia.com>
Message-ID: <c6334beb46fa154ecd031c4617618562@igalia.com>
X-Sender: uajain@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

Hello,

Gentle ping for review feedback.

On 2026-07-20 19:12, Umang Jain via Kernel-dev wrote:
> Currently, the early xhci-dbc assumes that the extended capability
> can be mapped within the fixed boot time mappings dictated by
> NR_FIX_BTMAPS.
> 
> This patch iterates over the PCI BAR address size to find and map
> xhci-xdbc capability which could be out-of-bounds otherwise,
> in xdbc_map_pci_mmio(). The iterations map the maximum allowed
> boot time mappings (fixmap size) at a time and search for xhci-xdbc
> capability offset, till the end of the bar address size.
> 
> This brings the need to track the early_ioremap() mapped size separately
> hence, introduce additional struct member xhci_base_length in
> struct xdbc_state.
> 
> Signed-off-by: Umang Jain <uajain@igalia.com>
> ---
> Link to earlier RFC:
> https://lore.kernel.org/all/20260604144122.962236-1-uajain@igalia.com/
> ---
>  drivers/usb/early/xhci-dbc.c | 94 +++++++++++++++++++++++++++++++++---
>  drivers/usb/early/xhci-dbc.h |  1 +
>  2 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 41118bba9197..5e540b6bf962 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -35,10 +35,23 @@ static bool early_console_keep;
>  static inline void xdbc_trace(const char *fmt, ...) { }
>  #endif /* XDBC_TRACE */
>  
> +/* Size of xHCI debug capability structure */
> +#define XDBC_MAPPING_SIZE	56
> +
> +enum xdbc_capability_flags {
> +	XDBC_CAP_FLAG_NONE		= 0,
> +	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
> +	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
> +	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
> +};
> +
>  static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>  {
> -	u64 val64, sz64, mask64;
> +	u64 val64, sz64, mask64, fixmap_size, mapped_size;
> +	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
> +	bool found_all_caps = false;
>  	void __iomem *base;
> +	int offset;
>  	u32 val, sz;
>  	u8 byte;
>  
> @@ -85,7 +98,72 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>  
>  	xdbc.xhci_start = val64;
>  	xdbc.xhci_length = sz64;
> -	base = early_ioremap(val64, sz64);
> +
> +	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
> +	if (sz64 < fixmap_size) {
> +		xdbc.xhci_base_length = sz64;
> +		return early_ioremap(val64, sz64);
> +	}
> +
> +	/*
> +	 * Base address size is greater than fixed size boot mappings,
> +	 * hence iterate over the region one fixmap_size at a time,
> +	 * starting with XHCI_EXP_CAPS_DEBUG capability.
> +	 */
> +	base = early_ioremap(val64, fixmap_size);
> +	offset = xhci_find_next_ext_cap(base, 0, 0);
> +	mapped_size = fixmap_size;
> +
> +	while (mapped_size <= sz64) {
> +		val = readl(base + offset);
> +		switch (XHCI_EXT_CAPS_ID(val)) {
> +		case XHCI_EXT_CAPS_DEBUG:
> +			if (offset + XDBC_MAPPING_SIZE > fixmap_size) {
> +				early_iounmap(base, fixmap_size);
> +				base = early_ioremap(val64 + offset, XDBC_MAPPING_SIZE);
> +
> +				mapped_size += offset;
> +				cap_flags = XDBC_CAP_FLAG_NONE;
> +			}
> +			cap_flags |= XDBC_CAP_FLAG_DEBUG;
> +			break;
> +		case XHCI_EXT_CAPS_PROTOCOL:
> +			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
> +			break;
> +		case XHCI_EXT_CAPS_LEGACY:
> +			cap_flags |= XDBC_CAP_FLAG_LEGACY;
> +			break;
> +		}
> +
> +		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
> +		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
> +		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
> +			found_all_caps = true;
> +			break;
> +		}
> +
> +		/*
> +		 * Find offset to next xhci-ext capability, remap if the offset
> +		 * is out of bounds of the already mapped region.
> +		 */
> +		offset = xhci_find_next_ext_cap(base, offset, 0);
> +		if (!offset) {
> +			early_iounmap(base, fixmap_size);
> +			base = early_ioremap(val64 + mapped_size, fixmap_size);
> +			mapped_size += fixmap_size;
> +
> +			offset = xhci_find_next_ext_cap(base, 0, 0);
> +			cap_flags = XDBC_CAP_FLAG_NONE;
> +
> +		}
> +	}
> +
> +	if (found_all_caps) {
> +		xdbc.xhci_base_length = fixmap_size;
> +	} else {
> +		xdbc.xhci_base_length = 0;
> +		base = NULL;
> +	}
>  
>  	return base;
>  }
> @@ -643,9 +721,9 @@ int __init early_xdbc_parse_parameter(char *s, int keep_early)
>  	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
>  	if (!offset) {
>  		pr_notice("xhci host doesn't support debug capability\n");
> -		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
>  		xdbc.xhci_base = NULL;
> -		xdbc.xhci_length = 0;
> +		xdbc.xhci_base_length = 0;
>  
>  		return -ENODEV;
>  	}
> @@ -682,9 +760,9 @@ int __init early_xdbc_setup_hardware(void)
>  		xdbc.table_base = NULL;
>  		xdbc.out_buf = NULL;
>  
> -		early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +		early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
>  		xdbc.xhci_base = NULL;
> -		xdbc.xhci_length = 0;
> +		xdbc.xhci_base_length = 0;
>  	}
>  
>  	return ret;
> @@ -987,7 +1065,7 @@ static int __init xdbc_init(void)
>  	}
>  
>  	raw_spin_lock_irqsave(&xdbc.lock, flags);
> -	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
>  	xdbc.xhci_base = base;
>  	offset = xhci_find_next_ext_cap(xdbc.xhci_base, 0, XHCI_EXT_CAPS_DEBUG);
>  	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base + offset);
> @@ -1004,7 +1082,7 @@ static int __init xdbc_init(void)
>  	memblock_phys_free(xdbc.table_dma, PAGE_SIZE);
>  	memblock_phys_free(xdbc.out_dma, PAGE_SIZE);
>  	writel(0, &xdbc.xdbc_reg->control);
> -	early_iounmap(xdbc.xhci_base, xdbc.xhci_length);
> +	early_iounmap(xdbc.xhci_base, xdbc.xhci_base_length);
>  
>  	return ret;
>  }
> diff --git a/drivers/usb/early/xhci-dbc.h b/drivers/usb/early/xhci-dbc.h
> index 8b4d71de45fc..e2aefb796084 100644
> --- a/drivers/usb/early/xhci-dbc.h
> +++ b/drivers/usb/early/xhci-dbc.h
> @@ -144,6 +144,7 @@ struct xdbc_state {
>  	u32			dev;
>  	u32			func;
>  	void __iomem		*xhci_base;
> +	size_t			xhci_base_length;
>  	u64			xhci_start;
>  	size_t			xhci_length;
>  	int			port_number;
