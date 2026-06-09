Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B776391840
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780999533; cv=none; b=qzgBobc/DJjnRKmycggqyx6lSGdS4r0tskNVqS76n69Q6xlr5I7GxCP/kKHQfs50EeIPFWiLv584JN7/9seGcekgmk8p05IVjS22IiAd4fasF+IL8PRpeIib5cDoTYpRpZKtHZWDdssa7wySX/4k6cYEXqUl1+sN1BSYT3h2+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780999533; c=relaxed/simple;
	bh=lsMtRqF/se5f4jwiNHGoHWjGAKyT7vyjsBgOk1ipL2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T28n5LQ2btYGpXZN9+NPR+a7S65jYe84ZELRdqB7JarjYY3BzH5fts/sID5R9jtiy5aQyQnDht1udqsRxuaLMDMN48Kl32rlqDlQoVwjle5W7MyUraIo5LDX0fEgBD+rMjCyK8S5ASZ1yPcguBRWAKTFzloN3S+ddXHFHWsWjRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhGXddpk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhGXddpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780999533; x=1812535533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lsMtRqF/se5f4jwiNHGoHWjGAKyT7vyjsBgOk1ipL2s=;
  b=NhGXddpkbUlcFf63tbi6GB4eGRMMj40HaXPU2wDEBVkMXj89CwA4fDdD
   dJE2jCqgIakkbiMcNrXJZmAcrQCLLU0NvEZItP+RyeeoK6CkdNSTYoSXB
   qUwlgmrv//yschB1c+V8oIpsAdIYTbfXxdVygIr5jw5zK6IjxllyG0DPM
   +FKjjLEH+dggDJRdixWhRtxOa5aEFKC8CkkMk3TYF1GbxeVgx6DJm+0WT
   w63N9g09DG2S1Y+rlRivSQJDnSFvbaaaszJ9tk6KJt9/jCEkizOwHm+2C
   bxLLmbQWyEit6XUqdtFaQIFOPWf/FrVQARjqbMlMeYLU6YZrGZ6YM1r/I
   w==;
X-CSE-ConnectionGUID: IaywxTa/QvWpZbnhghQ/9Q==
X-CSE-MsgGUID: BZvAKvVpR7CHOldADhKIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="104419707"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="104419707"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 03:05:32 -0700
X-CSE-ConnectionGUID: ncTDgsAETrK3HQWYS41RCA==
X-CSE-MsgGUID: J35ZKkFXTV6eToSw7+05nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="250105552"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 09 Jun 2026 03:05:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9FCF895; Tue, 09 Jun 2026 12:05:28 +0200 (CEST)
Date: Tue, 9 Jun 2026 12:05:28 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <bnatikar@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260609100528.GM2990@black.igk.intel.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
 <20260604050326.GH2990@black.igk.intel.com>
 <d80346d3-692a-4982-859e-5321c4ec022f@amd.com>
 <20260608064020.GJ2990@black.igk.intel.com>
 <a7f333a2-d594-4e1e-9cc5-265aeda8e5a6@amd.com>
 <20260608152201.GL2990@black.igk.intel.com>
 <9010e24a-afa0-4ede-bde9-90299f062dbf@amd.com>
 <0e482be6-3b60-4322-8554-53c48a2aa629@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e482be6-3b60-4322-8554-53c48a2aa629@amd.com>

On Tue, Jun 09, 2026 at 01:25:55AM -0500, Basavaraj Natikar wrote:
> 
> On 6/8/2026 10:25 AM, Mario Limonciello wrote:
> > > > 
> > > > I guess I see two approaches.
> > > > 
> > > > 1) Move to shutdown only (your suggestion).
> > > > 
> > > > Corner case of user who unloads before shutdown means they could
> > > > be exposed
> > > > to this.
> > > > 
> > > > 2) Link the DPR behavior to host_reset module behavior.
> > > > 
> > > > IE If a user set host_reset=0 avoid host reset on module load
> > > > and avoid DPR
> > > > on module unload/shutdown.
> > > > 
> > > > If user kept host_reset=1 then do DPR on unload.
> > > > 
> > > > Always do on shutdown (regardless of host_reset value).
> > > > 
> > > > What do you think of #2?
> > > 
> > > That sounds better. Also we could restrict this more for links that
> > > are TB3
> > > e.g no need to do for USB4, assuming that is simple to do.
> > 
> > OK thanks.  Basavaraj, thoughts?
> > 
> > The way that this was found was by looking at the traces of what Windows
> > and Linux were doing differently at shutdown.
> > 
> > Maybe before we make a decision to tie it only to TBT3 we should double
> > check if Windows was also doing the DPR for USB4 too.
> 
> So the traces confirm Windows only asserts DPR for TB3 and not for USB4
> docks, which matches what Mika suggested. For v2 I will restrict the
> reset to legacy TB3 devices (skip USB4 routers) and fold in the
> host_reset changes (the second approach).

Sounds good to me.
