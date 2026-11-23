Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412729;
	b=xHOifo3MluZuQmtlhZJZelto7rHLJtpnz7eyJ7uPyHjnN0FA3JmHTPdxiuDBbuOMov8l
	 Dlaw4FUS3p22alPWUJoXOSpcMZY/wKzCfk16stZsxWh4qzR8APkz2/sHw8SucMYdZciia
	 Er0tJzruEzR10U21qo+vEYw845oc+kO9XMg36O3bMhEH2sjJoTRjWvra4bfHKB7h/Iia4
	 EU8VlNoJEBxXfK7dcjDkZ7nGbzBbD5rhhw3yAqXKnqWZBOKF/GWMklGHoM39QjTH5c/kh
	 qiOor+d17/MS9ukm9/4P3KdWlfEybc+O/MFS8W8AdLsq6ReVuk+Y/t3l82+3f9kTriQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412729;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=iR5efCWHcrnnpvqZ8dr3t0xgLMI65MRie0fxwupGQLo=;
	b=zMkozhFxvNk/IbHO0yFnRc1Ndsad98Oc1g/1RTDUnHIMjHiSj6mDfe9SdrZSNAH+XzHb
	 3aY9I6EDnFmcPwVyo12Z3FH8YW84wmaEpmJ0ALN3EsQjLmlanvrZkbSyiFL+WZoJCdl5j
	 B/12WJnapSXcTeGUzWdMn/mZf4/hvzjM6IgK6/TJv8tXLLx99dMJajcXxSeLWbuaqf/eb
	 UeFiXrqfkFaG/2YxWIpSGcvu6UDqjCEy6DEVBZ6taSX3BrTcAwb5ohF9+63Mj+fJRL8WN
	 q05o+bRMmgehVI/BOz/V0hWGSuJTlX/hXAh6Nry9E/MrdvP2THzLRyizGzwEDt5NIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dM5KR+Ay;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7485606A31A;
	Mon, 23 Nov 2026 05:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7485606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dM5KR+Ay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795412729; x=1826948729;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JDv9piFwzYO81o32hanEvSpjBdSXgKo7bg0xZRzi9TE=;
  b=dM5KR+AyHjXSKTP9WWyf5h5pgcUKSHlLEnkwtcgC3bUHlL0VM92ltQEx
   lYnss8Fe9PTn/IvBJPW+blonkM/XgeQuAzIOu7WCeIhcnryd+ss0B/Yds
   oqDG9YHvkR/PyGiUD+Ip74s8N9o6gd5mumBaCZGoI+R9lYinbauQkozeV
   2m51sY5/mghSAW78rbzVgLuc8lWetgmeDEOcAShHIMRh1Qv6yW0V8+DXK
   SLb2+Erui/GLyiMJnpzBmpzw5E2bvKvE6QXlGEF6VBf8wacvUkjNCenjC
   oepheUJ9YgrqYzwxcc35ZuGVzzZjspOk2CtKfDYEs91nMHtMoAIFlrjTP
   g==;
X-CSE-ConnectionGUID: TVLC69NqTTGL/u63osGsWg==
X-CSE-MsgGUID: 6t7ZsaJlROeWUt78PexcDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4310303"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4310303"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 21:45:28 -0800
X-CSE-ConnectionGUID: YJLlhbnvR/6Nl7n6GrH7SQ==
X-CSE-MsgGUID: 4ekYtWcCT9SJOg4UzEagyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11213198"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2026 21:45:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 187A399; Mon, 23 Nov 2026 06:45:25 +0100 (CET)
Date: Mon, 23 Nov 2026 06:45:25 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] thunderbolt: cancel pending DP bandwidth requests on
 teardown
Message-ID: <20261123054525.GM229695@black.igk.intel.com>
References: <20261119023558.1495581-1-shunsheng1218@gmail.com>
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
In-Reply-To: <20261119023558.1495581-1-shunsheng1218@gmail.com>

Hi,

On Thu, Nov 19, 2026 at 10:35:58AM +0800, Yaohan Li wrote:
> tb_queue_dp_bandwidth_request() queues its delayed work and keeps no
> record of it.  The retry path in tb_handle_dp_bandwidth_request() queues
> the work again with a 50 ms delay, and tb_deinit() only cancels the
> bandwidth group release works.  The flush_workqueue() in
> tb_domain_remove() runs before tb_deinit() but it does not cover a
> delayed work whose timer has not expired yet, so a request that is
> waiting for its retry can run after the domain has been removed and the
> tb structure has been freed.
> 
> Record the queued requests in tb_cm and cancel the remaining ones in
> tb_deinit(), which runs after the workqueue has been flushed and before
> the domain device is unregistered.  A request is recorded and queued
> while holding dp_bandwidth_lock, so tb_deinit() either sees it and
> cancels it or the request is rejected before it is queued at all.  A
> work item that is already running hands the ownership of its request
> back to tb_deinit() through the canceled flag.
> 
> This covers the list and the delayed work, not the lifetime of @tb.
> dp_bandwidth_closed keeps new work from being queued, but it is not a
> reference on @tb.  Both in-tree callers are reached from the DP
> bandwidth handling in tb.c - one from the bandwidth work that runs on
> tb->wq, one from the control channel event path that tb_ctl_stop()
> stops - and tb_deinit() runs after both have been drained.
> 
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> 
> ---
> Prepared against v7.4-rc1-1969-g666539eecdf4.
> 
> Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
> and CONFIG_USB4=m.  The affected hardware was not
> available, so the teardown path was not exercised and no fault or
> race injection was run.

For complex fixes like this, I would definitely want a real hardware repro,
and also a proof that your change actually fix it and does not cause any
unexpected "side effects".
