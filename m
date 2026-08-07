Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6FA4756C9
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102279; cv=none; b=aLgiYaElU3LLKqdFuVh6FdAHdjw9TxyfphE+EPOcvjJOektPqWtvqgIFBeaALhVGxcb5/qw84fhz1WcdG34Wckgx/PMPvEeSrWKfRGfkN0+QThzSb0+PlLpItpdoGwBfCBfCCwdvI6iyv7V2umJOEPSBjVZzJwLCbUrvOX9Dfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102279; c=relaxed/simple;
	bh=G4exCgKpmLLaUI8GUb09KNtiha6U14KQ4TchJZdsbXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZczAJxjexW73viKCrjOj1KBBFlLIKOLVvWP4+0FGMPm57tVSSIeBbgFS1OINO2iTTzdl9epWcmZy6PQ8TH0fUmPFCn8v0lR6AyXNG6g8whMCP73leiGDI3VYrSi38G3/i+kWZ6AWCenyYB6Id0KzHv1Lo6iGQ2O1lSolJ736ciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GklI105j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GklI105j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786102278; x=1817638278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G4exCgKpmLLaUI8GUb09KNtiha6U14KQ4TchJZdsbXo=;
  b=GklI105j+27MNZOvxPnTenVIW2XWHeabr3XO0hHfEO7CXb+Er0sKgOOp
   909D7KCT17IJ51pMrrpb7jGCmhSSqT2+aYsCNu9ILGCSvUV+ICfLWfWKw
   H29/2Ns7rfT+hT2ZeFS4dWkRW4n6GBL4nLP2X3WWlDo2hT6rLgT4WRaue
   x9jTmauxCw6fmxz9V/12dCwkef1c8gRczH1EzyYGvDjHb9YnU2Y3uh7ZT
   XH9J94AFrRtRrv7lgqZ8xE1BPZYnQODIYl23blMuVeQm8y/acawszqVxf
   S0+tv22+8FW0JVzluNXk7AM9WDQSihNQ64vDcN3KWP38P665KOwIsCWq8
   g==;
X-CSE-ConnectionGUID: v+3DLbBBQx62uWENOd6BKQ==
X-CSE-MsgGUID: rDwcmDPsTI+UaKwu6PgBFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86560025"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="86560025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 04:31:17 -0700
X-CSE-ConnectionGUID: dMjH4ozgQteWn5ubhb2YxA==
X-CSE-MsgGUID: F1RUzlTeRKah96UBG1rXPA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 07 Aug 2026 04:31:15 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EFD8499; Fri, 07 Aug 2026 13:31:13 +0200 (CEST)
Date: Fri, 7 Aug 2026 13:31:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, lvc-project@linuxtesting.org,
	syzbot+901ca72278dfd89daf58@syzkaller.appspotmail.com
Subject: Re: [PATCH] thunderbolt: verify PCI resource type and size in
 nhi_probe()
Message-ID: <20260807113113.GO235112@black.igk.intel.com>
References: <20260807083757.318371-1-dmantipov@yandex.ru>
 <20260807095831.GL235112@black.igk.intel.com>
 <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7510bf11-7ae3-47dc-b499-5eb5e0aa0192@yandex.ru>

On Fri, Aug 07, 2026 at 02:13:06PM +0300, Dmitry Antipov wrote:
> On 8/7/26 12:58 PM, Mika Westerberg wrote:
> 
> > Yeah, I'm not entirely sure we want to start "fixing" issues like these
> > where it's clearly not a USB4/TB NHI. IMHO If user forces the driver
> > somehow to bind to this unrelated device then she/he got what asked for.
> 
> I agree but isn't there a scenario to trigger such a weird probe just by mistake?

Okay but how it is "mistake"? ;-) I'm actually not sure how this was even
triggered. Something like you as root echo random PCI device name to "bind"
files of a driver?
