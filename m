Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955E3F65F7
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244667; cv=none; b=rXaMpMRkcUHfzY3LuMTox2zTlbK2KwUDA+6kRsmiiqB9FezSMvBJdg1RMgbzzoiDtVKUymChjgicN9vPjkgZFnVAE1t1fXiql1s+vTIvSQWPgBWyfDslS4gDi02rUoAlX7Skp08J13cfXhwO4xSgrxsBTH0Ku8WreMpbbJh9aYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244667; c=relaxed/simple;
	bh=O0p4UE8jfnm3XJ2SRRgYSkZrmqwFLgFJf6TVlzB1w78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmXb14smjF8AemXEK1/JVgC+yIKT4yTi4NT5VdOfqw/4vZmjmLdL/kLCRphPUjzU4CqNcKkezzE7TYyyTRa/ibRtzkLDA9OpruYUt6IiVtA6wU12M2XNOMTNqHWvDTQzyL3qAJRLi/4sVA2dTWBxKOJaMJjjZoXnAOtlGuDGVr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJyqoLWy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJyqoLWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790244657; x=1821780657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O0p4UE8jfnm3XJ2SRRgYSkZrmqwFLgFJf6TVlzB1w78=;
  b=NJyqoLWy8hxvxazninnqfbA4PVQLBhqszxddpSkwYczEjWNFphm8rjUe
   Px9Os4Q1nPDGXeZ2jVh3l6NJWaaKzFpxaZaeM0q6aD8W4ZBU/LC2TzEfl
   hKYzYlqGwYyEyLSpAKuDo64dMMJui4HD8nYutFer/k1DavEgcNzzVAfOl
   SvrDz1nX8q7Xk1y81ryVMHI+tBhT1NhOiyjQwhc+HG/3MXjtQkKaohZn9
   Il683uFePhpFHqv66u/XoZ7/H+ScD/OPGdYQXv6ylkmYmrTVvx2tja39Y
   Wi6zPtY4AuwHwCKX5fhjTaT0ETFkp7zfDsQ7OrlGmPDq6zmRAN/KCfTiy
   w==;
X-CSE-ConnectionGUID: f4M9V+H/SaaCx9VBYzvKKg==
X-CSE-MsgGUID: hXQb6RjMTjS0l1Zh8TZPLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93508297"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="93508297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:10:49 -0700
X-CSE-ConnectionGUID: Tqb/QOv9SZqnYiyaPrVSCg==
X-CSE-MsgGUID: Hpxdmnx6QKKmL9rkgBubqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="273485138"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 24 Sep 2026 03:10:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E6A7099; Thu, 24 Sep 2026 12:10:46 +0200 (CEST)
Date: Thu, 24 Sep 2026 12:10:46 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [BUG] thunderbolt: Anker Prime TB5 (1ea:83b5) reconnect-loops on
 Meteor Lake (8086:7ec3) unless clx=0
Message-ID: <20260924101046.GN106095@black.igk.intel.com>
References: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Thu, Sep 24, 2026 at 07:57:10AM +0000, Kurt Lieber wrote:
> Hi Mika,
> 
> On Thu, Sep 24, 2026 at 07:35:22AM +0000, Mika Westerberg wrote:
> > Can you test with the dynamic debug enabled and provide full dmesg? Or
> > alternatively run:
> >
> >   # tbdump -r 1 -a 1 -vv -N2 LANE_ADP_CS_0
> >
> > and provide the output. This needs to be done when the dock is connected
> > (with clx=0 is okay). This should show if the dock claims to support CL
> > states.
> 
> The dock was connected and authorized. thunderbolt is loaded with clx=0
> (/sys/module/thunderbolt/parameters/clx reads N). 
> 
> # tbdump -r 1 -a 1 -vv -N2 LANE_ADP_CS_0
> 0x0036 0x1cfe01c0 0b00011100 11111110 00000001 11000000 .... LANE_ADP_CS_0
>   [00:07]       0xc0 Next Capability Pointer
>   [08:15]        0x1 Capability ID
>   [16:19]        0xe Supported Link Speeds
>   [20:21]        0x3 Supported Link Widths (SLW)
>   [22:23]        0x3 Gen 4 Asymmetric Support (G4AS)
>   [26:26]        0x1 CL0s Support
>   [27:27]        0x1 CL1 Support
>   [28:28]        0x1 CL2 Support

Yeah this is what I suspected. It claims to support all of them but
probably actually does not. This should have an entry in quirks.c then.
Want to do that? If not let me know and I'll make a patch.
