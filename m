Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D331F985
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097890; cv=none; b=fmAOW1guKR2h+MDjUKxXQFBTQnqE1PphkujwfA0Mi5SNOENrPGcv9sbxVGyI1sRN0Kq27Q5JqBVdUIgDd4taPk1pobMJvMR8+/EjRYgyT3UAVI33Xijt2vAuTGdh6Vd7wY0onsiGdY2759ZWNJz/p1sg3cPU5LbzWXkCtIo0ONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097890; c=relaxed/simple;
	bh=c9Le6AgIK6JiYbvYEDdBi66CwcuPz+peW8Mqb5asJTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxE6+4c9cib0RlDe+sXbGuX6T3zn+TIwcCcrXAM+jSOAfcYqBvTxT8/EOZiFAzwIjHkZaWlqICSPtLSpoq2os6GHGWVs3psRK8HMzPKt/G5dFtMegYz/uwLmSWK0mSu4lmTAhFnUHSOuQ3De7mkrKhBZzW4gmbQh9FfBrTeiIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgXCyyUS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgXCyyUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786097888; x=1817633888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c9Le6AgIK6JiYbvYEDdBi66CwcuPz+peW8Mqb5asJTA=;
  b=GgXCyyUSTACLG2MBS5LXHPNDrsp4yhlw2RHxxHkNsUds+/Tk62mZqnlh
   UH91ADYoWd8OI9cdvMKIZL3RDg8poRO3hfbGZvr8fQ8ktwb9sWdFmK6ds
   pQHR12r8AH2VQ0iOkqI1VrXVmhWZAR+YNH9dYA1n9Pc4b69xsimMkaZN/
   mHNN9z1c4GOwtp+uwaNXGIDacsL61CGr/3OsEcItb9poUwh2SErnB9WD7
   n40i0zsnQLF48GGc+KGy5MOZXgd/QIuKA5YJYQfXb4rr3oAzN1TAcIGYt
   F0MauH0LMtg8K+2+O1DAYqzcur61U9boWLMEdyhxD+MW83xl5shVCZab1
   Q==;
X-CSE-ConnectionGUID: vKZiGdc4Tg+RFO9m79ykwA==
X-CSE-MsgGUID: AeRs/NkyQe6d6WM+/bT9fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86578134"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86578134"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 03:18:08 -0700
X-CSE-ConnectionGUID: BZZezdxlRMe8FgHqLnJAzw==
X-CSE-MsgGUID: Bhx53knQQR2CsptWuwfnWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="300579225"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 07 Aug 2026 03:18:06 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 33AB599; Fri, 07 Aug 2026 12:18:05 +0200 (CEST)
Date: Fri, 7 Aug 2026 12:18:05 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David GUENAULT <david.guenault@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
Message-ID: <20260807101805.GM235112@black.igk.intel.com>
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
 <20260807043719.GI235112@black.igk.intel.com>
 <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOFj14869aOGeoSfBVcS+-W3FUCq7CN3g+3cuGRJeZTD5Zjnng@mail.gmail.com>

Hi,

On Fri, Aug 07, 2026 at 11:55:24AM +0200, David GUENAULT wrote:
> On Fri, Aug 07, 2026 at 06:37 +0300, Mika Westerberg wrote:
> > That's because Titan Ridge is using firmware based connection manager so
> > it's not the TB driver that creates the tunnels.
> >
> > Can you drop all the non-distro kernel command line options, except
> > "thunderbolt.dyndbg=+p" and provide full dmesg?
> 
> Thanks -- you are right, and my original analysis was wrong on that point.
> I had been enabling dyndbg after boot, so I never saw the init messages and
> wrongly concluded from the port dumps that the software CM was in use.
> 
> Rebooted with a clean command line as requested. Kernel is vanilla mainline
> v7.1.5 (build from kernel.ubuntu.com/mainline, no distro patches):
> 
>   BOOT_IMAGE=/boot/vmlinuz-7.1.5-070105-generic root=UUID=... ro quiet splash
>   thunderbolt.dyndbg=+p vt.handoff=7
> 
> Everything except thunderbolt.dyndbg=+p is generated by Ubuntu's GRUB.
> I also disabled the udev rules I had been using (they forced
> power/control=on on the thunderbolt and 8086:15e7/15e8/15e9 PCI devices),
> so this boot is entirely stock.
> 
> The firmware CM is indeed in use:
> 
>   [    1.673598] thunderbolt 0000:03:00.0: total paths: 12
>   [    1.673598] thunderbolt 0000:03:00.0: IOMMU DMA protection is enabled
>   [    1.673945] thunderbolt 0000:03:00.0: control channel created
>   [    1.673949] thunderbolt 0000:03:00.0: using firmware connection manager
>   [    1.673950] thunderbolt 0000:03:00.0: NHI initialized, starting thunderbolt
> 
> The dock is found and the link comes up bonded at 40 Gb/s, then:
> 
>   [    6.012100] thunderbolt 0000:03:00.0: PCIe tunnel creation failed
> 
> If I read icm.c correctly, that message is emitted by icm_*_approve_switch()
> when the firmware replies with ICM_FLAGS_ERROR, so the Titan Ridge firmware
> is refusing the tunnel rather than the driver failing to build it. Is that
> the right reading? If so, is there anything on the host side that can be
> inspected or adjusted, or is this purely an NVM/firmware limitation?

This could be a limitation in FW but TB5 devices should be compatible with
TB3 connection manager. 

> One setting that is NOT a kernel command line option and may matter:
> BIOS "Thunderbolt Security Level" is set to "Unique ID" (SL1), which shows
> up as security=user in sysfs. This is deliberate: with "No Security"
> (security=none) the device is auto-authorized, approve_switch is never
> called, no tunnel is ever attempted and nothing at all is logged -- the
> device just silently appears authorized but unusable. Switching to SL1 is
> what makes the firmware actually be asked for the tunnel.

So with IOMMU enabled SL1 is redundant and it may actually end up stepping
a non validated path because these systems ship with IOMMU support so the
CM firmware is by default "none".

Can you put the BIOS settings back to the defaults and then repro but
instead of booting with the device connected do this:

1. Boot the system up, nothing connected.
2. Once up, plug in the TB5 dock.

Then take full dmesg (and also output of 'sudo lspci -vv') and send to me.
The dmesg you shared was badly line wrapped so if you can please attach the
them instead (you can send them directly to me or put them somewhere I can
download).

Note if security is none bolt does not try to authorize the PCIe tunnel as
it does not need to so this is expected.
