Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D0033F361;
	Tue, 11 Aug 2026 04:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786421035; cv=none; b=f872amk3BGM85IQb+VUi/KAifUZRm8xQpBP3gi5GhZ8XEamx+tyvXj8nKV7P6ZPmNpW/LKLDJe7McdhptVdF+c+OIi5bMBY7bhYmaUwfsc6dQbD7DyOIPWMFkI0VguCRvyF1ygjuhoC8vQLJui6Rr6f6RG1eQT1rrMydi7bTrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786421035; c=relaxed/simple;
	bh=LbA4FA558ylgtlVl2t9c4qFUW6Yltp59ToJnfj8HRJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFMMy/iHjsdiwg5iZhATRKJpXugPJEGahiKCmj62eQlK74n6xgkGoq/Q5t+AoHc3WU19VV9ba39GTM7SSudT1huOovnO2yVkw8Yc4mdszvyJc5b39PVGH3Wo8EZzzCFuvaXVaEyFhL76Ct+4Z8IOl29twDhLcugBMkPhUNHAnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VM3Jmcqb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VM3Jmcqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786421031; x=1817957031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LbA4FA558ylgtlVl2t9c4qFUW6Yltp59ToJnfj8HRJk=;
  b=VM3JmcqbyMFBB+IAKWXEc2MG+ry+QAAA2r0AsOEjdRFReSm/brvJ6dDu
   Fn+CHH5tWAk2Y3BuWzgBhPsHUVmtHN4JCe5zoqzGFe2LOtOEXKEv87Ixx
   7/rfMqlsyPQZQ9c64ZnJpxBv75zxtnQN9jm27YbiU2MnQ3Jso1jyokQx6
   FvwrYq5ydDzUF9j5n3om7cHlXrt4EAHRLrsAfyZh1WMqxCaVgv5QO24L8
   W3Nr4gSKave7NLg6DglAng5g3BQ75iKhJcXC3sXc66+WXye4PXigTOyhr
   hxyrKCDPuM3xpQC6bFwwXDvtx7lkkgc2aUkg3cmOxaqwcIg7fVYyC0YAL
   w==;
X-CSE-ConnectionGUID: FAkQ5pcwRt6vUcIenvJr1g==
X-CSE-MsgGUID: cw+jLgnMTBGOen5p5rcw3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86799836"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86799836"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 21:03:50 -0700
X-CSE-ConnectionGUID: j+JHqkUfQkSVZuT2U/fyXg==
X-CSE-MsgGUID: Wv7P5xhiSLKy49LH9A2nEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259371661"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2026 21:03:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2CCD199; Tue, 11 Aug 2026 06:03:48 +0200 (CEST)
Date: Tue, 11 Aug 2026 06:03:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: fy15309206903@gmail.com
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Clamp DMA tunnel credits to what a hop
 register can hold
Message-ID: <20260811040348.GJ893316@black.igk.intel.com>
References: <20260810-tb-dma-credit-clamp-v2-1-e81af742994d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-tb-dma-credit-clamp-v2-1-e81af742994d@gmail.com>

Hi,

On Mon, Aug 10, 2026 at 12:14:13PM +0000, Fan Ye via B4 Relay wrote:
> From: Fan Ye <fy15309206903@gmail.com>
> 
> struct tb_regs_hop::initial_credits is 7 bits wide, but neither of the
> values tb_tunnel_alloc_dma() picks from is bounded by that: the
> dma_credits module parameter has no upper limit, and neither does the
> host router's baMaxHI. A larger count survives until tb_path_activate()
> copies it into the register and keeps the low bits, leaving the path on
> a credit count nobody asked for.
> 
> Clamp it in tb_tunnel_alloc_dma(), the only entry point for DMA tunnels;
> every step below it can only lower the value further. Carry the count in
> an unsigned int while at it.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Fan Ye <fy15309206903@gmail.com>

Applied to thunderbolt.git/next, thanks!
