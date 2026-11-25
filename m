Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612953;
	b=SiIhKFWzIkN1Y32MDTUKdxEAVhMV/4vFxPkpWXVwtardNmaw5f4rf9V+uW3UD2qzACZK
	 xZuWSYUDml1exUJKWU6FPv9l8gPQZFkBz597Vs998rg6yGxzRO8HfwgmcX5meAYM7L5Im
	 Loj0/8MW/SYW/dLC+N5xf/oC9YjMr93c7Xv/G6Q3lJDiJ5/e3211kPepiLAS49f2i8L9z
	 4H6S+1t7BpHevHgw/ezJKRZXBQPC4X83EeeCUzIghokzv49xkMQyIhARJlAYJNhhdVoK0
	 we2nASrCngi9NcgQjAuHqg6RRNN/ihh4kmT0wCOYjYP+Zl/oS43eRrev5bvAACRwfsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612953;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ipja5WGFJr2wY12IBTtFvehjTc7AMtHKnrCB3Ak9jgw=;
	b=kQcB9BjEJGRO5XJJdkqiZkQVp7NvXqUJ30arAkCd1KojIEGcHrdb4y2m8QZCBa4j2nF/
	 gvXqTk2Eu9KqxVMT4okihidACFQlKwP8iyNoqqjXEr5Jfr66kZu2W7/YGxn1d+/kQwLIY
	 vdCSX+O5aTDjmPB/KjccfHutR1tMl7RapXhC406LPl1lsQHGlKNiJSW3JUwYt6AdT6A49
	 5smzHuxy3twJ7E108cVsje++8WytelefnhHPNxBZ9CRCaj+dRgRBaMrPGykduMGACondw
	 VYq1Q5KEX/IfOnbA39m1AcLEB2bYsMwUec4k5cOqZ1jUu/MtWZtgTWcawyzCHZ+MOrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LhVW+n7u;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E76606A326;
	Wed, 25 Nov 2026 13:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LhVW+n7u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795612953; x=1827148953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xMZJqBJS/iUcGVaGQWziBnwHMl+g9+YwZ2CYauGmfRk=;
  b=LhVW+n7uqGGu1wVKNFOEjv3NRGROzNXL/KGqnQSN+AHt12z4UEym+O+0
   7tEwjPq+y2GJCrOSSJWliF3kklYbY+r9mE4LH5xkeRy0kdbiEatU4LxHn
   8GyLMAgB9xMVx5xyz8IxeoLsJqVWlU7QN43DzzAFw57mTcpxmwRDWfpvJ
   3xpQfx1465tVcHMyHS7FyZqI4rk9eplaoIlUSQYfF/r8PO5hhNxhLjhmd
   RotbJAGhLgqhbDaNT8+KopKZIHtps8h9UgBK0sQHAY70wnqnvjm+KBQdi
   q1qkVTh46ZkL1x0ZDc6Cwt5xWFeYH275QZK6ycObmwt6n6HcmlK26+51J
   A==;
X-CSE-ConnectionGUID: sn0Y/ciyTuiRJY6uFn2t9w==
X-CSE-MsgGUID: w7ZdDsSJR6aIM2INLyfuEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4550446"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4550446"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 05:22:32 -0800
X-CSE-ConnectionGUID: gY5d0gdCQBegZceIY9aUSQ==
X-CSE-MsgGUID: 9zyMiZcASqSPIroOmrlW7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11856614"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 25 Nov 2026 05:22:30 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7ADD098; Wed, 25 Nov 2026 14:22:28 +0100 (CET)
Date: Wed, 25 Nov 2026 14:22:28 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tobias Heath <heathtobias@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Sukhdeep Singh <sukhdeeps@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] thunderbolt: add opt-in to preserve tunnels across
 s2idle
Message-ID: <20261125132228.GE191152@black.igk.intel.com>
References: <8fbb5876-e556-45a1-96b5-4a8061de9e5d@gmail.com>
 <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>
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
In-Reply-To: <31d3413a-9aa0-4208-8e15-3ba85829ef79@gmail.com>

Hi,

On Wed, Nov 25, 2026 at 12:45:36PM +0000, Tobias Heath wrote:
> The current implementation of tb_switch_suspend() / tb_switch_resume()
> writes ROUTER_CS_5 SLP into each USB4 switch on entry to s2idle and
> rebuilds the tunnel on resume, independently of whether the host router
> and connected switches actually need that teardown.

Well after router sleep is set and acked and the implementation specific
method is run (typically ACPI power resource is turned off) the routers
reset their config spaces to default except certain fields that are
mentioned in the spec.

> On AMD USB4 host
> controllers (verified on Ryzen AI 9 HX 370; same expected on Phoenix /
> Strix generation hardware), the switch config survives D3hot intact,
> and the mandatory rebuild produces an entirely avoidable re-enumeration
> cascade on wake:

It is expected to go into D3cold and at that point you lose everything.

>   * Every downstream USB device goes through USB disconnect + fresh add,
>     device numbers increment, open file descriptors onto those devices
>     are invalidated (audio streams interrupted, filesystem mounts
>     unmounted-and-remounted by udisks, etc.).
>   * PCIe hot-plug fires for the dock-side bridges.
>   * The dock's PD controller is reset, producing a 1 - 2 s
>     ADP1 ONLINE=0 blip that interferes with any userspace relying on
>     AC state at wake time (for instance systemd's HibernateOnACPower=
>     policy).
>   * resume_devices takes ~2 - 5 s of avoidable work.
> 
> Add a module parameter, thunderbolt.s2idle_preserve (default: off), which
> skips both the tb_switch_suspend() teardown on suspend_noirq and the
> tb_switch_resume() + tb_tunnel_activate() rebuild on resume_noirq, when
> the sleep target is PM_SUSPEND_TO_IDLE. S3 and hibernate paths are
> unaffected.

Adding new module parameters should be avoided.

> Measured on GPD Win Max 2 with CalDigit TS5 Plus dock:
> 
>   Default upstream:  resume_devices = 2.6 s; USB storm per wake; AC blip.
>   s2idle_preserve=1: resume_devices = 0.2 s; zero re-enumeration events;
>                      AC stable; downstream connections (audio, storage,
>                      keyboard) survive unchanged.
> 
> The opt-in gate is deliberate. Where the TB tree is not preserved by
> hardware across s2idle (e.g. some Intel generations under specific
> firmware configurations), enabling this would leave the kernel with
> stale state at wake; users are expected to test on their own hardware
> before enabling.

That's actually everything except your system according to the USB4 spec at
least and I would also assume AMD follows that too. Why it does not enter
D3cold is not clear at this point. Do you disable it via sysfs?

There is also the power problem if you keep them alive.

What we can do is to avoid the unnecessary runtime resume if the domain is
already runtime suspended when entering s2idle but that's USB stack that
does the wake up.
