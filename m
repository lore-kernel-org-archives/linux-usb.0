Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860C54BF943
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 13:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602135; cv=none; b=N1PX8e61Fe08HiyLf0FBHiBAL9lwdy+XAdXbQbAU7oLpgJm15L/VMlos5/1IuQl+JWSN4P8uLE2dCDUZapkIfquTgXNfGizQgUvmZFpWxhy8fgjNR5imvYpDohUwvLHeZZD+SKrgeX69DIJzCLGuEDBctnkZ2qTVwA+9nCWEyzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602135; c=relaxed/simple;
	bh=DbvhWjTUdSmiWYloz0mPFI7s1k52YTSfVQYlSvq4Yao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L20/Ck9fY5e4EF0dvS1OcFwDZ9QvTMsRlEy6+7Cjx1jEcW7Sx4jtGNgLwKQ2i1b1y9M9CeGTSJgTAfYJIm1iUj5fZHKsjZ+ZF2dZ47gs0SHgloAAIoqPDxd++LSEqoc5sFErAuS9mLfDti090wXQ83U1pgO1HnKv3iiL82aHktc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJN8ywZV; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJN8ywZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790602134; x=1822138134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DbvhWjTUdSmiWYloz0mPFI7s1k52YTSfVQYlSvq4Yao=;
  b=jJN8ywZVJkvEguqxeywcqFb4YmcAFYIh0Tvqe6mCMdkHzMRcG0M6eZAC
   ZMQERce5BdWSrV+PxMeC8l+g4StuxK8u111yRm/UftlePC5XyXXYfYWvj
   byc/lHDSv6oSbNmrbFNj/KUIqEOubFgDMqtW7YTbQB1ZNeXvXOtkzg1jL
   Jei6/miZ8K+u3w7LBjDpZ7pZbEd1pweIA4dLAOYpV5enJx9QiPZHLKyCF
   q07BnmjeY10dG9wOOkBYE9iSJUpMqtv8kA9pq8x8tuMXevqTIFpn/UVdM
   tu0hFLTT7F1NpXTHzmyFbsAYczVH+5O07KQBsdSrpGWM8+xsZcAdre2Zz
   A==;
X-CSE-ConnectionGUID: 5ocebO5GTfijVAnjI9mr4A==
X-CSE-MsgGUID: vWFiCd1sRIK6LwpWxaBEPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94180362"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="94180362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 06:28:54 -0700
X-CSE-ConnectionGUID: TCvgldZhTIefcoFRkPf9Ng==
X-CSE-MsgGUID: W8DCPDTMRJizlh5TnZ2zqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278415455"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2026 06:28:53 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A664899; Mon, 28 Sep 2026 15:28:51 +0200 (CEST)
Date: Mon, 28 Sep 2026 15:28:51 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Leo Korotkevich <essacult@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ASUS GU605CX: diagnostic guidance for hard freezes and USB-C
 power-state changes
Message-ID: <arprk1YgN3llMaN7@black.igk.intel.com>
References: <CAEOLtbAXRO7zwWMtmVTG4X9az-ifFXtR1XgP0O7dNaCvZGmc5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEOLtbAXRO7zwWMtmVTG4X9az-ifFXtR1XgP0O7dNaCvZGmc5g@mail.gmail.com>

On Sat, Sep 26, 2026 at 02:45:15PM +0300, Leo Korotkevich wrote:
> Hello,
> 
> Could you recommend low-overhead USB-C/UCSI diagnostics for intermittent
> hard freezes on an ASUS GU605CX, Core Ultra 9 285H, BIOS 311?
> 
> The latest event was on CachyOS 7.2.7-1-cachyos with out-of-tree NVIDIA
> open 615.71.09. The screen froze and local input/VT switching stopped
> responding. The journal ends without a nearby USB error, OOM or panic. I
> have no evidence that UCSI caused it.

You should be able to disable the driver:

        echo "blacklist ucsi_acpi" > /etc/modprobe.d/ucsi.conf

In your case it may be enought to just unload it (modprobe -r
ucsi_acpi). Then just see can you reproduce the issue.

Thanks,

> Freezes recur across Ubuntu/Fedora/CachyOS releases, BIOS/kernel
> versions and performance profiles, Xorg/Wayland and
> dGPU-only/Dynamic-Hybrid modes. I also tried modprobe.blacklist=i915
> through GRUB; freezes continued. They also happen overnight on a
> stationary desk without cable movement. Some coincided with movement of
> the charging plug, while deliberate unplug/replug usually succeeds. They
> have occurred with the OEM ASUS charger and Lenovo/Dell adapters with
> different voltage/power ratings; exact specifications were not recorded.
> The current Apple charger reports a 20 V / 4.7 A PD contract.
> 
> Historical Fedora logs contain 1747 software-reported AC/DC alternations
> on March 9, not verified physical disconnects or a trace of the latest
> freeze. During successful recent reconnections, asusd changed profiles
> and restarted nvidia-powerd. UCSI_GET_PDOS failed (-95) appeared twice,
> but connection recovery succeeded. Brief profile/EPP changes also
> completed.
> 
> ASUS PD_FW 0003 declares firmware version 39 for the resource currently
> reporting ESRT version 1. It remains unapplied; its release note claims
> no freeze fix.
> 
> A bounded collector records power-supply uevents and contract fields. A
> temporary UCSI trace saw no events and has not been validated against a
> physical reconnection.
> 
> Which tracepoints best distinguish PD/PPM failure from normal contract
> changes and the platform's AC/profile reaction, without active
> controller polling? Sanitized excerpts are available.
> 
> Thank you.

-- 
heikki
