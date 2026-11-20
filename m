Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186608;
	b=3ftW1rSvtZq2iegjYMKRd4qTO+klW6gfPmypSxARWsMlPJq76glI3K5MUQH1Qmt8Jmiy
	 5bG896vOUmVs9rejL68cV9e+5wVVN6ZcYxSBOAmr00pnH9LVKe/pKS//KYI5f1i9QIkPW
	 ql53XOdUzkPFrGgddHDAonJq/P495yxJoGq0RNxUekucRBt1QBY3ZPlPqk35/xhZJ8kIg
	 +p7cfGU/BDWBhvWrVbAG1Yfv1ejFwNg7GMW9cH6y75UUQ+OyoZ9NUXbSDxy7GnLBBc3NQ
	 HUeQFdDPqXccgL24U3Lty99/PDiM+v5N5nTvqAAYJirkD6cSk34zDrji7jExSjBNrpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186608;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=M+a7f+bP1BlVHrhJu9tjEv5nRmCR1beJKZQ8POSqdCs=;
	b=mVNNA09c+Z16nPeZ47MkRmtyoiddVkvu5uqAkbNVXbsknAf47Ks3x5GJZuRSSk4BQAB3
	 lgqTlgzl9ISJt3dBNKcs0/g5dmY0dHVG7cd8AKp4orSAY/SbwvFZfLjxY5NH4O2J5n/n5
	 QojgdicqxbizkeTOJC+MgWhWZUgVyEtmomKW0Qo6uiz/H3f8KQDPZGipBybSqRck3c6DU
	 UDoxS1vfKD7DXFDkwJGSAQ72qNbNW1+GKpOSPIKvOHhdjqfMwuj3xuYZ/1ZWQpZsiWWY/
	 bOt/f8Bg4srBdgO2nCViNepIo722T/Ekm3W57IPof5yw2IYBJYk/ZLZqjRH4U15pNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALtMFmg9;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A232606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 14:56:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A232606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALtMFmg9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795186609; x=1826722609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=doGEBhGI1HTzkhPM2NKmdplhxzI8IBn+Gzm9m6GamRw=;
  b=ALtMFmg9HVUfHteHWi1Gr0OXDQrT0vKg/8J0I+Djbo/zGA61yaLEkxm/
   p31TR2Qc5W278axqk6N1zb2nQJeezHqgg1r7KgmLRNbeRyKaQA6jhUDsQ
   RCu8+DhMCsajkHArus8uqtp6219dUWRa9j4VpJ+HTL+B25p/OFc0FkERa
   0uqj6Zakd+Srft26+XkMsPoCQ//jGSC27REIZi1UDmeMwpIwrp1xTGmVD
   +WQ9QjpwFXCPbvtBeUU0oggUPWstBsuuq7CrJ84CMKVpWX9HU2YWTXwvY
   3q19wRdE4ILSDlKgg5YGBA6Tk7zEqr8zCydy3r2Vhv6CrhIzE6vhWzrkw
   A==;
X-CSE-ConnectionGUID: mBxLYwUJQ/mx8viSSMhLiQ==
X-CSE-MsgGUID: V8GQ1wPaSdy+wSF7n4ePkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4068795"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4068795"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:56:48 -0800
X-CSE-ConnectionGUID: 7thEx36gQQy/XzCFG2PK7A==
X-CSE-MsgGUID: 4ct4mLEvTeaVzVJaxhCYzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10841622"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 20 Nov 2026 06:56:46 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 72E9499; Fri, 20 Nov 2026 15:56:45 +0100 (CET)
Date: Fri, 20 Nov 2026 15:56:45 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Peter Walker <peter.walker78@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: ucsi_acpi: "bogus connector number in CCI: 2" flood on Acer
 Aspire A14-61M
Message-ID: <awBfrbFPUvcrS1Xg@black.igk.intel.com>
References: <CAPv=dGA4maJEzJ1mt6udD71WFD8SbxGFfun5Hg8PpvGEb038HA@mail.gmail.com>
 <ausGNtWlRzZN29ux@black.igk.intel.com>
 <CAPv=dGA6ygdQ8StHwht6nPJZyb2FTH0n03txOOWhb4SSHkG9zw@mail.gmail.com>
 <CAPv=dGBgnxKoyOrcbKBwym5sm3M9+oO+L5R1do7pP9X6cBDXUg@mail.gmail.com>
 <au4TbIvSBLxIWxnQ@black.igk.intel.com>
 <CAPv=dGC9FCbqW1hBnRz8Axy8FmdD4vohFZ+Q03fmsz3pDRod4Q@mail.gmail.com>
 <avR7Akf3n4G6QKtz@black.igk.intel.com>
 <CAPv=dGA4CoZrBVs7RGDmuXfb5YqPcR5hmYh7uUVsRcShbeT6hg@mail.gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPv=dGA4CoZrBVs7RGDmuXfb5YqPcR5hmYh7uUVsRcShbeT6hg@mail.gmail.com>

On Wed, Nov 18, 2026 at 09:30:30PM +0000, Peter Walker wrote:
> On Wed, Nov 11, 2026 at 03:26:10PM +0100, Heikki Krogerus wrote:
> > Okay, but it would not help in any case. The first problem is that the
> > PPM reports the wrong number of connector, right?
> 
> Yes. GET_CAPABILITY reports bNumConnectors 1, while Acer's SSDT31
> declares two connectors under \_SB.UBTC, CR01 and CR02, and port0 is
> bound to CR01. Both USB-C ports are on the left side, and connector 2
> is the rear one: with the charger in it, GET_CONNECTOR_STATUS(2)
> returned 0x000000000000000153851545222b0000 (connected, PD sink, RDO
> 0x53851545) and GET_CONNECTOR_STATUS(1) returned
> 0x00000000000000010000000020000000. Those readings are from 6 Nov.
> The BIOS is still 1.29, the newest Acer offers, and the DSDT and
> SSDT31 are byte-for-byte the same as on 20 Oct.
> 
> > That is a pretty obvious FW bug. Did you report that to Acer?
> 
> Not until now, sorry. Reported to Acer UK support today, case
> 261119-000931, with the readings and the SSDT31 disassembly.
> I'll let you know what they say, by 3 December either way.

Cool.

> > Can you share the complete dmesg output?
> 
> Attached: the kernel log for one whole boot on 7.3.4-ogc8.1.fc45
> (Bazzite), saved with journalctl -k -b, so the lines carry journal
> prefixes. ucsi_acpi and typec_ucsi are the stock modules; the taint
> comes from Bazzite's gcadapter_oc module. MAC addresses are masked.

Thanks!

> The messages started on their own 0.9 s after "UCSI_GET_PDOS failed
> (-70)", with the charger plugged in. On this boot that error was
> logged once, not twice as before. Later in the log the charger is
> unplugged and replugged three times, moved between the two ports, and
> there is one s2idle cycle.

I'll try to take a closer look at this next week. But it sounds like
the PPM is not behaving properly also in this case.

Thanks,

-- 
heikki
