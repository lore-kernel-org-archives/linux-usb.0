Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9F132B13E
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102506; cv=none; b=GOfIz9rVmkQ8eEuDNS3SICeWtuFaIWBECa3qLnMQtOnMc9CVKZbM7k/x0Z/Y8FMAiBYx4lqHkQOhMe6PRfyKhJGfiuXoAw1h5+86ch2X0qEJkgrEH2TqXq1cBp0vewm1Ii0HsPR0cBccXolc+7GyKS/GWVEXb7w2qObPj9PiDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102506; c=relaxed/simple;
	bh=6m09kTlh3avw8bM9oWK+DTkEfset+vKbHomfXs4fZZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p32cPQPmNpXdFr2F1oQLuulv24BQ1GYAA6bJ/ESN9Qj7k5fI1JO8zIdYH3WtFJj3gMhh4B7ATSo8grVZHMd3jprJpAANSOimV29NtpAC/G7Mmbs7Hl/KmvIp9eZEnphEaWuJdyd4OMj97Ut4yGHk446loNbEFAAXit4uxyFwjf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+r9SEOX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+r9SEOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786102504; x=1817638504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6m09kTlh3avw8bM9oWK+DTkEfset+vKbHomfXs4fZZI=;
  b=V+r9SEOXH0v0AdGSvr8OUG99H+h5VgQu+QPmZl2M6QmasMLtkSwAt+FW
   vEnRwa/zj8GtGTQjNJun7Em5V/oI1RbZjWIwJvnTfKylteGhk1fppYJmG
   osNz9mJTwUn5i7RUyd0EfpaLZRvDGriUJKpylaKkobbPZj+JjBQP5NYvt
   KUo7v+acd3x8qSH1eR8tUj+gu/LVkDgk3PtiCNr8/zE95ohKwg5/9p8km
   pe9OgyoaJgz3SBQfkq7XahwMssDDLyq8AbhL80cxb6c46UT4y3IjWQpsN
   UYZS4HBbEX916MQzUwxisHJEOLDhtFVYVPnuXk/wmEI9OqFgfaeAr2hiH
   Q==;
X-CSE-ConnectionGUID: txIb5AY4RY6l4kD+5hdapg==
X-CSE-MsgGUID: Jr9aucp/QzyND75uPJW5+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90525199"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90525199"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:35:04 -0700
X-CSE-ConnectionGUID: 3rHV+F3BTlmqzOCJGRVlug==
X-CSE-MsgGUID: ccKSQ+wJRje+XOJRDWiVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="261857575"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2026 04:35:02 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1E8A499; Fri, 07 Aug 2026 13:35:01 +0200 (CEST)
Date: Fri, 7 Aug 2026 13:35:01 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David GUENAULT <david.guenault@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
Message-ID: <20260807113501.GP235112@black.igk.intel.com>
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
 <20260807043719.GI235112@black.igk.intel.com>
 <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>
 <20260807101805.GM235112@black.igk.intel.com>
 <CAOFj14-tWAAkwGOuoyS_w-kV87PvLaXMViXmNKW9wjxS9Hr3yw@mail.gmail.com>
 <20260807112925.GN235112@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260807112925.GN235112@black.igk.intel.com>

On Fri, Aug 07, 2026 at 01:29:25PM +0200, Mika Westerberg wrote:
> On Fri, Aug 07, 2026 at 01:01:22PM +0200, David GUENAULT wrote:
> > On Fri, Aug 07, 2026, Mika Westerberg wrote:
> > > So with IOMMU enabled SL1 is redundant and it may actually end up stepping
> > > a non validated path because these systems ship with IOMMU support so the
> > > CM firmware is by default "none".
> > >
> > > Can you put the BIOS settings back to the defaults and then repro but
> > > instead of booting with the device connected do this:
> > >
> > > 1. Boot the system up, nothing connected.
> > > 2. Once up, plug in the TB5 dock.
> > 
> > Done. BIOS restored to factory defaults (only change kept afterwards:
> > Secure Boot disabled, because the mainline kernel build I am testing is
> > unsigned). Security level is back to the default:
> > 
> >   /sys/bus/thunderbolt/devices/domain0/security      = none
> >   /sys/bus/thunderbolt/devices/domain0/iommu_dma_protection = 1
> > 
> > Kernel is still vanilla mainline v7.1.5, command line unchanged apart from
> > the debug flag:
> > 
> >   BOOT_IMAGE=/boot/vmlinuz-7.1.5-070105-generic root=UUID=... ro quiet splash
> >   thunderbolt.dyndbg=+p vt.handoff=7
> > 
> > The udev rules I mentioned earlier are still disabled, so this is stock.
> > 
> > Booted with nothing connected, then plugged the dock in at t=60s. The
> > firmware CM is used, as expected:
> > 
> >   [    1.680488] thunderbolt 0000:03:00.0: using firmware connection manager
> > 
> > and on hotplug:
> > 
> >   [   60.228058] thunderbolt 0-1: new device found, vendor=0x41f device=0xd002
> >   [   60.228061] thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
> >   [   60.228236] thunderbolt 0-1: device disconnected
> > 
> > So the router is announced and then dropped 178 microseconds later. This
> > happens exactly once -- there is no reconnect loop. As you predicted, there
> > is no "PCIe tunnel creation failed" this time, since approve_switch is never
> > called at security=none.
> > 
> > Nothing appears behind the Thunderbolt downstream port afterwards:
> > 02:01.0 stays at PresDet-, no device on bus 04, no GPU in lspci. The dock's
> > USB and Ethernet functions do not show up either.
> > 
> > For reference, when the link does stay up (which happened in earlier tests),
> > the lane adapter error counters are all zero and the link reports
> > 40 Gb/s = 2 lanes * 20 Gb/s in both directions, so this does not look like a
> > signal integrity problem to me.
> > 
> > Attached:
> >   dmesg-factory-default.txt      full dmesg (1330 lines)
> >   lspci-vv-factory-default.txt   full 'sudo lspci -vv' (1190 lines)
> > 
> > Attaching them as files this time, sorry about the line wrapping in my
> > previous mail.
> > 
> > Let me know if you want any other capture -- I can rebuild the kernel with
> > extra tracing if that helps.
> 
> Thanks!
> 
> There is pretty much no PCIe hotplug from your logs and the lspci shows the
> same as you also noticed. One thing that stands out:
> 
> [    1.745588] thunderbolt 0000:03:00.0: 0: NVM version 42.0
> 
> I looked our latest NVM for TR and the version is 69.4, if I read right it
> also supports "SP" == Single Port == 2C version that you have. Now the
> release notes mention exactly issues with devices after Goshen Ridge (first
> TB4 dock) so that might actually apply in your case too because you have
> TB5 dock which is exactly the one after GR. There are certain bits that the
> CM needs to set for the tunneling to work in USB4 routers.
> 
> I wonder if you have checked if there is firmware upgrade available for
> that? It should be available through fwupd but some OEMs don't do that
> (Dell and Lenovo at least do).
> 
> I have TB5 dock here and TB3 system so I will try on my end if I can see
> similar behaviour.

Okay I took my laptop (TB3) and connected TB5 dock and I can see exactly
the same issue as yours. It definitely should work in TB3 compatible mode
but apparently not. Let me ask around.
