Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD343D45CF
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216062; cv=none; b=PepcJKZs6bc0UpkU63p7L5yxJrVwBKgFGmyY7TvAtH/QoRXgX/hZaCZsmon1hOIln1uaf/VLw5saPtlpr6LIxiAu+x0EBxzvTDYQratL3Xe/fSDrn3WtCV72QzM8tr6uzqTm0Wl2ZRinKGOA3Z6msT8LHO4wT0u/HsejwaXBFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216062; c=relaxed/simple;
	bh=OXt0GWxkEZAm3oq2nGNPN5A04oE321xd4uKWSRpBk0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFxK2J0OBli4awEfvJn6EVhpfyopp5/nfTZrIEZKO3+2Vp5bYXgcyXy+obKVg4Fyh2A1bWbIftPqvVrV70/zaDeWZCb3toF8pfk2DDPQIBIzAWTSFfRStowMOST5tdVUtRMs5xCuPJNNLKSf2sSFEAGrdVz+FFA+tRfjXTOS3ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgKR00qE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgKR00qE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782216060; x=1813752060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OXt0GWxkEZAm3oq2nGNPN5A04oE321xd4uKWSRpBk0E=;
  b=fgKR00qEjXm5oudK56PvxkiQ32kAxNmZX6UiEVLg5DitMXl6TGkjtcz+
   WhMNMjUTCp8tB8Kzm6nJjMVKawYjnTNwv7WCXkUGGlTTiIvCFxXTCix8c
   NifBhVnlxfLggi/aOll/BuaKGKxFWZXSbMl7Fx/MVqCBrfXBt0HExsqyP
   OZ5f0xHilKvwQyRAPmEVa9Tja9+ZEZEvd7T42j6L5deWqUJVF6YPTOJd5
   96w9kMipt8v9ruOM8sJEkjzO+iGjVvaZ4I5scji9MlfN+GD1AHcQNpaWg
   YcmkA+TJNuK+TH0J0l4UuA2124LAg/Hi2rXehqUV2aJbE27pMlnvygBdr
   Q==;
X-CSE-ConnectionGUID: STCZHcI5TpmUFXfMSRSwCQ==
X-CSE-MsgGUID: tJDDL/U7RkuD2SPe6JPA3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82959860"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82959860"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 05:01:00 -0700
X-CSE-ConnectionGUID: n5nOjFO7QauEpmTzmfpGOg==
X-CSE-MsgGUID: C4P7YQYcQtKcP+G4XpFXfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="245144839"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jun 2026 05:00:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 3D92E95; Tue, 23 Jun 2026 14:00:56 +0200 (CEST)
Date: Tue, 23 Jun 2026 14:00:56 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org, Mario Limonciello <superm1@kernel.org>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v4] thunderbolt: Assert downstream port reset on shutdown
Message-ID: <20260623120056.GA3066@black.igk.intel.com>
References: <20260611054157.928921-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260611054157.928921-1-Basavaraj.Natikar@amd.com>

Hi,

On Thu, Jun 11, 2026 at 11:11:57AM +0530, Basavaraj Natikar wrote:
> On shutdown the connection manager tears down the router tree without
> signalling connected devices. A Thunderbolt 3 device directly connected
> to a USB4 host never receives a disconnect indication and during shutdown
> this can cause polling the dead link for up to 60 seconds. On some
> platforms this behavior leads to a warm reset instead of a shutdown due
> to this timeout.
> 
> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> before tearing down the router tree. This drives SBTX low (USB4 spec
> section 6.9), causing the device to detect SBRX low and transition to
> Uninitialized Unplugged state immediately.
> 
> Always do this on system shutdown/reboot by forcing host_reset in the
> PCI ->shutdown callback. On plain driver unload only do it when the host
> router was actually reset on load (host_reset=1), since in that case the
> tunnels are not preserved across reload anyway; with host_reset=0 the
> tunnels are kept alive across unload/reload so the links are left intact.
> Restrict the reset to Thunderbolt 3 devices.
> 
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Applied to thunderbolt.git/next, thanks!
