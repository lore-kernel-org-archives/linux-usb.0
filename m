Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A6B328611
	for <linux-usb@vger.kernel.org>; Wed, 10 Jun 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781101402; cv=none; b=c8+DK79w1Amprd5weHqOyc9pMxERqAZ1HHcmvuQMRhmgXxoDYmjcdce4CFPDMOGop05jCj3al97Mb5aS0/PRuBP25WQGshxsKE55TVA/biVuEETpgM8TJxedMLP9IWmoxbbZ1wR+Fkzs47ZJohMcaJo8Xfx1NAP6P+mS36aNlA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781101402; c=relaxed/simple;
	bh=qhglIpWhz2vgZ6Wf5tjHY1wnQE53c2omrCITaj/ubZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGW0zkHM2mnzNPXsr22oN6aUJYlj/J+82oEJ2rA28R8YHYBkIuoUXgeaZWkx48oS6M65RB9q5v9EK+uf9j3fXvwsWQ/giaKBChjPzNXXbK21HXtXTZyCCkW4FPvWpVt3RDB6mQoLZNKGY2g1WCAe9eCkK4TcoUl+4EPpFOEkuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B43FKdZy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B43FKdZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781101401; x=1812637401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qhglIpWhz2vgZ6Wf5tjHY1wnQE53c2omrCITaj/ubZI=;
  b=B43FKdZy4IJ/e3SH5hVn1HeCdfDkw7AON66zXQAtb/gtOx5GvOGKXY+v
   6hM9di1vI31fMiAo4IW+hiOBJi3ICAqGOvzT+Nf4Nwc0MqOMl3+UZwNNh
   4gH4si9qrO8+ONCzSE/FHRecNeIt6LMZAcAd9lwQrwEIyV08znTwsfsY8
   vhcGcUGBOD7NjxUy9QjtrHVa8cnHYLNmkMz1pShwxDJC6LvPfQeTapiQ9
   A2KhLuEtMzmALPJJ67pYlOtUZWkUgK+paGF6T7qoK9tVJaSE6CXxj4Usm
   siwQF3D9jPWuhx/IWQD3gv+yinBTmISuwjCegjOrs0r3fTwhVdh0YXsXk
   A==;
X-CSE-ConnectionGUID: uNvpooyjTvCOFUxNN4fYhA==
X-CSE-MsgGUID: pFBTWgo+RKmDReK//l8N4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81636219"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81636219"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:23:20 -0700
X-CSE-ConnectionGUID: L1CKpeC1TXKm9VMit/VZ/A==
X-CSE-MsgGUID: tBbbxEDoSVWjvFnsZLalew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="243722267"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jun 2026 07:23:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3100395; Wed, 10 Jun 2026 16:23:17 +0200 (CEST)
Date: Wed, 10 Jun 2026 16:23:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
	westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v3] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260610142317.GS2990@black.igk.intel.com>
References: <20260610085006.3735139-1-Basavaraj.Natikar@amd.com>
 <20260610105717.GQ2990@black.igk.intel.com>
 <5b14d6df-bbbd-4c0e-a276-4cf8d370d097@amd.com>
 <20260610115846.GR2990@black.igk.intel.com>
 <ef95085b-8c7c-4214-ad81-1ece2adf805f@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef95085b-8c7c-4214-ad81-1ece2adf805f@amd.com>

Hi,

On Wed, Jun 10, 2026 at 07:02:02PM +0530, Basavaraj Natikar wrote:
> Hi,
> 
> 
> On 6/10/2026 5:28 PM, Mika Westerberg wrote:
> > On Wed, Jun 10, 2026 at 05:02:56PM +0530, Basavaraj Natikar wrote:
> > > On 6/10/2026 4:27 PM, Mika Westerberg wrote:
> > > > Hi,
> > > > 
> > > > On Wed, Jun 10, 2026 at 02:20:06PM +0530, Basavaraj Natikar wrote:
> > > > > On shutdown the connection manager tears down the router tree without
> > > > > signalling connected devices. A Thunderbolt 3 device directly connected
> > > > > to a USB4 host never receives a disconnect indication and during shutdown
> > > > > this can cause polling the dead link for up to 60 seconds. On some
> > > > > platforms this behavior leads to a warm reset instead of a shutdown due
> > > > > to this timeout.
> > > > > 
> > > > > Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> > > > > before tearing down the router tree. This drives SBTX low (USB4 spec
> > > > > section 6.9), causing the device to detect SBRX low and transition to
> > > > > Uninitialized Unplugged state immediately.
> > > > > 
> > > > > Always do this on system shutdown/reboot by forcing host_reset in the
> > > > > PCI ->shutdown callback. On plain driver unload only do it when the host
> > > > > router was actually reset on load (host_reset=1), since in that case the
> > > > > tunnels are not preserved across reload anyway; with host_reset=0 the
> > > > > tunnels are kept alive across unload/reload so the links are left intact.
> > > > > Restrict the reset to Thunderbolt 3 devices.
> > > > > 
> > > > > Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> > > > > Co-developed-by: Sanath S <Sanath.S@amd.com>
> > > > > Signed-off-by: Sanath S <Sanath.S@amd.com>
> > > > > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > > > > ---
> > > > > v3:
> > > > >    - Rebase on top of the thunderbolt next branch; the PCI ->shutdown hook
> > > > >      now lives in drivers/thunderbolt/pci.c (nhi_pci_driver_shutdown()).
> > > > >    - Add kernel-doc for tb_port_reset() now that it is exported.
> > > > >    - Move the host_reset flag into struct tb_nhi instead of struct tb, and
> > > > >      set it from nhi_probe() instead of tb_domain_add().
> > > > >    - Spell out "Thunderbolt 3" instead of "TBT3" in the kernel-doc.
> > > > >    - Reword the debug message to "downstream port reset failed, continuing".
> > > > > 
> > > > > v2:
> > > > >    - Add Reviewed-by tag from Mario Limonciello.
> > > > >    - Restrict the DPR assertion to Thunderbolt 3 devices, since the issue
> > > > >      only affects Thunderbolt 3 devices.
> > > > >    - Only assert DPR on system shutdown/reboot (the PCI ->shutdown callback
> > > > >      forces host_reset) or when the host router was actually reset on load.
> > > > >    - Reword comments and commit message to refer to the "router tree"
> > > > >      instead of the "switch tree".
> > > > > ---
> > > > >    drivers/thunderbolt/nhi.c    |  2 ++
> > > > >    drivers/thunderbolt/pci.c    | 16 +++++++++++++++-
> > > > >    drivers/thunderbolt/switch.c | 11 ++++++++++-
> > > > >    drivers/thunderbolt/tb.c     | 21 +++++++++++++++++++++
> > > > >    drivers/thunderbolt/tb.h     |  1 +
> > > > >    include/linux/thunderbolt.h  |  6 ++++++
> > > > >    6 files changed, 55 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> > > > > index 0f795ea58756..698fb124d529 100644
> > > > > --- a/drivers/thunderbolt/nhi.c
> > > > > +++ b/drivers/thunderbolt/nhi.c
> > > > > @@ -1235,6 +1235,8 @@ int nhi_probe(struct tb_nhi *nhi)
> > > > >    	init_completion(&nhi->domain_released);
> > > > > +	nhi->host_reset = host_reset;
> > > > > +
> > > > >    	res = tb_domain_add(tb, host_reset);
> > > > >    	if (res) {
> > > > >    		/*
> > > > > diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> > > > > index bbd186c29ef7..be63a4647b59 100644
> > > > > --- a/drivers/thunderbolt/pci.c
> > > > > +++ b/drivers/thunderbolt/pci.c
> > > > > @@ -493,6 +493,20 @@ static void nhi_pci_remove(struct pci_dev *pdev)
> > > > >    	nhi_shutdown(nhi);
> > > > >    }
> > > > > +static void nhi_pci_driver_shutdown(struct pci_dev *pdev)
> > > > nhi_pci_shutdown()
> > > > 
> > > > > +{
> > > > > +	struct tb *tb = pci_get_drvdata(pdev);
> > > > > +	struct tb_nhi *nhi = tb->nhi;
> > > > > +
> > > > > +	/*
> > > > > +	 * Force host_reset so the connection manager asserts DPR and signals
> > > > > +	 * disconnect to connected devices before the router tree is removed.
> > > > > +	 * Only Thunderbolt 3 devices are reset.
> > > > > +	 */
> > > > > +	nhi->host_reset = true;
> > > > > +	nhi_pci_remove(pdev);
> > > > > +}
> > > > > +
> > > > >    static struct pci_device_id nhi_ids[] = {
> > > > >    	/*
> > > > >    	 * We have to specify class, the TB bridges use the same device and
> > > > > @@ -593,7 +607,7 @@ static struct pci_driver nhi_driver = {
> > > > >    	.id_table = nhi_ids,
> > > > >    	.probe = nhi_pci_probe,
> > > > >    	.remove = nhi_pci_remove,
> > > > > -	.shutdown = nhi_pci_remove,
> > > > > +	.shutdown = nhi_pci_driver_shutdown,
> > > > nhi_pci_shutdown
> > > > 
> > > > Otherwise looks good.
> > > Thank you Mika for the review.
> > > 
> > > There is already a static nhi_pci_shutdown() in pci.c (the
> > > tb_nhi_ops.shutdown handler at line 233, also called from nhi_shutdown()),
> > > so reusing that name for the pci_driver ->shutdown callback would collide
> > > and fail to build.
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git/tree/drivers/thunderbolt/pci.c?h=next#n233
> > > 
> > > Would you prefer:
> > > 
> > >    1. Keeping a distinct name for the pci_driver hook, e.g.
> > >       nhi_pci_driver_shutdown() as in this version, or
> > > 
> > >    2. Renaming the existing tb_nhi_ops handler (say, to
> > >       nhi_pci_ops_shutdown()) so the new pci_driver ->shutdown callback
> > >       can take the nhi_pci_shutdown() name?
> > > 
> > > I'm fine with either; please let me know which you prefer and I'll send v4
> > > accordingly.
> > Put this code to nhi.c::nhi_shutdown() as that's applicable also to non-PCI
> > hosts, right?
> 
> I tried that, but nhi_shutdown() runs too late in the teardown to be
> useful here. On the shutdown/remove path:
>   nhi_pci_remove()
>     -> tb_domain_remove()
>          -> cm_ops->stop() == tb_stop()   /* reads host_reset, asserts DPR */
>     -> nhi_shutdown()                      /* ring/HW teardown, runs last */
> tb_stop() is what reads host_reset and asserts the DPR, and it runs
> inside tb_domain_remove() -- before nhi_shutdown(). So host_reset has to
> be set *before* tb_domain_remove(), and nhi_shutdown() would set it after
> tb_stop() has already run.

Ah okay.

> To still keep it generic for non-PCI hosts, how about a small generic
> helper in nhi.c that just forces the flag, called from the bus ->shutdown
> callback before the normal removal:
>   /* nhi.c */
>   void nhi_host_shutdown(struct tb_nhi *nhi)
>   {
>     /* Force DPR on connected Thunderbolt 3 devices, see tb_stop(). */
>     nhi->host_reset = true;
>   }
>   /* pci.c */
>   static void nhi_pci_host_shutdown(struct pci_dev *pdev)
>   {
>     struct tb *tb = pci_get_drvdata(pdev);
>     nhi_host_shutdown(tb->nhi);
>     nhi_pci_remove(pdev);
>   }
>   ...
>     .shutdown = nhi_pci_host_shutdown,
> 
> This leaves nhi_pci_remove() (and nhi_shutdown()) unchanged, and the
> host_reset logic lives in nhi.c so a future non-PCI host can reuse
> nhi_host_shutdown() the same way. Does that work for you, or would you
> 
> prefer it shaped differently?

I really would like to name the PCI driver shutdown hook as
nhi_pci_shutdown. What about this:

1. Rename nhi_pci_shutdown -> nhi_pci_release_irq as that's what it does
   (keep the callback member name shutdown still)

2. Rename nhi_pci_remove -> nhi_pci_do_remove that takes new parameter
   'reset' or so and passes this down to the tb_domain_remove() and also
   ->tb_stop(). 

3. Add nhi_pci_shutdown() that calls nhi_pci_do_remove(pdev, true);
4. Add nhi_pci_remove() that calls nhi_pci_do_remove(pdev, false);

Or something along those lines. If it looks horrible then we can do the
same but with the flag instead of passing the parameter down.
