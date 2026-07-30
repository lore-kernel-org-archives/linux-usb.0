Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30F39D6F2
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 04:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386912; cv=none; b=hnjb2GlTSaq6GmIACYfbGYdWVV/q+8+mwhfhT4aUL6CDhzOY3UyF4qgBivQ+gbUfqjniv9U95WztWKiGcWrRhLfev7LrIqoQwONCeTZJQIN5plqyuwXA2Pvv7BqzGeHmyQ6BEglFLWmm9bKYzg9bj5VmSM1tVB674OC9syK8KZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386912; c=relaxed/simple;
	bh=Ge2TgakRiHMVcQWyRs7WRkdN6uRjzTKHRvkAYnt/Bl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=You+uOqsRw01ydWYrdU+to1uTvdR1ilNGQGuJYZP5/0nXBS3KSpqSkuAwFJvXuDaJPiYonl+0jToV/4K3CLtPKYXQmRa/reHNvcDFTtj9bMrJdg+d27KoFG6y0CBMDcIMopZNdBeZ0K4jeZd452ifExAGiR4eo/6rIflSRDtRaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jUrWQvGu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jUrWQvGu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785386910; x=1816922910;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ge2TgakRiHMVcQWyRs7WRkdN6uRjzTKHRvkAYnt/Bl0=;
  b=jUrWQvGuwZxxx8aatVkw3m7ub32vVcvJel8bj8vu4NJ3TKEeef7nA4uj
   H/dtzWgwElDp+gIhX3eU6UveBgiECDL5Z37JYYJkqX3gaftvbyjNo3a/C
   0orZYsyvmN536wI0Ysyofq9NKXaZUiRhYL2RyLEuAVcFTuk20Br9s2jVJ
   +qFUyosaVubutKzZgm1kQYkgv2fbzj9kBPaJmud1miJb1o7YMz8OWkOp8
   hHgRiyEybcLR2dAkO1UZ81s9DLX1095IY9fHWiDlwT26KTtAR9sx1xkNw
   GrpPcRcHnH+0Tc5bnrcsVC2Trun4F9/tPQJogqdN3+urD7QAgBm7GjnQZ
   g==;
X-CSE-ConnectionGUID: Gq4Oz2OCT9uBqZB+VL9QiQ==
X-CSE-MsgGUID: /Iy8S7EqR5STfDC86m9siA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86119512"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86119512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:48:29 -0700
X-CSE-ConnectionGUID: kKCCmMVDTbSvppoBUiQlXw==
X-CSE-MsgGUID: XaxxZVNDTHGHLwzBurRavA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="258414795"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2026 21:48:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C628099; Thu, 30 Jul 2026 06:48:26 +0200 (CEST)
Date: Thu, 30 Jul 2026 06:48:26 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Woody Suwalski <terraluna977@gmail.com>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] thunderbolt: Initialize ->domain_released completion
 before it is being used
Message-ID: <20260730044826.GD20844@black.igk.intel.com>
References: <20260728065222.2550284-1-mika.westerberg@linux.intel.com>
 <20260729065554.GA20844@black.igk.intel.com>
 <3d0e3639-87cd-5289-eb1c-40293d8ac9b7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d0e3639-87cd-5289-eb1c-40293d8ac9b7@gmail.com>

On Wed, Jul 29, 2026 at 11:54:45AM -0400, Woody Suwalski wrote:
> Mika Westerberg wrote:
> > On Tue, Jul 28, 2026 at 08:52:22AM +0200, Mika Westerberg wrote:
> > > Both Woody and Marek reported following crash:
> > > 
> > >   BUG: unable to handle page fault for address: fffffffffffffff8
> > >   Call Trace:
> > >    <TASK>
> > >    device_release+0x43/0x90
> > >    kobject_cleanup+0x3c/0x180
> > >    icm_probe+0x19c/0x550 [thunderbolt]
> > >    nhi_probe+0x1a4/0x370 [thunderbolt]
> > >    local_pci_probe+0x41/0x90
> > >    pci_call_probe+0x5b/0x1a0
> > >    ...
> > > 
> > > This only triggers on the error path when icm_probe() fails and the
> > > domain structure is released, it tries to complete() uninitialized
> > > completion.
> > > 
> > > Fix this by initializing the completion earlier.
> > > 
> > > Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > > Closes: https://lore.kernel.org/linux-usb/amdezCBiW4fd_DuB@mail-itl/
> > > Reported-by: Woody Suwalski <terraluna977@gmail.com>
> > > Closes: https://lore.kernel.org/linux-usb/62caf7f8-b403-d0dd-15bc-b31b56f71c28@gmail.com/
> > > Fixes: f5cc545f5969 ("thunderbolt: Wait for tb_domain_release() to complete when driver is removed")
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Applied to thunderbolt.git/fixes.
> The patch seems to work OK. I can see
> |/sys/bus/thunderbolt/devices/domain0/.
> 
> Tested_by: Woody Suwalski <terraluna977@gmail.com>

Thanks for testing! I added your tag to the commit now.
