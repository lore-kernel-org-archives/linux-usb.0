Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B442B725
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102170; cv=none; b=UGl2x7vVjl7VHFBlevZxWZQIcuajysyWUL13NgYwiD4Ev1CC5eiCFG/fLjde8T7UNPYgBi/F9pG+eNhQ8X9p1BKNmigL/xCCmPJ4pQp/n0OoniHZV26LX26l1fZ4jKaTdxUfBhcNZVtQt/yYgAifzKMIUqG54zA3shvcLa5fRfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102170; c=relaxed/simple;
	bh=3ShrTcZGI+mE3BmeQLuXscz4NMrLwoKlHW3KtQyYGdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dco4mmoAPmWjsajK/+jF7PM7Z/xQdUEd3Jtaq2Ghm1IHX9O1enlI4UAAc2vc9pm8ZWKe65OoX109gPP8qhR1JKE/J9cZAw02ENZ+I/+T/OR3eFHucDhgFb4706GlXfvuYE8KZP0jkzHgttPL4ppTLphrjxd/lYH9pCkhZnjUdCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaQfa38z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaQfa38z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786102168; x=1817638168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3ShrTcZGI+mE3BmeQLuXscz4NMrLwoKlHW3KtQyYGdI=;
  b=CaQfa38zjPzLKZ8BxKoRsNXXtqY3gDArIfZR9UYha/5XAtB9QMkL+gWd
   31zklKt33aBrqL1bTWrPpwesjz9rU70Xd4VuZfrSdaryv7eM0OZELzM46
   Eojh7M+Ez3V9kpaZs0oBTO05YB+45SdifG1FWeLutP0M4vcGCqsWWrR93
   oxqLGMWe1liUYiolbNNWwoT0e1/9CxRkFF24WLjnoIYmXqn9qf3WyhY3u
   gN40o/HumJvcHe/tB6wcKoowdcbkg6+0Bz1dVdUgglGgzykgi+TDzbWsr
   15I2OfyjZ5zYds9SVp9ZIROn3M7SfNKBOJp71K6eu9mruHB5ZIr4iN2lr
   g==;
X-CSE-ConnectionGUID: AlpPBkJPRkGObB8Z57JcCQ==
X-CSE-MsgGUID: qsi0lhdgSP6NeaIFauUdWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97356203"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97356203"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:29:27 -0700
X-CSE-ConnectionGUID: G+dI8PdCTyG0YNonIuK+5w==
X-CSE-MsgGUID: ZMulofL3QaCIdBemiZuyJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259765735"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 07 Aug 2026 04:29:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6319A99; Fri, 07 Aug 2026 13:29:25 +0200 (CEST)
Date: Fri, 7 Aug 2026 13:29:25 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David GUENAULT <david.guenault@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
Message-ID: <20260807112925.GN235112@black.igk.intel.com>
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
 <20260807043719.GI235112@black.igk.intel.com>
 <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>
 <20260807101805.GM235112@black.igk.intel.com>
 <CAOFj14-tWAAkwGOuoyS_w-kV87PvLaXMViXmNKW9wjxS9Hr3yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOFj14-tWAAkwGOuoyS_w-kV87PvLaXMViXmNKW9wjxS9Hr3yw@mail.gmail.com>

On Fri, Aug 07, 2026 at 01:01:22PM +0200, David GUENAULT wrote:
> On Fri, Aug 07, 2026, Mika Westerberg wrote:
> > So with IOMMU enabled SL1 is redundant and it may actually end up stepping
> > a non validated path because these systems ship with IOMMU support so the
> > CM firmware is by default "none".
> >
> > Can you put the BIOS settings back to the defaults and then repro but
> > instead of booting with the device connected do this:
> >
> > 1. Boot the system up, nothing connected.
> > 2. Once up, plug in the TB5 dock.
> 
> Done. BIOS restored to factory defaults (only change kept afterwards:
> Secure Boot disabled, because the mainline kernel build I am testing is
> unsigned). Security level is back to the default:
> 
>   /sys/bus/thunderbolt/devices/domain0/security      = none
>   /sys/bus/thunderbolt/devices/domain0/iommu_dma_protection = 1
> 
> Kernel is still vanilla mainline v7.1.5, command line unchanged apart from
> the debug flag:
> 
>   BOOT_IMAGE=/boot/vmlinuz-7.1.5-070105-generic root=UUID=... ro quiet splash
>   thunderbolt.dyndbg=+p vt.handoff=7
> 
> The udev rules I mentioned earlier are still disabled, so this is stock.
> 
> Booted with nothing connected, then plugged the dock in at t=60s. The
> firmware CM is used, as expected:
> 
>   [    1.680488] thunderbolt 0000:03:00.0: using firmware connection manager
> 
> and on hotplug:
> 
>   [   60.228058] thunderbolt 0-1: new device found, vendor=0x41f device=0xd002
>   [   60.228061] thunderbolt 0-1: Micro Computer (HK) Tech. Ltd. TBGAA
>   [   60.228236] thunderbolt 0-1: device disconnected
> 
> So the router is announced and then dropped 178 microseconds later. This
> happens exactly once -- there is no reconnect loop. As you predicted, there
> is no "PCIe tunnel creation failed" this time, since approve_switch is never
> called at security=none.
> 
> Nothing appears behind the Thunderbolt downstream port afterwards:
> 02:01.0 stays at PresDet-, no device on bus 04, no GPU in lspci. The dock's
> USB and Ethernet functions do not show up either.
> 
> For reference, when the link does stay up (which happened in earlier tests),
> the lane adapter error counters are all zero and the link reports
> 40 Gb/s = 2 lanes * 20 Gb/s in both directions, so this does not look like a
> signal integrity problem to me.
> 
> Attached:
>   dmesg-factory-default.txt      full dmesg (1330 lines)
>   lspci-vv-factory-default.txt   full 'sudo lspci -vv' (1190 lines)
> 
> Attaching them as files this time, sorry about the line wrapping in my
> previous mail.
> 
> Let me know if you want any other capture -- I can rebuild the kernel with
> extra tracing if that helps.

Thanks!

There is pretty much no PCIe hotplug from your logs and the lspci shows the
same as you also noticed. One thing that stands out:

[    1.745588] thunderbolt 0000:03:00.0: 0: NVM version 42.0

I looked our latest NVM for TR and the version is 69.4, if I read right it
also supports "SP" == Single Port == 2C version that you have. Now the
release notes mention exactly issues with devices after Goshen Ridge (first
TB4 dock) so that might actually apply in your case too because you have
TB5 dock which is exactly the one after GR. There are certain bits that the
CM needs to set for the tunneling to work in USB4 routers.

I wonder if you have checked if there is firmware upgrade available for
that? It should be available through fwupd but some OEMs don't do that
(Dell and Lenovo at least do).

I have TB5 dock here and TB3 system so I will try on my end if I can see
similar behaviour.
