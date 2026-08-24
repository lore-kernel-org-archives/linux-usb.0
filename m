Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5103F58E0
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787566075; cv=none; b=tfOuutpgFcM6c0ZYWnHnEoGadfAP3yuXkoiFDqRQI6c5ccSBOg+JpU7Mfoq1/1NXnZvHz2NaEe1AMU/PZOQuTF2lhKvURZwZrJrEV/hrGfQCspk0a7DVFCtambNpcxAqXsJP0sdD4nzF36Zv7K8NGzUImftYiyq6uUXDJvLF/PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787566075; c=relaxed/simple;
	bh=8sdhYAkfd5CXdWcVIF2M2CKslqItKWDWERLCoumPlUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQh9xiarjfkfVtHpH0yJG0ezROISfnSZphJGNSMNDL4ZEs6k7+Am1D0qmCs4EUAT6jK2q4w5iID4dZDxGc8DPihfqJSJTUviBo5zrg1RJp6NKJ77zwZHrvxuzCclEfnrXapbu5Kx4lmpOsThfi5gTK25qLmFaoVshLdVro5ez6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITvdznnR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITvdznnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787566074; x=1819102074;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8sdhYAkfd5CXdWcVIF2M2CKslqItKWDWERLCoumPlUY=;
  b=ITvdznnRtYQUFfmmrecLhS/yrJcgdpn0rBOMpzFa87m2iA2XfVpan7hW
   gPdntUyROIdxrXuxcZHesdx2jfws8RnPpJlECsSdG24QOlFDK40zOzk3P
   4AzTb6p8jT26aYynUO8R65qIQ4eGwGCztYFWQMR4yQ3NsGI9oI3oIbsB8
   cWnOJT3n5HuN4zHJExNIAbnl/yzmE9jF61g12+U8Zv2XzcD8GPf+tjmDM
   tkebbLMO8i6gFknPfDf+Cif1ItAXWJeRxptqLb0qMQxHtHtLVTyOFHnQl
   462Xvk7W9LQ2lMwhov8BAYl1Fz1xX2TIdcx7Wbo4wC5ANKzvb8e7HgFPa
   Q==;
X-CSE-ConnectionGUID: /kngO2bDT9qN1XGAijWBbQ==
X-CSE-MsgGUID: GwwI//M9RsOiFTUF8tuRMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="105390733"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="105390733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 03:07:53 -0700
X-CSE-ConnectionGUID: +ztQ8CqBQbW/Rpum2YTz0Q==
X-CSE-MsgGUID: UCpTVlzoQym8ID7lcDvCcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="290485417"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2026 03:07:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2ABE699; Mon, 24 Aug 2026 12:07:50 +0200 (CEST)
Date: Mon, 24 Aug 2026 12:07:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dennis Wang <wqingxmu@gmail.com>
Cc: linux-usb@vger.kernel.org, Imre Deak <imre.deak@intel.com>
Subject: Re: thunderbolt: DP tunnel activation not retried when display NAKs
 while settling after link reset (Apple Studio Display XDR 2026 on Panther
 Lake)
Message-ID: <20260824100750.GC893316@black.igk.intel.com>
References: <CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com>

Hi,

On Sun, Aug 23, 2026 at 11:24:40PM +0800, Dennis Wang wrote:
> Hi,
> 
> On most cold boots of this machine the connection manager gives up
> permanently on DP tunnel establishment while the attached display is
> still settling after the host-side link reset (the display stays powered
> across host reboots; what matters seems to be whether it has recently
> completed a successful bring-up with some host). Recovery only happens if
> the display times out (tens of seconds) and resets its own TB link, producing
> a fresh hotplug; when that doesn't happen the screen stays black until the
> cable is replugged. The same display on a macOS host connects immediately,
> and "warming" the display on a Mac and then replugging it into this Linux
> host also connects immediately - so this looks like a host-side retry-policy
> difference rather than a link-capability problem.
> 
> Hardware
> --------
> - Host: ASUS NUC 16 Pro, Core Ultra X9 388H (Panther Lake),
>   integrated TB4 host router (8086:e433 DMA0), Intel retimer 8087:d9c
> - Display: Apple Studio Display XDR (2026 model, TB5 upstream, 5K@120,
>   internal hub is Intel JHL9480 Barlow Ridge [8086:5786])
> - Cables tested:
>   * Apple passive TB5 cable  -> link trains Gen3 x2 (40G total)
>   * generic USB4 20G cable   -> link trains Gen2 x2 (20G total)
> - Kernel: 7.1.8-arch1-3 (Arch Linux), xe graphics
> - Software CM; bw_alloc_mode active; display requests TWO DP tunnels
>   (main sink 12750 Mb/s with DSC for 5K120, second sink)
> 
> Failure case (cold boot, TB5 cable, default loglevel)
> -----------------------------------------------------
> [  289.341041] thunderbolt 0-1: new device found, vendor=0x1 device=0x8024
> [  289.341073] thunderbolt 0-1: Apple Studio Display XDR
> [  289.342256] thunderbolt 0000:00:0d.2: 1: failed to enable TMU
> [  289.342321] thunderbolt 0000:00:0d.2: 1: USB3 tunnel creation failed
> [  289.342383] thunderbolt 0000:00:0d.2: 1:11: DP tunnel activation
> failed, aborting
>    (x4)
> [  289.342748] thunderbolt 0-1: device disconnected
> [  289.343325] thunderbolt 0-1: new device found ...      (bounces to 0-3)
> [  289.363303] thunderbolt 0000:00:0d.2: 0:10 <-> 3:12 (DP): not
> enough bandwidth
> [  289.363367] thunderbolt 0000:00:0d.2: 3:12: DP tunnel activation
> failed, aborting
>    ... at least ~54 s of silence, no retry from the CM ...
> [  343.614848] thunderbolt 0-3: device disconnected       (display firmware
> [  348.801013] thunderbolt 0-1: new device found ...       resets itself)
>    ... this attempt succeeds silently, display lights up
> (Note: early timestamps above are journald ingest times - root fs is
> encrypted, so initramfs-stage kmsg is re-stamped after unlock.)
> 
> xe reports matching "[CONNECTOR:512:DP-1] commit wait timed out" +
> intel_dp_link_check WARNs during the failed window.
> 
> Observations
> ------------
> 1. Every failed attempt ends at tb_tunnel_one_dp() ->
>    "DP tunnel activation failed, aborting". Nothing is rescheduled;
>    the only recovery path is a fresh hotplug generated by the display
>    itself. On a bad day the display doesn't reset and the black screen
>    is permanent (needs replug / display power cycle).
> 2. Hot-plug of the warm display succeeds 100% of the time on both cables
>    (40G on the TB5 cable, 5K120 DSC fine).
> 3. A successful cold boot captured with thunderbolt.dyndbg=+p (USB4 20G
>    cable) still shows 2 disconnect/reconnect cycles and one transient
>    "not enough bandwidth" for the second DP tunnel before converging -
>    success vs failure appears to be the same bounce loop with a lucky
>    final iteration, not a different path.
> 4. thunderbolt.clx=0 makes the "failed to enable TMU" line disappear but
>    does not change the user-visible behavior.
> 
> Question
> --------
> Would a bounded retry with backoff in the DP tunnel setup path be an
> acceptable direction? I.e. on activation failure / NO_BANDWIDTH in
> tb_tunnel_one_dp(), schedule delayed work that re-runs tb_tunnel_dp()
> a few times (cancelled on unplug) instead of aborting permanently.
> Notably the driver already applies exactly this pattern to
> bandwidth-allocation requests that arrive before the tunnel is active
> (TB_BW_ALLOC_RETRIES, 50 ms backoff in tb_queue_dp_bandwidth_request());
> tunnel establishment just has no equivalent today.
> I'm happy to test patches on this hardware, and can provide:
> - full dyndbg log of the successful cold boot (3900 lines, on hand)
> - dyndbg capture of a failing cold boot (can reproduce)
> - anything else that helps (this combination - Panther Lake TB4 host +
>   Barlow Ridge based TB5 display - is probably rare right now)

[Added Imre.]

There was recently another report about the same monitor but we could not
root cause the issue because the reporter had to return the display. I
think the problem happened also when plugging the monitor in after the
system was already up.

Can you provide a full dmesg of the cold boot with dyndgb enabled? Please
also add "drm.debug=0x10e" in the command like so we can get the graphics
side logs as well.
