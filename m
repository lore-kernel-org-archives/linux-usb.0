Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABC3145A1F
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 04:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786077444; cv=none; b=mYz6eU0lsLcqwbczxkCW62JNRlW4dw2Iwsnqfdd9+/dzJNigbuNt49fOSAgz8IxV0IJzLnFZbgCYLPfizXvwE70zZYT5n4wythZX8X6Qn7rvr5kKndxR4Xg16KiesfdsRnX1X8IObr05vlGDeO3no9zXf3pkRBwRhKHdLc6G7tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786077444; c=relaxed/simple;
	bh=280CT3oV9ErBpUEaySHTUgaZWc+hfmHG9qle4Xs8aJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXHHRcRTC0FytAvrqwyWgdy8NckrY9mp6osXJXPSvGAq9RijfmuKxzLxjmMTpihviYFwJooBHSQmjfdMlx89SmwqSZl9ezYshgjYS89jIUL1oGh4Gqnp0vw0x/2zQ+FfhaUGyvfnQ1k0m+kDFRAdCj1Oe2MqM3e8gUpXL6ibBKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSjq4doE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lSjq4doE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786077443; x=1817613443;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=280CT3oV9ErBpUEaySHTUgaZWc+hfmHG9qle4Xs8aJQ=;
  b=lSjq4doEcvuSFyxQbCS6/YTNFQjAohgykX49u0xEHh9CBVHDisiZlEAa
   mqEIudZzTWAFoQjRxxfdEkf5WqiqOdJFb0wcQlLMUbObtDUbwGroq5WIy
   aWek2GsX54LtqTisuYs3v7CFigHoO09jgID6fFoeuReHUtcEqlZngDQZ+
   Nf4QeIhYdqhT3amyXU2gQH+mpgb9sfhxZtbAyslo5p29BwcLLfMqY/Idv
   IIKeeBQ2gpRTJJLWfPDAwh3gPdj6WY4MgD5ckrxDoW4Wag7Gh8LtpB4+1
   xV26m1Z5qP9hos3Kk3u2lhgbWcGzNZnyCCUn5ph0RrPZP2wq2lKgEEMY6
   w==;
X-CSE-ConnectionGUID: e/1dlufdT5GusElX0Td2iQ==
X-CSE-MsgGUID: NgyzCym8SDKDHpMd2s7iuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86555487"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86555487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 21:37:22 -0700
X-CSE-ConnectionGUID: CfndzumNQyKu4lBcEOVD7g==
X-CSE-MsgGUID: ANe1JMUbRHyvwE649KGgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="258443348"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2026 21:37:21 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CDF3199; Fri, 07 Aug 2026 06:37:19 +0200 (CEST)
Date: Fri, 7 Aug 2026 06:37:19 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: David GUENAULT <david.guenault@gmail.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: thunderbolt: PCIe tunnel creation fails for USB4 eGPU dock on
 Titan Ridge host
Message-ID: <20260807043719.GI235112@black.igk.intel.com>
References: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOFj14_tBEh5eXt_o5ZZme6bMt+Gt1pLS1ARwR2n=29WcjP2Qw@mail.gmail.com>

Hi,

On Thu, Aug 06, 2026 at 11:48:24PM +0200, David GUENAULT wrote:
> PCIe tunneling never succeeds between an Intel Titan Ridge 2C host router
> and a USB4 (Thunderbolt 5) eGPU dock, although the Thunderbolt link itself
> comes up fully bonded at 40 Gb/s and both routers enumerate cleanly.
> tb_tunnel_pci() fails silently -- the only message is "PCIe tunnel creation
> failed", with no path/credit/activation diagnostics even with full dyndbg.

That's because Titan Ridge is using firmware based connection manager so
it's not the TB driver that creates the tunnels.

Can you drop all the non-distro kernel command line options, except
"thunderbolt.dyndbg=+p" and provide full dmesg?
