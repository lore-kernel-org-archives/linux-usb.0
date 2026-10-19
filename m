Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C53AA4E1
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 06:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390286; cv=none; b=HSlZtr+G24MqD5qsh6iqUejU28NX/w7TbWKmriCoM+rW7neuDKCnySkVzbvDCvz1kts7rsFLGu7iwuXNKVWzPILyD5ALGw7XzjGynJLySUcfBfGm+o5Ve30Dgs1A7aLmQKkWxt0bVjaMAFqhPo3iz3n8Ei2McB3LCF9veHaSRkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390286; c=relaxed/simple;
	bh=h86DjC4kd+8hxW7jisgmZoOvowW6N1haOjiQZrIdrZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAgu6lB90kNWGa4zZyZgsStZV7Uz63w2IEaOMtSnrS0V5sVkXc8iy9Z5HmiKMW1vxDTQ9M8U7CbdKyDr49wfFbd6yheCJArR8Eoa2d77crK0S3BXT6XX9d+yevITZyaprVvpaUHFJ4vN7L+1Rm+OW7WlC6A7N1nz0dfEl+CQ5+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpK/C+5/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpK/C+5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792390285; x=1823926285;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=h86DjC4kd+8hxW7jisgmZoOvowW6N1haOjiQZrIdrZI=;
  b=FpK/C+5//+epTSCM4MsGfaN5fSJHbrCthlO9mS/bQcEkUfpGcO39afOY
   e8X3Ek5s0cbR9HZvYekdCkvcbE5gAyJuRzkgmpTsR94lAmxToS2At/VJd
   G+EbJUOi0MKKv2asGP0YdfDjwO8SPyMsnohTxy3O45GwmsSeCn84EQ0LO
   t+oFyapKxzUPDk+U1r2gA9axL2cAKQsVrFgLhwtPFlLb0nhKm12SGHnRl
   GGBX1YDHgi5jyXJMqfS/bxCUK9RPWVmNt6ts0MdaRvCGrre3evP4FMs7n
   TLGwZNdsB2AJs/EWj3lDqH11Ks/Mb2E/suEGMyAmxmIZ73pNdfRU6+pv7
   Q==;
X-CSE-ConnectionGUID: iAsmMSmUSCKc2hRmJ8Pj5A==
X-CSE-MsgGUID: T2dEkmGYRZKx6FymNMxOMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="935887"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="935887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:11:24 -0700
X-CSE-ConnectionGUID: nA4qm2saQN+E514Zm//RFw==
X-CSE-MsgGUID: KaeHFhKsQ62ujibsDLCDag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2560011"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 23:11:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3B33C99; Mon, 19 Oct 2026 08:11:21 +0200 (CEST)
Date: Mon, 19 Oct 2026 08:11:21 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?B?UGF3ZcWC?= Frelek <pawel.frelek@gmail.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
Message-ID: <20261019061121.GZ176164@black.igk.intel.com>
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
 <20260925052929.GW106095@black.igk.intel.com>
 <CABL4uFn1nTrdxomWgAWs_gtsM5r1owt+4KOk1F39rXTLF3UZkg@mail.gmail.com>
 <20261016055802.GV176164@black.igk.intel.com>
 <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABL4uFncJktAvO9yVpZOjm=uAjLa7291deE9x805i8Kc7tFUDw@mail.gmail.com>

Hi,

On Fri, Oct 16, 2026 at 06:55:40PM +0200, Paweł Frelek wrote:
> pt., 16 paź 2026 o 07:58 Mika Westerberg
> <mika.westerberg@linux.intel.com> napisał(a):
> >
> > Hi,
> >
> > Okay something is still holding the domain reference.
> >
> > > The full pstore dmesg is attached. I can enable thunderbolt dynamic
> > > debug or test patches if that helps.
> >
> > Yes please. Also drop the dprx_timeout= if you don't need it (you should
> > not). I'm adding AMD folks here too just in case.
> 
> Hi Mika,
> 
> It’s reproducible here: turn the monitors off (DPMS), wait a minute,
> turn them back on and reboot ~10 s later. 3 out of 3 tries hung, all
> with thunderbolt.dyndbg=+p, on 7.2.9 (Arch). The third one was without
> dprx_timeout, so that parameter isn’t related to the hang.
> 
> First try: the reported hung task is a kworker in
> drm_fb_helper_damage_work, blocked on a mutex held by
> drm_dp_mst_link_probe_work. That one is still running, in an atomic
> commit doing a DPCD read over the DPIA AUX through DMUB, which times
> out every 10 s once the dock is gone:
> 
> [ 381.866955] shutdown[1]: Rebooting.
> [ 381.909909] thunderbolt 0-2: device disconnected
> [ 381.910278] thunderbolt 0000:74:00.6: control channel stopped
> [ 391.281808] amdgpu 0000:73:00.0: [drm] ERROR
> wait_for_completion_timeout timeout!
> [ 391.494199] amdgpu 0000:73:00.0: [drm] ERROR
> dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic
> data
> ... repeats every 10 s ...
> [ 493.681887] INFO: task kworker/8:0:46 blocked for more than 122 seconds.
> [ 493.695092] INFO: task kworker/8:0:46 is blocked on a mutex likely
> owned by task kworker/6:0:40.
> [ 493.695982] Workqueue: events_long drm_dp_mst_link_probe_work
> [drm_display_helper]
> 
> Second and third try: shutdown blocked in nhi_pci_remove ->
> wait_for_completion, same as my earlier reports. In the second one
> amdgpu keeps logging these every ~200 ms (250+ pairs, they pushed the
> beginning of the log out of pstore):
> 
> [ 932.152799] amdgpu 0000:73:00.0: [drm] ERROR Error queueing DMUB
> command: status=2
> [ 932.153392] amdgpu 0000:73:00.0: [drm] ERROR
> dc_dmub_srv_log_diagnostic_data: DMCUB error - collecting diagnostic
> data
> ...
> [ 985.211169] INFO: task shutdown:1 blocked for more than 122 seconds.
> 
> Earlier today, without the monitor off/on step, I also got it on a
> plain reboot after ~14 min of uptime (shutdown in nhi_pci_remove, no
> dyndbg in that one).
> 
> About dprx_timeout: without it the monitors didn’t come up on 2 of 3
> boots today. Once the DP tunnel was torn down after 12 s of “DPRX read
> timeout”. The other time the DPRX capabilities read completed, but the
> tunnel was torn down as “not active” ~14 s later. With 60000 I haven’t
> seen this today, so I’ve put it back for now.
> 
> Attached (pstore dmesg unless noted):
> 
> hang-dyndbg-dmesg.txt.gz: first try
> hang2-dyndbg-dmesg.txt.gz: second try
> hang3-no-dprx-timeout-dmesg.txt.gz: third try, without dprx_timeout
> hang-earlier-dmesg.txt.gz: plain reboot, no dyndbg
> no-dprx-timeout-boot-tb.txt.gz, no-dprx-timeout-boot2-tb.txt.gz:
> thunderbolt lines from the two boots where the monitors didn’t come up
> (full logs available)

Thanks for the logs! There are bunch of other fixes around this area that
might not yet be in your kernel, specifically this one:

1fd1f67c94d3 thunderbolt: Fix domain reference leak when DPRX read is canceled

I suggest to take the just released v7.3 and see if the problem still
persist.
