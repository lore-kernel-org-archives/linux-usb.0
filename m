Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221387;
	b=on22iII1l69nYPNajj7MiTBN0LqLT/nobuqGKUqnrkNtV2P87Eu93uqQM1SfcFgbwlx8
	 l2UUZ6rSONrO5wb1ISO5u6A139MiysUn4puEEq4JgKMktj/d616OtLitzmKYQREsCBp/+
	 XIQz5PGKE46yjUK1DgzE0hbhgknHgaYhg1lfUfk+itnQ8js3S+9aoAaDlL+hfMufbjN10
	 xVTLId3AQ4JJo0NZJyxDdYuRc6QBU1TyG/V9xeHCI5yp765elFLT7Q+iaYalfzkVIrEpb
	 kpTMwpD/AkOS/lsDW7x/GA5aZ95q/K6ib0A7cD7XoNxFU30mKqCCrtiFq6Oc+1BoFeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221387;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=SnsS8aAAaUNdypX6l7bAwgTgel7g/QixvjzyFBNPxn0=;
	b=Pe34jtJGLGrpqVKGt4ZAaVUdUIjosp6q7IFceULIHCEKL401LC7PL5pTXwD4RGsnuKtE
	 SlY4/tgPU5cbWUUQ6bBUHTRmLXGzDpGJGhinvlZm76/8+hL7yuJCXu/RDjJs5+NyLEacl
	 d1aaXvwoVBuxYRoPQMTOlvPv5huOE/xr8rMrWMzDrpyXxUxBwbKn7frDzc5yWAD8VZC2O
	 1jhfPz0IRC5fWpzsKK84QlZfGGeK4pUFdwCJTICdySJgTyiVjhtA6VHu948cTvkzZ02tA
	 5Fp8jtFYWcRAp7232IUy0xG7/761uj1uYfvA6QfS8sWliOmO9uDj8cA2TUG0BVHrfVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aq3n0dx1;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198BE606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 10:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 198BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aq3n0dx1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794221386; x=1825757386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=dmYh+m2G0ma3dZkzHdwNuTXFq/pjRs16AYK4vaw5ups=;
  b=aq3n0dx10FYKRelLPfR+ALVGDI50+8gFzpqxyW9GoCYLQjQ4yT74O0O+
   ZVtEjglcfLi7TKLxilhWVmnwJqcy5pBXHDAkMlQncFomb6Z8oWHjBZ0ia
   euIqRNgDkRbtUas/nvULKc9SgN5HfnpaYqOVBRNOKEY0FeCdEaDITDT+T
   5Rh0EnNCdn4C3xPaFhF+i3Yl/rvD0wCJGmQIuKbCQijrzS8VAwcBm+0Yd
   2v+nHX+mWRoDuzmYw7FVCxEokqROUgVCxbVTs/K6K4ULJdqNGtNVpTPQM
   SFNhkvK4yxsfx/rn0LMLjh/ij5mr0c0LCg12F5pjY6DdGqDMmbrvtcMw1
   g==;
X-CSE-ConnectionGUID: llyfZoOfTq6xXKTgT1vdug==
X-CSE-MsgGUID: LBWDYR3WTyes0iMXjqO4Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2930160"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2930160"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:49:45 -0800
X-CSE-ConnectionGUID: ZIsUqQMXRmiE1SrCeedS0A==
X-CSE-MsgGUID: bx5DKdIaSQe3LinBfyg6SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7873959"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 09 Nov 2026 02:49:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 07AE099; Mon, 09 Nov 2026 11:49:43 +0100 (CET)
Date: Mon, 9 Nov 2026 11:49:43 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alex <rubin@afternet.org>
Cc: westeri@kernel.org, linux-usb@vger.kernel.org,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: thunderbolt: NULL deref in nhi_remove() from pciehp during
 shutdown (Titan Ridge, ThinkPad P1 Gen 3)
Message-ID: <20261109104943.GM176724@black.igk.intel.com>
References: <CADsFipQPdiLag-w56GjdCFgvuUbKhdC4B-2hc9tPUjr31jPiLw@mail.gmail.com>
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
In-Reply-To: <CADsFipQPdiLag-w56GjdCFgvuUbKhdC4B-2hc9tPUjr31jPiLw@mail.gmail.com>

Hi,

On Fri, Nov 06, 2026 at 07:46:16PM -0800, Alex wrote:
> Hi Mika,
> 
> I'm not a kernel developer, so apologies if this isn't the right way to report
> this.
> 
>  My ThinkPad P1 Gen 3 has been hanging instead of turning off
> for most of this year whenever it powers itself off on a low battery.
> I had an AI assistant (Claude Code) dig into it, and it found what
> looks like a double teardown of the Thunderbolt NHI during shutdown.
> The info dump below and a suggested patch are AI-generated, so please treat
> them that way.
> 
> I applied the patch and it fixed the problem, and it looks like from research
> that this issue was called out as a bit of a concern when it was comitted back
> in the day, so thought I would share in case you want to fix it. 
> 
> Thanks,
> -Alex
> 
> ------
> 
> Hardware: ThinkPad P1 Gen 3 (20TH0037US), BIOS N2VET36W (1.21)
> 2021-12-27, Titan Ridge JHL7540 behind root port 00:1c.0 (pciehp,
> HotPlug+ Surprise+). Firmware connection manager. Ubuntu 24.04, kernel
> 6.8.0-138 at the time of this dump. The nvidia and ZFS modules are
> loaded, hence the taint.

Can you try with a newer kernel and see if the problem still happens?
Something like v7.3 would be good. If it does then please provide dump.
