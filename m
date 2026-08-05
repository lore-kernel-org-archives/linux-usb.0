Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15383456E1E
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931907; cv=none; b=WXRhIXbE9XXflVB3EsQgrVql+zY10PimgJAc8STMKAhVFZvukylU+Kl4teop6J+pJV0S62IKoNiy0IRyrDD/4p2qOVxGNnNfRKszM4nqSOkUBbE5R9xrgevf/TxC6n4y2y6Oyq1Vi5vVJorL8b2YNxH4zacazbXxrbQPogHSf8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931907; c=relaxed/simple;
	bh=k+Mm4uqcNyM1cwOW56sVAQ88X8umlqFjOdhpQTW2970=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+p2KC5PUG1wjSiotN7zCSCaFvf1p3HrYQSdMG79y0Hm5nmwhHdWwILFR7F1K7a8uxVcIpXHvMz21ngTPeo8AOhB5o2epqy1rRU4c/78l7PGi3hQnmqwq09DehLskolxoKmnY1qrS/j/RgQ4ssI994+XVafVkpUSGDgzPvcUDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjQ80wIN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjQ80wIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931906; x=1817467906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k+Mm4uqcNyM1cwOW56sVAQ88X8umlqFjOdhpQTW2970=;
  b=FjQ80wIN16EK++SJCPIKrnuaB67MeX0CapAYubrEYgb+PL/VnrZ3NMoY
   C07T7Ax2s5RpbGuzqtqUwuod967XryrI/Tbt8E3nU8VPzY+ib4fm5dRd1
   R6qQLruYcOgl6/iHySNs8GHokT7GLFHM49uwjHTGHnfBCtkrnmlS0Opzz
   b5YbjWwl/uJ2C1SB1ZvQCrBuX7u8YhGMuTSYJJ+8YZ573lzRJdvr6TOTw
   7s7nfxgsStkRtM37aEEFimOD2ocHV2xwgC7GxGKrpIuaqbTg0/L9e+R+n
   XtwvmlRsw8QXeVNiUWLdqXHzCXbIqMvVIEvkxrOh+zNKYHoyAik2da0ZN
   A==;
X-CSE-ConnectionGUID: n/o2Sd3oQIepxfnovNk0mQ==
X-CSE-MsgGUID: ca4lPleOToigJ/f9T3xMHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86705231"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86705231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:11:46 -0700
X-CSE-ConnectionGUID: zEd44JW4QPWC+1cLODkCWw==
X-CSE-MsgGUID: qQ7ingHfR36UKSEgtHn0wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="286450233"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 05 Aug 2026 05:11:45 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9155899; Wed, 05 Aug 2026 14:11:43 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:11:43 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jacob Riff <jacob@riff.dk>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: intermittent "PPM init failed" at boot is never
 retried, Type-C event handling stays dead for the session
Message-ID: <anMof36XGNf1UjM8@black.igk.intel.com>
References: <CAAw_munfAcpOUw-J9dPcnzVu+sibyxymFkLTp-a3-PMEe6VRZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAw_munfAcpOUw-J9dPcnzVu+sibyxymFkLTp-a3-PMEe6VRZQ@mail.gmail.com>

On Sat, Jul 25, 2026 at 02:31:53PM -0700, Jacob Riff wrote:
> Hi,
> 
> On a Lenovo ThinkPad X1 Carbon Gen 14 (21V7CTO1WW, Panther Lake), UCSI
> initialization intermittently fails at boot, and because the failure is
> never retried, no typec ports are registered for the rest of the
> session. Most visible consequence: after unplugging and replugging the
> USB-C charger (a PD monitor), the machine silently never resumes
> charging. Notably, DisplayPort alt mode on the same port continues to
> work across replugs in this state, and charging does work if the
> charger was already attached at boot (EC autonomous) - it is
> specifically resumption of charging after a replug that is lost, which
> makes the failure easy to miss until the battery is unexpectedly
> drained.
> 
> Failure rate: 5 of 8 boots on one day of testing. Reproduced on two
> firmware versions including the latest (BIOS N4OET49W/1.12 and
> N4OET51W/1.14, EC 1.09 and 1.10). No clear correlation with whether
> anything is attached at boot: two boots one minute apart with the same
> setup split ok/fail.
> 
> Kernel: 7.1.4 (Arch Linux, unpatched in this area)
> 
> Two failure flavors seen:
> 
>   ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
> 
> and:
> 
>   ucsi_acpi USBC000:00: possible UCSI driver bug 2
>   ucsi_acpi USBC000:00: error -EINVAL: PPM init failed
> 
> Both appear ~1s after the typec ports bind. On failed boots
> /sys/class/typec/ stays empty.
> 
> The part that suggests a driver-side improvement: recovery is trivial.
> Reloading the module seconds later has succeeded on every attempt so
> far (double digits by now):
> 
>   modprobe -r ucsi_acpi && sleep 2 && modprobe ucsi_acpi
> 
> after which connectors register and charging renegotiates immediately,
> no replug needed.
> 
> ucsi_init_work() currently only requeues the init work for
> -EPROBE_DEFER (up to UCSI_ROLE_SWITCH_WAIT_COUNT). Given that an
> immediate retry reliably succeeds here, would it be reasonable to also
> retry a few times on other errors (-ENODEV/-EINVAL) before giving up?
> The PPM on these machines appears to simply not be ready to answer
> during a window around when init runs.
> 
> Possibly related prior reports of Lenovo PPMs being slow/unready at
> init: the "usb: typec: ucsi: increase timeout for PPM reset operations"
> RFC (Feb 2025) and Ubuntu bug #2054928 (ThinkPad E490, -ENODEV).
> 
> Happy to test patches on this hardware.

I'm sorry to keep you waiting. I'm just letting you know that this
issue is in my queue, but right now I don't have time. I will try
to take a closer look at this later this month.

Thanks,

-- 
heikki
