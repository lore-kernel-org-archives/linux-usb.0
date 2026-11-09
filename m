Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238799;
	b=m49YwS68b1GYCfJn7Sb2O22LEnD6etmkjG9O1WHHwkoXsBFe7tNpTMW8zWvv4wZNlqPY
	 QT7yjt8DORt1LRpZuqX/7lm0LOPlTu6A01DdPw3WAizZIaREqFZCKC38FepxZyb/D8Lau
	 9+xHG/wi5UuWuGQW5SDCIbItfRJnNejlQMKhEuSG+lW6ico89QN2VA2RLpFujhlXINVAA
	 rj3r0whF6Pl4WjUbdIVYhZIMYDNqscjb9XfM8sei2voW8vzqUWUPw3wpb8i5AFX6GMtAf
	 aaJDLlE0HIRm8VvUcfzMyuQHPGobN2tKbDSdTYkqufAjMj8oynLfnVB23kRXwIA6+gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238799;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=NeKZG6TM7rVi4pdyKEpuypvjGtaKNi67bdmRxliWAU0=;
	b=3JCbLiiSXSWV+R5KRbp9Ri1UvzmiKWvtNRTUPFFOmLB59kEHO7kgOyzFuieGJBlsPCDQ
	 SpEm2q9ORTvsFr2iehN8eFnb5Vk0TiNFQSeeO0xqA332wNqVKFTFEF3ipoAjs27nlji2O
	 ox2vnU4IyWMER8F4ax7mqaYA6YB+IildhD2dKubclnm2WI7z1JuIu4uaVCS+JICuGeVfq
	 Dxd9YyVq3JIqpV1SyWggWOzQLXNf7XamTkJGs6H3uROjSDhT36QcDvXhgUyAMBcor8M79
	 WeyytCch2bbUlNFxR5GtOiBaFMo5YqwjjjWGwQuLSXfHTQHsZJ0ldBtUMSqGme9XuuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHhicCdU;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A353606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A353606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mHhicCdU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794238799; x=1825774799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=SfGiBQFBf2FXFWW/N0jORkJoCbWdCN2nwEvotnPL7CE=;
  b=mHhicCdUttB0E8GLOoOmbrPdYPbp1fvqPa2/GGMr2b/0cVaKDCnau6S6
   APe30oCEZ+7ynoqxk+YejC3TtmN4ACHvi5FTesG9DEB3d9BM/zh5vt1Pk
   WZHE8Z1kJlJGMnOdqxCmslqJvDvHQbc6FK08fHGVVLEyknsLs+IZxufRn
   w6aa6LAK6IgwxAvzUQXgSU2PHrrspsY60Sq4HpzD2mzOAcGQER4AEo+MS
   jdgvdj2/ve7ojHtwpcVYHJccFc5y1xLsgaXKaNlT5iyagRiSOqAK6j2wt
   ZQNLSk2SzgAaI7JN3qPdxiUgNqfVdf+bLvmVYLcToRtlTCCpy2fnofFdu
   g==;
X-CSE-ConnectionGUID: AkXfVqQ3Sh2rRnuOFtC/QQ==
X-CSE-MsgGUID: YoQroBcZRwaXtxsKUNL+1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2951227"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2951227"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 07:39:58 -0800
X-CSE-ConnectionGUID: fcX+L6FLRKGw5SX4zGompA==
X-CSE-MsgGUID: JISWnTVvTTiYtyMEC+HL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8033008"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 09 Nov 2026 07:39:56 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3F0EE99; Mon, 09 Nov 2026 16:39:55 +0100 (CET)
Date: Mon, 9 Nov 2026 16:39:55 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: James R Taylor <jrtaylor11@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
Message-ID: <20261109153955.GU176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
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
In-Reply-To: <1794235167.3657.reply.hermes@gmail.com>

Hi,

On Mon, Nov 09, 2026 at 02:39:27PM +0000, James R Taylor wrote:
> Hi Mika,
> 
> On Mon, Nov 09, 2026 at 03:20:41PM +0100, Mika Westerberg wrote:
> > Please drop thunderbolt.host_reset=0 and pcie_aspm=off. The later disables
> > much more than just ASPM so it may affect everything. Once you have done
> > that please take another dmesg (and check also the link registers via
> > tbdump).
> 
> Done. I rebooted with both parameters removed. The only addition is
> thunderbolt.dyndbg=+p so the full debug output is in the log:
> 
>   nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf usb-storage.quirks=0bc2:3343:u thunderbolt.dyndbg=+p
> 
> The result is the same as before: the link still comes up as TBT at
> 10 Gb/s x2 (the dmesg has "2: link: TBT" and "current link speed
> 10.0 Gb/s"), and the lane adapter registers are identical to my
> previous dump. The host lane adapter targets Gen 3, the DEG2 targets
> Gen 4, and both report Current Link Speed = Gen 2, x2.
> 
> The full dmesg from this boot is attached (gzipped). The tbdump output
> is below.
> 
>     # cmdline: initrd=\EFI\nixos\c18phgd1m2qpc2g72pz14fg9h9i38j6w-initrd-linux-7.2.15-initrd.efi init=/nix/store/x1jyvpbgdhl6a91iysmbr5wisgi0sghd-nixos-system-nyx-26.11.20261106.4fe25e1/init usb-storage.quirks=0bc2:3343:u nohibernate root=fstab loglevel=4 lsm=landlock,yama,bpf thunderbolt.dyndbg=+p

Yeah now this is better :)

>     # 1-2 rx=10.0 Gb/s x2 tx=10.0 Gb/s x2
>     # usb4_port link: none tbt tbt none none none
> 
>     $ tbdump -d 1 -r 0 -a 2 -N 2 -vv LANE_ADP_CS_0
>     0x0080 0x003c01c0 0b00000000 00111100 00000001 11000000 .<.. LANE_ADP_CS_0
>       [00:07]       0xc0 Next Capability Pointer
>       [08:15]        0x1 Capability ID
>       [16:19]        0xc Supported Link Speeds
>       [20:21]        0x3 Supported Link Widths (SLW)
>       [22:23]        0x0 Gen 4 Asymmetric Support (G4AS)
>       [26:26]        0x0 CL0s Support
>       [27:27]        0x0 CL1 Support
>       [28:28]        0x0 CL2 Support
>     0x0081 0x4828003c 0b01001000 00101000 00000000 00111100 H(.< LANE_ADP_CS_1
>       [00:03]        0xc Target Link Speed → Router shall attempt Gen 3 speed
>       [04:05]        0x3 Target Link Width → Establish a Symmetric Link
>       [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
>       [10:10]        0x0 CL0s Enable
>       [11:11]        0x0 CL1 Enable
>       [12:12]        0x0 CL2 Enable
>       [14:14]        0x0 Lane Disable (LD)
>       [15:15]        0x0 Lane Bonding (LB)
>       [16:19]        0x8 Current Link Speed → Gen 2
>       [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
>       [26:29]        0x2 Adapter State → CL0
>       [30:30]        0x1 PM Secondary (PMS)
> 
>     $ tbdump -d 1 -r 2 -a 1 -N 2 -vv LANE_ADP_CS_0
>     0x0036 0x0cfe01c0 0b00001100 11111110 00000001 11000000 .... LANE_ADP_CS_0
>       [00:07]       0xc0 Next Capability Pointer
>       [08:15]        0x1 Capability ID
>       [16:19]        0xe Supported Link Speeds
>       [20:21]        0x3 Supported Link Widths (SLW)
>       [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)
>       [26:26]        0x1 CL0s Support
>       [27:27]        0x1 CL1 Support
>       [28:28]        0x0 CL2 Support
>     0x0037 0x4828003e 0b01001000 00101000 00000000 00111110 H(.> LANE_ADP_CS_1
>       [00:03]        0xe Target Link Speed → Router shall attempt Gen 4 speed
>       [04:05]        0x3 Target Link Width → Establish a Symmetric Link
>       [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
>       [10:10]        0x0 CL0s Enable
>       [11:11]        0x0 CL1 Enable
>       [12:12]        0x0 CL2 Enable
>       [14:14]        0x0 Lane Disable (LD)
>       [15:15]        0x0 Lane Bonding (LB)
>       [16:19]        0x8 Current Link Speed → Gen 2
>       [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
>       [26:29]        0x2 Adapter State → CL0
>       [30:30]        0x1 PM Secondary (PMS)
> 
>     $ tbdump -d 1 -r 2 -a 2 -N 2 -vv LANE_ADP_CS_0
>     0x0036 0x0cfe0100 0b00001100 11111110 00000001 00000000 .... LANE_ADP_CS_0
>       [00:07]        0x0 Next Capability Pointer
>       [08:15]        0x1 Capability ID
>       [16:19]        0xe Supported Link Speeds
>       [20:21]        0x3 Supported Link Widths (SLW)
>       [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)
>       [26:26]        0x1 CL0s Support
>       [27:27]        0x1 CL1 Support
>       [28:28]        0x0 CL2 Support
>     0x0037 0x4828003e 0b01001000 00101000 00000000 00111110 H(.> LANE_ADP_CS_1
>       [00:03]        0xe Target Link Speed → Router shall attempt Gen 4 speed
>       [04:05]        0x3 Target Link Width → Establish a Symmetric Link
>       [06:07]        0x0 Target Asymmetric Link → Establish Symmetric Link
>       [10:10]        0x0 CL0s Enable
>       [11:11]        0x0 CL1 Enable
>       [12:12]        0x0 CL2 Enable
>       [14:14]        0x0 Lane Disable (LD)
>       [15:15]        0x0 Lane Bonding (LB)
>       [16:19]        0x8 Current Link Speed → Gen 2
>       [20:25]        0x2 Negotiated Link Width → Symmetric Link (x2)
>       [26:29]        0x2 Adapter State → CL0
>       [30:30]        0x1 PM Secondary (PMS)

We could still look at the PORT_CS_18 but the driver log already tells that
it is in TBT3 mode. What kind of cable you are using? Is it short TB4/5
cable or something else?
