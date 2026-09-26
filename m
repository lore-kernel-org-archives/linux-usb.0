Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9361FA272
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417594; cv=none; b=qk+GwU38UrerHkHsqybsMjDqcm+7ot6y0Gesr0wA8Iq71gTleLHpIzb55HWsEz4zcOxC7rFz+C7h3QQ3fMIlQNeIxkgnvchjlC2iicwYE9uHpncVcEl9Dg7fqLpRo9PLUtJRR2xdcVhjgt3rMcBDwh+kCAKLEPosc1iGuEIP4HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417594; c=relaxed/simple;
	bh=ouehsSR1e7hLBahLbkGVBEOjF6MCR0WkRD3rYP7/Q7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHk1La5sp5bEe2wCFE+ccr1KgyWTqG0YKel4AZJlTUmcmhUH5W3qBJL+MtguJFJBILvGi7JiDaJhaa14bBR5P+EZQ/AeeGgYvRtKwojxJjuPPZifmBUpmfbNY9bgrt+xJPWA4XNsRIZzdKoSCT/nh2NqHth2DzPH+im5/L9GZOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gKKDdOm+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gKKDdOm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790417592; x=1821953592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ouehsSR1e7hLBahLbkGVBEOjF6MCR0WkRD3rYP7/Q7U=;
  b=gKKDdOm+bSOOB1SIRx6ytX2NtW5nk4N7PNFoD/lnXKudz5Guu2KMtwdc
   Gkxer3nVR2bM+n9FoKFqeO8PQ7/071xKgqZUkNFl9WoPFUR8EI1dn5A+W
   yFRnCDUBb86hjKFDgmf9w2MXDhqE5/q8kcHyGYD8VZpV8ES9EMylfKTmV
   n3qpR6G9FwVBXp4qbI8iqwCZf/kOOvh2Uv7VOskQXifhB7IUp5P0T9ZGK
   htAfrZRGkST3te1ElEP7agfDpXZAqyC3LTcW48SRZxLKV526HUzzzG5UG
   oB34sjELjknr4f6E/VyCoG8VgP6hQPVLNUNp5ULujgRalAutIuUWiYmVV
   A==;
X-CSE-ConnectionGUID: R5J6jPRVRvufAaR5adTluA==
X-CSE-MsgGUID: KtFcHug0S5mbRZG6h/YTBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102554805"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="102554805"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 03:13:12 -0700
X-CSE-ConnectionGUID: nrXm3x6vQveq3Zpzjs+a9w==
X-CSE-MsgGUID: MZXs9VfPSVeGdxnQL64XrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="300819733"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 26 Sep 2026 03:13:11 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F2E8499; Sat, 26 Sep 2026 12:13:09 +0200 (CEST)
Date: Sat, 26 Sep 2026 12:13:09 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: brandon.proulx@42fifty.dev
Cc: "westeri@kernel.org" <westeri@kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Thunderbolt: reboot hangs in nhi_pci_remove() with CalDigit TS5
 Plus on AMD Strix Halo
Message-ID: <20260926101309.GC106095@black.igk.intel.com>
References: <3jbg0iV8op7Un2K3xLx2Y9Y_m8MbrxhUGm6y7eIO-UhE20lCXE321cO3Vd3IzDkBMy55DMA4A84SBZfOxoje_UHglYaYP9PxfvrstgSZd9E=@42fifty.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3jbg0iV8op7Un2K3xLx2Y9Y_m8MbrxhUGm6y7eIO-UhE20lCXE321cO3Vd3IzDkBMy55DMA4A84SBZfOxoje_UHglYaYP9PxfvrstgSZd9E=@42fifty.dev>

Hi,

On Sat, Sep 26, 2026 at 02:06:42AM +0000, brandon.proulx@42fifty.dev wrote:
> Hi,
> On a Framework Desktop (AMD Ryzen AI Max 300 / Strix Halo) with a CalDigit
> TS5 Plus attached, reboot never completes. After systemd finishes, PID 1
> sits in D state in nhi_pci_remove() during device_shutdown() and the
> machine never resets. The hardware watchdog does not fire either. Only the
> power button recovers it.
> 
> Hardware:
>   System:  Framework Desktop (AMD Ryzen AI Max 300 Series), BIOS 03.06 (2026-07-13)
>   Host routers:
>     c5:00.5 AMD Strix Halo USB4 Host Router [1022:158d], subsys [f111:000a]
>     c5:00.6 AMD Strix Halo USB4 Host Router [1022:158e], subsys [f111:000a]
>   Device:  CalDigit TS5 Plus (thunderbolt 1-2, domain1 on c5:00.6), gen 4, NVM 64.c1
> 
> Kernel: 7.2.5 (distribution build 7.2.5-3-omarchy, Arch-based)
> thunderbolt.host_reset=Y (default)
> 
> Stack of PID 1, sampled every few seconds from reboot until power-off.
> Unchanged from 21:02:02 to 21:07:27:
> 
>   [<0>] nhi_pci_remove+0x53/0x60 [thunderbolt]
>   [<0>] pci_device_shutdown+0x3e/0x80
>   [<0>] device_shutdown+0x169/0x1d0
>   [<0>] kernel_restart+0x3a/0x70
>   [<0>] __do_sys_reboot+0x22b/0x270
>   [<0>] do_syscall_64+0xaa/0x690
>   [<0>] entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
> The offset lands on the wait_for_completion(&nhi->domain_released) after
> tb_domain_remove(), so it looks like the last reference to the domain is
> never dropped while the TS5 Plus is connected. Unbinding the NHI via sysfs
> (echo 0000:c5:00.6 > /sys/bus/pci/drivers/thunderbolt/unbind) before reboot
> blocks in the same place (unbind_store -> nhi_pci_remove).
> 
> Reproduction:
>   1. Boot with the TS5 Plus connected to a rear USB4 port.
>   2. systemctl reboot
>   3. Machine hangs after the last systemd message and never resets.
> 
> Current workaround: sync, then SysRq-b (emergency_restart), which skips the
> device_shutdown() walk.

There are bunch of fixes for this area in my "fixes" branch here:

https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/

I wonder if you could try those and see if the problem goes away?
