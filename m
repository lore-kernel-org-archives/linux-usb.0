Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287EE352025;
	Thu, 13 Aug 2026 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612505; cv=none; b=rLgt8Xv4M2c5fi9bTBMG7hLoGEEysS5q6SGgsn/xuSAZx5fwdSSZlgPn2S6BH1RYD3FNxNE5nDj4LszkyfcuQuHpLWzRFlFdB4AP6Ti6NKDrpKhEiXFU1eZwydZ6V6SLv4QAlb1t+um500EGeLwp/UEO0Lbg8TsogrP43UiWpZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612505; c=relaxed/simple;
	bh=w3C3J7IGWagmh0zTKd1Td+aVnV4SHUDYBfvg5ftX/qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltDEOZ3s27Y/NjazUu9IiPFsJkqa6ra6xK5bInW8ED9naJrX4hDgjMjseylVweLJbzG8jR2DqnRGmReHz+y9WWlCVJtP46sKSf2d0JuSHFSlRyGyvQgxcUtSXYQ6EmLaNuaOZpM3VG1MBKfT6v3hYMDObRLVPx43NIy8z29RHWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eUmSwNXQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eUmSwNXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786612504; x=1818148504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w3C3J7IGWagmh0zTKd1Td+aVnV4SHUDYBfvg5ftX/qo=;
  b=eUmSwNXQWbbzchM6Urz1DzCOcgqFASa4uoTAjR8tWc7bp4C/soPbyusH
   kMMqPE3LWcWQY+iXkh3SrFg5WoxdU9KTz4rconGwfj6SDwLC60YgamEP2
   UuQVruZVvT3U9tTqyaVmUcy2GYkpNQAx9zxdpBVJep3qLPMM/MqSe7/BQ
   pDAMgXPi6i3cjgFTs7/V6JuveyhKE8qUE4sYVs1RRqdefdcLPxcrLyrqT
   38EZrW5q4eS10yhXfovyUOyIrxOZ4ffZhZasO9ECHUmJK/Kq/av2EYFdW
   LyGAH3733xgkDn+E1xVPPl/bQ7WGC/gIhD53GZE0PV8NusBOslYKIRnbo
   Q==;
X-CSE-ConnectionGUID: HeC3GLizSgCKLi+4wL845g==
X-CSE-MsgGUID: NQOVpR0oSfWkpFhFvUMPSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="104565926"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="104565926"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:15:03 -0700
X-CSE-ConnectionGUID: /2lbzUDASdWDAaBRR7KiJg==
X-CSE-MsgGUID: o71AGw/cQiqhThxMMdt/iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="259641428"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 13 Aug 2026 02:15:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EF6DA99; Thu, 13 Aug 2026 11:15:00 +0200 (CEST)
Date: Thu, 13 Aug 2026 11:15:00 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Andre Eikmeyer <andre@negmaster.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7] thunderbolt: Add device links for Apple T2 NHI
Message-ID: <20260813091500.GP893316@black.igk.intel.com>
References: <20260812153717.1345-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812153717.1345-1-atharvatiwarilinuxdev@gmail.com>

On Wed, Aug 12, 2026 at 11:37:14AM -0400, Atharva Tiwari wrote:
> Ice Lake Thunderbolt NHI That are only on T2 Macs. The NHI and its
> associated PCIe Root Ports all sit directly on the Root Complex
> with no upstream port. Identify the tunneled PCIe Root Ports by
> their PCI IDs and create device links back to the NHI so that
> PCIe tunnels can be re-established after sleep.
> 
> And on other Thunderbolt NHI's, like Titan Ridge, the default method
> is used to add device links.
> 
> Co-developed-by: Andre Eikmeyer <andre@negmaster.com>
> Signed-off-by: Andre Eikmeyer <andre@negmaster.com>
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Can you guys do the changes I asked during the v5 review?
