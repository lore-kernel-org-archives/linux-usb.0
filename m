Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD22F7F1C
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 12:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785933970; cv=none; b=mGRbenq9MbZwt2v/mn/UQHIMhrtm76bIUm5m/QX0+8dvl/jyJn3NWv1955U2/kL+ZfhojvIMhxT0k0KbpS6B2i1r+iL5P5Emzx45gb2z2oRWbh04KI0IghdnuCu6XnlDH5shDlAK4Q7fIiDQksepAZprMZhABX64N4/Wk3lUJ+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785933970; c=relaxed/simple;
	bh=qb2Qb9+93g3wBORBl4Vq1TxWbvN0gRbPNamurWF9r2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reNEtnuhoJ75AjLqO2uUDMkCJjdaNuUFGnL5JkTD+67YDyRyDgZZItPo0MnLGe96FT/HPFwqkK2i9iA1bhSNnc429+no6zSTu8iL+PUUL0rve27ZxcEiCXiJAR4keFrm6xGgocv0gaw1OAeyJOwQLc9yiGEQ0fvHnklxSR1Qvkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pzzrkjbi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pzzrkjbi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785933969; x=1817469969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qb2Qb9+93g3wBORBl4Vq1TxWbvN0gRbPNamurWF9r2E=;
  b=PzzrkjbiQymZx0WeWjdkOeDP2rry1FSnuHI8FWW864cfSHUsZJKPEX6l
   TtaoAt7k5PRL8qMt3mUxflwP1z9MZvDF0KCWosgjbSVGot6xZjA6Q0+ya
   FLfrR5Xlr2PeJ9u50KjOJQmUvngAo5NOjBihKkJpIr9WaPorCF3JzIdj4
   uSPvfPYWJ9JReS61xzTdiTIcA1a/g80Nek6PNi2MgZRHC/euggBJEG/LZ
   1odANZhKrVutpqMzd1k1NhinNOMRn3zguuHFsXxhDvnMntAqxcjOQ5Hl8
   Hl8EDHH3yZdv+Uu6yf58MGeCdlwEBYpRQF79Q3kJjux3zMwwREYZfb2xZ
   w==;
X-CSE-ConnectionGUID: o+FIgdBbQhGr3C75ylSE0g==
X-CSE-MsgGUID: lF67HTpCS3+E9h1/bIL+FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86386152"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86386152"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:46:08 -0700
X-CSE-ConnectionGUID: TE4YM/bbRVqHjuFIOp4Myg==
X-CSE-MsgGUID: RVHmopgdTVCff+LcD8Q92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="260523213"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 05 Aug 2026 05:46:07 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E398899; Wed, 05 Aug 2026 14:46:05 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:46:05 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jacob Riff <jacob@riff.dk>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: intermittent "PPM init failed" at boot is never
 retried, Type-C event handling stays dead for the session
Message-ID: <anMwjQvKA9GYmH85@black.igk.intel.com>
References: <CAAw_munfAcpOUw-J9dPcnzVu+sibyxymFkLTp-a3-PMEe6VRZQ@mail.gmail.com>
 <anMof36XGNf1UjM8@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anMof36XGNf1UjM8@black.igk.intel.com>

On Wed, Aug 05, 2026 at 02:11:43PM +0200, Heikki Krogerus wrote:
> On Sat, Jul 25, 2026 at 02:31:53PM -0700, Jacob Riff wrote:
> > Hi,
> > 
> > On a Lenovo ThinkPad X1 Carbon Gen 14 (21V7CTO1WW, Panther Lake), UCSI
> > initialization intermittently fails at boot, and because the failure is
> > never retried, no typec ports are registered for the rest of the
> > session. Most visible consequence: after unplugging and replugging the
> > USB-C charger (a PD monitor), the machine silently never resumes
> > charging. Notably, DisplayPort alt mode on the same port continues to
> > work across replugs in this state, and charging does work if the
> > charger was already attached at boot (EC autonomous) - it is
> > specifically resumption of charging after a replug that is lost, which
> > makes the failure easy to miss until the battery is unexpectedly
> > drained.
> > 
> > Failure rate: 5 of 8 boots on one day of testing. Reproduced on two
> > firmware versions including the latest (BIOS N4OET49W/1.12 and
> > N4OET51W/1.14, EC 1.09 and 1.10). No clear correlation with whether
> > anything is attached at boot: two boots one minute apart with the same
> > setup split ok/fail.
> > 
> > Kernel: 7.1.4 (Arch Linux, unpatched in this area)
> > 
> > Two failure flavors seen:
> > 
> >   ucsi_acpi USBC000:00: error -ENODEV: PPM init failed
> > 
> > and:
> > 
> >   ucsi_acpi USBC000:00: possible UCSI driver bug 2
> >   ucsi_acpi USBC000:00: error -EINVAL: PPM init failed
> > 
> > Both appear ~1s after the typec ports bind. On failed boots
> > /sys/class/typec/ stays empty.
> > 
> > The part that suggests a driver-side improvement: recovery is trivial.
> > Reloading the module seconds later has succeeded on every attempt so
> > far (double digits by now):
> > 
> >   modprobe -r ucsi_acpi && sleep 2 && modprobe ucsi_acpi
> > 
> > after which connectors register and charging renegotiates immediately,
> > no replug needed.
> > 
> > ucsi_init_work() currently only requeues the init work for
> > -EPROBE_DEFER (up to UCSI_ROLE_SWITCH_WAIT_COUNT). Given that an
> > immediate retry reliably succeeds here, would it be reasonable to also
> > retry a few times on other errors (-ENODEV/-EINVAL) before giving up?
> > The PPM on these machines appears to simply not be ready to answer
> > during a window around when init runs.
> > 
> > Possibly related prior reports of Lenovo PPMs being slow/unready at
> > init: the "usb: typec: ucsi: increase timeout for PPM reset operations"
> > RFC (Feb 2025) and Ubuntu bug #2054928 (ThinkPad E490, -ENODEV).
> > 
> > Happy to test patches on this hardware.
> 
> I'm sorry to keep you waiting. I'm just letting you know that this
> issue is in my queue, but right now I don't have time. I will try
> to take a closer look at this later this month.

Can you check does this improve the situation:
https://lore.kernel.org/linux-usb/20260805085725.389761-1-huangwei@kylinos.cn/

Thanks,

-- 
heikki
