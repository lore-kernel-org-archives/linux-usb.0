Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6634EEF7
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092732; cv=none; b=jb8UW2xOPbOJZTamCzygLFj6HWxQrqaon7WSSZqlq4EK1qgplaVtPfItsIMNMaebXjtyTeJjGi1lAgZ6cC/MbXwsClkLeMNBNnHzMIFJLfxdaGTFqzQFR2S5OmXwS9ze0AE/UHtx8HiGeBmHuAcBGp8qfSCZEf06eVCKjJAWKVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092732; c=relaxed/simple;
	bh=qnSQ8TcaHALa8+FYrn0UiUZO+EUkemU6DfIZnMNe+pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uCyEt3vhkcE9XZn5xXmT6ujvEmWc2p/mp8wcX2i4LHcwY/t5k9e59kXmziYzl14O+ah+L508YzWhygtW7e/eCitPODpFwNvp6D2d+HpoLpw0DbAj0dAZL9yNrmGfJgk9ruGe3htjSORHlruD61njkwR2SwdUwe8CAqsV8GIoSXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KAFaHSK9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KAFaHSK9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092730; x=1812628730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qnSQ8TcaHALa8+FYrn0UiUZO+EUkemU6DfIZnMNe+pQ=;
  b=KAFaHSK9S4YoeFJKm+yxdFK0ryrCt7VsrD3s1dGCq0t2DzDtPE+OTi/I
   +mS9Mp0cB8nKsICJS3Lu0gb35ozUrtq/db5GJ7OgWgXXCjoSqGRIXSsjO
   UnhgIoPXTiNtSHKIGskLaYpkon8Je0rG+SsCR76yPp3l9HLfkJDPA3xZK
   hev/BcCLJW54B31v/Iw76bP+8DiHUtjs2uMSFV5vR8FDBOV0b/1KzAN1I
   VKYXfboO7s02g1pmPG2EW+VVoTSqWa88AB4jK3BlrzWx3EvoaTtn5V5ow
   i9zWp2km4i3SmVu2ZEQQE42YdFDgzIpGuVsxds49XGx0akjDu8Qb3j7P1
   w==;
X-CSE-ConnectionGUID: K31tWW2kTauW+o89vo5YwQ==
X-CSE-MsgGUID: Nb35HIFOQQGseJcMgv3EyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81925584"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81925584"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:58:50 -0700
X-CSE-ConnectionGUID: Ivn10aYZSb2a0Sz1pLKe3g==
X-CSE-MsgGUID: RPGC3cLrRGuEVZ3NYXfW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243688321"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2026 04:58:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D0B8395; Wed, 10 Jun 2026 13:58:46 +0200 (CEST)
Date: Wed, 10 Jun 2026 13:58:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
	westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260610115846.GR2990@black.igk.intel.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
 <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>

On Wed, Jun 10, 2026 at 05:02:56PM +0530, Basavaraj Natikar wrote:
> 
> On 6/10/2026 4:27 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
> > > On shutdown the connection manager tears down the router tree without
> > > signalling connected devices. A Thunderbolt 3 device directly connected
> > > to a USB4 host never receives a disconnect indication and during shutdown
> > > this can cause polling the dead link for up to 60 seconds. On some
> > > platforms this behavior leads to a warm reset instead of a shutdown due
> > > to this timeout.
> > > 
> > > Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> > > before tearing down the router tree. This drives SBTX low (USB4 spec
> > > section 6.9), causing the device to detect SBRX low and transition to
> > > Uninitialized Unplugged state immediately.
> > > 
> > > Always do this on system shutdown/reboot by forcing host_reset in the
> > > PCI ->shutdown callback. On plain driver unload only do it when the host
> > > router was actually reset on load (host_reset=1), since in that case the
> > > tunnels are not preserved across reload anyway; with host_reset=0 the
> > > tunnels are kept alive across unload/reload so the links are left intact.
> > > Restrict the reset to Thunderbolt 3 devices.
> > > 
> > > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > > Co-developed-by: Sanath S <Sanath.S@amd.com>
> > > Signed-off-by: Sanath S <Sanath.S@amd.com>
> > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > > ---
> > > v3:
> > >   - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
> > >     now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
> > >   - Add kernel-doc for tb_port_reset() now that it is exported.
> > >   - Move the host_reset flag into struct tb_nhi instead of struct tb, and
> > >     set it from nhi_probe() instead of tb_domain_add().
> > >   - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
> > >   - Reword the debug message to "downstream port reset failed, continuing".
> > > 
> > > v2:
> > >   - Add Reviewed-by tag from Mario Limonciello.
> > >   - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
> > >     only affects Thunderbolt 3 devices.
> > >   - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
> > >     forces host_reset) or when the host router was actually reset on load.
> > >   - Reword comments and commit message to refer to the "router tree"
> > >     instead of the "switch tree".
> > > ---
> > >   drivers/thunderbolt/nhi.c    |  2 ++
> > >   drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
> > >   drivers/thunderbolt/switch.c | 11 ++++++++++-
> > >   drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
> > >   drivers/thunderbolt/tb.h     |  1 +
> > >   include/linux/thunderbolt.h  |  6 ++++++
> > >   6 files changed, 55 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> > > index 0f795ea58756..698fb124d529 100644
> > > --- a/drivers/thunderbolt/nhi.c
> > > +++ b/drivers/thunderbolt/nhi.c
> > > @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
> > >   	init_completion(&nhi->domain_released);
> > > +	nhi->host_reset = host_reset;
> > > +
> > >   	res = tb_domain_add(tb, host_reset);
> > >   	if (res) {
> > >   		/*
> > > diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> > > index bbd186c29ef7..be63a4647b59 100644
> > > --- a/drivers/thunderbolt/pci.c
> > > +++ b/drivers/thunderbolt/pci.c
> > > @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
> > >   	nhi_shutdown(nhi);
> > >   }
> > > +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
> > nhi_pci_shutdown()
> > 
> > > +{
> > > +	struct tb *tb = pci_get_drvdata(pdev);
> > > +	struct tb_nhi *nhi = tb->nhi;
> > > +
> > > +	/*
> > > +	 * Force host_reset so the connection manager asserts DPR and signals
> > > +	 * disconnect to connected devices before the router tree is removed.
> > > +	 * Only Thunderbolt 3 devices are reset.
> > > +	 */
> > > +	nhi->host_reset = true;
> > > +	nhi_pci_remove(pdev);
> > > +}
> > > +
> > >   static struct pci_device_id nhi_ids[] = {
> > >   	/*
> > >   	 * We have to specify class, the TB bridges use the same device and
> > > @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
> > >   	.id_table = nhi_ids,
> > >   	.probe = nhi_pci_probe,
> > >   	.remove = nhi_pci_remove,
> > > -	.shutdown = nhi_pci_remove,
> > > +	.shutdown = nhi_pci_driver_shutdown,
> > nhi_pci_shutdown
> > 
> > Otherwise looks good.
> 
> Thank you Mika for the review.
> 
> There is already a static nhi_pci_shutdown() in pci.c (the
> tb_nhi_ops.shutdown handler at line 233, also called from nhi_shutdown()),
> so reusing that name for the pci_driver ->shutdown callback would collide
> and fail to build.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/tree/drivers/thunderbolt/pci.c?h=next#n233
> 
> Would you prefer:
> 
>   1. Keeping a distinct name for the pci_driver hook, e.g.
>      nhi_pci_driver_shutdown() as in this version, or
> 
>   2. Renaming the existing tb_nhi_ops handler (say, to
>      nhi_pci_ops_shutdown()) so the new pci_driver ->shutdown callback
>      can take the nhi_pci_shutdown() name?
> 
> I'm fine with either; please let me know which you prefer and I'll send v4
> accordingly.

Put this code to nhi.c::nhi_shutdown() as that's applicable also to non-PCI
hosts, right?
