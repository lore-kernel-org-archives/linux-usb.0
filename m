Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018240;
	b=g1kdmXDhZqpw4f+c/FjWVfOGLTZKv3A+B1LM4iiiloS4EMT9C+iLRFHzeKeYLOqzKt8L
	 h/VSSC3bhn3FRM4i1/GEaUK06kimxmgjnfaO0Ew4o+D5oDMQ7zUFJ3a3Ki6nu3LUOCIoQ
	 0KMFsCE/EUgANGHN73OGDugRnxv5hAUGM/VDHjCjqPELsR1h27hZWMNldUjK2ctb6ZTov
	 XH2TMmSaafqUakaW0QMx7oAdNNcU2WQG0mZOuSAxhtGmERJAwtrVgyBCbT0j/XxQg14Ss
	 O3OPp/tR1lu9hBxUpn0g7EjcNp2BlLBSLKQvl6Cnjh8XSr7DSfSQg2IgTlG0UFn+RYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018240;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=BpY7NsPIPdEk7MVL+wQTDzsCZJ/tn265MVItc/H4VaQ=;
	b=wsp0iFwmR/VzEXzN+tXw1YkpUiYgN089CgJD4cUZNLosHY/c5wiXlGuIWGcRgIHt2sd2
	 L4tDkiqYBlGeZ03jgayjQVAUSaXpyoGiQfKsdYyp9g6HNgEJYyKtD0muPWW04jHjjvzZd
	 GEkFgehfV41OEIs3AQkC6820lJ3UZ00mL/v9rnZJEA9XVLEXNKzSyy+DKfTSxmCrGE35J
	 8TFDvj3wMW1Av2pCbUHBkNa6pYamZsF3+cVZh8FtmsxLscrZIvXOuFXlKr9xv9ONC/lzI
	 zx3t4wwxzc3N0Dt6z0h9hwo/vkmSkMX3A/RNz2GIZp2kswF7EvRL9TxAIpV0FAJ1oMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdwrJCZ+;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F91606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 12:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EdwrJCZ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793018240; x=1824554240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5SrNTHLR6x3oGRQBM0iKuh4kDd4ZR6Ck/9Pw1dbTXnY=;
  b=EdwrJCZ+Ign+QGf+vYMZsVxNhxfe5QSp67zEMFQN9hBt7FT+TMAIEtxK
   pc3wpFVCWBLzzK6QVVRtrkRmjOFOViD8D8kF1u9dxm75Otk5PNKneyQN6
   zxRb5Q4T3NfIGHvSqmfibgdJDyKmTgPhDGrUbTn/32Ty30D701lBLaMM4
   Llj6W8JRIDsx1XLOZDF0a5aBBWaUYRTpLcDVDzZ9F/IwR6MBWWHcOasAF
   zNdi5fRpw2x0UbxXhXoYdsF1/yiFuEotj3r43Fp6xPwPNWwTq9evY/nSS
   mbWSo0O6BbyFPpmXBVfl4zexrkhhtX37hKzgJHsbH+icBuuL3v6Nit1Hr
   g==;
X-CSE-ConnectionGUID: qIqs8TAmTHqmSIxgU6Jq5Q==
X-CSE-MsgGUID: AvC6zR6YT+6n9kBL9DyN8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1583519"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1583519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 05:37:19 -0700
X-CSE-ConnectionGUID: /hCQ2wsXSBCWi6KrR6uryg==
X-CSE-MsgGUID: 5XVCd1lbSgK4kFBcn0Bxsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4203516"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 26 Oct 2026 05:37:18 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7E97699; Mon, 26 Oct 2026 13:37:16 +0100 (CET)
Date: Mon, 26 Oct 2026 13:37:16 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
Message-ID: <20261026123716.GF158991@black.igk.intel.com>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
 <20261026052331.GC158991@black.igk.intel.com>
 <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
 <686b2d33-7a50-44b7-940c-70c30f4c941d@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <686b2d33-7a50-44b7-940c-70c30f4c941d@oss.qualcomm.com>

Hi,

On Mon, Oct 26, 2026 at 11:48:06AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 26-Oct-26 11:30 AM, Hans de Goede wrote:
> > Hi Mika,
> > 
> > Thank you for your quick answer.
> > 
> > On 26-Oct-26 6:23 AM, Mika Westerberg wrote:
> >> Hi,
> >>
> >> On Sat, Oct 24, 2026 at 08:17:16PM +0200, Hans de Goede wrote:
> >>> Hi All,
> >>>
> >>> I hit this error:
> >>>
> >>> Oct 24 19:16:58 x1 kernel: thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): not active, tearing down
> >>>
> >>> while doing some work on a Raptor Lake ThinkPad laptop plugged into a Thunderbolt dock.
> >>>
> >>> After a bunch of debugging I found that the problem is that I had:
> >>>
> >>> "UseSimpleDrm=1" in /etc/plymouth/plymouthd.conf, which combined with
> >>> the latest dracut version causes dracut to omit the i915 drm driver
> >>> from the initramfs.
> >>
> >> The error means that the graphics driver did not read the monitor
> >> capabilities in time (~12s) and therefore the tunnel was torn down.
> >> Capabilities read is required for DP tunnels to work properly.
> >>
> >>> And when thunderbolt.ko loads (or maybe only once userspace pokes it ?)
> >>> and the i915.ko driver has not claimed the DP connection then the above
> >>> message is logged and Linux does not see the DP attached display(s).
> >>>
> >>> Building i915.ko into the initramfs works around this, but there
> >>> seems to be an assumption on the kernel side about things happening
> >>> in a certain order during boot which there should not be.
> >>
> >> Right but as above capabilities read is required by the specs and we cannot
> >> keep the DP tunnels up forever to consume power (and there is also
> >> complication with add-in-cards that don't have all DP INs connected).
> >>
> >> You can pass "thunderbolt.dprx_timeout=-1" (or some number or seconds) to
> >> work it around.
> > 
> > Hmm, I see thank you for explaining this. The problem is that these kind
> > of timeouts *never* work. We've been at this since the late 199x years
> > where we had initramfs shell scripts which loaded scsi drivers and then
> > had a "sleep 5" for the scsi bus to get scanned, which of course was not
> > enough on some machines. This was never fixed until we made initramfs-
> > scripts use udev events to actually wait for the specific disk to show up
> > instead of a sleep X + blind mount /dev/sdx / which failed when the sleep
> > was not long enough.
> > 
> > In this case specifically there are plans to stop including the GPU drivers
> > in the initramfs because of the ever growing size of both the drivers and
> > especially the firmware the GPU drivers need, see e.g.:
> > 
> > https://hansdegoede.dreamwidth.org/28291.html
> > https://fedoraproject.org/wiki/Changes/PlymouthUseSimpledrm
> > 
> > The plan is to instead only use simpledrm during the initramfs boot-phase.
> > And the recent dracut changes to modify dracut's plymouth support to stop
> > it from bringing in GPU drivers when UseSimpleDrm=1 is set in plymouth's
> > config file show people are sitll working on this.
> > 
> > Combine this e.g. no i915 in the initramfs with a LUKS diskcrypt password
> > which the user needs to type in in the initramfs boot-phase and one can
> > easily exceed the 12 seconds.
> > 
> > AFAICT the GPU driver never showing up (rather then showing up later)
> > would be a (configuration?) bug of the system. Under normal circumstances
> > this (GPU driver never showing up) should not happen.
> > 
> > OTOH the GPU driver showing up late is expected behavior when a system
> > is configured to not have the GPU drivers in the initramfs.
> > 
> > So it seems that the current timeout of 12s optimizes for the wrong thing,
> > it optimizes for a scenario which should never happen while OTOH breaking
> > a scenario which (IMHO) we actually want to work.
> > 
> > I think using a timeout of -1 should be the default, since by default
> > we should expect a GPU driver to show up and claim the DP connection.
> > 
> > Would you be willing to accept a patch to change the default timeout
> > to -1 ?
> 
> Ok, so re-reading your answer I guess one problem here is:
> 
> "complication with add-in-cards that don't have all DP INs connected"
> 
> Still I would expect at least one GPU driver to always load and
> initialize successfully. Can we have the GPU driver make a call
> to the thunderbolt code that it has initialized even if it is not
> claiming any DP connections and then start the timeout from that call?
> 
> I think it is reasonable to expect any secondary GPU drivers to load
> within 12 seconds once the first one has loaded. But for the no GPU
> drivers in initramfs case it may take longer then that for the first
> GPU driver to load.
> 
> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> We had a similar problem with deferred_probe_timeout handling, see:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/Kconfig?id=56e3ee721b33bdc4ce0765d370983aa4384f8a59
> 
> there this was fixed by making the default timeout value a Kconfig
> option and letting distros override it since previous discussions
> did not lead to a consensus on how to handle this. But that won't
> work here if we want to deal with the "complication with add-in-cards
> that don't have all DP INs connected" case.
> 
> I'm mentioning this because it shows there is a generic problem
> with this "timeout design pattern" trap us kernel devs seem to
> keep falling for, especially in relation to things not happening
> in the initramfs while it waits for user input causing all
> these timeouts to trigger while they should not trigger yet
> because more drivers will load once we switch to the real rootfs.
> 
> This has made me thinking that maybe we need a bootup-done
> or at least switched-to-real-rootfs sysfs file userspace can
> write and only start timeouts like these once userspace has
> written that file?

Yes, I think this is the way to go forward. Then something (like
notification or callback) that drivers who are interested can opt-in.
