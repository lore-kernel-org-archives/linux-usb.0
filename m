Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675DC1A239A;
	Wed, 19 Aug 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787142733; cv=none; b=r4Z6kRxi7fwo7jPnf0ZnGNL0RWHjEcfi8ByhpeF4o6xrJotTYdLKy19UYK4x8eYaI3EFNwYlPk5FrFnO84rlVNDqGgqK5KuHbfJ0z6TUM12CEyOMxMUmKo5fYDNQpZutgkjnyQzlK6oPK3RJKzVwNcvX2LOeuPkcKlJD12d1bH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787142733; c=relaxed/simple;
	bh=5awv0K86NtUvA5TxT3UGh/LUQAJH88EpiXJkQgp3P4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RHC1CJPxQy8CztBhLNyBi+G1+yVwC0/SQNFn4psbswmOUu+8IqP18YxANDNS0H1qqePTVFWolAPIcJjVoJ8+vMitJDA7CjbxppU0NKLYqvjreS9X5a70xde6GTqrQkLXaf1aB1ByFA/o/Yvr+p2/+oTZCE8RQsw4o3+1afUDYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKYuOGHa; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKYuOGHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787142731; x=1818678731;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5awv0K86NtUvA5TxT3UGh/LUQAJH88EpiXJkQgp3P4Q=;
  b=BKYuOGHavLiFdLxlWl+C8Va4Y0chf4SNDsZgngTT6f4TmiPm6XW49v0Q
   QkWwN16xs4J7KWe1Ln4ktdind0T+P9dD6OkFAeYYjMt0/R6BGznnxxWrd
   mE7DttILioB82RKvhsTQjo2iScsJbMKOvgBoXhY6RNaBVihoozk624AO5
   UzZaBg7zABhRveHY2ge0AAyjNAOBflt5aM+Bk9O5UNeHmQjwMRRp/Dc2T
   QPc9FuwJ+8IdPjTTx/ClU+cvjrLAGHjEh5TJluyqzfdai91ztJHl6b6VB
   de0/T+S0mw9TD6FO47sdO/6nys/3VpPOsHQbUkTkqW5mxBG8B7pvpaSW0
   w==;
X-CSE-ConnectionGUID: duARWLN8Sr2ms4Ad5kizmA==
X-CSE-MsgGUID: 8iEswKVxR5y01nctUDZ0ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="91463674"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="91463674"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 05:32:08 -0700
X-CSE-ConnectionGUID: zRRwmVI+T2anVlPjL196gA==
X-CSE-MsgGUID: G6Y0jIgGQdW7FlUGrM9KMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="263783774"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.137]) ([10.245.244.137])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 05:32:05 -0700
Message-ID: <593d88f8-f719-4f95-bce6-22fb61686f13@linux.intel.com>
Date: Wed, 19 Aug 2026 15:32:02 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] early: usb: xhci-dbc: Handle out of bounds xhci-xdbc
 capability
To: Umang Jain <uajain@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260720191249.1272328-1-uajain@igalia.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260720191249.1272328-1-uajain@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 7/20/26 22:12, Umang Jain wrote:
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
>   drivers/usb/early/xhci-dbc.c | 94 +++++++++++++++++++++++++++++++++---
>   drivers/usb/early/xhci-dbc.h |  1 +
>   2 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 41118bba9197..5e540b6bf962 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -35,10 +35,23 @@ static bool early_console_keep;
>   static inline void xdbc_trace(const char *fmt, ...) { }
>   #endif /* XDBC_TRACE */
>   
> +/* Size of xHCI debug capability structure */
> +#define XDBC_MAPPING_SIZE	56

I know spec says 56 bytes, but when looking at the Debug capability structure
in xhci section 7.6.8. it looks like 64 bytes.

Addresses 3F-00H from the dbc ext cap offset

I'd change this to 64 just to be sure

> +
> +enum xdbc_capability_flags {
> +	XDBC_CAP_FLAG_NONE		= 0,
> +	XDBC_CAP_FLAG_LEGACY		= 1 << 0,
> +	XDBC_CAP_FLAG_PROTOCOL		= 1 << 1,
> +	XDBC_CAP_FLAG_DEBUG		= 1 << 2,
> +};
> +
>   static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   {
> -	u64 val64, sz64, mask64;
> +	u64 val64, sz64, mask64, fixmap_size, mapped_size;
> +	enum xdbc_capability_flags cap_flags = XDBC_CAP_FLAG_NONE;
> +	bool found_all_caps = false;
>   	void __iomem *base;
> +	int offset;
>   	u32 val, sz;
>   	u8 byte;
>   
> @@ -85,7 +98,72 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>   
>   	xdbc.xhci_start = val64;
>   	xdbc.xhci_length = sz64;
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

Do you know if it ever had to go past first fixmap_size (first iteration)
to find the XHCI_EXT_CAPS_DEBUG and the other needed capabilities?

If not then we could maybe skip the feature to iterate over entire xdbc.xhci_length.
Just check for the extended capabilities in first fixmap_size, and fail if not found there.

> +		val = readl(base + offset);

We should make sure offset < fixmap_size before reading 'base + offset'

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

xhci_find_next_ext_cap() only returns 0 if there are no extended capabilities left.
(in cases where ID is set then it returns 0 if no extended capabilities with that ID are left)

I think we need to do something like:

if (!offset) {
	break; /* exit, failed case */
} else if (offset > fixmap_size) {
	iounmap()
	ioremap(val64 + mapped_size, fixmap_size)
	...
	OR just break/exit/fail if we decide to just check first fixmap_size
}

Thanks
Mathias

