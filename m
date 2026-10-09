Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C92C0F6D
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791557566; cv=none; b=oml7TRRdI3Q+2CJ+doVrinCPRq6g9BwIVbXNHTgC2reBxwPaooSTshVi1w5c7yWiwKy7/WD8itsEB+UpuII1XXzQ5/ccWI4SNlGTEBUd3/9neWVOohqD6Bk/b0r9YgvcG6nHKwZ5ni/RO/5vFNpVfcQliCufJsqUyJw46iOcao0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791557566; c=relaxed/simple;
	bh=j/W0rjMStjXwrznsrjwLG2IWM+mP8O7kgmoVpAqOLYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1Wx/ToJq0J/i1MCHA8vU2aOyTNYzPwU/hRLF4KzMxLEzvW0QiywMohaQNRcujnJTpexKXsEP9kgFEHDF4CyNWXhDYBQ1bXTCk8tPhwC/xRtIqof0tbd7YSLyzxqRmWT/Qju+ttTLm3Bv4Wr1Ire4vYyUXZ7G/SDCr3wJEdUvNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AsmJQNfK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsmJQNfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791557564; x=1823093564;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=j/W0rjMStjXwrznsrjwLG2IWM+mP8O7kgmoVpAqOLYg=;
  b=AsmJQNfKB0lqunvNJlRJZRjmYC137ymACr0Epeutaf9vwdVgb07uSpTI
   tip58JE/fccdqrYG/DeZXxVyn9vlGOrmHh8MOBGagewaZmGeZXNG/d/2g
   3wuf/ml9xKIuCmfLQ5lctlAWF/BbvcBcMRO+ajrGSjNOJDpXz10Vn2Wyc
   px/JsiEuT3DyDRxRqnINbKlpkuBp3WYcMmUaxTMS/B2viu6VhJBWPe7Ah
   GU/WQzfwafFqAoLb3EFEPdH8xda6CXzce8viO0yKhfrgfVF2Dp24aghp7
   jg5DdJjtc5KZdnXsG8hSiFRZjLhpjkApCEhvnn3x4DN2IyaIAJWcZfoU/
   g==;
X-CSE-ConnectionGUID: l8pVbqV1QcWeJDiUsCXYnQ==
X-CSE-MsgGUID: UlfSDHHVQOaEH30Kj/dBhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="263597"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="263597"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 07:52:43 -0700
X-CSE-ConnectionGUID: Qe6ZRDtxSHCTqViaRVuDnQ==
X-CSE-MsgGUID: 6Vt01TD9QnuHGjRf0IPSoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="263218"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.17]) ([10.245.244.17])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 07:52:42 -0700
Message-ID: <b74c1110-6c36-4863-a40c-5a515e3ed107@linux.intel.com>
Date: Fri, 9 Oct 2026 17:52:39 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] early: usb: xhci-dbc: Handle out of bounds
 xhci-xdbc capability
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, Umang Jain <uajain@igalia.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20261009095834.561578-1-mathias.nyman@linux.intel.com>
 <20261009095834.561578-2-mathias.nyman@linux.intel.com>
 <sashiko-outbox-165202@kernel.org>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <sashiko-outbox-165202@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/26 13:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] usb: xhci-dbc: OOB MMIO read during capability traversal via truncated early_ioremap
> - [High] usb: xhci-dbc: strictly requiring optional LEGACY capability breaks valid hardware
> - [High] usb: xhci-dbc: missing bounds check allows OOB access to LEGACY capability registers
> - [High] usb: xhci-dbc: lockless unmap on ioremap failure causes UAF with active console
> - [Medium] usb: xhci-dbc: off-by-one check incorrectly rejects capabilities ending at fixmap boundary
> - [Medium] usb: xhci-dbc: missing offset=0 check processes base registers as capability
> --
> 
> commit c5569785c857fd1c3eacf9d2844609e296560040
> Author: Umang Jain <uajain@igalia.com>
> 
> early: usb: xhci-dbc: Handle out of bounds xhci-xdbc capability
> 
> This commit handles the case where the PCIe memory IO size exceeds the
> fixed boot time mappings dictated by NR_FIX_BTMAPS. It ensures that the
> xHCI debug capability can still be queried by mapping the base address
> up to the fixmap size and querying capabilities within that range. It also
> introduces xhci_base_length to track the early_ioremap() mapped size.
> 
>> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
>> index 41118bba91978..f2ed8e52cc56c 100644
>> --- a/drivers/usb/early/xhci-dbc.c
>> +++ b/drivers/usb/early/xhci-dbc.c
> 
> [ ... ]
> 
>> @@ -85,7 +98,59 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>>   
>>   	xdbc.xhci_start = val64;
>>   	xdbc.xhci_length = sz64;
>> -	base = early_ioremap(val64, sz64);
>> +
>> +	fixmap_size = NR_FIX_BTMAPS << PAGE_SHIFT;
>> +	if (sz64 < fixmap_size) {
>> +		xdbc.xhci_base_length = sz64;
>> +		return early_ioremap(val64, sz64);
>> +	}
>> +
>> +	/*
>> +	 * Base address size is greater than fixed size boot time mappings
>> +	 * hence, map maximum allowed fixmap size from base address and
>> +	 * determine if the required extended capabilities lies within the
>> +	 * fixmap.
>> +	 */
>> +	base = early_ioremap(val64, fixmap_size);
>> +	if (!base)
>> +		return NULL;
>> +
>> +	offset = xhci_find_next_ext_cap(base, 0, 0);
>> +
>> +	while (offset < fixmap_size) {
>> +		val = readl(base + offset);
> 
> [Severity: Medium]
> If xhci_find_next_ext_cap() returns 0 (indicating no capabilities found),
> doesn't this loop unconditionally enter because 0 < fixmap_size?
> 
> Inside the loop, readl(base + 0) would read the base xHCI Capability
> Registers rather than an extended capability header. XHCI_EXT_CAPS_ID(val)
> could then mistakenly extract the CAPLENGTH byte, potentially misinterpreting
> it as an extended capability ID like XDBC_CAP_FLAG_LEGACY.
> 
> Should there be an explicit check for offset == 0 before entering the loop?

will fix, but not a real world issue as all xHC hosts have extended capabilities.
without extended capabilities host won't have any ports.

> 
>> +		switch (XHCI_EXT_CAPS_ID(val)) {
>> +		case XHCI_EXT_CAPS_DEBUG:
>> +			if (offset + XDBC_MAPPING_SIZE < fixmap_size)
> 
> [Severity: Medium]
> If the 64-byte DEBUG capability struct ends exactly at the fixmap_size
> boundary (offset + XDBC_MAPPING_SIZE == fixmap_size), it is fully mapped
> and safe to access.
> 
> Does the strict less-than operator here incorrectly reject a perfectly valid
> capability that ends exactly at the boundary?
> 

will fix, this just rejects a border case that could work.

>> +				cap_flags |= XDBC_CAP_FLAG_DEBUG;
>> +			break;
>> +		case XHCI_EXT_CAPS_PROTOCOL:
>> +			cap_flags |= XDBC_CAP_FLAG_PROTOCOL;
>> +			break;
>> +		case XHCI_EXT_CAPS_LEGACY:
>> +			cap_flags |= XDBC_CAP_FLAG_LEGACY;
>> +			break;
> 
> [Severity: High]
> This accepts the LEGACY capability without ensuring its extended registers
> fit within the mapped fixmap region.
> 
> If the LEGACY capability header is located at fixmap_size - 4, the while
> condition (offset < fixmap_size) is satisfied, and the header is read.
> However, later in xdbc_bios_handoff(), the code accesses the control register
> at offset + XHCI_LEGACY_CONTROL_OFFSET (offset + 4).
> 
> Will this result in an out-of-bounds MMIO read when offset + 4 equals
> fixmap_size?
> 

will fix, size of legacy capability is 8 bytes. Odd and extremely unlucky
if these 8 bytes would cross the NR_FIX_BTMAPS << PAGE_SHIFT limit.

>> +		}
>> +
>> +		if ((cap_flags & XDBC_CAP_FLAG_DEBUG) &&
>> +		    (cap_flags & XDBC_CAP_FLAG_PROTOCOL) &&
>> +		    (cap_flags & XDBC_CAP_FLAG_LEGACY)) {
>> +			found_all_caps = true;
>> +			break;
>> +		}
> 
> [Severity: High]
> According to Section 7.1 of the xHCI specification, the "USB Legacy Support
> Capability" is strictly optional.
> 
> By requiring XDBC_CAP_FLAG_LEGACY to be present here, does this patch
> introduce a regression that breaks DbC initialization on valid, compliant
> hardware that safely omits it?

Not an issue. No regression.

This patch adds early dbc support for more hosts. Doesn't remove support.

> 
>> +
>> +		offset = xhci_find_next_ext_cap(base, offset, 0);
> 
> [Severity: High]
> Does this blindly request the next offset without verifying bounds beforehand?
> 
> Inside xhci_find_next_ext_cap(), the helper computes the offset to the next
> capability and immediately dereferences it:
> 
> xhci_find_next_ext_cap():
>      do {
>          ...
>          next = XHCI_EXT_CAPS_NEXT(val);
>          offset += next << 2;
>      } while (next);  // loops back to readl(base + offset)
> 
> If the computed offset exceeds fixmap_size, readl() will access unmapped
> MMIO memory and cause a kernel page fault BEFORE xhci_find_next_ext_cap()
> returns.
> 
> The offset < fixmap_size check at the top of the loop is too late to prevent
> this out-of-bounds access.

True, this was actually a good find.

xhci_find_next_ext_cap(base, offset, 0) does unnecessarily read the next
capability even if we don't care about the content (the capability id)

xhci_find_next_cap() was never designed to work with a limit size mmio map
of this PCI device.

Could be somewhat easily fixed in xhci_find_next_ext_cap(), but I don't want
to touch it at this stage without properly testing.
It's used everywhere, and risk of regression is high.

I'll drop this until properly fixed.

Thanks
Mathias


