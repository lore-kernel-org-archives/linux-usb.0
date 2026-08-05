Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CCA36074F
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916979; cv=none; b=li1cBUJ4MMXxm+dRs5q2G3JWOkdhneine4tgvyhN8Ah02Q00For8L7JrsdyWgYKh0fyX/RX6657BpgxSe852nv73GY2ClGOvuyKK7hMxaFym09AdEQaCAgUlF+6lPTMjTkPEZgrDrDXBQWkfmQHzjXnBGDBBXFK4ooJ4JpltlFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916979; c=relaxed/simple;
	bh=rpAbymTiSYNn+PG7rSWq/Ny3bWLOU++mM8QhmSwhrq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPVea67qjJVnokCqPn/VC40xTcwGLDNrUycN5WvZTpp4HE/TVGlJMXOcbZvQ8jhdMh8xAQJy68fXcFVaIO7cRDMR7P5ys59HeUhTkYsBXrkyKjbND9kLQw2Qj/t+pDGVhx43u0SyxTUiO45ShAj51/1dMzBJykW6aEQuhc9+tYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkv7Y4yd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkv7Y4yd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785916974; x=1817452974;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rpAbymTiSYNn+PG7rSWq/Ny3bWLOU++mM8QhmSwhrq0=;
  b=kkv7Y4ydnunSLTX4z1flivDFic7fLPq5Fw4sb12fcfZI+WofVCLpBw8y
   qXB54QaUR9rI2CsmEBJUvDEJsU8XlsKTSq7fp7+8r440KRyCOgw9XEBMJ
   aTgQWnAeDQqLE9W8+04+b0udM/1N5ojUpNBDFlKPfxdooR2VAo3y1xoAR
   CjQGcPyZa2Yrww8d/ilNcd4TIhv6mPa8Hd2azae3Z77IP9Cr33Cj//Veu
   21tD/3yrhCq351lidShA/5AAtlLvO8Tt7udV/ZFdE8X8V4AfVL+bM1GQ4
   8qQ7+LfqhCaYZr8d56oMaWPS6P2YhAYdPdqsn2hdhXsWKk2GdNAcCpNl8
   Q==;
X-CSE-ConnectionGUID: 7T9a/WCGTq6uZlovUrn5MQ==
X-CSE-MsgGUID: jbpI3hJkRJ6NV96CP1QbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86342769"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86342769"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 01:02:52 -0700
X-CSE-ConnectionGUID: b0Ie5+y0TamaiEtKngvDPg==
X-CSE-MsgGUID: zW1+oZuqSMODuI32+iQtMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="259980020"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 05 Aug 2026 01:02:52 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7D4C699; Wed, 05 Aug 2026 10:02:50 +0200 (CEST)
Date: Wed, 5 Aug 2026 10:02:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bernd Behler <bernd@behler.me>
Cc: linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: Apple Studio Display =?utf-8?Q?=282026?=
 =?utf-8?Q?=2C_Thunderbolt_5=29_?= =?utf-8?B?4oCU?= DP tunnel torn down every
 few minutes on Intel TB4 host
Message-ID: <20260805080250.GG235112@black.igk.intel.com>
References: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
 <20260802064729.GL20844@black.igk.intel.com>
 <CAM=hwCytVxuqfT2d4UNaf2x5FCOpMXaaGyuQ6xEoh_+w8NVJtw@mail.gmail.com>
 <20260804140449.GA235112@black.igk.intel.com>
 <CAM=hwCx7hg7ZubxmGOND02Do_Vp7W-qJRXK+NyN48sO0Zmy0_g@mail.gmail.com>
 <20260805041421.GE235112@black.igk.intel.com>
 <CAM=hwCwB=eXrDKFLdohPhvPMHCGm_+2qukTa5qiDknkyFVcj=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM=hwCwB=eXrDKFLdohPhvPMHCGm_+2qukTa5qiDknkyFVcj=g@mail.gmail.com>

Hi,

On Wed, Aug 05, 2026 at 09:36:22AM +0200, Bernd Behler wrote:
> Hi Mika,
> 
> > This is not expected. What typically happens is that there is another
> > hotplug and the DP tunnels get re-established.
> 
> You are right and my observation was wrong — I had queried tbtunnels after
> the re-establishment, not during the outage. It goes exactly as you describe,
> about a second later:
> 
>   16:47:48  acking hot unplug event on 1:11
>   16:47:48  1:11: DP OUT resource unavailable: adapter unplug
>   16:47:48  0:5 <-> 1:11 (DP): deactivating
>   16:47:48  acking hot unplug event on 1:12
>   16:47:48  1:12: DP OUT resource unavailable: adapter unplug
>   16:47:48  0:6 <-> 1:12 (DP): deactivating
>   16:47:48  looking for DP IN <-> DP OUT pairs:
>   16:47:48  0:5: no suitable DP OUT adapter available, not tunneling
>   16:47:48  0:6: no suitable DP OUT adapter available, not tunneling
>   16:47:49  1:11: DP OUT resource available after hotplug
>   16:47:49  available bandwidth for new DP tunnel 34650/34650 Mb/s
>   16:47:49  0:5 <-> 1:11 (DP): activating
>   16:47:49  0:5 <-> 1:11 (DP): DP IN maximum supported bandwidth 8100
> Mb/s x4 = 25920 Mb/s
>   16:47:49  activating Video path from 0:5 to 1:11
>   16:47:49  Video path activation complete
>   16:47:50  1:12: DP OUT resource available after hotplug
> 
> So: unplug on both adapters, teardown, then a fresh hotplug on both and full
> re-establishment roughly one second later. Nothing stale. Sorry for the noise.

No worries.

> Cable and power supply
> ----------------------
> 
> > Also, you connect the monitor with a real TB cable, right?
> > The second idea that comes to mind is power supply
> 
> Both original Apple parts, and I can answer this better than by description,
> because of how the desk is arranged: the NUC sits physically on top of a Mac
> mini M2 Pro. Same room, same mains outlet, same monitor, same cable.
> 
>   cable plugged into the Mac mini underneath  ->  stable
>   same cable plugged into the NUC above       ->  teardowns within minutes
> 
> Nothing moves except which host the plug goes into. That rules out the cable,
> the monitor's power supply, and anything environmental. Note the Mac mini M2
> Pro is Thunderbolt 4 as well, not 5, so this is not a TB5-sink-on-TB4-host
> problem either.
> 
> The cable was additionally swapped for the 2022 unit's Thunderbolt cable
> earlier; link still came up at generation 4 and the failure was unchanged.

Okay. And if it was cable issue it would not trigger only DP OUT unplugs
but wanted to verify.

> > Based on your dump it also happens to both DP OUT adapters (11, 12) at the
> > same time.
> 
> Confirmed, always both, in the same millisecond bracket. The tunnelled USB3
> and PCIe stay up throughout — only DP goes down. The monitor's USB hub,
> webcam and speakers never disconnect during an event.
> 
> 
> Usage pattern
> -------------
> 
> > You don't see any "usage" pattern there when this happens?
> 
> Partly. Scrolling bright web pages full screen raises the rate noticeably and
> is my usual way to provoke it. But it also happens with the machine idle and
> nobody in the room, at a lower rate. So load correlates but is not required.
> 
> I am sorry to say I cannot run any more tests: the monitor goes back
> today, so this
> hardware is gone as of this afternoon and no further tests are possible on it.

Understood.

> What I do still have is everything captured while it was here — the traces
> already sent, matching dmesg with drm.debug=0x104 plus thunderbolt dyndbg,
> and full journals across several sessions. If any of that is worth a closer
> look, or if you want a specific window extracted, just ask and I will dig it
> out.

If you can put one full dmesg + trace somewhere that I could take a look
that would be great. Basically from the whole boot up to and including the
first double DP OUT unplugs. Maybe there is still something that could
point us to the culprit?
