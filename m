Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792992214;
	b=M1jYWGzCCWlwdv4FyzSUEzp3FU+VJMxV3hbUjc4Gp/LYRNrxURUySGT6z3UvBKGBGCYf
	 TZdR4j5829oL+4O562I/v2ezYbJpa3afYAykWe+82TNt098JZTj2SbRMouV40FJOAmJMZ
	 rbv1/w1PwVvIpvB0Fjb+VLcgk0K0UGrrV9d+EVIFQED5+ck4s92nI+7QZtIy2iE2zbNwG
	 wrsxfBw3Q++4lvyyl8XEvO1+i9B3brloeAU0kwkxz2PQLdJoeK+RBjlLPUBGSLUgbKU8R
	 DP1AIQnWFOcoTlAqgarNPGIpoCojmuMxqOT2euiL33jrUmppkcySe7rrUbaKO9jhuOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792992214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=+fvw5zBzVtH38sGQzYTDlsIZTybbduyDjGI60QE2zZM=;
	b=voh5K3Lj3yxk86FXB9CZlZm/G6gl/3c/OaImrjAqLEc05dv9C2vtdkC6AtvBBH9YTuLd
	 p6oeRmOGN8XpymNNma+nwRjPwH6jd0MErs1Ln21QPlmRLSleZoAQrZXODWQYwQIwgUzok
	 Rj5LBmvUPIBLxocc9iRBxgAiPbMHULLxnP7V6ZZBgTjt9W9IwfZ7KlNHlqTC/06+zXmOW
	 oFTj4cECJuaOcJ+No6tTWUBbLc3yqFm9k/1E8s/TJaA2ssg8F+FifQAnPuMegFbW/L3lT
	 EOiZaZVSWMpeZHDOQyKFgnQ/lJzeeButPpo61i937XkzAKNDzQNdtVqgRITxlsH5gTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Bs5m/R3h";
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A29B606A31A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 05:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A29B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bs5m/R3h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792992214; x=1824528214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z79nnM68tNJ/EKlVxPMN+aolLTZRY7Z10Skcek5Eqto=;
  b=Bs5m/R3h5TtobZSN3i7IRVcSSkBNbSHp4k+IDauBZQlHhX2ukCoMh4AC
   zMGkWcnvM8ZegbGB/2Qn8R37GqS4al5bambDIVDFY87WLCdxgwFEYx3el
   sJRTq8H01I+T0NeYXcWqcoIUfbEGziz+BWlKl1PR6mJDxdwCDIWnb+vEZ
   GcMjKr8zCinno0gMWbr2RcseC/7QXkVFXek1jSqKyqS+khX80I2+mBATx
   +jr3nD0odjVgvYG4+KrLjLnEig/GZxVeSBKNlahvqDtxltmAFIEpjrink
   k44lWKaDcVS/xIsZ2fwLy+ou3XmZ/dSr9vLHgJscQHkX1DLK0L4vcm9Wb
   g==;
X-CSE-ConnectionGUID: YGwH28v6QCez2RU0iWnfZA==
X-CSE-MsgGUID: oLNY3pOSR965EyOnvkH/mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1539140"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1539140"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 22:23:33 -0700
X-CSE-ConnectionGUID: 4oE5intWTZ23gU9/qQOyCw==
X-CSE-MsgGUID: YG2FnhcaQn2dXVg7DJcYaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4145442"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 25 Oct 2026 22:23:32 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 0EEEC99; Mon, 26 Oct 2026 06:23:31 +0100 (CET)
Date: Mon, 26 Oct 2026 06:23:31 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-usb <linux-usb@vger.kernel.org>
Subject: Re: "thunderbolt ... (DP): not active, tearing down" error breaking
 DP over thunderbolt displays
Message-ID: <20261026052331.GC158991@black.igk.intel.com>
References: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>
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
In-Reply-To: <b5145213-9542-4351-8f98-527aad74ee64@oss.qualcomm.com>

Hi,

On Sat, Oct 24, 2026 at 08:17:16PM +0200, Hans de Goede wrote:
> Hi All,
> 
> I hit this error:
> 
> Oct 24 19:16:58 x1 kernel: thunderbolt 0000:00:0d.3: 0:5 <-> 1:11 (DP): not active, tearing down
> 
> while doing some work on a Raptor Lake ThinkPad laptop plugged into a Thunderbolt dock.
> 
> After a bunch of debugging I found that the problem is that I had:
> 
> "UseSimpleDrm=1" in /etc/plymouth/plymouthd.conf, which combined with
> the latest dracut version causes dracut to omit the i915 drm driver
> from the initramfs.

The error means that the graphics driver did not read the monitor
capabilities in time (~12s) and therefore the tunnel was torn down.
Capabilities read is required for DP tunnels to work properly.

> And when thunderbolt.ko loads (or maybe only once userspace pokes it ?)
> and the i915.ko driver has not claimed the DP connection then the above
> message is logged and Linux does not see the DP attached display(s).
> 
> Building i915.ko into the initramfs works around this, but there
> seems to be an assumption on the kernel side about things happening
> in a certain order during boot which there should not be.

Right but as above capabilities read is required by the specs and we cannot
keep the DP tunnels up forever to consume power (and there is also
complication with add-in-cards that don't have all DP INs connected).

You can pass "thunderbolt.dprx_timeout=-1" (or some number or seconds) to
work it around.
