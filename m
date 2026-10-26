Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793026954;
	b=cPgR7KdU5VaLQ5inbq06d25mE8jQFGLIP/r1eo/OJQeN2inQzPjPH3f/VfJSe9pSTBSW
	 unF01XbEeNrv04MMPkberb6UUqt4747912gjRrpNKdy1c85p0vQJKm8fQbTOh0+XDrnmW
	 B9+mYz4btryw579CuRIFj8im2UOKjARNIKJxDqZHraRvA+kWF+b2WSfmd1l4sRHBlVNQv
	 h4/IuCIpk39Mgsj3kWQ19kUs18H+G+nkjgrWONRCwy27U3CQ0oU5yDcNK7i7b2ZpXbJ0z
	 1cZJn4UNz9HjiaIZttFFn1LZSisVfJQjjuke0XPbEgc5z9IXZOqGaRuMz0o/OmKuwUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793026954;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IK6X4dD8/NVEL8oGdX1mc7D337+r6Pleiq7BN4EKAQs=;
	b=BDLN7uXCrmmMt5mRFd7RUUk+8DJykLaFPBBM6Rp+QVf9hMPIn/7UlqQbB6zTv287Zwf4
	 UW0Vh4OJw/1K2YjRuuXYUTcjmNworX9zbAlWn3Sqp2UX7loDXJSeTyPj1E1fl+wT3+Oj8
	 82hPymH3UqqrqfOOwepYmYvllWFG46uVfo03agiY+nu51pN64ZrW70LWmW1cbdlF/Zccd
	 J4Cgw7jqC3KNh+bMW4jd08iWX3EQAyBIIyxm6Nq1xNVSf77xvR0K6gJ/TBR4SO414K77m
	 k1Hh2LmbXXLesjyfdi4oIGoEFqzQZYyt43Ml1eJkK2JNkpOwaWKm8G22uGV+CEOfEfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LTchcAJY;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B227F606A322
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 15:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B227F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LTchcAJY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793026954; x=1824562954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IL/qkYBNiA2v0J+yMjNpdjLGgN1W36IUQOFsZ3nenvk=;
  b=LTchcAJYfGtVLkxydP/kxBvih/YAIB8Yh79wWWYuMjK3hNWkBuoihMzE
   yBzw3gXFHg2gQkifECMexEquiHcSm+CVe+CIlroVAf2XFMssuqDWh84u6
   ca0EwM0OiCzKLpNvNqU/KNmqO0lw3YZotKhqsYGNNPdtjozkFAZ6zsLP5
   hIm7Z8fHmsK1fxqKhw4Y65zgZOiK2+bANftYY0JGYz8uS5gllDxFbcQ4m
   e7YBK7IzEptiLzdI74ZSmx8Y9TxBQE+ELyr5yIfew/GvuDG6P5kxTCakF
   PpRbYbxqfV6CG4oC6SKVDwbiFhEvQhCycmalrxB9c5ZZY3vj6uaVMgujU
   A==;
X-CSE-ConnectionGUID: UD9fpqKDQVSFGbASftVUXw==
X-CSE-MsgGUID: YV3cNYF5T7iqs1EbcvCriA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1731613"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1731613"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:02:32 -0700
X-CSE-ConnectionGUID: Kn7zNzC6RIiw86UA457KnQ==
X-CSE-MsgGUID: Jh2/kQXFS92JDY42uovJ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4268021"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 26 Oct 2026 08:02:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 15D2899; Mon, 26 Oct 2026 16:02:29 +0100 (CET)
Date: Mon, 26 Oct 2026 16:02:29 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
Message-ID: <20261026150229.GG158991@black.igk.intel.com>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
 <20261026052331.GC158991@black.igk.intel.com>
 <fcbac09a-be91-4fac-ae0f-934f628afa01@oss.qualcomm.com>
 <686b2d33-7a50-44b7-940c-70c30f4c941d@oss.qualcomm.com>
 <20261026123716.GF158991@black.igk.intel.com>
 <b0bc482a-f739-4c9b-8eef-9e2634ab2e02@oss.qualcomm.com>
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
In-Reply-To: <b0bc482a-f739-4c9b-8eef-9e2634ab2e02@oss.qualcomm.com>

Hi,

On Mon, Oct 26, 2026 at 03:22:06PM +0100, Hans de Goede wrote:
> Hi Mika,
> 
> On 26-Oct-26 1:37 PM, Mika Westerberg wrote:
> > Hi,
> > 
> > On Mon, Oct 26, 2026 at 11:48:06AM +0100, Hans de Goede wrote:
> 
> <snip>
> 
> >> p.s.
> >>
> >> We had a similar problem with deferred_probe_timeout handling, see:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/base/Kconfig?id=56e3ee721b33bdc4ce0765d370983aa4384f8a59
> >>
> >> there this was fixed by making the default timeout value a Kconfig
> >> option and letting distros override it since previous discussions
> >> did not lead to a consensus on how to handle this. But that won't
> >> work here if we want to deal with the "complication with add-in-cards
> >> that don't have all DP INs connected" case.
> >>
> >> I'm mentioning this because it shows there is a generic problem
> >> with this "timeout design pattern" trap us kernel devs seem to
> >> keep falling for, especially in relation to things not happening
> >> in the initramfs while it waits for user input causing all
> >> these timeouts to trigger while they should not trigger yet
> >> because more drivers will load once we switch to the real rootfs.
> >>
> >> This has made me thinking that maybe we need a bootup-done
> >> or at least switched-to-real-rootfs sysfs file userspace can
> >> write and only start timeouts like these once userspace has
> >> written that file?
> > 
> > Yes, I think this is the way to go forward. Then something (like
> > notification or callback) that drivers who are interested can opt-in.
> 
> I'm glad you like the idea.
> 
> There are some details which we need to work out. If we enable this
> unconditionally in the kernel then all timeouts based on this will
> only work if there is a new enough userspace to actually write
> 
> "rootfs-mouned" or "bootup-done" to:
> 
> /sys/kernel/boot-stage
> 
> So my suggestion would be that the initramfs itself will write:
> 
> "initramfs" to "/sys/kernel/boot-stage" early on and that activates
> this mechanism pausing any potential timeouts.

I wonder if using SYSTEM_RUNNING and the like here would do the trick? If
not then maybe adding one more state there?

> The problem with this approach though is that this means starting
> the timeouts as before, cancelling them on "initramfs" boot-stage
> and then re-starting them on "rootfs-mouned" or "bootup-done" .
> 
> With the cancelling bit feeling a bit icky, although I guess this
> could all be done with the same notifier depending on the notifier
> argument so this might not be too bad...

At least for TB I think we can start with the infinite and then once we get
some "notification" just modify the timeout to now + 12s or so. Not sure
about the other use cases though.

> ###
> 
> Once we've an API design we like, the problem becomes who is going
> to write the code for this and lead the attempt to get something
> like this upstream. I'm interested in this, but I also really do not
> have the time to work on this atm.

Yeah, I also don't have time to work on this right now.
