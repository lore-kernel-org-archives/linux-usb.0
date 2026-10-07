Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5802B47C0F5
	for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2026 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378815; cv=none; b=F06xqXq3mVLwN5wzABzQI6+kiZxn5vUXZaxOB04U0tfmJCe2k8DE1AJ9+NSXcJ5xj9v9dJ3eYoC1vHZ1ZoEWj0Z6hF1xsBJXPDJ7vY0XZHj24/zBW4qk/sgQ7sRv3VIUPZjdVVEjhf08UpYTkJKleXWl6Ur/XTC17yph6u0MFrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378815; c=relaxed/simple;
	bh=AO2X+QL5qzEGGkAYPOqkj9lLRjixX/V3ibVDojTMw9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWFFjpg5lMCNAEemusiZkSJU8tzGDDUu/7xCiuMmmVHONMhOBKkvb4rcJ7UF66MlVBn1wrKyT/yxp7c1DGD7rqDToPUmA1FbHau9JAqKLvub2Jx1n4rW74NEz8dBnlWnKhmeDy3DchmE6I5Mcax2VUGgEOwanrOowoy7YAlI0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a53P3ug3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a53P3ug3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791378802; x=1822914802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AO2X+QL5qzEGGkAYPOqkj9lLRjixX/V3ibVDojTMw9Y=;
  b=a53P3ug3YeGlaR9VVU9j3JDs4ptzosZLRIA9YKuwsxreawRGjWZDD6a1
   VPw0b5vs2wUspu64n9xwBIvt+wwdgui3AmZD2RTK41igbPLcmQeRQntdz
   P62Vhh5hK/GuuCsbI5NpB0NCzsEv9Cz1ZUtFillb0ZuzCAkffmbYyo2yi
   Uqox75zgtupk4e72QJWNPpnahNMtEozeBi89AsOGlkJ0u4G6QqoktTZkE
   ozOr54anZzZH6kiHeMZyKU+jFGV2G+OYt1dCQ65fGUf79zzXWlnaZtyD/
   /Rm5kj5BHa1W6RmeqxfKfJKnv8QKLMWqPsR6ONudr+e4OnhTtapg+R3lc
   A==;
X-CSE-ConnectionGUID: SUsEsticQXCPlwf4NzeM3A==
X-CSE-MsgGUID: XVIe+xLhROK8B4th+uZbGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="134661"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="134661"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:13:21 -0700
X-CSE-ConnectionGUID: MTM8USNsTJepA11PAkTP+w==
X-CSE-MsgGUID: JEroc3GESRysDtC86TNzlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="276555549"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 07 Oct 2026 06:13:20 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 9158A99; Wed, 07 Oct 2026 15:13:18 +0200 (CEST)
Date: Wed, 7 Oct 2026 15:13:18 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v7.3-rc7
Message-ID: <20261007131318.GS176164@black.igk.intel.com>
References: <20261007115859.GR176164@black.igk.intel.com>
 <2026100738-duct-antitoxic-1605@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026100738-duct-antitoxic-1605@gregkh>

On Wed, Oct 07, 2026 at 02:58:06PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Oct 07, 2026 at 01:58:59PM +0200, Mika Westerberg wrote:
> > Hi Greg,
> > 
> > The following changes since commit 395e9f2967a7ac6898026e8f136c369805dc2fd9:
> > 
> >   thunderbolt: Disable CL states for the Anker Prime TB5 dock (2026-09-28 11:34:48 +0200)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc7
> > 
> > for you to fetch changes up to 96a8479804e3f7af43e639e9df39f562f1a75fd5:
> > 
> >   thunderbolt: Do not RPM complete unrelated subtrees on unplug (2026-10-05 13:31:20 +0200)
> > 
> > ----------------------------------------------------------------
> > thunderbolt: Fix for v7.3-rc7
> > 
> > This incluces a single fix to make the runtime PM completion complete
> > devices that are actually part of the domain. Needed for firmware
> > connection manager based systems.
> > 
> > This has been in linux-next for few days with no reported issues.
> 
> Is this a regression or a "new" bugfix?

It's a new bugfix. It can go to next too if you think it is too late for
the -rc.
