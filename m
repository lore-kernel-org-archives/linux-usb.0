Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8587F3D3D16
	for <linux-usb@vger.kernel.org>; Tue,  4 Aug 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785853355; cv=none; b=OnNBBcGdVNWVS58dwVlIGIE26rEYeGX5p99quUKXICfJuxVIhOROyBCfoZdxuw4b473KYlzBrDfx+0NIiohHUhZOopdVIPFDnT3f3g9S7TQsriZryWqZdyuULuzmhjOukoUYevWwTlWPgI2kHU/oeOwUS7KuRtPq0xes7OPsFNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785853355; c=relaxed/simple;
	bh=7hQdiRDNFKy/FYkb0/7YHXHbCDumIzmCOH11rZDRElo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mmy1gUSD8vFDvmv3eeT55kxhmLcZDp+iZ6XVBIkJfPnZR8PDdGKzYSASiqwMOPAks25Tsa+bVtQ1hmyUxpRSSyQlTnq2PVeJb6/u6BegDussto9hSpAsL6ajOsWA2S56iiyEFNpEcShaqxv2gavSlR59Z6WKFwG3c5bVFNKLyOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ywm2dyzr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ywm2dyzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785853341; x=1817389341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7hQdiRDNFKy/FYkb0/7YHXHbCDumIzmCOH11rZDRElo=;
  b=Ywm2dyzrs+/czfNeJOCYQVyRKUuE07dsbWoyzpROAxYRMrNpd8mHN3aa
   Xn00rcChgIL6ibN1r1qM2U+mOm7PzunyHmoiU4vaDRwvIs1+0d1KAmGrJ
   GTUU6wncjrG+79nx0henk1oKhIb5AgTyYksHxBS3xgtItWK/1eH0NuF4k
   4cOfUo8rUFi2VSRPWXqvCPlARcsM3/M44cDMNEeZtHW3mroEnsv6bqdRB
   pzXnTAqyOSguVC1HTZN9IGuIxgFiGCabKfpw57zJaqJZzYYvhb4SF2Bsu
   D9brmHP3IFotHtIh1RVbnZxUEa3RTjZr46Txe9wSew5Frue7tOPvxVW5Y
   A==;
X-CSE-ConnectionGUID: yurwhi85R22A4ebAK4S9LA==
X-CSE-MsgGUID: 0sxKZJ9XTJaoH0Ua0UY55g==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86413883"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86413883"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 07:22:14 -0700
X-CSE-ConnectionGUID: f3t9+mbdRDm+EWxchFpbsQ==
X-CSE-MsgGUID: RR+J5TANQBm5AeFhrB0LAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="286167013"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 04 Aug 2026 07:04:50 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7F7719B; Tue, 04 Aug 2026 16:04:49 +0200 (CEST)
Date: Tue, 4 Aug 2026 16:04:49 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bernd Behler <bernd@behler.me>
Cc: linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: Apple Studio Display =?utf-8?Q?=282026?=
 =?utf-8?Q?=2C_Thunderbolt_5=29_?= =?utf-8?B?4oCU?= DP tunnel torn down every
 few minutes on Intel TB4 host
Message-ID: <20260804140449.GA235112@black.igk.intel.com>
References: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
 <20260802064729.GL20844@black.igk.intel.com>
 <CAM=hwCytVxuqfT2d4UNaf2x5FCOpMXaaGyuQ6xEoh_+w8NVJtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM=hwCytVxuqfT2d4UNaf2x5FCOpMXaaGyuQ6xEoh_+w8NVJtw@mail.gmail.com>

Hi,

On Tue, Aug 04, 2026 at 10:01:32AM +0200, Bernd Behler wrote:
> Hi Mika,
> 
> Traces attached, two matched trace/dmesg pairs, each captured with
> drm.debug=0x104 plus "module thunderbolt +p", tbtrace enabled before and
> dumped after the event:
> 
>   trace-tc3-domain1.out.xz / dmesg-tc3-domain1.txt.xz   controller 00:0d.3
>   trace-tc1-domain0.out.xz / dmesg-tc1-domain0.txt.xz   controller 00:0d.2
> 
> Larger captures exist (up to 19M, several events each); say the word and I
> will put them somewhere downloadable.

Thanks! I think I need the full ones because these are just missing what
happened right before the DP OUT unplug packet arrived. If this is the MST
issue then the graphics driver did AUX read to certain MST range registers
that immediately triggered the DP OUT unplug.

I only need for one controller, no need for both.

> > Do you have full dmesg with the debugging enabled available somewhere?
> > Can you also repro this so that you enable tracing of the TB driver and
> > provide the output (alongside with the full dmesg so we can compare)
> 
> Attached, as above. Both pairs are from the same display on the two
> different Thunderbolt controllers, and the signature is identical apart
> from the PHY:
> 
>   00:0d.3, domain 1:  [ENCODER:521:DDI TC3/PHY TC3] - long
>   00:0d.2, domain 0:  [ENCODER:540:DDI TC1/PHY TC1] - long
> 
> > It should tear down the tunnel at that point.
> 
> Understood, thanks.
> 
> > Those happen until GFX reads the capabilites through the DP tunnel - its
> > normal
> 
> Good, I will stop treating DPRX read timeout as a symptom.
> 
> 
> Both displays attached at once
> ------------------------------
> 
> Since my report I ran the two models simultaneously, one on each
> controller, in the same compositor session:
> 
>   DP-3  Studio Display 2026 (NVM 64.81)   domain 0
>   DP-1  Studio Display 2022 (NVM 67.0)    domain 1
> 
>   Connector DP-3 disconnected    8
>   Connector DP-3 connected       8
>   Connector DP-1 disconnected    1
>   Connector DP-1 connected       2
> 
> The 2022 unit has never blanked in use, here or at any other time. Its
> single connector event in the log above is from cable handling, not a
> fault.
> 
> This is the same-host, same-kernel, same-moment version of the comparison
> in my original report.
> 
> 
> Newly ruled out since 2026-08-01
> --------------------------------
> 
> - Host firmware, completely. BIOS CRARL579.0023 (2025-03) ->
>   CRARL579.0032 (2026-07-28). The flash displays "Updating Intel
>   Thunderbolt Retimer FW"; retimer NVM goes 24.82 -> 26.85. That capsule
>   also carries iTBT 16.2, IOM 30.001e.0.0, SPHY 18.1.1.7053,
>   NPHY 18.1.0.7015, new PMC and EC. First failure 2.5 minutes after the
>   reboot, signature unchanged.
> 
> - Kernel version. Identical failure on 6.18.39 LTS and on 7.1.4. Two
>   branches roughly a year apart, so not a recent regression.
> 
> - Disabling Thunderbolt in the BIOS does not give a DP alt mode fallback
>   to compare against: the Type-C port disappears entirely, no video and no
>   USB, for either display. So I could not test this display without
>   tunneling.
> 
> 
> A TB5 sink on a TB4 host is not the issue as such
> -------------------------------------------------
> 
> The 2026 display runs without fault on a Mac mini M2 Pro, which is
> Thunderbolt 4, not 5. Combined with the 2022 unit tunneling fine on this
> Intel host, the failure needs both this sink and this host stack.
> 
> 
> > We also used to have similar issue, related to MST register access that
> > triggered DP OUT unplug but I think that's already worked around in the
> > graphics side for Meteor Lake.
> 
> This is the lead I would most like to follow. This host is Arrow Lake-H
> (Core Ultra 5 225H, 8086:7d51). Is that workaround gated on Meteor Lake?
> If it is, everything above fits: a host-side access pattern this sink does
> not tolerate, absent on macOS, handled on MTL but not on ARL.

I don't remember but Imre who is CC'd (but may be on vacation, I'll ping
him internally just in case) should be able to tell. I think it was applied
up to Panther Lake or so. That can be confirmed if you disable MST from
i915 (there is a module parameter that can be used to disable it. Let me
know if you don't find it and I will look it up).

> If it is a different mechanism, what would you need from me to decide
> whether a per-device quirk is justified?
> 
> 
> I may only have this display on hand for a few more days. If you or Imre
> want anything run on it — different tbtrace options, more debugging, a
> patch — please say so soon and I will do it while I still can.

OK.

> Unrelated oops in the same setup
> --------------------------------
> 
> Separate issue, flagging it here rather than opening a thread unless you
> prefer that. Pulling the display's mains lead while the Thunderbolt cable
> was still attached killed the machine on the first attempt, kernel 7.1.4:
> 
>   Oops: general protection fault, kernel NULL pointer dereference 0x0
>   RIP: 0010:strlen+0x4/0x30            (RDI = 0)
>   Workqueue: events ucsi_handle_connector_change [typec_ucsi]
>     kernfs_remove_by_name_ns
>     typec_unregister_partner     [typec]
>     ucsi_unregister_partner      [typec_ucsi]
>     ucsi_handle_connector_change [typec_ucsi]
> 
> Looks like a partner being unregistered with a NULL name during a
> connector-change storm. The worker dies in the global events queue and
> userspace hangs behind it. Full dmesg available on request.

Okay I suggest to report that separately.
