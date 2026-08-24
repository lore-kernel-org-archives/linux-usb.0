Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993C93ACA42
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568362; cv=none; b=bIQ2nSX2nAvDzfkouBiXWO+Ermghx/gWuvFEJ+pONKgLqXeS1aWMUWD681OV3AM+5RfsBF1rDhC6XGOTJ63mpS7FMoOPeWK3xTArfQjAUFYP3a2yKXmfgpLx7PP4Igav5bvK10NmMVEJGMM37vn4H7dNDEQdh6CeYAJ7mY++vSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568362; c=relaxed/simple;
	bh=9JrNfIkebCZ3PNuyobHBoiIkO7NCHFW1PJL9BIw/5dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jz3SUccxIe1yGYpfk2P6LIZe1+C7cwnCeovIAhZA/COAWqP9xX2xy0J0+t4V7oUcngEFyv00EJCGBlEd28Z4kYG9t+cf4HjpXk5SwxZ829/FQ2X88yCS5pQxebIVpXCv7Hcq9mP1Wi6btmOQK/tC+wpTbNxO1kO3Slal68g5kRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jH9tYR5J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jH9tYR5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787568360; x=1819104360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9JrNfIkebCZ3PNuyobHBoiIkO7NCHFW1PJL9BIw/5dI=;
  b=jH9tYR5J4UvOPvl326JXizu9N+8hi47ja/0GeakjgnWBiyG9s3/gUoBS
   COjBqP3WUdKweZSIcApyCuHr88boRZyik229ztgYTpWMJ3QUZlr5ULsJK
   uU7ZWdkXLOOfZXm2VmTqsrmU4rrYN4WGjF0ZghxI6Zu7Bn2z/fc2AXe+C
   zV4h7O3X62Fg9h1OXXnkTmOLkGeLjFVHtslN3OgbRGcF/rUqqLd66zhPL
   cK5FN0dzOu0ZZeKA/0N/RWcoF1RHk9jVcE9+QQ/42pXiFzaC34z0znB81
   Gplh/1OmcTpibcxCKZiY0dE73CX0VItnoDrnhclPVfFelW5dG55D8sL2l
   w==;
X-CSE-ConnectionGUID: BdL84na8Que1cT2SbhURYg==
X-CSE-MsgGUID: eVgJY3/6SkqizVi+U0wbJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="113548637"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="113548637"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:46:00 -0700
X-CSE-ConnectionGUID: 0djLu9ERQbq8MS/RYHJy0w==
X-CSE-MsgGUID: oKT5D6y5R/qQTRhjAuuqYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270431027"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 24 Aug 2026 03:45:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id D429199; Mon, 24 Aug 2026 12:45:57 +0200 (CEST)
Date: Mon, 24 Aug 2026 12:45:57 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jacob Riff <jacob@riff.dk>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huang Wei <huangwei@kylinos.cn>
Subject: Re: [RFC PATCH] usb: typec: ucsi: retry init when the PPM answers
 early commands incorrectly
Message-ID: <aowg5VSbnK48rn32@black.igk.intel.com>
References: <CAAw_mu=c96SYR2QGtoE=EoVRu+iGDo7x=vDjDYP4nc2yfkMnvw@mail.gmail.com>
 <20260815005724.8741-1-jacob@riff.dk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815005724.8741-1-jacob@riff.dk>

On Fri, Aug 14, 2026 at 05:57:24PM -0700, Jacob Riff wrote:
> On some platforms the PPM is not ready to answer commands correctly
> for a short window during boot. On the Lenovo ThinkPad X1 Carbon
> Gen 14 (21V7, tested on BIOS 1.12 and 1.14) roughly half of all boots
> fail ucsi_init() with either -ENODEV (GET_CAPABILITY completes but
> reports zero connectors) or -EINVAL (a standard command is rejected,
> logged as "possible UCSI driver bug"). The failure is not a timeout:
> increasing the sync command completion wait does not change the rate.
> 
> Since ucsi_init_work() only requeues on -EPROBE_DEFER, a single bad
> answer during that window leaves UCSI dead for the whole session, so
> Type-C events are never handled again; most visibly, the machine
> silently never resumes charging after the charger is replugged.
> Manually reloading ucsi_acpi a few seconds later has succeeded on
> every attempt observed, which suggests simply retrying is enough.
> 
> Retry -ENODEV and -EINVAL the same way as the role switch wait, log
> the retries at debug level, keep the loud report for the case where
> the retries are exhausted, and note when init only succeeded after
> retrying.
> 
> Tested on the affected machine: across 8 consecutive boots with this
> patch, 5 hit the failure (matching the historical ~50-60% rate) and
> all 5 recovered on the first retry ("PPM init succeeded after 2
> attempts"). 0 of 8 boots ended with UCSI unusable, where ~5 of 8
> would have without the patch.
> 
> Signed-off-by: Jacob Riff <jacob@riff.dk>
> ---
> This is the failure previously reported in the thread
> "ucsi_acpi: intermittent PPM init failed at boot is never retried"
> and reproduces on the latest firmware for the machine. Happy to test
> alternative approaches on this hardware.

Thanks for the patch. I don't have currently any better ideas so we
can go ahead with this.

Thanks,

> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2211,18 +2211,36 @@
>  	int ret;
>  
>  	ret = ucsi_init(ucsi);
> -	if (ret)
> -		dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
> +	if (!ret) {
> +		if (ucsi->work_count)
> +			dev_info(ucsi->dev,
> +				 "PPM init succeeded after %u attempts\n",
> +				 ucsi->work_count + 1);
> +		return;
> +	}
>  
> -	if (ret == -EPROBE_DEFER) {
> -		if (ucsi->work_count++ > UCSI_ROLE_SWITCH_WAIT_COUNT) {
> -			dev_err(ucsi->dev, "PPM init failed, stop trying\n");
> +	/*
> +	 * On some platforms the PPM is not ready to answer commands
> +	 * correctly for a short window during boot: standard commands are
> +	 * rejected or GET_CAPABILITY reports zero connectors, seen as
> +	 * -EINVAL or -ENODEV from ucsi_init(), and a retry moments later
> +	 * succeeds (observed on Lenovo ThinkPad X1 Carbon Gen 14, where
> +	 * this affects roughly half of all boots). Retry those like the
> +	 * USB role switch wait instead of giving up on the first attempt.
> +	 */
> +	if (ret == -EPROBE_DEFER || ret == -ENODEV || ret == -EINVAL) {
> +		if (ucsi->work_count++ < UCSI_ROLE_SWITCH_WAIT_COUNT) {
> +			dev_dbg(ucsi->dev, "PPM init failed (%pe), retrying\n",
> +				ERR_PTR(ret));
> +			queue_delayed_work(system_dfl_long_wq, &ucsi->work,
> +					   UCSI_ROLE_SWITCH_INTERVAL);
>  			return;
>  		}
> -
> -		queue_delayed_work(system_dfl_long_wq, &ucsi->work,
> -				   UCSI_ROLE_SWITCH_INTERVAL);
> +		dev_err(ucsi->dev, "PPM init failed, stop trying\n");
> +		return;
>  	}
> +
> +	dev_err_probe(ucsi->dev, ret, "PPM init failed\n");
>  }
>  
>  /**

-- 
heikki
