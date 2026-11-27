Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795757728;
	b=1UMWQE0ThYg0ve3jxBp2YrTSZHvHB3sjm6qGjnXuZKEw1Orc/nfhcTp1DRFGIggEmWEW
	 sLDKwq4H/oiXvb2Pw4BQa2Ou7chJxwriNx54MinWi7aQ2Ey1V1fL9uxlJC+02nGJ8W2QQ
	 nVnHigNV/aey92jzcKQP6qoEmJ2kyKVX8T4h+Kn3WzlKuwPcuM8ryXMTbW5shXNnPJMKf
	 oBv4NJEgr52i58hfAQqMt5gRct8JRcarR/M3i59Rd9lotkno+y1I03Pl3l1aGJctMXapf
	 kOUAf9/Bk7KfpWZhA/uprKE74fDi2rCbRjpv77g1oTY1epruI39MtIstTF7MIAkCcKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795757728;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=Stq4Rm3CYzkRBLWddrkzFHxExqAmf//TeSJw6eyfh9M=;
	b=CmYnQvY8lMsSu1RrI1+iCfnMyXs26KHh+ZxZxpS+9H0TwytAzXLvwuJW1y2mZJLEt14U
	 yUXZkDv+LYMmhJB+oA8AjkSaF26XJh/OXztVtMSwVWQOdK3A6Td+22zBnkdRAAryRt+9q
	 WKHae4ITzSAba155buRT/LW9DiFM6IG1pRvIAhHZ+VA0yCBoHnB0h/Xnx0jHzUPOh5ZrI
	 Ih+kUxrAcaLgzVaHk1PkM5HEHUGE0UxeVw//FQCg1RVeMtSffrq1A0ltki5DdNHanZwCH
	 65BUQKBqIOqdndj0aKQLGso4V30kYz4NcMGswTzezxTKd+Ymu0yzwcbOnak3yTVSLHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUfynnwC;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B455606A31C
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B455606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hUfynnwC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795757727; x=1827293727;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tiPPQmE/XbOA23TgP/uDhlTjHcAqaWMaCydMdI/kNfg=;
  b=hUfynnwCBGFHMrVscJ01P+Kcttubs1w3cAXLK9BHjjlx4VYe2rrbWAAe
   2rLxnE73LPe/5xp+seMVtPZC17/XqT2HV6o/c4v4fobf9s3Knpyyq8rWC
   +GXUJ+XpdyAm6moKZ+X5ZosOQmSiPpsugDQrCi0YEnz7IgRIHSKvOAZML
   7nV8IISOPdUpbVXuLgLzFm6m3LBwciiz94QRgb658FOfeChj69I7Mcm1H
   lUkX626f0w1SjQ0xhQEhOBuENygd4sCAcCFR6/R8Qg9j2CNpdJmhG9pgo
   +HbgH9bZKOPoNcxGfqZ822DdwG2h9MRAjfK62Q2ie17qDhQqKsSNCYAv1
   Q==;
X-CSE-ConnectionGUID: 8F0xzVyKQhWi3dj8DCDhDw==
X-CSE-MsgGUID: vFBnFPisQPm+CCAsM19aXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4571977"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4571977"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 21:35:27 -0800
X-CSE-ConnectionGUID: Sq6xsn4VQ6SiYEtPTh4Ysg==
X-CSE-MsgGUID: 1HwRfWiRSCu2oEkDxm6q8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12463220"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2026 21:35:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 613C198; Fri, 27 Nov 2026 06:35:24 +0100 (CET)
Date: Fri, 27 Nov 2026 06:35:24 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Achim =?utf-8?Q?L=C3=B6bbert?= <aloebbert@gmx.de>
Cc: linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
Subject: Re: [REGRESSION/BUG] thunderbolt: ASM4242 fails to restore DP tunnel
 after resume on Ryzen 8700G (7.4-rc4)
Message-ID: <20261127053524.GC953667@black.igk.intel.com>
References: <UCVQtIkrSxeOKGOgiChTpA@gmx.de>
 <y0Ed3XDFSA-_b1YnGjn2yQ@gmx.de>
 <20261126122715.GA953667@black.igk.intel.com>
 <bnvmvVhIQ2O8wiVp9S1lyw@gmx.de>
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
In-Reply-To: <bnvmvVhIQ2O8wiVp9S1lyw@gmx.de>

Hi,

On Thu, Nov 26, 2026 at 05:59:26PM +0100, Achim Löbbert wrote:
> Hi Mika,
> 
> On Thursday, 26. November 2026 13:27:15 CET Mika Westerberg wrote:
> > Hi,
> > 
> > On Thu, Nov 26, 2026 at 09:53:05AM +0100, Achim Löbbert wrote:
> > > > Can you provide full dmesg without anything non-standard, except
> > > > "thunderbolt.dyndbg=+p" in the command line?
> > > > 
> > > > Once the host router (well any router) is enumerated during resume it is
> > > > expected to send plug events to the DP IN adapters that are available
> > > > for
> > > > tunneling. That does not seem to happen here but it would be good to see
> > > > the full dmesg first.
> > > 
> > > Hi Mika,
> > > 
> > > please find attached full dmesg log with command line changed as
> > > requested.
> > > Still have a black screen after resume, until a manual re-bind of
> > > 0000:71:00.
> > Thanks! I can see that the ASMedia controller does not send plug events to
> > its DP IN adapters at all. My interpretation of the spec is that it should
> > do that but I think we can fix this with something like below. Can you try
> > it?
> > 
> > I haven't tried on Intel hardware yet so if this works for you we should
> > still check for both AMD/Intel that nothing breaks.
> > 
> > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > index 4db25062b5e5..964191a1e0ab 100644
> > --- a/drivers/thunderbolt/tb.c
> > +++ b/drivers/thunderbolt/tb.c
> > @@ -3198,6 +3198,8 @@ static void tb_restore_children(struct tb_switch *sw)
> >  	if (tb_enable_tmu(sw))
> >  		tb_sw_warn(sw, "failed to restore TMU configuration\n");
> > 
> > +	tb_add_dp_resources(sw);
> > +
> >  	tb_switch_configuration_valid(sw);
> > 
> >  	tb_switch_for_each_port(sw, port) {
> 
> thank you for looking into this and sending the patch. The patch failed to 
> apply against 7.4-rc4 (line numbers seem to differ, but it was easy to edit).
> 
> With that change the screen came up within a few seconds after 1st suspend/
> resume cycle after boot, much faster than the workaround using unbind on 
> suspend and rebind on resume where it took randomly between 20-50 seconds, 
> measured after wakeup key press. The unbind/bind workaround is robust, though.
> 
> With your change, on the second and most of the following suspend/resume 
> cycles the screen stays black again, unfortunately. In that state when waiting 
> for a couple of minutes, monitor backlight suddenly turns on by itself w/o any 
> keystroke and when pressing a key at that moment, video signal sometimes is 
> back instantly, sometimes not at all. Pretty sure this was not observed with 
> the unbind/bind workaround.
> 
> New dmesg attached with your change showing 1st successful suspend/resume 
> cycle after boot with video displayed, followed by a couple of resumes ending 
> in just black screens.

From the dmesg you shared, the DP tunnel is up an running (you can also see
that from by running tbtunnels from [1]). Why the graphics driver is not
showing anything is beyond me. Depending on userspace, you may need to
enable the outputs via xrandr.

[1] https://github.com/intel/tbtools
