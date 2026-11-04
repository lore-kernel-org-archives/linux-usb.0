Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794251;
	b=gNIqJbQaJVF6N9RyQT0e7S4iLT1wQ3lKnyPNDb3EiM+lnDQmBvB0Q9GCHzforVuqmacD
	 b31Ut3xZD9Aj02/08O27Zr7hpbE5t6UByB7LXzGw/Tuqau5ZIuhSu4nBBVLPuNlsS2s2B
	 wrwm8jUAZ+kPN60jQIOBR5JaX9DGcH8GCMgz8fQekOOJK8EOM+kijWIwHpK8pEwsiaocN
	 Z/YOXhF3e1yGkKDHsNiBzcGcUoVpbjaWpsMykyzdrAH42F8IC7ZC6TA9oE0SUataP2ehW
	 5zr9urlbjq6isJtpsI8sQJ/ylW6m4xnip2cz2gGTJhjq1GwW8dV85XMTPuJrZ8dywXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794251;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=4q+7nmSwngd2YrW+0sqV+3n9qv9JNyT1G3cBZj70q1Q=;
	b=osYnUCWydsudUeBfJogapzF9MxleNn76TdCe2tZH+/ajtBrDmAqMsPHX5s9kRqJoPrt+
	 c22efD4uISlyHOSuGYF0XobgdgfQGFfHnmZyH4qB0Uhyk0Iq6O9VJX+5lmNwPrKocCXg+
	 58m5FidcDcwLKNifJ8+fX3MOcD0a1BQXc5kN+vhJNISrgS+ws25/P4r60IcXtSQDVqclD
	 gDoNG12WbI0kMafOLpDHlBtSDmqyfd/uCMb6jYIk42CANw/XOA1CTVfOJzfcYhw3GgkHW
	 9Xk6KfDIxFlo5rQRDqAgw5NsiMdm7gRIOtg+azV51d1G9JiT4eyM+Y+MNCvFlEAnUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kCAzkF2o;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24092606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 12:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24092606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kCAzkF2o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793794251; x=1825330251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NaDrle2QU/ed63qF/c0+43kXtQAN4sDuXGVqMGAMpdc=;
  b=kCAzkF2oxXS+r5+his6wPGPuDNS3SC1Hx055XQxyTej4I74myV7KVDn7
   E+/sWl9SbCLKcM760c4nn5HBSOsgTecbiaiNUal+/NUwKJidsf0T1qXeo
   kjy+l/MFjKe4tAEaU5jYnjyLdQ9AmqfSfcNNLGusbJPei5miY/fdz27O5
   BT2ziNWn/d0ByL4YAfXUJspv72D6l9q+B9X0VuTPBHBS1NnfgLVUi+b/j
   A9uPAgtYWL+2+Vjr+lsXdPfTVEySLkQalfXfx1CSzw1/w9eSGTsbTfq6y
   Igt6U7JmUFZETmFuD57kj2cU6ls1bseMcv40pJmmildcxx0QkDl2enp0T
   Q==;
X-CSE-ConnectionGUID: t8lu9p70QdSvXoKGM1KlVQ==
X-CSE-MsgGUID: HC8MWgXtRce/khmrZyxpsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2580897"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2580897"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 04:10:51 -0800
X-CSE-ConnectionGUID: t+tCC7eVRdaJFxd9Pfx6Sg==
X-CSE-MsgGUID: 5+7muVDzTWacGOpaDWsyDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6864786"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2026 04:10:50 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A3F5D99; Wed, 04 Nov 2026 13:10:48 +0100 (CET)
Date: Wed, 4 Nov 2026 13:10:48 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Phani Kumar <phanigudipally@gmail.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: xhci_hcd 0000:00:0d.0 =?utf-8?Q?=28Pan?=
 =?utf-8?Q?ther_Lake=2C_8086=3Ae431=29=3A_=E2=80=9CUnknown_event_condition?=
 =?utf-8?B?IDE5OeKAnSw=?= then HC died, with a TB4 dock and two displays
Message-ID: <20261104121048.GE176724@black.igk.intel.com>
References: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>

Hi,

On Tue, Nov 03, 2026 at 10:18:28AM -0800, Phani Kumar wrote:
> Hi,
> 
> On a Framework Laptop 13 Pro (Panther Lake), the Type-C Subsystem xHCI
> controller (0000:00:0d.0, 8086:e431) reports a vendor-defined completion code
> 199 and then stops responding, taking down every USB 3 device behind a
> Thunderbolt 4 dock. It is triggered by Ethernet traffic through the dock. With
> two displays connected to the dock at boot it happens reliably within 1 to 4
> minutes; without displays it happens intermittently.
> 
> Hardware:
>   Laptop:   Framework Laptop 13 Pro (Intel Core Ultra Series 3)
>   CPU:      Intel Core Ultra X7 358H, microcode 0x11a
>   BIOS:     03.02 (2026-05-26), ME firmware 21.0.6.1503
>   xHCI:     00:0d.0 Intel Core Ultra (Series 3) Type-C Subsystem xHCI
> [8086:e431] (rev 01)
>   TB host:  Intel Gen16 USB4 host router (8087:a000)
>   Dock:     Razer Thunderbolt 4 Dock Chroma (TB vendor 0x127, device 0x8), NVM
> 30.0
>   Ethernet: RTL8153 (0bda:8153) inside the dock, in-tree r8152 driver
>   Displays: two 2560x1440@60 on the dock's downstream TB4 ports
>             (one USB-C to DisplayPort, one USB-C to HDMI adapter)
> 
> Kernel: 7.3.1 (Ubuntu mainline build 7.3.1-070301-generic)
> 
> Reproduction:
>   1. Boot with the dock and both displays connected.
>   2. Generate network traffic over the dock's Ethernet (e.g. open a browser).
>   3. Within about 1 minute the xHCI controller dies, and every USB 3 device
> behind the dock disconnects.
> 
> Log:
>   xhci_hcd 0000:00:0d.0: ERROR Unknown event condition 199 for slot 5 ep 3 , HC
> probably busted
>   r8152 2-3.4.5:1.0 eth0: NETDEV WATCHDOG: CPU: 11: transmit queue 0 timed out
> 5665 ms
>   r8152 2-3.4.5:1.0 eth0: Tx timeout
>   r8152 2-3.4.5:1.0 eth0: Tx status -2
>   r8152-cfgselector 2-3.4.5: reset SuperSpeed USB device number 6 using
> xhci_hcd
>   xhci_hcd 0000:00:0d.0: ERROR Unknown event condition 199 for slot 5 ep 3 , HC
> probably busted
>   r8152 2-3.4.5:1.0 eth0: Stop submitting intr, status -71
>   xhci_hcd 0000:00:0d.0: xHCI host not responding to stop endpoint command
>   xhci_hcd 0000:00:0d.0: xHCI host controller not responding, assume dead
>   xhci_hcd 0000:00:0d.0: HC died; cleaning up
>   usb 2-3: USB disconnect, device number 3
> 
> Full kernel log attached.
> 
> Observations:
>   - With only one display connected (either one), it does not happen.
>   - Booting with one display and hot-plugging the second after login did not
> trigger it in one test.
>   - With thunderbolt.dyndbg=+p, the Thunderbolt driver logs nothing in the
> window before the failure, so tunnel and bandwidth changes don't appear to be
> involved.

I agree, I checked the log you shared (although it missed some details)
tunnels look fine. One thing you can try is to run "sudo tbunnels -v" after
this happens so we can see if the USB3 tunnel is up.

You can get tbtunnels from [1].

[1] https://github.com/intel/tbtools
