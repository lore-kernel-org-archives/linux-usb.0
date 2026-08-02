Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CC5390601;
	Sun,  2 Aug 2026 08:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660115; cv=none; b=SvueE+J64Na2J8fI3P659EwBhXsHZeeiZZMlb/wuVL19S0KzCJEYuS+wVJqBrzzYm0BPp3vzxsuWN1P3ncjJ97Lqj0euoGtUCsrLoiQgjLiZxfd63U5L0Jfl96C+yHbiCou0kn06YSTXcNtJfjUD63A3uRfsws5isj+EijuWdGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660115; c=relaxed/simple;
	bh=UBFQ4/nq0LXLskmxbuf+fEMvZnPC+kk8on2dh1BW9kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6Zt2t5RLAdOaK29qfh5KmqXg1g0oTXAJDhFexWoNgWEzVivtm+5g+9szOpN/Mpv44xvVR1ibiR3u2BbjrC64Tbl2oB3cFZfb1tehADg34ikTlmJY51OEb58Y95UJ6ON+LzDGY5V+cUT1RHYk25oW7lC+lllpFZiH54ax82y1PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ME+ZRB+2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ME+ZRB+2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785660113; x=1817196113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UBFQ4/nq0LXLskmxbuf+fEMvZnPC+kk8on2dh1BW9kU=;
  b=ME+ZRB+2gzGfw9qDjMionWjIPxxyC1ST4SbspRWqfBjmfpmee9liLMzn
   HDeHZSliAMLkYR13/THezDx9ZVlsjgw20WcLmDlHxD34oWEzff0YR3ZQv
   fiVniv7g9TJ642ZU/idEBTv+cKmHdcw4k9MXnqQLQ1zrKMrSrLsSrL8gc
   bB/gpPxthGjJ3W50JMr5cf0/Kuf9uNZOzKegdD4Q+DEX9ZloEUkgTMMc+
   TdIlxSLGpXFTEgEE96uuTlHzyBKTuz4+jK+KWn2ubvarc3h3HVoBLbKmk
   rO/sTjHDE2sfFDVGEf4Gyh1RpNrHftrZuFDccUSA4FM9/AuOduISENpjW
   A==;
X-CSE-ConnectionGUID: WS76VPEOQtypDUAlWJ6Qyw==
X-CSE-MsgGUID: f0W9ZBTbSyavJ7zfBqYy0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="89903155"
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="89903155"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 01:41:52 -0700
X-CSE-ConnectionGUID: kaNSgnylRh282nPbXGWBXw==
X-CSE-MsgGUID: PNS5obIuSH+a8rdh6MRgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,200,1779174000"; 
   d="scan'208";a="260392713"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Aug 2026 01:41:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 342D199; Sun, 02 Aug 2026 10:41:49 +0200 (CEST)
Date: Sun, 2 Aug 2026 10:41:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: validate DROM entry lengths
Message-ID: <20260802084149.GM20844@black.igk.intel.com>
References: <20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn>

Hi,

On Fri, Jul 31, 2026 at 10:20:54PM +0800, Pengpeng Hou wrote:
> tb_drom_parse_entries() checks that a DROM entry does not run past the
> end of the DROM, but it does not require the declared entry length to
> cover the entry header itself. A one-byte generic string entry therefore
> makes the payload length calculation underflow.
> 
> Require each entry to contain its two-byte header before dispatching to
> the type-specific DROM entry parsers. Also require a USB4 product
> descriptor entry to contain the vendor and product fields read by its
> parser.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
> Changes since v1: https://lore.kernel.org/all/20260706091532.77293-1-pengpeng@iscas.ac.cn/
> - use the full author name in From and Signed-off-by as requested by
>   Mika Westerberg
> - validate the fields read from USB4 product descriptor entries
> - rebase onto the current tree
> 
>  drivers/thunderbolt/eeprom.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 5681c17f82ec..87ae1b8d7c82 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -348,6 +348,12 @@ static int tb_drom_parse_entry_generic(struct tb_switch *sw,
>  		const struct tb_drom_entry_desc *desc =
>  			(const struct tb_drom_entry_desc *)entry;
>  
> +		/* Header, USB spec, vendor ID, and product ID. */

Can't you just compare to the desc here since that's the structure we find
there in that entry?

> +		if (header->len < sizeof(*header) + 3 * sizeof(u16)) {
> +			tb_sw_warn(sw, "USB4 product descriptor entry is too short\n");
> +			return -EIO;
> +		}
> +
>  		if (!sw->vendor && !sw->device) {
>  			sw->vendor = desc->idVendor;
>  			sw->device = desc->idProduct;
> @@ -414,9 +420,16 @@ static int tb_drom_parse_entries(struct tb_switch *sw, size_t header_size)
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
> +		if (entry->len < sizeof(*entry) ||
> +		    entry->len > drom_size - pos) {
>  			tb_sw_warn(sw, "DROM buffer overrun\n");
>  			return -EIO;
>  		}
> -- 
> 2.50.1
