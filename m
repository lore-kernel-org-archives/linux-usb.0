Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158726;
	b=VrKTa8NQ+lqbayFCB6Ye/OHUbfg3FMeeMRO9n7ub8KehCJrKaTfyPgohYshf6mTO0rjr
	 CBslqbfpLnONyhvfgr2bo/HbeI/Fmosu7t/7870k+UMMg/ozMOYKS4PZFAygIrzaUJy+9
	 kufQqcnGR7FV+kz1EeYJ6S3oWKVyvrI6yTpcBzmCqsZII991nPRLZ8WmHzMYflp+RtdS4
	 FoCBdG+ekdUtyAGeEYVN89UAi8D+G+ZPQkWxl1nJ6wg7mnCEQGs6C1r7f3E/pbXJ5f6X8
	 ixmAbFgohAmHk9TTI4uqHGjAlXiNoZZtTBmZfYqVnk9c6vY/xKtZRjg0VMryoVwinBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158726;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=gi0jzvXY1YB0X/lfluYyMQJKw+vpp1xzqtN3oqtHtmY=;
	b=KSCXHMYNeEP3buEGVlu1MySIJa6ocPQbzZJ5t4mkiKEcnuzZ2vsn9j3CERXQ5eSF/ygt
	 e8myc5gBBkvqdpZ5U7+3N5jwa7gIYjLWxWuHLYRM+ICui5wINosBn03Pa5crzV7lJMD29
	 al01jKMbqbywF3dG7bze6QuObNu3IZtdTTs3a1bhN4LG2iRvKTiwBczbUg/gnl2sYQ4rU
	 2Kmbmz8paZq8MX9HlST3Rkmf1BRlob4Qw1Gi4NgMAENNwVEZLIFseClBffbUWvdiMnB4s
	 ZWpl20Jt/IXGWz62vb7V2VDMUbL2gWK1+Q0FPQUT01r5btBE/BOiaZ9q8LoPYs2lJ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAls2UzB;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C32606A320
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 07:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C32606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DAls2UzB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795158725; x=1826694725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=c8g28YtYVEIK5h8KygqQsee6taLhyOs1rE4xFdFGoMA=;
  b=DAls2UzB9y9otQg/pWdd9mCqxtprqlORgGoqU1d3vriWUNpXDznf7Cm4
   lItbctUHDzhwr59Y1Tw0TBpI8q7+mTHw/sT3xH4WZ2Oy12KtMWIJHL0Y8
   UES+5+GeoRke3Zo3tqdgHndmyXKvQyDziZTO9W3vkKz3Dk/Jt0W6VlbvI
   zSYlbTyOh7IZh2oEDXCSPLqrdZ2D5c643rAHytjqWafn9WWiW0EMNh7yy
   zlXg5/RasYW5QFXQCghqUMfiWgaBFWuHadhtGoqdNF2ohOwOzhfpBXDlN
   U7C0F3WKQm0RDN7H6bBK92eX6otELSApwKZwbdIyW3H0LsNFrbDSqqAfk
   g==;
X-CSE-ConnectionGUID: MO0nGlG2TfySX47qYPzGpQ==
X-CSE-MsgGUID: cIq3QY7jQ+680LkwMMo9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4065202"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4065202"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:12:04 -0800
X-CSE-ConnectionGUID: /T/7Ly4bQXKfAYNAHjNr7Q==
X-CSE-MsgGUID: SCdbB/DySmOXkSR6IQZphg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10624333"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2026 23:12:03 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 53A3599; Fri, 20 Nov 2026 08:12:02 +0100 (CET)
Date: Fri, 20 Nov 2026 08:12:02 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Phani Kumar <phanigudipally@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org
Subject: Re: [WARNING: UNSCANNABLE =?utf-8?Q?EXTRAC?=
 =?utf-8?Q?TION_FAILED=5DRe=3A_xhci=5Fhcd_0000=3A00=3A0d=2E0_=28Panther_La?=
 =?utf-8?Q?ke=2C_8086=3Ae431=29=3A_=E2=80=9CUnknown_event_condition_199?=
 =?utf-8?B?4oCdLA==?= then HC died, with a TB4 dock and two displays
Message-ID: <20261120071202.GH229695@black.igk.intel.com>
References: <CAMcR36+hWzhS_Pytej3uoDvOU6160v5vtuWXSnyFb=zEoRFQJQ@mail.gmail.com>
 <d15451e1-b89f-4db3-95a8-21b188cd0030@linux.intel.com>
 <CAMcR36LCr0RFrHsLFPaPziPS=1CMbEnO3GcDk=3Oe33S8uZFpw@mail.gmail.com>
 <78b30387-f71d-4e6d-b49c-aea1f8fbc98b@linux.intel.com>
 <CAMcR36KcP7cMZ2D1pu_bC-R0uPn2chd_1jEzp4FBBq-jZz=D3A@mail.gmail.com>
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
In-Reply-To: <CAMcR36KcP7cMZ2D1pu_bC-R0uPn2chd_1jEzp4FBBq-jZz=D3A@mail.gmail.com>

Hi,

On Thu, Nov 19, 2026 at 11:35:28AM -0800, Phani Kumar wrote:
> Hey,
> 
> Thanks for the reply. I did a few more tests to figure out this
> problem, and below is what I found.
> 
> Summary: the failure only happens on Linux when the USB4 link to the
> dock runs at Gen 3 (2 x 20 Gb/s). At Gen 2 (20 Gbps cable) Linux is
> stable. Windows 11 on the same laptop is stable at both Gen 2 and
> Gen 3, under the same load, with no USB/USB4/network errors logged.
> When it fails on Linux, the tunneled USB 3 link is stuck in Recovery
> at both USB 3 adapters while all tunnels stay up and the thunderbolt
> driver logs nothing.
> 
> == Hub 2-3 port 2 ==
> 
> Nothing USB 3 is enumerated behind 2-3 port 2 in my setup. In all
> these tests the displays are connected to the dock's downstream USB-C
> ports with video-only cables (one USB-C to HDMI, one USB-C to
> DisplayPort). Unplugging doesn't help: with no displays and only a
> USB 3 thumb drive on the dock, the failure still happens. In the
> latest run (7.4-rc3, usbcore.dyndbg=+p, both displays connected) I see
> no 2-x-portN warm reset messages before the failure, so the port 2
> resets do not seem to be required for it.
> 
> == Test matrix ==
> 
> Same laptop (Framework Laptop 13 Pro, Core Ultra X7 358H, BIOS 03.02),
> same Razer TB4 Dock (NVM 30.0), same displays (2560x1440@60 and @75).
> Dock always links in USB4 mode (sysfs generation 4).
> 
>   Cable                  Link                 Linux     Windows 11
>   TB4 cable x3           Gen 3, 2 x 20 Gb/s   fails     stable
>   USB4 40Gbps cable      Gen 3, 2 x 20 Gb/s   fails     stable
>   USB4 20Gbps cable x2   Gen 2, 2 x 10 Gb/s   stable    stable
> 
> Linux: kernels 7.3.3 and 7.4-rc3, every laptop port. Any USB 3 device
> behind the dock triggers it (RTL8153 or a thumb drive). When the xHC
> dies, USB 3 on all of the laptop's own ports goes down too; removing
> and rescanning 0000:00:0d.0 restores it.
> 
> Windows stress test (TB4 cable, "40Gbps/40Gbps (Gen 3, dual lane)",
> dock connected at boot, both displays): 20 GB download through the
> dock's RTL8153 at ~800 Mbps, USB 3 thumb drive on the dock at 146 MB/s
> read and 45-68 MB/s write, and both at the same time. No drops. The
> System event log has no USB, USB4, xHCI or network errors, only two
> "monitor ... successfully enumerated by the USB4 Connection Manager"
> entries at boot.
> 
> Control test without USB4: the USB-C monitor's hub (0bda:0412 +
> RTL8153) connected directly to the laptop as native USB 3 at 5 Gbps,
> same xHC: stable under heavy Ethernet traffic.
> 
> == USB 3 adapters stuck in Recovery ==
> 
> USB4 register snapshots (debugfs regs, tbadapters, tbtunnels) at
> Gen 2, at Gen 3 before the failure, and at Gen 3 after it
> (usb4-snapshots.tar.xz, including diff-report.txt):
> 
>   tbadapters            Gen 3 before    Gen 3 after failure
>   host 0:12 USB3 Down       U0              Recovery
>   dock 1:16 USB3 Up         U0              Recovery
>   tbtunnels: identical before and after, all tunnels present
> 
> Timeline (7.4-rc3): transfer errors at 70.3 s, event 199 for slot 8
> ep 3 at 78.0 s, "HC died" at 88.7 s. With thunderbolt.dyndbg=+p the
> thunderbolt driver logged nothing between 44 s and 138 s (no hotplug,
> notifications or link events). Vendor-specific registers on both USB 3
> adapters jump across the failure (e.g. 0x00000909 -> 0x0000b6b6 /
> 0x0011bcbc), and lane adapter cap 0x01 dword 2 goes from 0x7/0x3 to
> 0x0 on both ends.
> 
> == Lane margining ==
> 
> thunderbolt.ko rebuilt for 7.4-rc3 with USB4_DEBUGFS_WRITE and
> MARGINING, 3 runs per rate, raw debugfs results included
> (margining.tar.xz):
> 
>   Receiver                     Gen 2                  Gen 3
>   dock 1:1 voltage low/high    ~207/197 mV (at max)   ~77/75 mV
>   dock 1:1 lane 1 time (raw)   354-370 mUI            241-290 mUI
>   host retimer 1-0:1.1 time    387-403 mUI            370-403 mUI
>   host retimer voltage         (not readable)         ~107-121 mV
>   host router port 1 (SW)      0 errors               0 errors
> 
> So every receiver has margin at Gen 3, but the laptop -> dock
> direction (dock receiver) has noticeably less than dock -> laptop.
> Host retimer 8087:0d9c NVM 28.02 (fwupd), no newer firmware offered;
> BIOS 03.02 is the latest.
> 
> == Ruled out ==
> 
> - Bandwidth: USB 3 tunnel gets 9003/9003 Mb/s at Gen 3 (fails) but
>   only 9003/4751 Mb/s at Gen 2 (stable). xHCI port_bandwidth SS_BW is
>   ~90% available at both.
> - Thunderbolt 3 compatibility mode: both rates link as USB4
>   (generation 4).
> - thunderbolt.clx=0, bw_alloc_mode=0, pcie_aspm=off, runtime PM off on
>   0d.0/.2/.3, LPM/autosuspend off on the RTL8153, Realtek's r8152
>   v2.22.1: no effect. host_reset=Y.
> 
> == Questions ==
> 
> 1. Since Windows' CM keeps the Gen 3 link and the USB 3 tunnel clean on
>    the same hardware, what could Linux be configuring differently at
>    Gen 3 (TMU mode, lane/retimer equalization, USB 3 adapter setup)?

Windows CM should follow the CM guide as does Linux. USB3 tunnels are the
same regardless of the Gen, except that the isoc bandwidth limit is put
lower in case of Gen2.

> 2. Are ~75 mV / ~0.26 UI at the dock's receiver typical for Gen 3?

It's a good question. The hardware margin has bit set when these exceed the
ranges and in your case they are not set, also the host direction you don't
see errors so I would say this is okay.

> 3. Should r8152 back off after -EPROTO instead of resubmitting
>    immediately? That seems to be what pushes the xHC over in case 1.

For this I hope Mathias has an answer :)
