Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014708;
	b=iFNleS6oLvjyJxY6mdWXulXcS1yfILd3w4BlqvWxqaV/HHYmX/6jS62jOolhX1V/Riqu
	 iHxQbQx9T81Jze8PYszkZSz+34t/ZDOe8PmR0YC3N6S1MFPD6Mx012MQPaLsj96SaE/Ks
	 ZI5Kivny2r/76QAe4iIV/COQPXDIZVEzcmtVWhKagJNTq/DHqrAcrbBq/GBnv35EMKd+o
	 7LfCoPh+ZzPfsJmIAWKxKQQCBJHWyqnj5cawTh6QETNk+940Feixov9oXZ+yK8ZENoAuQ
	 iBFQaa6K5jQ59i6vGQ/HiQ2+WRqApVsjRnhO6Gsbev44lvS95eXRgkjKsmcJQ3QGsYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014708;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=blxnqThsMk81z4qvMbZ6ri3hXR90Vzov50Fn/Bsuoq8=;
	b=F9MHAM705dEYTWClLeTRaUVDdqflUaiKOgRdmlo+4P7oqe4mcjC/+0LaKNI+WFi/oHdF
	 HDmcQiewso8fMURUXnweZyjjtmt5XjFbjoGWDpo8EMP2IyaLJNr0gNUVjdq3rvMKQnZSd
	 iYL+ncLuwEtIFnx61S+dhuHUA4XQ6fBST2hoa1oJYt5fl8H9BrXZkXKPel3q60Sw7NlRy
	 np6Y8tnbK9tcFtlHCQaH4f26/57z0PUeuSjC+cTAdmHWclK4DTgQdkze6SuSCkZkzd9Ph
	 NGCtRkX4a3FqpLshJ7YfXuIGq6DXOjpY7OtkNW0BxCrgJRp1YXs91GuwOimVcV+gS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W7RuWAz2;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5C1606A324
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W7RuWAz2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793014708; x=1824550708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LFXbw8h2752XrUusI0960pEZ0NcWauS+1+FZTY+K7jg=;
  b=W7RuWAz2kfPQyQA5bQMZYIamhY935SQh9tQx97hScfOzMnDsvuZ28RZW
   RLLiqQZGREadtBBtf13P2lj+3M8aNhxNkFJYnoqJJaEH6fdI32nx1ce4F
   HBnzS4XnTlbCY02yEW1k+rrVnk+eBdurPwB65pgm72HXvYnQQR+4NMXF7
   XbXU7U/ESxeOmanrna631A+fxS1AJR1ola6ssZyRDLMaxbjUC4gLdD4nT
   iLrNevMchmvjxYvY70bF6xpnLdpdfbLf1jMDORJGqVOL4Sg+tSf5FvdpH
   WzmpXBWKR+OGydRmaTX1tx9E/a6kfwFAA9CwmqkzgYNyPiAlxDGJ2pX4U
   Q==;
X-CSE-ConnectionGUID: FOr4Yz3cSmK5pED52pnkug==
X-CSE-MsgGUID: 8zN88C4JQim/iPrme2T7Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1579586"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1579586"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:38:27 -0700
X-CSE-ConnectionGUID: NPEgw9ayQ0qK1DReY3lbYw==
X-CSE-MsgGUID: YRb4OqMeTgCl/BOZ9rGSyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4595198"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2026 04:38:26 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id AA8BE99; Mon, 26 Oct 2026 12:38:24 +0100 (CET)
Date: Mon, 26 Oct 2026 12:38:24 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ville =?iso-8859-1?Q?Kivel=E4?= <vkivela@outlook.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"acelan.kao@canonical.com" <acelan.kao@canonical.com>
Subject: Re: usb: typec: ucsi: duplicate-altmode filter keeps invalid DP
 partner VDO on Dell XPS 14 DA14260
Message-ID: <at87sDXF-KHTJAxb@black.igk.intel.com>
References: <PR3PR10MB3898251C0136EEFE9DEC84FAA5902@PR3PR10MB3898.EURPRD10.PROD.OUTLOOK.COM>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PR3PR10MB3898251C0136EEFE9DEC84FAA5902@PR3PR10MB3898.EURPRD10.PROD.OUTLOOK.COM>

Hi Ville,

On Sun, Oct 11, 2026 at 07:34:59PM +0000, Ville Kivelä wrote:
> Hi,
> 
> The duplicate partner altmode filter added in 67c92c6419ea ("usb: typec:
> ucsi: Detect and skip duplicate altmodes from buggy firmware") keeps the
> invalid copy of the DisplayPort partner altmode on this machine and drops
> the valid one. The DP altmode driver then cannot bind, and the monitor's
> USB hub never works.

This is why from now on all quirks for this driver are going to be
isolated with either DMI match or something similar.

> Hardware:
>   Dell XPS 14 DA14260 (Intel Panther Lake), BIOS 1.8.2 (2026-05-22)
>   UCSI over ACPI: \_SB_.UBTC (USBC000:00)
>   Partner: Dell U2720Q monitor (DP alt mode + USB hub + PD source)
> Kernel: 7.2.5 (Arch-based distro kernel "7.2.5-3-omarchy")
> 
> The firmware returns the partner's DP altmode (SVID 0xff01) twice on every
> attach:
> 
>   ucsi_acpi USBC000:00: con3: Firmware bug: duplicate partner altmode SVID 0xff01 at offset 1, ignoring but please contact the BIOS vendor to fix this issue.
>   ucsi_acpi USBC000:00: con3: VDO mismatch: 0xff01a043 vs 0x00140045
> 
> The entry at offset 0 is invalid (0xff01a043: SVID in the upper half,
> identical whatever the monitor is configured to). The entry at offset 1
> is the real DP capabilities VDO, and it changes with the monitor's
> "USB-C Prioritization" setting, as expected:
> 
>   High Resolution: 0x00140045 (UFP_D, receptacle, pin assignments C/E)
>   High Data Speed: 0x001c0045 (UFP_D, receptacle, pin assignments C/D/E)
> 
> The port exposes a single DP altmode (port2.1, svid ff01, vdo 0x001c1c46),
> so the per-SVID cap is 1. The filter keeps the first partner entry and
> registers port2-partner.0 with vdo 0xff01a043:
> 
>   $ cat /sys/class/typec/port2-partner/port2-partner.0/{svid,vdo,active}
>   ff01
>   0xff01a043
>   yes
> 
> typec_displayport does not bind to it (no displayport/ directory under the
> partner altmode), so the OS cannot choose a pin assignment.
> 
> Observed result:
>   - High Resolution: video works, but the monitor's hub never enumerates,
>     not even at USB 2.0.
>   - High Data Speed: the hub (0451:8440) enumerates at SuperSpeed on the
>     TCSS xHCI and disconnects within ~1 s, as DP mode is entered. USB 2.0
>     enumeration starts and never completes. There is no video.
> 
>   usb 2-3: new SuperSpeed USB device number 2 using xhci_hcd
>   usb 2-3: New USB device found, idVendor=0451, idProduct=8440, bcdDevice= 1.10
>   hub 2-3:1.0: USB hub found
>   hub 2-3:1.0: 4 ports detected
>   usb 3-4: new high-speed USB device number 6 using xhci_hcd
>   usb 2-3: USB disconnect, device number 2
>   ucsi_acpi USBC000:00: con3: Firmware bug: duplicate partner altmode SVID 0xff01 at offset 1, ignoring ...
>   ucsi_acpi USBC000:00: con3: VDO mismatch: 0xff01a043 vs 0x001c0045
> 
> The same monitor and cable work fully (video and hub) on a MacBook.
> Reproduced on two different USB-C ports, after a full power drain, and
> with Dell's "Video/Power only on Type-C ports" BIOS option disabled.
> 
> The root cause is the firmware, and it has been reported to Dell. However,
> when duplicates disagree, keeping the first entry is arbitrary. Would it
> make sense to prefer an entry that passes basic validation? For SVID 0xff01
> that could mean a non-zero pin assignment field, no reserved bits set, and
> the upper 16 bits not equal to the SVID. Alternatively, the driver could
> prefer the last entry. I'm happy to test patches.

I already send a patch where I disable support for the alternate mode
reporting for all Dell XPS systems, but it looks like Greg missed that
patch - I'll resend it:
https://lore.kernel.org/linux-usb/20260911132850.1580669-1-heikki.krogerus@linux.intel.com/

It does not make sense to attempt to add more and more quirks to this
driver that fix firmware problems on these systems. Dell really has to
fix the PPM.

> Also seen once at boot on the same machine (cleared by reloading ucsi_acpi):
> 
>   ucsi_acpi USBC000:00: con1: failed to register alt modes
>   ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

That should get fixed with the above patch as well.

Thanks,

-- 
heikki
