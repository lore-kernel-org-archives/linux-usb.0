Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407174;
	b=bgl+YVpxCJm0QitCKrQDme3OISjEvfNMw4RUxTfx+mdeWTxX5LhHhog2h1VoLy/nmOHf
	 d3ggLd0bPWRQp2HKlWqGhKmw+jUqen3+D9RJPEFlsx8ViEDri66leBmw1wnJAidlFtiNI
	 8hfXorFFfv5rjT1jZ9udCJmMz0y/YfCPRZ7uHG9/PF9C/RPBSR9/52lvW49Bbu6/8H2Uh
	 4to8KdWQwI7WfZKfiR5+pfY78sp+C2wpEHdrQTPGaadeqRjGBxkrvOpGuj+lk5+ZlcN9r
	 9bhiTp/6H4JwcDcy1VtDRGdytBG6IK3scNSRB7XU3UeF/gUcmddEkbZd4n4OU8uOzqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=p06BpfxDacpShmZgqEuc//PUu1v9zCba4rUpMbz25eE=;
	b=vX1OMSg2gW+y5JtgRdvLS3f406H05CHF4oj1w8a/n+QgqxHWr2Z0cAxThyASDl/X+QIW
	 H9LkZSj+mkAyZWYr0yCaTYbiMuUjPRX7Ga2GRs1HjhBAiBdWdDKZyh9ryXCWZQ3DUht0+
	 N+pr7WYcn8/ZJiKJ1h5f6n6fGZWbkbL4nD6djLqY9jK0Jy+4f4cQMy12AnnEkLxuDNRW3
	 P+ZZoSor36Vtal6ipCoBQrhc7K3fm2mRr45BiYG0BTuaq5lY1/fv61cwRWEcfhAXryvl6
	 0QfK2OxzGpAOr+TPqN6Lhwa5kBbi8ELdGzlX58OWzUV4R4kZAIYABRdP9Z6S3bK3B8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CL9Q6XaP;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21778606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 14:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21778606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CL9Q6XaP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794407173; x=1825943173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZzDGdrtEaxLl3nU5t9IoJ3KeCuxTpuwjVZxJhhB7wxw=;
  b=CL9Q6XaPu0AKNkbos6tjuNFF94aaL4Id3oR39KglhyIaSCmqc97ik5Az
   hh6eA2g/nbVKi6YFyUWELm0nc9wjqhjn/V71b4ENP0iUxD9CKPEvBkPW1
   xZj3rBnCZeNOXa2OqpE79AHlhKiTP4IVuDxMB9uAD4oebS2sAXx5kEJVy
   +2S2HHee5vUDdYOUnLAS9++5YZfI7LSyoFVfawOvgDx4R1AfII5ZwhNSk
   ql66ebPs1mXLglA0QXqUKg0xnXiVPd0neCGq9MJwdYzqMHQR4rGT/SBJc
   0gUN4h30/IQCkabG/ST/i61ZAVjSv4jpKYVoaTEyIPpE+KGKn2FtfqWyJ
   g==;
X-CSE-ConnectionGUID: mBVw/P9ATjmD6nCUsRiDfQ==
X-CSE-MsgGUID: EZPVUG8zQ76oAbqRspqNlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3182634"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3182634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:26:12 -0800
X-CSE-ConnectionGUID: asXOq1EOR+6Rqgi2r1bGlw==
X-CSE-MsgGUID: ergF3TQOSu2mSc9ViPfmIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8767859"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2026 06:26:12 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6946D99; Wed, 11 Nov 2026 15:26:10 +0100 (CET)
Date: Wed, 11 Nov 2026 15:26:10 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Peter Walker <peter.walker78@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
Message-ID: <avR7Akf3n4G6QKtz@black.igk.intel.com>
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
 <ausGNtWlRzZN29ux@black.igk.intel.com>
 <CAPv=dGA6ygdQ8StHwht6nPJZyb2FTH0n03txOOWhb4SSHkG9zw@mail.gmail.com>
 <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com>
 <au4TbIvSBLxIWxnQ@black.igk.intel.com>
 <CAPv=dGC9FCbqW1hBnRz8Axy8FmdD4vohFZ+Q03fmsz3pDRod4Q@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPv=dGC9FCbqW1hBnRz8Axy8FmdD4vohFZ+Q03fmsz3pDRod4Q@mail.gmail.com>

On Fri, Nov 06, 2026 at 09:25:26PM +0000, Peter Walker wrote:
> On Fri, Nov 06, 2026 at 06:50:36PM +0100, Heikki Krogerus wrote:
> > On Wed, Nov 04, 2026 at 11:28:12AM +0100, Peter Walker wrote:
> > > I don't have the laptop with me at the moment, I can run the command you
> > > provided this weekend if that helps?
> >
> > It would help.
> >
> > Please try to avoid top-posting on the mailing list.
> 
> Sorry about that. The laptop has two USB-C ports.
> 
> I tested your patch on 7.2.11-ogc4.1.fc44 (Bazzite): ucsi_acpi.c
> from stable v7.2.11 with the Nitro ANV15-41 line removed, built out
> of tree against the running kernel and loaded in place of the stock
> module. It makes no difference here.
> 
> - "UCSI version is zero, assuming 1.2" is never logged.

Okay, but it would not help in any case. The first problem is that the
PPM reports the wrong number of connector, right?

That is a pretty obvious FW bug. Did you report that to Acer?

We can prepare a quirk where that is fixed, but it means that the FW
may never get fixed. So let's try to get the FW fixed first.

> - At probe, "UCSI_GET_PDOS failed (-70)" is logged twice, as on
> every boot.

This is probable another issue. Let's tackle these one by one.

> - The first "bogus connector number in CCI: 2" came 4.7 s after the
> first of those, and acer_wmi logged a charger unplug 0.3 s later.
> The stock module had been printing them until I unloaded it, about
> 100 s before.
> 
> - From then on they kept coming at 17 every 10 s, the same rate as
> the stock module just before, while the charger went back in, out
> and in again, and across an s2idle cycle. Four were logged during
> the suspend and resume, and the next came 2.4 s after
> "PM: suspend exit".

Can you share the complete dmesg output?

> - port0 never followed the charger: no partner, power_operation_mode
> "default" and ucsi-source-psy-USBC000:001 online=0, whether the
> charger was plugged in or not.
> 
> One correction to my first report: a charger unplug may not be the only
> trigger. Going back through the journal, on 8 of the 20 boots on
> 7.2.x kernels the messages started 3.9-4.6 s after the probe's first
> "UCSI_GET_PDOS failed (-70)", before any charger event was logged.

Thanks,

-- 
heikki
