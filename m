Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234044;
	b=IUYyTsCUwSKuW5b1MbJ4/xo9jIVSUabN9ZHZylnrKlKGYRnoyyyRNAzbMEADjKBjQnOJ
	 N3G+S/QN5iakeJeUqnIKm7kSOnpWrzf8oM+6+CWoZjaP+9W3PjlxDrggB0QJIqmSlRI3t
	 vi/gje1bonYHatNfn6708GLwCl1Rw5rBjn+av24P5lbhEMwv4+Bkr8CgVKJZB/Hh7n/Gg
	 /SfTTpY2apZkI4HbsVlBBiT8EkRcGwM+yD6+dcA0UycqB13KpclCDfoDGV2vQmOKBwTL/
	 pDf3+OxV4Z3IYEt54FDOawFPpyLWovZ1a3jIHH2lsrfBgp4y0nH3+2Y1GygT3sUdRjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234044;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=M71iMpKdMfHIP6yiMa4Z2DhA06G/FZRvI25PBkVKJ8U=;
	b=n9M2KFG7oCL3meT3tE9s2WnQHRQd02a/Q5/j1A2D472bMdinIwz0G6TMzBHFYFTTP2YT
	 PNWROawqCynKd9k+2H7aIvkqwDJwNJD/teLZPmqdj4ycijqgt6qu1jzAm59ut87Bu9jeX
	 Ah6+CdnYgGITPSNe45hQWe/UVDfXbL52Kgv+mDntt3HioBsYNMd5trRGq+L02n5FJa9tL
	 4RgdbKpp2M68wSr/t2jL6nbnr0FUR+GrM+kosgysCZ3QK77Rhw+ITynAPWocODMnp+Irp
	 uE+Ttw79arVEyu62KWd9xpbHVSCw+m/ZYB4r8SDCFavtQXwsFbyEF+R3UlU3VZT6oiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZiksYaQc;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5F3606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 14:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B5F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZiksYaQc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794234045; x=1825770045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HlgYlRgX09uOdMgma0cSlhrAT3HYbD5uFhejD1If/5I=;
  b=ZiksYaQcOpB3AgFbC4uCzl/yds5njlSXub64I2XAOpCDCwmYT/ldhgCs
   3V0EhE4Syohnwrhvv9fXoRIF9mmFWbd/WswIfesXyjqoDRVk1h76Q8rRp
   9hc//hQhXe96jNa3PHYoRVvBUzfFIIurfghOGqHpuR0PjEigUrm89ig4B
   4zz/gvNb8gxeK6UUQzt2qTD2bJORSP/gl45zn4bSOe4fX2+4hhdYxxpHp
   MWCj1cXXLpWPYlH421AP0ZeGRvOSLSK25YjZieDmha0hP8bqiL+eR/LsV
   jUxzgZygeJwK99vLB57HkZhGV6DkA2HlnFm+H2ShyurSeYHs5S9WOfoH7
   Q==;
X-CSE-ConnectionGUID: G2tlL1+vR76G7fDmFQvRSQ==
X-CSE-MsgGUID: du9Iq0O2QrCZqSgdHbLHYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2873335"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2873335"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 06:20:44 -0800
X-CSE-ConnectionGUID: 6tEybwtQSxWrh+6L+wr/Yg==
X-CSE-MsgGUID: iSnBkkbIR5iPo3GYKmxxFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8446828"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Nov 2026 06:20:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AE21399; Mon, 09 Nov 2026 15:20:41 +0100 (CET)
Date: Mon, 9 Nov 2026 15:20:41 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: James Taylor <jrtaylor11@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
Message-ID: <20261109142041.GS176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
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
In-Reply-To: <1794223545.366398.reply.hermes@gmail.com>

Hi,

On Mon, Nov 09, 2026 at 11:25:45AM +0000, James Taylor wrote:
> Hi Mika,
> 
> On Mon, Nov 09, 2026 at 12:18:52PM +0100, Mika Westerberg wrote:
> > Please use tbdump from tbtools [1]. It knows the registers. Something like
> > this:
> >
> > https://github.com/intel/tbtools/wiki/Useful-Commands#dump-lane-adapter-capability-for-current-link-capabilities-and-status
> 
> Thanks, here it is (tbtools 0.8.0). Domain 1 route 0 is the AMD host
> router, route 2 is the DEG2 (JHL9480). Both lane adapters on each side
> are included, followed by tbadapters for reference.

In your command line:

[    0.000000] Command line: initrd=\EFI\nixos\c18phgd1m2qpc2g72pz14fg9h9i38j6w-initrd-linux-7.2.15-initrd.efi init=/nix/store/2m5ckvjrfdbcxrfpklc7rg16jwi11spa-nixos-system-nyx-26.11.20261106.4fe25e1/init usb-storage.quirks=0bc2:3343:u thunderbolt.host_reset=0 pcie_aspm=off nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf

Please drop thunderbolt.host_reset=0 and pcie_aspm=off. The later disables
much more than just ASPM so it may affect everything. Once you have done
that please take another dmesg (and check also the link registers via
tbdump).
