Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D13C1D43;
	Mon, 10 Aug 2026 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361309; cv=none; b=TE1DNSiebzqTTU55NRGLWxEmDLD3Jw1mGxJVBEamgj7HvAet3CuvcuP0alJO9CC2305QSkVz0pPgtJFaa+YzHW28gK7JqlSP7cVc04+N4ZikELTDXMPpJ0NB+g/mqLL28cdE5mnZZNAyYiwBDyKn7rjRpQHfzN9yuubmjrS5R0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361309; c=relaxed/simple;
	bh=v5Rz9kHKy2KhD6Q1uV7kj+GrlnZNr/iTNfvzhQHQeAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaMa2sfIGBssBYd+7ztuzyePsCU0oa32z/mMOyrTe1iqlCvdLOhcjDlUjf6quCa58gyMHgIZkbyaMC//DWPOsS3ZOjTkrhVOIe5ix0bMjM5htb0+I1G8glbLG4my6jZKtf9sagDuT54TRPiiAzQhqi4rBj+XfqSL3kIW+fynHnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiaP5BSB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiaP5BSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786361308; x=1817897308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v5Rz9kHKy2KhD6Q1uV7kj+GrlnZNr/iTNfvzhQHQeAU=;
  b=LiaP5BSBZAup+pBzehej1FSRvftIBkL5b76Anj/tWsx+NPR/GTaRxsw2
   dy0mAYgOHPxmvuKhCTCKaXrDUZ+Ti1z5LyE/kG/Si+aq4Mus7vl1CVHlB
   7q0HIDtm7hVJ/a9vIspCb8T0Z3s090jpI7nZX001Q7tdWp8jC0KGPHsow
   Wu2uZWRIBlmtk7I+kSJ8HSwJ7vK3e9yl5hcmRqfomXJIiK2MYVbM37uzG
   Kr0rYPD3sIOheA4A3tkWAS3mx8YyJDb+kiyq01LAU3Ky4Gu1xZyE7MCLD
   6x7bkKKMC6SKbrsN6u67/3E5smcleB7oShFdkveRixzbJmcX9WrPnAF+g
   A==;
X-CSE-ConnectionGUID: syFNeCk7TPmRjzOCRuaq1w==
X-CSE-MsgGUID: 6H602Cm3RNay2cBfOAu+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="109662935"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="109662935"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:28:28 -0700
X-CSE-ConnectionGUID: 6DAr+qFGQKmKhBmlzrAZKg==
X-CSE-MsgGUID: TINHx7kUR6Wrqrxy2VLHfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="292946616"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2026 04:28:23 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AAD6299; Mon, 10 Aug 2026 13:28:18 +0200 (CEST)
Date: Mon, 10 Aug 2026 13:28:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: fy15309206903@gmail.com
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Clamp DMA tunnel credits to what a hop
 register can hold
Message-ID: <20260810112818.GH893316@black.igk.intel.com>
References: <20260810-tb-dma-credit-clamp-v1-1-69610146d164@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810-tb-dma-credit-clamp-v1-1-69610146d164@gmail.com>

Hi,

On Mon, Aug 10, 2026 at 09:38:30AM +0000, Fan Ye via B4 Relay wrote:
> From: Fan Ye <fy15309206903@gmail.com>
> 
> struct tb_regs_hop::initial_credits is 7 bits wide, so a hop can be
> programmed with 127 credits at most. tb_tunnel_alloc_dma() picks the
> credit count for a DMA tunnel out of two values that are not bounded by
> that: the dma_credits module parameter, which has no upper limit at all,
> and the host router's baMaxHI, which usb4_switch_credits_init() reads
> out of a 16-bit field and only checks for presence, never for magnitude.
> 
> What comes out is handed to tb_dma_init_rx_path() and
> tb_dma_init_tx_path(), which lower it to what the adapter has room for
> and store the result in struct tb_path_hop::initial_credits. That field
> is an unsigned int, so an oversized number survives until
> tb_path_activate() copies it into the 7-bit register field and keeps
> only the low bits. The path then runs on a credit count that neither
> the driver nor the user chose, while port->dma_credits goes on
> accounting for the number that was asked for. Nothing reports the
> difference.
> 
> The adapter has to have that many buffers for the truncation to be
> reachable, and ADP_CS_4_TOTAL_BUFFERS_MASK leaves room for it: the lane
> adapters of an ASMedia ASM4242 host router report 174. Asking such a
> router for 172 credits leaves 172 & 0x7f == 44 in the hop.
> 
> Clamp the count where it is chosen. tb_tunnel_alloc_dma() is the only
> entry point for DMA tunnels, the clamp sits ahead of every hop
> assignment and every credit accounting update, and each step below it
> can only lower the value further, so one bound covers the whole tunnel
> and the driver's bookkeeping stays in step with the hardware. Before the
> module parameter existed this line read min_not_zero(TB_DMA_CREDITS,
> nhi->sw->max_dma_credits) and could not yield more than 14.
> 
> While at it, carry the count in an unsigned int. Both min_not_zero()
> operands and every function it is passed to are unsigned already, so the
> int only added a signed detour in the middle of an otherwise unsigned
> path.

This is huge commit message for a simple thing. Can you trim them to be
of reasonable size?

> Fixes: 7ee20d0afb69 ("thunderbolt: Allow specifying custom credits for DMA tunnels")

I don't think it even needs a fixes tag.

> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Fan Ye <fy15309206903@gmail.com>
> ---
> The truncation is not reachable with the defaults. dma_credits is 14 and
> the ASM4242 in front of me reports baMaxHI 32, so 127 is never
> approached; I had to drop the baMaxHI cap with a local debug patch and
> ask for 172 to see it. Reading the hop straight back after
> tb_path_activate() had written it then showed 44 in the register. With
> this patch it shows 127.
> 
> That is not an argument for 127 being a good number to run on. On this
> hardware anything above what the router asks for costs packets - the
> receiving adapter starts dropping around 35 credits, and further up the
> control channel stops answering altogether - so the clamp is a statement
> about what the field can hold, not a recommendation.
> 
> The same 7-bit field is assigned from three other places: USB3
> (sw->max_usb3_credits, with no min() at all), DP AUX
> (sw->min_dp_aux_credits) and PCIe (min(sw->max_pcie_credits,
> available)). usb4_switch_credits_init() only checks that those buffer
> allocation values are present, never how large they are, so nothing in
> the driver stops them from passing 127 either. I left them alone because
> I have no evidence any router advertises that much there - the one I can
> read out reports 64/2/64 for USB3/DP AUX/PCIe, and the bad advertisement
> already handled in tree, quirk_dp_credit_allocation(), is 56. Should
> those get the same treatment, or does the spec bound them in a way that
> makes it unnecessary?
> 
> One thing I deliberately left alone: tb_available_credits() computes
> spare = min_not_zero(sw->max_dma_credits, dma_credits) without this
> bound, so with dma_credits set above 127 it now reserves more than a DMA
> tunnel can take, at the expense of the DP stream count. Clamping there
> too is one more line, but it changes how many DP streams fit, which is
> more than a truncation fix should do on its own.

Same here regarding the amount of text. This is too much at least to for
me.

> No Cc: stable, since reaching this needs either dma_credits set by hand
> or a router advertising baMaxHI above 127, and I have not seen the
> latter. Happy to add it if you disagree.
> ---
>  drivers/thunderbolt/tunnel.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
> index b7f32305f14a..b2a8e4950200 100644
> --- a/drivers/thunderbolt/tunnel.c
> +++ b/drivers/thunderbolt/tunnel.c
> @@ -48,6 +48,15 @@
>  #define TB_DP_AUX_PRIORITY		2
>  #define TB_DP_AUX_WEIGHT		1
>  
> +/*
> + * struct tb_regs_hop::initial_credits is 7 bits wide, so this is the most a
> + * hop can be programmed with. What feeds it is not bounded by that:
> + * ADP_CS_4_TOTAL_BUFFERS_MASK is 10 bits and the dma_credits module
> + * parameter has no upper limit at all. A larger value is stored with its
> + * top bits cut off, leaving the path on a credit count nobody asked for.
> + */

Same applies to this comment - I know LLMs have tendency to over-generate
text so it's your responsibility to cut it down to reasonable size.

> +#define TB_MAX_HOP_CREDITS		127

TB_MAX_CREDITS

> +
>  /* Minimum number of credits needed for PCIe path */
>  #define TB_MIN_PCIE_CREDITS		6U
>  /*
> @@ -1908,7 +1917,7 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
>  	struct tb_tunnel *tunnel;
>  	size_t npaths = 0, i = 0;
>  	struct tb_path *path;
> -	int credits;
> +	unsigned int credits;
>  
>  	/* Ring 0 is reserved for control channel */
>  	if (WARN_ON(!receive_ring || !transmit_ring))
> @@ -1931,6 +1940,11 @@ struct tb_tunnel *tb_tunnel_alloc_dma(struct tb *tb, struct tb_port *nhi,
>  	tunnel->destroy = tb_dma_destroy;
>  
>  	credits = min_not_zero(dma_credits, nhi->sw->max_dma_credits);
> +	if (credits > TB_MAX_HOP_CREDITS) {
> +		tb_tunnel_dbg(tunnel, "%u credits do not fit a hop, using %u\n",
> +			      credits, TB_MAX_HOP_CREDITS);
> +		credits = TB_MAX_HOP_CREDITS;
> +	}
>  
>  	if (receive_ring > 0) {
>  		path = tb_path_alloc(tb, dst, receive_path, nhi, receive_ring, 0,
> 
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260810-tb-dma-credit-clamp-eb3931e5a588
> 
> Best regards,
> --  
> Fan Ye <fy15309206903@gmail.com>
> 
