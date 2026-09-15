Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A96B3D47A3
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 04:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789446008; cv=none; b=iPLchIeGGjVGXPlYfyf3qNh9vdkeA7XpvdwT1XnPZjH0BH5p9YYr08eMZn104dVJFaK5glmIaYGPVEqxpnX9j6PGMKdsSAIk+VUBuC43gZlFlar5IRtVSjfS6u15ok66K32O9uNx/DFGZz0Zsr/qCh+C1xoedFttJ1/V/5M5Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789446008; c=relaxed/simple;
	bh=MCeM1YG3A4UV5ube6C2VvTv7aMCA+MEP1egwTGfhWMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRhiDMur9Evi+egcdAMV6vTk2uqsZOE/XddzLMLo8B1fGXklsG7+RQlGQIIZnhfw0VEE8f4Ql2hduR6F4d4E8mOc7d5iwUgUjobXTkr3bYsFvJYjnTXkTD283BRHhD8FJFhoq2OGYP0qmppMdE2nQPqPmhS1JJ5q9YnnU5s3D0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+BDKPNz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+BDKPNz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789446002; x=1820982002;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MCeM1YG3A4UV5ube6C2VvTv7aMCA+MEP1egwTGfhWMQ=;
  b=D+BDKPNzQ4UgG/X9VoJ1UYZMQ3bA6CjFeNS6CKGz9RgZgY2QHBW6kbPP
   esmIkAa9lhI/KY3HEyJpsY23+ei0YDU+z7fnYXhY2Q2J/jxMETRo3DaPY
   jhTA01Ei2M6lR0QCOgrHWLCe9p7FMHTfwsKWS/6q0Lxfrx0vZvQiU1mkt
   oU873WEkTPiHq5sPGGqH01M89TD1TztScACqIB5YGpjMkSIFARdlhbb+1
   q/5kk3XSSvvSA/U9SXi/ppHVjmSdXLHm9aQKzjFkE0dCDsr6uI0Z7YVrI
   bGk5hrOzVMyNCNzghUXv2Uf4lYx7+W3SHTC+eH64Jet6RuPFV9aNY6mPL
   g==;
X-CSE-ConnectionGUID: IqTZIa8rRymhtWBDN148WA==
X-CSE-MsgGUID: FSCMN6HfQFSrHJyc3V++AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107171422"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107171422"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 21:20:01 -0700
X-CSE-ConnectionGUID: QlU+W0TZShaYdSEDIMnzIA==
X-CSE-MsgGUID: ySzlBLBZSkOj1hIRClWolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272826007"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 14 Sep 2026 21:20:00 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C5BA299; Tue, 15 Sep 2026 06:19:58 +0200 (CEST)
Date: Tue, 15 Sep 2026 06:19:58 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ben <benstaples10@gmail.com>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260915041958.GE106095@black.igk.intel.com>
References: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANcA1gDByZBwvkHBi4Bin-eCzBpN31OHaNStbpi4vhTF-WOAPg@mail.gmail.com>

Hi,

On Tue, Sep 15, 2026 at 12:04:34AM -0400, Ben wrote:
> Hello,
> 
> Long and short of it is that my Caldigit TB4 dock is not working properly with
> my modern linux desktop setup that has thunderbolt enabled by installing a PCIE
> card. It's able to drive two 1440p displays fine, but USB is not functioning at
> all. USB does work with another machine so I'm sure it's not the dock.  
> 
> I have done a lot of investigation over the last two nights, and I figured that
> y'all would be the people to send the results to (though there is a terribly
> large amount of stuff I'm sending)
> 
> Attached are reports generated immediately after boot on various kernels and a
> writeup of what I've done to try and work around the issue. 
> 
> Best,
> Ben

> ############################################
> # Captured: Tue Sep 15 03:19:04 AM UTC 2026
> ############################################
> 
> === uname -r ===
> 7.3.0-rc2-1-cachyos-rc
> 
> === uname -a ===
> Linux moomooPC-cachy 7.3.0-rc2-1-cachyos-rc #1 SMP PREEMPT_DYNAMIC Fri, 11 Sep 2026 06:51:19 +0000 x86_64 GNU/Linux
> 
> === /proc/cmdline ===
> initrd=\initramfs-linux-cachyos-rc.img root=UUID=a9c18677-7688-4fb4-a1e6-dd5fc4ee40a7 rw rootflags=subvol=/@ zswap.enabled=0 nowatchdog quiet pcie_aspm=off iommu=soft usbcore.autosuspend=-1 thunderbolt.d3cold=0 thunderbolt.host_reset=0
> 

Please drop all the non-default command line options. For instance
pcie_aspm=off goes and disables whole native PCIe support. I have never
seen thunderbolt.d3cold so must be something not in the mainline.

Once that is done then at least PCIe should be working. However, if this is
a PCIe add-in-card you need to have BIOS support for this too to add the
"power contract" in order to keep the tunnels after PM transitions. But
let's see the full dmesg after you have dropped all the non-default command
line options first. 

But you can still add "thunderbolt.dyndbg=+p" so we can see what is going
on.
