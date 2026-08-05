Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6942439F7B;
	Wed,  5 Aug 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785930599; cv=none; b=KKQH3evRdRzqHIPh0YN+3T7rwI4eqHrUmdTOPRlzpEyj95jo+pUzOXYdORy4AP3RtiGcgwDaU86tXGWTJyDr9LHzO1nfZuJ4ygP/a5RQ2qMQOrfvZmXW/fu/zH62nFHqo0/zauP4BUKOGIHReI4+17INIAgRvYrwBBw135/PA88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785930599; c=relaxed/simple;
	bh=vfVTtUAod5Fw57i1ApIxcCNGkDHEEyEqpbkWkTy+sLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqGzJwyKmcuZvGZkT5DlG5TDaHDhv2uNOG4swk1yueKLjWvujH452GN4bMuGXesKxEvCnYwkdMHAie6lNA7bZOxZiMcMSV931XafXh5qn+pQ27cRzxEXnsesVd+HF+fGR/8r80tssATkWw2vgigLPkqKGHGZzU+7C6qzYSi/QN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QmA5YJeO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QmA5YJeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785930598; x=1817466598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vfVTtUAod5Fw57i1ApIxcCNGkDHEEyEqpbkWkTy+sLo=;
  b=QmA5YJeO/V+Z26kNoIpr9+HjidtZcVKLsd4NtNnsosk52g6vJsROpmsL
   aI+7WI2xeTra3MqDB8Xcmuzm+J3nNT7ITFer03mN72/XirG5aFINA3BFC
   VpBndYikQ3UDF23rgfrdzp/dKlst99hhcHAKbHnKNtNn5qxXNjgFTo/6l
   Mku/4l9A1tKPjAQ2QIiT89VXpaN5CWQuX+9/3GQwor+aV6tVgwwWKHGuI
   Birm4Gn7Lt83j0mFvBVuABZtWcYKoG2gbV4zYUXRBkRoJ60LGG1knohMc
   uTcrQRYKZXfm3MYN256+BxHsfz0XcRSm9LpuN+HZjjztSn8COXcg19pnT
   Q==;
X-CSE-ConnectionGUID: q2IjZInPTyeL9U06tYrFWA==
X-CSE-MsgGUID: UfxxlH/2QtKvOM3sAP/RBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90176214"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90176214"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 04:49:57 -0700
X-CSE-ConnectionGUID: eHxFjVU5Te22cZkP6tW7uQ==
X-CSE-MsgGUID: rdEjeUyyQISLa2pqhi7XAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="257927545"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 05 Aug 2026 04:49:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8EBDB99; Wed, 05 Aug 2026 13:49:54 +0200 (CEST)
Date: Wed, 5 Aug 2026 13:49:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Tormento <mtormento80@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: deattach child device from typec connector on
 port unbind
Message-ID: <anMjYmZAVA21fT8V@black.igk.intel.com>
References: <20260721202201.27442-1-mtormento80@gmail.com>
 <amDplMXaf1JpxE0v@kuha>
 <CACF_UwoqtaGMB=O2em92JcTnW1RP_ozD415ieAbMBgmmq+gG6w@mail.gmail.com>
 <amc9R83pQ8-XyYYm@black.igk.intel.com>
 <CACF_Uwo-hj8qpWoK8EjYVKRui2EmwHmWZ-ntS2Yd8MrTZ5Udgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACF_Uwo-hj8qpWoK8EjYVKRui2EmwHmWZ-ntS2Yd8MrTZ5Udgw@mail.gmail.com>

On Mon, Jul 27, 2026 at 06:51:36PM +0200, Marco Tormento wrote:
> Hi Heikki,
> 
> On Mon, 27 Jul 2026 at 13:13, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > We should not need to reverse anything. We can't avoid calling
> > typec_attach() separately from connector_bind() because we can't
> > prevent USB devices from being enumerated before the typec drivers are
> > loaded for example during bootup. But that does not mean we need to
> > call typec_deattach() in connector_unbind().
> >
> > After the USB device is "attached" to the typec connector, the
> > connector device should be pinned down for as long as the USB device
> > exists, but that is not happening. So what both you guys are doing, is
> > working around a problem with the reference count.
> >
> > I can see that most of your commit message is written by some LLM, and
> > the parts that you've added don't usually belong to the commit
> > message. That makes me a bit concerned about how much you actually
> > understand what the code that you are modifying does.
> >
> > Use of LLMs is fine, but you still have understand the code that you
> > modify.
> 
> First of all, thank you for the explanation.
> 
> The commit message definitely sounded over confident, my understanding
> of the issue is summed up here in my first patch submission a year
> ago: https://lore.kernel.org/all/20250720210847.30998-1-mtormento80@gmail.com/
> 
> As I said back then, my experience on kernel code was nearly zero, and
> I was well aware there might be better ways to fix the issue: that's
> also true today.
> 
> What I did a few days ago was to ask AI to analyse my first patch and
> see if it could find a better mitigation.
> It came up with this patch, I read the explanation and it made sense
> for my level of understanding of the matter (which is arguably low,
> unfortunately).
> I checked the code and tested for a while with success, so I submitted
> a new patch and here we are.
> 
> Do you have any suspects yet on where the underlying issue might be?

Right now my gut feeling is that this should be fixed in
drivers/usb/typec/class.c, but I would need to be able to study this
more carefully.

Thanks,

-- 
heikki
