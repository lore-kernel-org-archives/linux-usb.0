Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157678;
	b=YEVPGJd6WnuLiL222Dkg1H8IjYr4xXSodNzSM/70DYBUtgqSkjWO2eRGXRX5im1hEfsP
	 uMTUIRmYbu1GufkxeNxMmuTxDrrYk69CblQXGieH1BSj0SM9ii88jw00oO9zIlEsD57td
	 AC44SGqW5AzFFGYw5Moe0DqvB+v9/uqsLh5r5A/rlVhexVxRLpQlTEKwFEioAuoSGAlnD
	 Oc0HnjZQctzXXd8SdVy/UB6uSAU0rbwjctNlJ+lo+g3d00a42he7+4jdt4XQ4b0uSzQAG
	 0+jwah7ZvJVzSpN2n3OSGXcFvEX3EvbLfJRJyIznwmnsSL7CbjFOcaZ4e5sLQuOVLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157678;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=lvXhl0QV/8/mtmUu8TyTtu7169W5LDhYCHV3ufeKZys=;
	b=KHymMzfkOVJk8TtWWDYeLVpqVPu1Ybl0qohE1shtEmzl9SHSkXy3Ku/I7giaY5I0USHh
	 FlL8ZMgbnOrvU6kVSaKzCAiFc233M5mOIIFoWMieVm1ZUHpqgJJphNitAZbmqO5L+7cWd
	 g+NqsQBeg29K1gYMdopQ1fhhFqnJifJjRAEZkzj2iPUo0OtVJcxosju3yvW9kO0QQj8pD
	 PO5sq/IlF0hvhPyrCgXjWr3feHQyHTk0Xq9h/BfXiKcW1R8Bq4iOACE5ImvqpbYp4GBr6
	 3fjaeLu/inI2Aq0qvAD/1TkYyH4oY6WpZlCygrtc5WEtVORYdWMo9Z1RSuyO3y+E/jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ni/xmO8h";
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97FB606A334
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97FB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ni/xmO8h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795157678; x=1826693678;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xJAp/bykYNtmmfUmtdoQXpDLWMW4ANnjHjB3QPKBlRw=;
  b=Ni/xmO8hR3lv1BVOc6VVuonSU7iUWtbMznIxaw19SovzueYq6naDhPzu
   oG79uRRTKgEwT6tWUoGaVhpjTh/y6tPWSBEvJAXsNGUAbajSkUsvG6B8Y
   TOkM5XMFfzkHA6O7oiKai6steRszZgE0S3DwpNuTX75xmOJ7+CWWviRwD
   BYk1QSgdrPFQPO3jUmbJQZEkKJ4xDQ9Faj3OngaC204SqZzpX29Z2cda9
   gXRiQoJSbbglLov9ipJfgBwlcQXlqolLjqnueIwogCM8Drsrsuc0Qkfl9
   Z2ZP1z3UURJOeNgmu8RkTMWURD24NNPTbl6h6Yw7a+SomlNqpl0tn8P8m
   Q==;
X-CSE-ConnectionGUID: nnVGft6dTu+MQWGilHnW1w==
X-CSE-MsgGUID: nWasWSY2S1qrgUxpDZrQrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4047871"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4047871"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 22:54:37 -0800
X-CSE-ConnectionGUID: GJRfyU/xRKaxZCiBkkG6mA==
X-CSE-MsgGUID: wpiit/FDSWqYMICz8z7F3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12626035"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 22:54:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 800F299; Fri, 20 Nov 2026 07:54:35 +0100 (CET)
Date: Fri, 20 Nov 2026 07:54:35 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 15/18] thunderbolt: Rework tunnel credit allocation
Message-ID: <20261120065435.GG229695@black.igk.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-16-mika.westerberg@linux.intel.com>
 <sashiko-outbox-223717@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-223717@kernel.org>

Hi,

On Thu, Nov 19, 2026 at 05:43:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] thunderbolt: data race on port->credit_pool in
>   port_credits_show()
> --
> 
> commit c28526c3bb35bc796324ed492685bd1fa66796c3
> Author: Mika Westerberg (Intel) <westeri@kernel.org>
> 
> thunderbolt: Rework tunnel credit allocation
> 
> This commit reworks lane adapter tunnel credit allocation to use per-port
> credit pools with minimum protocol reservations and on-demand allocation
> from a common pool, and exposes pool usage in debugfs.
> 
> > diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> > index 0d9f41a0f2cdc..eac6d564bf185 100644
> > --- a/drivers/thunderbolt/debugfs.c
> > +++ b/drivers/thunderbolt/debugfs.c
> > @@ -2488,6 +2488,32 @@ static int port_sb_regs_show(struct seq_file *s, void *not_used)
> >  }
> >  DEBUGFS_ATTR_RW(port_sb_regs);
> >  
> > +static void credits_show(const struct tb_port *port, struct seq_file *s)
> > +{
> > +	int i;
> > +
> > +	seq_puts(s, "# pool used total\n");
> > +
> > +	for (i = 0; i < USB4_CREDIT_NUM_POOLS; i++) {
> > +		const struct usb4_credit_pool *pool = &port->credit_pool[i];
> > +
> > +		seq_printf(s, "%s %u %u\n", usb4_credit_pool_name(pool),
> > +			   usb4_credit_pool_used(pool),
> > +			   usb4_credit_pool_total(pool));
> > +	}
> > +}
> > +
> > +static int port_credits_show(struct seq_file *s, void *not_used)
> > +{
> > +	const struct tb_port *port = s->private;
> > +
> > +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->sw->tb->lock)
> > +		credits_show(port, s);
> > +
> > +	return 0;
> > +}
> 
> [Severity: Low]
> Can port_credits_show() race with usb4_port_update_credit_pools() on
> port->credit_pool?

Yes it can but that's intentional. This is just for debugging so the
always accurate numbers don't matter.
