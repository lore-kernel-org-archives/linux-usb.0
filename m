Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5B3C109A
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 07:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789544335; cv=none; b=uZBGnMoZJ2P35Lhiv0UBNWmaaAinScgf4RiTFHrZaYXkSYRik1FogpF8ycCZC2euNFg/qpdMsoIjj8A0urORClZADbARlmTNZQ7QHq4Z5hT6bqISYH1VW3FOZtd1P/hfmF7ksAkLQva4HQ5aW09hgVhg0ZpR+CKID7gpqoeEIhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789544335; c=relaxed/simple;
	bh=k7OKeulNavXpC2MT+XQZIyDcs9FqfB1VNG9sE9o7R/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxMMCeyZW9FBCta62p+F6fWLroWj5PHl24oZLiUJupNoaSYlXpZqnV4h2XvBZdEn9w7AZmyU/jrerxXhX4oHVSF/WiWsVuQG4w8ZfmLtiMPQMekBqgpcNJB5r6RYUq3T2iVTuU8o1kqD89/ee0Qp/QPykkm/IETucwWcgaWH2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJR1vfVG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJR1vfVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789544327; x=1821080327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k7OKeulNavXpC2MT+XQZIyDcs9FqfB1VNG9sE9o7R/Q=;
  b=UJR1vfVGC4Hd9rxBhAdoAPADAIqL/SJWbsd4fcy4aV1t+ar6d2WS/AZE
   cjVSNMVgB53L2rNeJZqLjtcawUxYsvUg9sdGlLqBcVPFRT7U3frt9Pofd
   auqZf3x3vqjEWwimqedyCtc/7Q1ZuU9c+CRPhrFtGDYPrplnn72wGsj6o
   h3iXeXtUCulY6PnGmTQLAihEIP2HYGto90JKt7OUShISjonkU6R5IC2Ba
   nBZ8rueVbmCPgi1lLZzF0jHahQYclJ8OrEe1s1nWENbwgl96/daqA5a84
   7bUa8tVF9VBDBPcBhWACLkVc/1ToUtRJdttz18VgeYeLGqleP4euXkdpO
   w==;
X-CSE-ConnectionGUID: oQtju5UsS7iWE/bBUXFggw==
X-CSE-MsgGUID: Jl0EQL+NT+SKEosR5yMmxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89671566"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89671566"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 00:38:43 -0700
X-CSE-ConnectionGUID: 7hhPL24XRce8A6b5u58Pbg==
X-CSE-MsgGUID: FXiCAbozTyWSU4TRH2uBjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="277379758"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 16 Sep 2026 00:38:41 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D7B5399; Wed, 16 Sep 2026 09:38:39 +0200 (CEST)
Date: Wed, 16 Sep 2026 09:38:39 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Nils Arnold <ns.arnold@web.de>, linux-usb@vger.kernel.org,
	Sanath.S@amd.com, Basavaraj.Natikar@amd.com, westeri@kernel.org
Subject: Re: AMD Strix Halo USB4: 20/40 Gbit/s negotiation with RJ45 and
 original host-reset patch regression
Message-ID: <20260916073839.GL106095@black.igk.intel.com>
References: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
 <20260915124904.GK106095@black.igk.intel.com>
 <853b62e8-5b07-43d2-be93-bfbd95f55165@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <853b62e8-5b07-43d2-be93-bfbd95f55165@kernel.org>

Hi,

On Tue, Sep 15, 2026 at 03:42:43PM -0500, Mario Limonciello wrote:
> On 9/15/26 07:49, Mika Westerberg wrote:
> > Hi,
> > 
> > On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
> > > Hello Sanath, Mario, Mika and Basavaraj,
> > > 
> > > I would like to add test evidence from two Strix Halo hosts to this
> > > USB4 reset discussion. My reset test used a backport of the ORIGINAL
> > > f1de1fc5f632 commit, not the newer deferred-reset implementation.
> > > I have not tested the revisions discussed on September 15.
> > 
> > Okay the last message on the thread I asked if we should revert the commit
> > for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
> > I understood it seems to solve the issue without the deadlock and killing
> > the whole host interface underneath everybody else.
> 
> FWIW to Nils I left a note on that thread and agree with Mika.
> 
> > 
> > Once we have that patch, you can test and see if that helps in your case
> > too. Now that we know AMD guys can CC you when they submit it.
> 
> One thing I'd like to note though; I would rather that we keep out of tree
> modules out of the conversation on the kernel mailing list when it comes to
> upstream behavior.
> 
> There are multiple ways to do xdomain tunnels in the kernel, and we should
> collectively fixate our time and energy on bugs related to those instead of
> PoC out of tree drivers.

Fully agree. But the same behaviour is with the in-tree Thunderbolt
networking and stream (and maybe DMA test) drivers so those should at least
be working with the AMD controller without wedging.
