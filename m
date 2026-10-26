Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003422;
	b=wB+Nbz1ZrJPwc03bdU4+9uw5XH6cDSPUvZdOkT6pv/bLi8FsE0Rb+/9Tc+qjxkesO9Tu
	 3YFVIOmLngX99ykipkcXKQQb6+fmWlHd44D5bjKIwpeLZyHSUS5yrF0KlRgHOOp6XnKeR
	 gTkPClIrEFwzEzbvDFdeGgAxjk0LPmeDg2fGsaQ3Xn0zkl86RFeg651EkfXd/eLOLdMvw
	 0e2aakcyvK9wBJ1O6b7rtJcT/fD+675//hWVwa5UalwBgdJZhjo9wv1Rgq4dfVY0KnnTn
	 6TaJuYnWK/YKZQtI1nIhrWHngktez+3ZXqRZWTu1hK1msxiqbazRypcqeJRKCAvwtuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003422;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cauEy1jGuoJ/TXM/AKgN+ULfLBIhdf6kQPKKiLt3h04=;
	b=0YLi/NgPCKqVSfhxUhS9Xq5pMPPM+3MSs6X4DgqiLze8HNffx5a33uE6Y+lzSOaJYhE0
	 8J4Q9uXHj9lcldlPtT/KS36o7aV0a9Gab9TWqvbrENdxC4GWD3R+9RJovvzWt8V+ahCXx
	 wVu006xo+eLXrYYO5ayil1oeV2glxEio0iF5cXVvpGMES8oU69NM6FeQjeKYwchJbIH/b
	 4oaomENJevruhKD5KeqSKRdtuZrOAqF1Yf6Ef8Nf26KIGgv98taSs/Na/JtSgHEMeK+pn
	 8Is7DXpRQ9RQBeIXpRPfMXxnB2g7QanIqOfpSpb/yhG09X7U5dQohCLEJqc4mjDp1/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gcczljmJ;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE3606A916
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 08:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AE3606A916
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gcczljmJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793003421; x=1824539421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cg3AVJAr5HSWOD7wX6M6wq5+Ap915NoxPU0JP0O53Xo=;
  b=gcczljmJdLXJ0ck9xB/jE8GoPd2JV1MfvdrPxWR0aQN+IBPYcYiuwD1p
   KPJrwaYYyDYTIeQw55YZFrEyYrAG6llYB4brINUNyxAsVT4lhsk1GAnr3
   2BQ963Hh3/RwKOx8R35vcmVuN3J5swKe+VdMM94sPl61OZhLHeqE5tKoO
   p58mx0j5GymG6qR0SHrAsS/3FrkUcxSFV/vee7M+VnK5em19ZGVBCLNGx
   4gVi5r6cyxNNa/1oYOpdyDDm+dlu3MzhL95G0zNj7F0QXVm3SzTrX5Kqf
   GD/YM3R8iJKX0z1iE8qcdomXSaIQNd8nycYbScVrfhgNhJDrYHRz3LW2n
   g==;
X-CSE-ConnectionGUID: oqYeEw2tSI+PGJyXaXObLA==
X-CSE-MsgGUID: d5qxg/7mRRqrikBT5TIN0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1688100"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1688100"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 01:30:20 -0700
X-CSE-ConnectionGUID: 3QdZTc4OTkGnoa0ot9OtGQ==
X-CSE-MsgGUID: ZRG/JcuMTAiOS3ALACU0DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4237293"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2026 01:30:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 82B6099; Mon, 26 Oct 2026 09:30:18 +0100 (CET)
Date: Mon, 26 Oct 2026 09:30:18 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Mohammad Fadhil Rasyidin Parinduri <mohfadhilrp@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: typec: ucsi: DP alt mode fails on hotplug on Acer Swift
 SF314-57 (Ice Lake), "failed to register partner alt modes (-5)"
Message-ID: <at8Pmr1Chs4yk8Z7@black.igk.intel.com>
References: <CAATc+wvUT788onrfk-8=xKBY6vnVerxjoj90K9qAL6OSg+2Stg@mail.gmail.com>
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
In-Reply-To: <CAATc+wvUT788onrfk-8=xKBY6vnVerxjoj90K9qAL6OSg+2Stg@mail.gmail.com>

Hi,

Thanks for the report, and sorry to keep you waiting.

On Mon, Oct 05, 2026 at 01:22:07PM +0900, Mohammad Fadhil Rasyidin Parinduri wrote:
> Hi Heikki,
> 
> DisplayPort alternate mode does not come up when I hotplug a USB-C to
> DisplayPort cable into the USB-C port of an Acer Swift SF314-57. Each plug
> event logs "con1: failed to register partner alt modes (-5)", the cable
> enumerates as a USB Billboard device, and the DP connector stays
> disconnected. The monitor wakes and then goes back to standby.
> 
> If the cable is plugged in before power-on, the display works, which I take
> to mean the firmware enters DP mode during boot. After one unplug and
> replug, the display does not come back until the next reboot.
> 
> My setup:
> 
>    - Machine: Acer Swift SF314-57 (board Floris_IL)
>    - CPU: Intel Core i5-1035G1 (Ice Lake)
>    - BIOS/EC: Insyde V1.21, 2021-01-18 (newest version I can find for this
>    model)
>    - UCSI: ucsi_acpi, USBC000:00, Type-C revision 1.3, PD revision 3.0
>    - Kernels: 7.2.3-arch1-3 (stock Arch) and 7.2.5 (Arch-based downstream
>    build). Both behave the same.
>    - Cable: USB-C to DisplayPort cable with a Genesys Logic converter
>    (Billboard device 05e3:0f01). The same cable and monitor work on another
>    USB-C device.
>    - Monitor: Samsung LS27FG53x
> 
> To reproduce:
> 
>    1. Boot with the cable plugged in. The external display works.
>    2. Unplug the cable, wait about 10 seconds, plug it back in.
>    3. The display stays dark and the DP connector reports disconnected.
> 
> Reloading ucsi_acpi (modprobe -r ucsi_acpi && modprobe ucsi_acpi) and
> replugging does not help.
> 
> With ucsi_acpi and typec_ucsi both unloaded, a replug also fails: the
> Billboard device enumerates, no UCSI messages are logged, and DP-1 stays
> disconnected. So the firmware does not enter DP mode on its own after boot,
> even with the OS sending no UCSI commands.
> 
> After a failed hotplug, sysfs shows:
> 
> /sys/class/drm/card2-DP-1/status          disconnected
> /sys/class/typec/port0/port0.0/svid        8087  (active: yes)
> /sys/class/typec/port0-partner/number_of_alternate_modes   1
> /sys/class/typec/port0-partner/port0-partner.0/svid        ff01
> /sys/class/typec/port0-partner/port0-partner.0/active      no
> /sys/class/typec/port0-partner/supports_usb_power_delivery no
> 
> The port lists only the 8087 alternate mode, with no ff01 entry, although
> the platform drives DP over this port at boot. There is no INTC1043 (PMC
> mux) ACPI device, and intel_pmc_mux is not loaded.

The muxes are handled in FW. The UCSI on your system is only an
"optional" status interface. You have no real control over the ports
from the operating system, and as we can see, even the status
information is unreliable.

> Hotplug on 7.2.3-arch1-3, 2026-10-05:
> 
>   usb 3-3: USB disconnect, device number 2
>   usb 3-3: new full-speed USB device number 6 using xhci_hcd
>   ucsi_acpi USBC000:00: unknown error 0
>   ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-5)
>   usb 3-3: not running at top speed; connect to a high speed hub
>   usb 3-3: New USB device found, idVendor=05e3, idProduct=0f01, bcdDevice=
> 1.00
>   usb 3-3: Product: Billboard Device
>   ucsi_acpi USBC000:00: unknown error 0
>   ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-5)
> 
> Boot with the cable connected (display works, same error logged):
> 
>   usb 3-3: New USB device found, idVendor=05e3, idProduct=0f01, bcdDevice=
> 1.00
>   typec port0: bound usb3-port3 (ops connector_ops)
>   typec port0: bound usb2-port1 (ops connector_ops)
>   ucsi_acpi USBC000:00: unknown error 0
>   ucsi_acpi USBC000:00: unknown error 0
>   ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-5)
> 
> Earlier the same day on 7.2.5, the first plug event logged:
> 
>   ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS
> failed (-110)
>   ucsi_acpi USBC000:00: possible UCSI driver bug 1
>   ucsi_acpi USBC000:00: failed to re-enable notifications (-22)
>   ucsi_acpi USBC000:00: unknown error 0
>   ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-5)
> 
> "unknown error 0" also appears once at boot without anything plugged in.
> 
> Is the OS expected to trigger DP mode entry on this platform, and if so,
> through which interface? I can run debug patches, enable dynamic debug for
> typec_ucsi and ucsi_acpi, or dump the ACPI tables if that helps.

The operating system has no control over the alternate modes on this
system. It's all handled in firmware.

Let's make sure that the ucsi drive is not having any effect with this
issue. Please remove the ucsi module completely, and then reproduce
the issue. There should be no difference.

If that's the case then we simply can't do anything from the operating
system to improve the situation unfortunately. The firmware has to be
fixed.

Thanks,

-- 
heikki
