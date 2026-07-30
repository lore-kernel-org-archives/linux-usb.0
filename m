Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F43368D46
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 04:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386665; cv=none; b=BjAE9BtF14ROc2x0Hb+yjB5cvV//vcRm8BQEwyTHEvOr2bpAvC5dZW5NRqeF4WkqG4wIdeYGF5mK6ALIWimZUM4r/czSlw+Rtx4tsN1Tp7JO0xiA3dDu0jUi3wMY7BQGJZSCZAIXRvXyNUxvQ2MYvdd7Vrxs09qrQrGou3jggbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386665; c=relaxed/simple;
	bh=2LkxNJmzANEno4fR9ONEMPDQiskBLYpxNq5h3TI7z0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt/gddbkHx8m8CpaA4IDkqIQuVPXMJ3vCQXO5YaNIzwaveueHCKrcqauTubyZCfRC3DCovQfak2u4A9B+JtsTUnySGv8XYT9Bj3nQnA3gUcZjcXsv25uFEzvyPDq3J2XnhPfWws+t9R9TVNYwWBNYQibBsrlHVD95PpqjZGW1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuEcKqBJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuEcKqBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785386663; x=1816922663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2LkxNJmzANEno4fR9ONEMPDQiskBLYpxNq5h3TI7z0E=;
  b=ZuEcKqBJzu4bFytZc0cdF5ikukgs/NxlaZYlMn5Z0xPjcp278vct0XbD
   zHIAYOdQeynqpVDhEuqUrRNBBOlkCxh4Mp2q7aQNuTeE2fE9BnGbD5mCI
   p5pjMba0UfVSrH97hkQHREUDadT+WHt97jCDk576F6/klK+Rz9I4d4vcc
   xAs/gTNf75ssDst6pgAIk5TcYwXUBvEUAo3kSZZsJh4badWkUgV7/QAlp
   sqpWPXkUMi+y2qU/5DtsTkj7w3JaiFCnSl4PCYyZIcxD6U4XE/2kPgYMk
   EWXo+F60mSiW36r12J/NIQj2gcG3s1KFL9fdXPrc0bvxlTetJesHY+X8R
   w==;
X-CSE-ConnectionGUID: UyITtG+9SvCf/eRBEuqtTw==
X-CSE-MsgGUID: ZmzRNpMVSA20x7hH4GCITg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="88538024"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="88538024"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:44:23 -0700
X-CSE-ConnectionGUID: grRg7McOT2KaELZh7j8DfA==
X-CSE-MsgGUID: 6HqNpgN0Qca7XEp6s8xYYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="263683371"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 29 Jul 2026 21:44:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3288999; Thu, 30 Jul 2026 06:44:20 +0200 (CEST)
Date: Thu, 30 Jul 2026 06:44:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Subject: Re: [PATCH 5/5] thunderbolt: stream: Add support for busy polling
Message-ID: <20260730044420.GB20844@black.igk.intel.com>
References: <20260728115141.2585464-1-mika.westerberg@linux.intel.com>
 <20260728115141.2585464-6-mika.westerberg@linux.intel.com>
 <amoSnhr833oztrqK@wunner.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amoSnhr833oztrqK@wunner.de>

Hi,

On Wed, Jul 29, 2026 at 04:47:58PM +0200, Lukas Wunner wrote:
> On Tue, Jul 28, 2026 at 01:51:41PM +0200, Mika Westerberg wrote:
> > Using interrupts and scheduling workers increase latency so latency
> > critical applications may want to avoid that. Make this possible in
> > USB4STREAM by adding a new ConfigFS attribute: busy_poll that, when
> > activated switches the rings to polling mode. The cost for lower latency
> > is that this burns more CPU cycles and things like poll(2) cannot be
> > used.
> 
> Hm, would it be possible to auto-detect whether polling is more performant
> for the current workload and automatically enable and disable it?
> E.g. by counting the number of interrupts in a given interval and
> enabling/disabling polling based on a high water mark / low water mark?
> Those marks could then be finetuned from user space, but moving in and
> out of polling automatically would be more desirable I think.  Forcing
> polling could be achieved by setting the water marks to a special value,
> e.g. 0 or UINT_MAX.

I think the applications that want the minimal latency and end up setting
this will put it to the "minimal" anyway (because they don't tolerate any
additional latencies caused by interrupts and the worker scheduling) and
for the rest they can already tune this by setting non-default values to
"throttling" attribute (eg. 0 to avoid it completely, makes latency lower
while still keeping it from hogging the CPU fully).

We can introduce auto-tuning mode afterwards as you suggest if it turns out
to be wanted feature.
