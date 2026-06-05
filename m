Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A53A783B;
	Fri,  5 Jun 2026 18:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683372; cv=none; b=Z2S2ucX3k5woa23Lb6jH6VFgX+Nh2j8JtccqEWASR/BXGRgzxX7ufY2whiU6DbVNQlJwLwQ/yhkZPoNuSYDS5+MNkZSBtqdelRAJp3McvQwBWfxxfg83tcT5LMX3mrMi6yL7w2oxPBp0rHegO7J+/L9JSTego7oWnof98uK5LcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683372; c=relaxed/simple;
	bh=2SJmGYKeHcbYh/1VQINjZhulcecoKpdDpZPbYOAjJ0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZLE8SFzf96veC9H36FnbJwAPJd/hAhOFq4eqOdMD7vQ7jj0OfSyzEtz8R8ZM8JYF8PVQ1GoYaD2cuRJKVBs1Ro0YIA8thZvpq9ay/SBiRRBGO0keFkVATHLJ5SiQc4QLQuSevbG5Gq0EuH5iU4XgwglTKnYfv1SOIkW4E0Qp3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBa0vHam; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBa0vHam"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780683371; x=1812219371;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2SJmGYKeHcbYh/1VQINjZhulcecoKpdDpZPbYOAjJ0U=;
  b=JBa0vHamn7XpDPr6UQw3mFQilGVeLLHjKfvj/QRMPc0vMd/ydakMjYXv
   LGCRKV0kkhPjQmMgaY2u+tXXcMq/HpUvuPmYMK21peddrbSTPQhkEMju6
   3Ds6777UqLupeCc/wJ3KBpxdVsYhE7OYZwsCtF6z+2bev9GB9onX2Ziqf
   SV9n70vepE1ubFuYHrJT3sjSIzNGPrJX0tCuAOERqyU+SvTdSB6r/zAxc
   R5E/qkU+46PgbPVergVmdC3rAybrEtBtNZdjm9zlbbcpVnJI0+Wjgl+Nd
   acCFaQ6YhOAvum1qnhbOfD9sw+UNdG61jr8Y5sblyTwwl7jMsVqAjItwG
   A==;
X-CSE-ConnectionGUID: p/EIlvvqT7OuWGq6Ujz83A==
X-CSE-MsgGUID: uP7dI+17Q06eizx/KjgdaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="93010930"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="93010930"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:16:10 -0700
X-CSE-ConnectionGUID: RpzaD1aPR7+f0xCriMuHcA==
X-CSE-MsgGUID: mViOkAfYRCGUu8bltqUnxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="244965130"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.223]) ([10.245.245.223])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 11:16:09 -0700
Message-ID: <8d88e66a-c5bb-4f6c-b1a0-3f3b00a84540@linux.intel.com>
Date: Fri, 5 Jun 2026 21:16:06 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 2/3] early: usb: xhci-dbc: Handle out of bounds
 xhci-xdbc capability
To: Umang Jain <uajain@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260604144122.962236-1-uajain@igalia.com>
 <20260604144122.962236-3-uajain@igalia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260604144122.962236-3-uajain@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 6/4/26 17:41, Umang Jain wrote:
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

Patch 1/3 can probably be merged into this one.

> Signed-off-by: Umang Jain <uajain@igalia.com>
> ---
>   drivers/usb/early/xhci-dbc.c | 47 +++++++++++++++++++++++++++++++++---
>   1 file changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 8ce362a90910..1f6a129d4b5d 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -35,10 +35,13 @@ static bool early_console_keep;
>   static inline void xdbc_trace(const char *fmt, ...) { }
>   #endif /* XDBC_TRACE */
>   
> +#define XDBC_MAPPING_SIZE 56
> +

I know spec says 56 bytes, but when looking at the Debug capability structure
in xhci section 7.6.8. it looks like 64 bytes.

>   static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   {
> -	u64 val64, sz64, mask64;
> +	u64 val64, sz64, mask64, fixmap_size, mapped_size;
>   	void __iomem *base;
> +	int offset;
>   	u32 val, sz;
>   	u8 byte;
>   
> @@ -85,8 +88,46 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   
>   	xdbc.xhci_start = val64;
>   	xdbc.xhci_length = sz64;
> -	base = early_ioremap(val64, sz64);
> -	xdbc.xhci_base_length = sz64;
> +
> +	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
> +	if (sz64 < fixmap_size) {
> +		xdbc.xhci_base_length = sz64;
> +		return early_ioremap(val64, sz64);
> +	}
> +
> +	/*
> +	 * Base address size is greater than fixed size boot mappings,
> +	 * hence iterate over the region one fixmap_size at a time.
> +	 */
> +	base = early_ioremap(val64, fixmap_size);
> +	offset = xhci_find_next_ext_cap(base, 0, 0);
> +	mapped_size = fixmap_size;
> +
> +	while (mapped_size <= sz64) {
> +		val = readl(base + offset);
> +		if (XHCI_EXT_CAPS_ID(val) == XHCI_EXT_CAPS_DEBUG) {
> +			if (offset + XDBC_MAPPING_SIZE > fixmap_size) {
> +				early_iounmap(base, fixmap_size);
> +				base = early_ioremap(val64 + offset, XDBC_MAPPING_SIZE);

Took a closer look and it turns out we do sometimes need to touch registers in other
extended capabilities. Mainly BIOS handoff in XHCI_EXT_CAPS_LEGACY and port reset in
XHCI_EXT_CAPS_PROTOCOL

In the case where xHC size is larger than early_ioremap() allows I would just
early_ioremap() maximum allowed size once, starting from xdbc.xhci_start.
Then walk the extended capabilities list ensuring DbC and the other needed capabilities
are inside this maximum allowed size.
early_iounmap() and fail if not.
   
This way we can also access the normal xHC host registers in case we need to reset the
controller, or ensure the 'controller not ready' bit is clear.

Thanks
Mathias
