Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CE73A2544
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 08:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854838; cv=none; b=jjPfkKHhqDQy3erwcioghQBpOrNfFf+5f9eoRRj5fPmTakiNw6hXzi/w+kLIByOtQruMYWCPKCWw4aQFaFxttesuvD6IHvoSys4SeS2ap17Fm7jARv5rhPMG4rtZDj/QEURbpTQiFKbSEOLkqASPyC9y/rfZiL6zOYD10CxVgFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854838; c=relaxed/simple;
	bh=JAZtd4R1M8dj8YrMj7C8MbPDS+Cmbrx75g4YWav993A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Qyoff7LR5uvKRWFPTMChWRs4613biLGca837dRVhYvrKngYdKrLEAV3/0Sj2kxyEPtkjyJ/P95zwtwkVhMI3LZFDF2iyUEZuPmL0JhGDCON/R5QMw/0wlWXspTn9HBRQsm+w5gPn0cXkRAmEdC3oENKmdAtWnNzshFi8P0UHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkQw5jo8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkQw5jo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788854837; x=1820390837;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAZtd4R1M8dj8YrMj7C8MbPDS+Cmbrx75g4YWav993A=;
  b=JkQw5jo8oP3XekqtNhXZV7urcZwVRdm5nxMvJqNPCALThV9isQspyorG
   IvwmexXFOKAU5hV+mINGULmgfZV/caP8sGIo8UVIR4gCsVE9bquNVaMLX
   3FzVgvojRnKIadtwUH6p7w4T15Kj1PrrI+juXYBhBONd9IzluH2Yz72kJ
   xc5DxCJtF7PYgwU+qbmloo6JWETbMbtbkgmfEcgP3ym9zeSovEr9yC7Op
   gPEBdNUX3Tujn+6sOvr+Rf8aIFrmGa2ywELDrCbP9SiqPKO+sawJQU+cP
   PqapcSXnTY/GIo7Vea5H84uWWDkG2lh6E9ITIftwC6TuODKMskcYe0FDF
   w==;
X-CSE-ConnectionGUID: NVzR95KOSZm70dhka/SAlQ==
X-CSE-MsgGUID: cvVFNky5TV+S50nyNdrSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93113290"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93113290"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 01:07:16 -0700
X-CSE-ConnectionGUID: iGYd9y3+Q/mEhH/TLARlug==
X-CSE-MsgGUID: KfFseVRRQGWvTJNWHMHYWg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2026 01:07:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F3D9899; Tue, 08 Sep 2026 10:07:11 +0200 (CEST)
Date: Tue, 8 Sep 2026 10:07:11 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Alexander Fischer <alexander.fischer@kait2en.org>,
	Andre Eikmeyer <andre@negmaster.com>
Subject: Re: [PATCH v10 0/3] thunderbolt: Add device links for Apple T2
Message-ID: <20260908080711.GZ106095@black.igk.intel.com>
References: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831100026.1783663-1-mika.westerberg@linux.intel.com>

Hi,

On Mon, Aug 31, 2026 at 12:00:23PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> Original cover letter:
> 
>   This series adds support for Device linking on Titan ridge, and Icelake,
>   which are used exclusively on Apple T2 machines.
> 
> I went and did some changes so wanted to check that these still work on the
> Apple T2 systems. I dropped Tested-by from Alexander Fischer because these
> are not anymore the same patches. I would appreciate if you could re-test
> these and let me know if they still work or not.
> 
> The changes I did:
> 
>   - Make ->add_links a NHI operation instead.
>   - Move the check to nhi.c instead after we have selected software CM.
>   - Split out add_link() helper that can be used both integrated and
>     discrete case.
>   - Link only the matching PCIe root ports to the NHI that actually tunnels
>     them. The previous version (v9) linked all four for each NHI so there
>     are duplicate links. Each NHI tunnels just up to 2 PCIe root ports in
>     Ice Lake.
> 
> v9 of the patch series can be found here:
> 
>   https://lore.kernel.org/linux-usb/20260824184305.1234-1-atharvatiwarilinuxdev@gmail.com/
> 
> Atharva Tiwari (3):
>   thunderbolt: Move tb_apple_add_links() to pci.c
>   thunderbolt: Add device links for Apple machines with Titan Ridge
>   thunderbolt: Add device links for Apple systems with Ice Lake

Appled these to thunderbolt.git/next. I did not get any reports whether
this still works on the Apple T2 system but I guess silence means "no
issues" ;-) Let me know if that's not the case.
