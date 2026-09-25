Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F7933D6E6
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 05:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790314173; cv=none; b=krl+Zid9CM0fYfaqjIyZqeMWXXEh7CiwcAk9OG+VVuL4BjabjsWzTaiCroj1XjWMvShYlzA69wDc90tIIbuxN0GjArfRNTNl+sBoycCisDqJoP9fglFEcsW/FHrlEV0AQm5Q9z2pi7LuFEyndVXVLsqbcAZHKqkDQxFW0J4aVFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790314173; c=relaxed/simple;
	bh=nfZO6pEAqPo2wmXTsdkDKZWno+d+L+oNxTfNr6W0dYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3ApI6RRAhAdgwEn7crgV8APhIMaWv8KcsueTfFspiRiQ1z76I09tT8xatv+BKgX72/JBB3TAo14MQHKbML0qY2m7WPfQ+QKs/9FV1ouBh5DuN6whN4kKcCVp7T0kyPvn8tVK3T5T6p3mAEKDNYFYMRfIu0AJIlSyz1sNw5U0ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvNBAmVy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvNBAmVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790314172; x=1821850172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nfZO6pEAqPo2wmXTsdkDKZWno+d+L+oNxTfNr6W0dYQ=;
  b=WvNBAmVyuVQcqNXYcRV6atWvLlqIC6msjPcUNmnFRheE/aVN/c4POow/
   uBzDel0fJNwxY3qu5QcHlwauXDNU0KIvepHrTIGiFmpAoatPhnaewh4YD
   VG5BTkQC2nrAmhEX3c8iVJ2lg7wQp+QKQe+1kJI7AOdAXjP5mi/DQ4BMl
   MlFEgxqOyoKwgL+XJlp5TmK2N+m8IYfz9hfT5pyS2YzJ4aYjlEtwoiWz2
   aANmIyR7dCtLTylbrqeYUAtkTjQy+4YNaBQFk5N2pLmtL3LiHtCvmLHRg
   sLncmIC3Dlez76RgWZb1vekIxh8fnqdJ/xipB4SpW84gKEFq8dMcDEa+0
   Q==;
X-CSE-ConnectionGUID: Pwvz+YRRTp+r5QiHCZjsqg==
X-CSE-MsgGUID: WgGzXOdfRMOamIjmTdEbmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90055254"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90055254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 22:29:32 -0700
X-CSE-ConnectionGUID: 8ohqqzgrRuObGGtkml/FIA==
X-CSE-MsgGUID: gwtMUIQcSTqx9gtXYKFf5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273730250"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2026 22:29:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 24CCE99; Fri, 25 Sep 2026 07:29:29 +0200 (CEST)
Date: Fri, 25 Sep 2026 07:29:29 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: =?utf-8?B?UGF3ZcWC?= Frelek <pawel.frelek@gmail.com>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org, andreas.noever@gmail.com,
	YehezkelShB@gmail.com
Subject: Re: [BUG] thunderbolt: NULL pointer dereference in tb_dp_dprx_work
 after device disconnect (7.2.6)
Message-ID: <20260925052929.GW106095@black.igk.intel.com>
References: <CABL4uFnCWgWdPL5s85O49sDyNADf4Lk684nx60g9wox_qOOOww@mail.gmail.com>
 <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABL4uF=f6Y06KmZ+ux2ZrboiLxivFZMyB_dqc4rTiEtiLd3GLw@mail.gmail.com>

Hi,

Thanks for the report and good that the problem got fixed. These should
land on the v7.3-rcX still.

On Thu, Sep 24, 2026 at 06:28:34PM +0200, Paweł Frelek wrote:
> FWIW, this is addressed by Sven Peter's series "thunderbolt: Fix DP
> tunnel teardown while an async DPRX read is running", patches 1-6 of
> which are already in thunderbolt.git/fixes. I tested v3 on top of
> 7.2.6 on this machine (dock unplug/replug, reboots with the dock
> connected): no crashes or warnings.
> 
> Thanks,
> Paweł
> 
> wt., 22 wrz 2026 o 16:48 Paweł Frelek <pawel.frelek@gmail.com> napisał(a):
> >
> > Hi,
> >
> > I hit a NULL pointer dereference in tb_dp_dprx_work during reboot,
> > right after the dock was disconnected from the Thunderbolt bus.
> >
> > Hardware:
> > - Lenovo ThinkPad X13 Gen 3 AMD (21CNS15T00), BIOS R22ET81W (1.51)
> > - Lenovo ThinkPad Thunderbolt 4 Dock (40B0), external monitor over DP
> >
> > Kernel: 7.2.6-hardened1 (Arch linux-hardened), not tainted
> > Cmdline includes: thunderbolt.dprx_timeout=-1
> >
> > What happened:
> > The external DP monitor behind the dock did not come up at boot. I
> > unplugged and replugged the monitor's DP cable at the dock, without
> > success, then rebooted (the dock itself stayed connected). During
> > shutdown the dock was reported as disconnected and ~50 ms later the
> > pending DPRX work crashed:
> >
> > [  140.825070] thunderbolt 0-2: device disconnected
> > [  140.875648] BUG: kernel NULL pointer dereference, address: 000000000000032b
> > [  140.877281] CPU: 8 UID: 0 PID: 125 Comm: kworker/u48:4 Not tainted
> > 7.2.6-hardened1-1-hardened #1 PREEMPT(full)
> > [  140.877513] Hardware name: LENOVO 21CNS15T00/21CNS15T00, BIOS
> > R22ET81W (1.51 ) 04/10/2026
> > [  140.877748] Workqueue: thunderbolt0 tb_dp_dprx_work [thunderbolt]
> > [  140.878003] RIP: 0010:tb_dp_dprx_work+0x82/0x160 [thunderbolt]
> > [  140.880927] Call Trace:
> > [  140.881164]  <TASK>
> > [  140.881652]  process_one_work+0x198/0x370
> > [  140.881896]  worker_thread+0x1a6/0x310
> > [  140.882380]  kthread+0xf3/0x130
> > [  140.882863]  ret_from_fork+0x2dc/0x3a0
> > [  140.883818]  ret_from_fork_asm+0x1a/0x30
> > [  140.884065]  </TASK>
> > [  141.399331] Code: 24 20 48 8b 87 58 ff ff ff 48 8d b8 18 03 00 00
> > 49 89 c4 4c 8d b8 18 03 00 00 e8 39 ff db d3 48 8b 8b 60 ff ff ff 48
> > 8b 41 20 <0f> b6 90 2b 03 00 00 c0 ea 05 75 5d 66 81 b8 18 03 00 00 86
> > 80 74
> > [  141.399974] RAX: 0000000000000000 RBX: ffff88ae1389c4b0 RCX: ffff88b040d53578
> > [  141.400298] RDX: ffff88b0916f0000 RSI: ffff88ae1389c4b8 RDI: ffff88ae011a6318
> > [  141.402844] Kernel panic - not syncing: Fatal exception
> >
> > It looks like the DPRX work is not cancelled when the device behind the
> > tunnel goes away. With dprx_timeout=-1 the work never expires, which
> > makes the window large, but I assume the race exists with the default
> > timeout too.
> >
> > I set dprx_timeout=-1 because the external monitors sometimes did not
> > come up at boot (DP tunnel torn down as "not active").
> >
> > Full pstore dmesg available on request.
> >
> > Thanks,
> > Paweł
> >
> > --
> > Paweł Frelek   (﻿ ͡° ͜ʖ ͡°)
> > pawel.frelek@gmail.com
> 
> 
> 
> -- 
> Paweł Frelek   (﻿ ͡° ͜ʖ ͡°)
> pawel.frelek@gmail.com
