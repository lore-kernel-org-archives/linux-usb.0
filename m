Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5F3EB0F0;
	Mon, 27 Jul 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785152069; cv=none; b=gzlT2DZOjfvanPEkumLq2IVrayBRe0fXpQaBLbJba7MHIR7miB9s6ey29/+8C8uXIGCIv5AMRG0EBU82N6FWgpCzYgETA3AKzKm8Nss3RSfglXKe+SyCge2mtqt1OMf+ze0OgPC0/7Ds3yrUNEg0wUk4lhbnzP/+suYToAiMW7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785152069; c=relaxed/simple;
	bh=wS/Vxz0LxTYwlkR1uEvBBElCcIn21eOBUxyjkz7aZsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4XNWlTVph1/JgM3flpTHfLxYJmhuNppRcGyWw/rXGYdCayAzrajN/MFSqsd5HNVTWHddbcqei5gvFcBCUVMaXwUvUc0ddC++b2nPfF0Ha+gOhS2Wo83zD4ZfAPuTeBrp0MAxUqkthRF9+jwphckTyWNMuaSDh1PvUqnaFIzwp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MN/hDQrd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MN/hDQrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785152067; x=1816688067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wS/Vxz0LxTYwlkR1uEvBBElCcIn21eOBUxyjkz7aZsA=;
  b=MN/hDQrdu2Ixc/UIlYw4YS/Kc+y5OHeeDobt2M6COiQhbF33hBrd7rTr
   ZyywTvhnJcFJt8kPlgo9T/KLbUWO98In7jQ2iMVgML9UQoj0agUeqV7QF
   tXbMAexSyL9Bw81Wjn2rvxs1YV8FeUo7gPXZrjK0drH/w1du+LazCAtLp
   RXw5+1Zzk33NSXdC3LAkCS1ZCI7IvSVGpX1yoOX+9GhvAAQwW+Tmob7Yl
   vTpWEeH387w1DVc3gS3hXZDcadX/+HotvQwOFoL6pXM56F4JIhoYPHpNo
   ZUD3gSUpmqJuhmR7aZoLJzaoXfLb41qi+vyr+7hMNCpFKIC0Q0d6MCqjt
   g==;
X-CSE-ConnectionGUID: z7+iXYPpQp6A9RfIx2HyJg==
X-CSE-MsgGUID: OztloS1KQamt+FwzgAkB+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="103128314"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="103128314"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 04:34:27 -0700
X-CSE-ConnectionGUID: MmP0QmitQLCc+DwBn1kmUg==
X-CSE-MsgGUID: 2dWvIcHaT+KrQgNft34lAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="297616262"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 27 Jul 2026 04:34:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 4D9A499; Mon, 27 Jul 2026 13:34:24 +0200 (CEST)
Date: Mon, 27 Jul 2026 13:34:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: validate DROM entry lengths
Message-ID: <20260727113424.GK2365036@black.igk.intel.com>
References: <20260706091532.77293-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706091532.77293-1-pengpeng@iscas.ac.cn>

On Mon, Jul 06, 2026 at 05:15:32PM +0800, Pengpeng Hou wrote:
> From: Pengpeng <pengpeng@iscas.ac.cn>
> 
> tb_drom_parse_entries() checks that a DROM entry does not run past the
> end of the DROM, but it did not require the declared entry length to
> cover the entry header itself.
> 
> Require each entry to contain its two-byte header before dispatching to
> the type-specific DROM entry parsers.
> 
> Signed-off-by: Pengpeng <pengpeng@iscas.ac.cn>

Can you add your full name to the From and SoB?

> ---
>  drivers/thunderbolt/eeprom.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 5681c17f82ec..270bb34aff42 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -414,9 +414,15 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
>  	int res;
>  
>  	while (pos < drom_size) {
> -		struct tb_drom_entry_header *entry = (void *) (sw->drom + pos);
> -		if (pos + 1 == drom_size || pos + entry->len > drom_size
> -				|| !entry->len) {
> +		struct tb_drom_entry_header *entry;
> +
> +		if (drom_size - pos < sizeof(*entry)) {
> +			tb_sw_warn(sw, "DROM buffer overrun\n");
> +			return -EIO;
> +		}
> +
> +		entry = (void *)(sw->drom + pos);
> +		if (entry->len < sizeof(*entry) || entry->len > drom_size - pos) {
>  			tb_sw_warn(sw, "DROM buffer overrun\n");
>  			return -EIO;
>  		}
> -- 
> 2.43.0
