Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9113D45EF
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170329; cv=none; b=W5v+Dcpw87+9AIAaIeJL7Hnv8FMv6FlTnGRHjVGRcBCBK8+NoQPJh0lJlDVHB2R1V4pqhMoLaGEkLQQKkLNDHzVvHx3eZzG8Re51LVO3ixZnnBspKMYAZXVG7vAntZyclO25UnefzDG4zPTMFUs14IyvFphyEx5WCmV9b9xSr/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170329; c=relaxed/simple;
	bh=l5QiMZ3Fg/43qKPyTY/tGyG1KWvPK6Sbt9J10kdJ0wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHbX926SPGglSJQPGo6HNcN4av0Wgt50oH+cqKRN0Nc/40quXn/UjswuULcr/KTGejK7VLEvEeuqVyZolElTEnPNUhx16fYPi1xlSuBYCSB8Fd9mr1sqwrMLIyFeGdthncXKDcJcdI5CJo/WgIZCr1d8FTeCk4agJQpsyJE0iFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJu6Inb8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJu6Inb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788170328; x=1819706328;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l5QiMZ3Fg/43qKPyTY/tGyG1KWvPK6Sbt9J10kdJ0wU=;
  b=JJu6Inb8MVUv6c53WkMoR3dglJJi3S+XUC+1oKXrqBha0b6gbRe30Gvd
   5bp6Ju2e+FeGcwdLfGmCUwUaou43LYhdg3W38tGJmG0fvPegfpJ7A23Cq
   8KktRIkenqskYoNw/+dNhjhfj0jqcTnrx9813IKhvRrbbBS3hloFbyvec
   ya0tqBY98VpTC0KK1KmuDFi7yFnb3+e6fjkhqbSAjEmiuSwEMkVhnd6c6
   /vPJRZ2gTypcSV2cFGEQOZFphH0nF3A1UwKZBXTzoOEWrEzp/0vIZLU+k
   HfXjluxVb2m37ecv2s0AkpuLz1jQMWDMU+FhhWsVd3tVjfIhjQKDblXjk
   A==;
X-CSE-ConnectionGUID: hdyv/q1oROidr8N7L9czSQ==
X-CSE-MsgGUID: k/JNm7ErSC60o/xVeuEWKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99924750"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99924750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:58:47 -0700
X-CSE-ConnectionGUID: cs4WAxp2QZmfHckQ00/iBg==
X-CSE-MsgGUID: F9Qq+mx+TiCpZ5AYIrx2DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266172831"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 31 Aug 2026 02:58:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5071499; Mon, 31 Aug 2026 11:58:45 +0200 (CEST)
Date: Mon, 31 Aug 2026 11:58:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jacob Riff <jacob@riff.dk>
Cc: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huang Wei <huangwei@kylinos.cn>
Subject: Re: [PATCH v2] usb: typec: ucsi: retry init when the PPM answers
 early commands incorrectly
Message-ID: <apVQVU4fPNC6675K@black.igk.intel.com>
References: <20260824173536.2395830-1-jacob@riff.dk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824173536.2395830-1-jacob@riff.dk>

On Mon, Aug 24, 2026 at 10:35:36AM -0700, Jacob Riff wrote:
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

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: no functional change; resent without the RFC tag.
>   - Rebased on usb-next; applies unchanged.
>   - Discussion on v1: Huang Wei asked whether the -EINVAL retry should
>     distinguish a not-ready PPM from a genuine driver bug, since
>     ucsi_read_error() maps UCSI_ERROR_INVALID_CON_NUM /
>     UNREGONIZED_CMD / INVALID_CMD_ARGUMENT to -EINVAL. The two cases
>     are indistinguishable by error code here, so the patch relies on
>     context and persistence instead: the retry exists only in the
>     ucsi_init_work() path, it is bounded, and the dev_err() in
>     ucsi_read_error() is untouched and still fires on the first
>     occurrence. No code change resulted.
> 
> v1: https://lore.kernel.org/linux-usb/20260815005724.8741-1-jacob@riff.dk/
> 
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2212,18 +2212,36 @@
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
> 
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440

-- 
heikki
