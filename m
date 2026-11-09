Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794239410;
	b=UyKHsooNL0033KpCdlBcyTqd6vqKQP44J/kAhiddbiHnXH0paKEZm2AYmrfq7ogu71tm
	 mat9IOMTeprfhcp6Ji6BW2AThzZKP0h0Nv9OWKBjLamtwbcu3YMb/jXb5PIHQWsH6pc0Q
	 CEwMAH5fuFSxjKaZsuO1kfokGx/JhywRwMF7/+MaB1bCrYzWjbpH8RDm8T8EaM9NyBVRv
	 5IVw5Za7Fos6r0iMrtuPavANiOVnQk/GHPZ65pqa8wXSNYVg4puL7EtumG1pY/UausoBY
	 MZKIAt88PxaEw+Rs+bERxJNn3/WcQ6uHlZ5IppEAC+4kmtrr/Qd3IxTWFtA+UAXzwmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239410;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=83vGVTAc/ZH81XS8vndiLAU18fHWaMHmXA7A3pxvB10=;
	b=yKCHs/w/edgHwwM4KmXYpvCIjoczmDxGBo8jShRR53pH9cjS4drB+HhBvyVChVKA0Cis
	 EYZohyWnwX/xwqJ0JiBMJgSyYkf7Az+UmVHec1Y8YRPRJ44fRa3o5o3PP1RjG8xEEHXcI
	 lt4u+XLgHbx9nqfXlUU7FduGGBRjk3DYP45gAExiCampMudtLN1KwcMJ1rws4fw00C8pO
	 6MvNjKb19QS1T8xSmi9aL2rkuRqqNx7n1aOk9Vu03sNlucoTvzNghroqKPkfoyWImJOKQ
	 R99cem02MyNiyd7MOzKADXWG3Wy3qknzgyPugInmC8bOLaGyHy8EI07jIvwakWvdVmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqUhiktI;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD29606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD29606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cqUhiktI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794239410; x=1825775410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n7yOQt2gk6kH3F9dC7Dy4Qayp79BK+3L87JeNPePtYo=;
  b=cqUhiktIh4254sGwp8ujXZe7xXUYdAEkLSVCMAUXq2Wzd4m8EEtm7WiS
   zgVAL4h58SU0t+m7FLaYSn/tldj2GV3S1pLJ392vj+0ipTPXPTbNK97yp
   ZsUaegW8RBPimHQCFfZB130dCmb4dEtRUf8vJ200cxooqXz0+yKw/e3ei
   dO+bsJIqwJ6YQ7TrxkiuXLTOngthjR25lhFBqxEydIrikQM5oTomxQOPQ
   jHprr7KSE+g6q8zSvmyzAcD+UPxDbaefWJrCeXLb4W0B3NAfRrmwhKHy0
   pnS9WdGl7MQn87z4t3+5WcPFVuIKYFnEC9bUciAALk/ssgVXXY1Z+Y4n4
   Q==;
X-CSE-ConnectionGUID: PrH2qXajSSm+0KW9If/HEA==
X-CSE-MsgGUID: YqRkvUgMSzGj4A7Qy5GG7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065724"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3065724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 07:50:10 -0800
X-CSE-ConnectionGUID: QSwHNJr1Q/ufyyRRvEZnoA==
X-CSE-MsgGUID: NRmdUakEQWKk657fcwh5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8062224"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2026 07:50:08 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5C61899; Mon, 09 Nov 2026 16:50:07 +0100 (CET)
Date: Mon, 9 Nov 2026 16:50:07 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: James R Taylor <jrtaylor11@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sanath S <Sanath.S@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: Re: thunderbolt: AMD Phoenix USB4 host advertises Gen3 Support=0 in
 SB LINK_CONF with TB5 device, link stuck at Gen2
Message-ID: <20261109155007.GV176724@black.igk.intel.com>
References: <1794143745.17311.hermes@gmail.com>
 <20261109111852.GQ176724@black.igk.intel.com>
 <1794223545.366398.reply.hermes@gmail.com>
 <20261109142041.GS176724@black.igk.intel.com>
 <1794235167.3657.reply.hermes@gmail.com>
 <20261109153955.GU176724@black.igk.intel.com>
 <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>
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
In-Reply-To: <6af1e999.9efe04cf.8f35d.ae23@mx.google.com>

Hi,

On Mon, Nov 09, 2026 at 07:41:13AM -0800, James R Taylor wrote:
> Hi Mika,
> 
> On Mon, Nov 09, 2026 at 04:39:55PM +0100, Mika Westerberg wrote:
> > We could still look at the PORT_CS_18 but the driver log already tells that
> > it is in TBT3 mode. What kind of cable you are using? Is it short TB4/5
> > cable or something else?
> 
> It is a short Thunderbolt 5 cable: StarTech TBLT5MM50CM240W, 0.5 m.

Okay so definitely it should enter USB4 mode.

> One retimer enumerates on the link, 1-0:2.1 (vendor 0x7fea, device
> 0x1032, "retimer NVM format of vendor 0x7fea unknown"), and it goes
> away when the dock is unplugged. I haven't been able to tell from
> Linux whether it sits in the cable or on the DEG2 board.

That's the host side retimer.

> In case it is useful, here is PORT_CS_18 from both ends, read just now
> (same boot as my last mail):
> 
>     $ tbdump -d 1 -r 0 -vv -a 2 -N 1 PORT_CS_18
>     0x00d2 0x00002f00 0b00000000 00000000 00101111 00000000 ../. PORT_CS_18
>       [00:07]        0x0 Cable USB4 Version
>       [08:08]        0x1 Bonding Enabled (BE)
>       [09:09]        0x1 TBT3-Compatible Mode (TCM)
>       [10:10]        0x1 CLx Protocol Support (CPS)
>       [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
>       [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
>       [13:13]        0x1 Router Detected (RD)
>       [20:20]        0x0 Cable Gen 3 Support (CG3)
>       [21:21]        0x0 Cable Gen 4 Support (CG4)
>       [22:22]        0x0 Cable Asymmetric Support (CSA)
>       [23:23]        0x0 Cable CLx Support (CSC)
> 
>     $ tbdump -d 1 -r 2 -vv -a 1 -N 1 PORT_CS_18
>     0x00d2 0x00902f01 0b00000000 10010000 00101111 00000001 ../. PORT_CS_18
>       [00:07]        0x1 Cable USB4 Version
>       [08:08]        0x1 Bonding Enabled (BE)
>       [09:09]        0x1 TBT3-Compatible Mode (TCM)
>       [10:10]        0x1 CLx Protocol Support (CPS)
>       [11:11]        0x1 RS-FEC Enabled (Gen 2) (RE2)
>       [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
>       [13:13]        0x1 Router Detected (RD)
>       [20:20]        0x1 Cable Gen 3 Support (CG3)
>       [21:21]        0x0 Cable Gen 4 Support (CG4)
>       [22:22]        0x0 Cable Asymmetric Support (CSA)
>       [23:23]        0x1 Cable CLx Support (CSC)
> 
> (The wake status bits and TIP, 16-19 and 24, are 0 on both sides.)
> 
> So both ends are in TBT3-compatible mode, but the host side reports
> Cable USB4 Version 0 and Cable Gen 3 Support 0, while the DEG2 side
> reports Cable USB4 Version 1 and Cable Gen 3 Support 1 for the same
> cable.

Agree it looks like the AMD host only gets the link up Gen2 for some
reason. It could be retimer/PD firmware issue. Anyways I'm adding the AMD
experts if they have any ideas.
