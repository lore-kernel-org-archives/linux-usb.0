Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794301707;
	b=wV+XxPFQb/w6q01kgvmeYx4lBSsFYaNLIxmxOHxgI7HJoNP2rQWvCn8BlQsAkeEdJUZF
	 GkX/nXVYot0W+uvNUz9bgCpNDSNnNa4NFWAQnbhix87c56jrJhwTtIydZuilmQUIN59Ex
	 01KDIt84owVQeqZe1Eevuf5toxdjqr74Bp7dQwZsgHmh8drmvN5wLPI+fovU5HR9zmnGD
	 QUoG3cXOIXo9yAS2hzwNSIiiuiol7lGvyC5aQ2sEMTSzW7MtPV9sobMKhZt87Iiovtpm0
	 CGRJQFJJTR3y+63jJkZwNGkTJ5dkJh9fWZeAgGWDKIp5GTGXxNFkx+U62AU6q5v9I6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301707;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wPEmE3oAUNXorCdVLTl71phWzDoQSIVdHdBcXFCl8jw=;
	b=eUIA6rWg92qj0E/Vxa7f6nQ/XPwP0DXXMrkygpSSpYfimmfJl5Ls6jYSrVJsO0Ka9GDm
	 zB9XgXWQGZn1SDOsL5xwFUC+0N27tgBx4tLHD327CZCkEoLSjwaQv0WP1ddrQwOGDRDLI
	 WDSLGRx4A90wsyJcX8bkCRtVWXfs1DauKWoKIXNb1OC8RSGsRUwFPQJfqqBlYCfvabh3J
	 z9PR744ZiFnj+iLvYiaKoViPjZT0mCe81/2aKJCDiGZYiFqPVicDezfQqT8wttiaH/M6F
	 hWCEGWYHTt9SJhcV0iZ6bb7uPQoU8rUgL3x9Wtaq5d9ZLqS6j3SINXgUfZT/Y55qi3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+IaFWbT;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4273D606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4273D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+IaFWbT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794301707; x=1825837707;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=k99JnI/WD6zvga5NLJLf7Q6SMbxYBqfCjxjzj3UkZT0=;
  b=e+IaFWbTWzx0fS0geuIyKHrl/DqMGU3siHFO5S2pNfE8/Qaq45gP1cMY
   sjoOu4ifGbawY4yj6aA/hCFyT8bes9qmQ9kJys8TVYA3GXgMh5DB3cKyY
   1AgiyaucA+kBbYFO2xGC2ZYBzhv3HEt2gghhinHRHFHGOdK0JN8YLUJ46
   Wh4yhmekzxH285JZHHjNbaKB0gOiCfjkjp6woBXdJZAGAGz5bhnhjzQUP
   TYrVYOpFflykKfZEqWu93Jq1V+x068BHO2BKZQIw5sZz+M76pGxYO6tUS
   e9dZ6TbeTXqBZuFXiSI52YcQVpLb9QtX6djVpp+vGSOzvhu2JMOzrBsL1
   g==;
X-CSE-ConnectionGUID: z7+IhHPQR0KHiYsAFcTUSQ==
X-CSE-MsgGUID: jdv5FTWCT/qxMtGRRpeQOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3125621"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3125621"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:08:18 -0800
X-CSE-ConnectionGUID: NfAn0gJbS+atryh8YzUobg==
X-CSE-MsgGUID: c/jrgX95SoqwQ8qo25Umqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9878929"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.1]) ([10.245.245.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:08:17 -0800
Message-ID: <d15451e1-b89f-4db3-95a8-21b188cd0030@linux.intel.com>
Date: Tue, 10 Nov 2026 11:08:14 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_xhci=5Fhcd_0000=3A00=3A0d=2E0_=28Panther_Lake=2C_80?=
 =?UTF-8?B?ODY6ZTQzMSk6IOKAnFVua25vd24gZXZlbnQgY29uZGl0aW9uIDE5OeKAnSwgdGhl?=
 =?UTF-8?Q?n_HC_died=2C_with_a_TB4_dock_and_two_displays?=
To: Phani Kumar <phanigudipally@gmail.com>
Cc: linux-usb@vger.kernel.org, mika.westerberg@linux.intel.com
References: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 20:18, Phani Kumar wrote:
> Hi,
> 
> On a Framework Laptop 13 Pro (Panther Lake), the Type-C Subsystem xHCI
> controller (0000:00:0d.0, 8086:e431) reports a vendor-defined completion
> code 199 and then stops responding, taking down every USB 3 device behind a
> Thunderbolt 4 dock. It is triggered by Ethernet traffic through the dock.
> With two displays connected to the dock at boot it happens reliably within
> 1 to 4 minutes; without displays it happens intermittently.
> 
> Hardware:
>    Laptop:   Framework Laptop 13 Pro (Intel Core Ultra Series 3)
>    CPU:      Intel Core Ultra X7 358H, microcode 0x11a
>    BIOS:     03.02 (2026-05-26), ME firmware 21.0.6.1503
>    xHCI:     00:0d.0 Intel Core Ultra (Series 3) Type-C Subsystem xHCI
> [8086:e431] (rev 01)
>    TB host:  Intel Gen16 USB4 host router (8087:a000)
>    Dock:     Razer Thunderbolt 4 Dock Chroma (TB vendor 0x127, device 0x8),
> NVM 30.0
>    Ethernet: RTL8153 (0bda:8153) inside the dock, in-tree r8152 driver
>    Displays: two 2560x1440@60 on the dock's downstream TB4 ports
>              (one USB-C to DisplayPort, one USB-C to HDMI adapter)
> 
> Kernel: 7.3.1 (Ubuntu mainline build 7.3.1-070301-generic)
> 
> Reproduction:
>    1. Boot with the dock and both displays connected.
>    2. Generate network traffic over the dock's Ethernet (e.g. open a
> browser).
>    3. Within about 1 minute the xHCI controller dies, and every USB 3 device
> behind the dock disconnects.
> 
> Log:
>    xhci_hcd 0000:00:0d.0: ERROR Unknown event condition 199 for slot 5 ep 3
> , HC probably busted
>    r8152 2-3.4.5:1.0 eth0: NETDEV WATCHDOG: CPU: 11: transmit queue 0 timed
> out 5665 ms
>    r8152 2-3.4.5:1.0 eth0: Tx timeout
>    r8152 2-3.4.5:1.0 eth0: Tx status -2
>    r8152-cfgselector 2-3.4.5: reset SuperSpeed USB device number 6 using
> xhci_hcd
>    xhci_hcd 0000:00:0d.0: ERROR Unknown event condition 199 for slot 5 ep 3
> , HC probably busted
>    r8152 2-3.4.5:1.0 eth0: Stop submitting intr, status -71
>    xhci_hcd 0000:00:0d.0: xHCI host not responding to stop endpoint command
>    xhci_hcd 0000:00:0d.0: xHCI host controller not responding, assume dead
>    xhci_hcd 0000:00:0d.0: HC died; cleaning up
>    usb 2-3: USB disconnect, device number 3
> 
> Full kernel log attached.
> 

Could you take both xhci traces, and log with xhci and usb core dynamic debug enabled?

Looks like the endpoint or its contexts may be in some odd state
(vendor event for specific endpoint, and failure to stop endpoint)

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

xHC may also refuse to add an endpoints if it doesn't have the bandwidth to handle it.

What do files under /sys/kernel/debug/usb/xhci/0000:00:0d.0/port_bandwidth'
show right after starting network traffic?

Thanks
Mathias

