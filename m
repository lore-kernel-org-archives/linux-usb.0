Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6B344DB5;
	Wed,  5 Aug 2026 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785951592; cv=none; b=PVlqgje+y7rl4w4q8aIqlgyDNwIcLc4o20iyV6U9fCSRfZNgg/d4kquySvy6tUbh8ZQzvfJGNMuNxcqdAVW9o/6OIQF47Ig2xIRDQxOPnuRfVxjl8oMpGza3ZUJHgWGy81GcIuwPh+4B9xE4WTAOgf2B5NqPFwbYa9yAeAy4ssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785951592; c=relaxed/simple;
	bh=QhC+dhOxcqnt6GJGrqtuy9z6elAxAakmbTk1so7Suhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NrMTSvWOjxyc1/cXjw7r1TAw2iFdly88s6N29ZC/HiHe5hUL1OzsuE7ehbUKWEkfqm2eihGt9TZAx3fqAlxHwmHMb9L/zl3fQMOrj1zcfqvZgMxEdd+MePYRB6WA2uqQzV376o+bcXhlOO2+phf/1dzXEzC7+xbV5f/Uh87gD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJAys4nq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJAys4nq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785951590; x=1817487590;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QhC+dhOxcqnt6GJGrqtuy9z6elAxAakmbTk1so7Suhg=;
  b=JJAys4nqouQNQCTef8aqj/PF17sysS8IdJNa94fXQe9PdRc+tkwpcARO
   4o6jVVe3ZAY08wAtwRlMaPfy8lS8viLqhgcn8wRhkWnp4yfmOzrolAc+3
   jTZI+hthz4magmLWxhcHwF4lMIj9xmGgcmrvgHiJ0ry3FwSQq9OKxEssD
   VQ2xHhj4TuHgjBtqmMwKhIWB+V6gv84NH+DfR3j5SZdh6jOfcgOhYNiNg
   05V/EdQNGgtkY1Z0MgCSqYaPbXO0aEO6ZHvvwjrFBW9keBWsX14Byt8dD
   /DnkwB0QfUlJ/IHcjGQJD4ZPoQLS068A8w5yK/U91pkKwOA9cMAGqtLuN
   A==;
X-CSE-ConnectionGUID: EsoAvXYcSqS3sRGO8mImoQ==
X-CSE-MsgGUID: ZKykR1WLTIaEiWuOKz7qrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="109324243"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="109324243"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:39:49 -0700
X-CSE-ConnectionGUID: kpxBe+C8Rl2eOkmy09pV6g==
X-CSE-MsgGUID: NuUMit4jTFKPLPylBcdcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="285229750"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.51]) ([10.245.244.51])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 10:39:14 -0700
Message-ID: <d017215b-3e91-4786-9c41-f5685e5c19e0@linux.intel.com>
Date: Wed, 5 Aug 2026 20:39:12 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] usb: xhci: Rework and improve the TD matching and
 skipping logic
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bart Nagel <bart@tremby.net>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260804120110.01bda0e2.michal.pecio@gmail.com>
 <20260804120537.5c30554e.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260804120537.5c30554e.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 13:05, Michal Pecio wrote:
> Matching events with TDs and giving back missed TDs is carried out
> by a complicated loop. Replace it with a simpler linear logic:
> 
> 0. Having verified that 'td_list' isn't empty,
> 1. Scan it to find the matching TD and count missed TDs,
> 2. Perform necessary adjustments for corner cases,
> 3. Give back missed TDs, if applicable, using a short and tidy loop,
> 4. Check if the event refers to the expected TD and proceed as usual.
> 
> Besides cleaning up the code, this provides a few improvements:
> - when the skip flag is set, no TD is given back unless we found a match
>    or otherwise know how many TDs should be given back
> - when the skip flag is clear, we know if the event refers to a "future"
>    TD so we can log this in the Scary Error Message to aid debugging.
> 
> While altering the error message, drop a pointless goto.
> 
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

How about modifying step 1 a bit and store the last passed td instead of
count missed tds?

If the event points to a valid trb ahead of last trb in td, but
before the enqueue pointer, then we know hardware has passed this td and we
can give it back.

This should work even if event trb points to a link trb or no-op trb.

It should also cover the "td->error_mid_td && !trb_in_td(td, ep_trb_dma))" case

something like:

static struct xhci_td *find_td_by_dma(struct xhci_ring *ring, struct xhci_td **passed_td, dma_addr_t dma)
{
	struct xhci_td *td;

	if (!dma)
		return NULL;

	list_for_each_entry(td, &ring->td_list, td_list) {
		if (trb_in_td(td, dma))
			return td;
		/* event points to a valid trb passed this td */
		else if (dma_in_range(dma, td->end_seg, td->end_trb,
				      ring->enq_seg, ring->enqueue))
			*passed_td = td;
	}

	return NULL;
}

static int handle_tx_event(struct xhci_hcd *xhci,
			   struct xhci_interrupter *ir,
			   struct xhci_transfer_event *event)
{
	...
	struct xhci_td *passed_td = NULL;

	...
	td = find_td_by_dma(ep_ring, &passed_td, ep_trb_dma);

	if (passed_td) {
		struct xhci_td *tmp_td;
		list_for_each_entry_safe(td, tmp_td, &ep_ring->td_list, td_list)
		{
			xhci_dequeue_td(xhci, td, ep_ring, td->status);
			if (td == passed_td)
				break;
		}
	}

-Mathias
