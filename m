Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8A39A4A7
	for <linux-usb@vger.kernel.org>; Thu, 24 Sep 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261695; cv=none; b=X2rcdmI52HdyvFdp6K1iqdyV3PyZ66v8WSzrDWqSiy0OEeUzJX9qNoJaZYioQVxHi3zWD1J9U+t0IOtL29WRcGfF1it5JjHUM+Hi1eDdLF/3BWqYijZv2pn7C7JDHQC9tX28mzG/lV9VLmqP9/6Uzo/2uAmknWlA3q7SG89GFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261695; c=relaxed/simple;
	bh=ynoRrsrSIdeqLf28XLN49ma1e+iV8wlkOoosLSqGa6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNBU/7Ps5gfBn+d06q+VIdK3A/adHMIRS0CSDnyCEHAO0ZpXVkm0Xf2o46r3F9V3fbbc5KGSpi5URxXlJIMZacZihZmdjQTEIK5vzKAwU/yEbtZs/0XB55+Mu52p4uvLC7Xf6w071KW9Cb4Wv6JdSzapfObljMcUTYynqY/xNF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HS3DMAM2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HS3DMAM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790261692; x=1821797692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynoRrsrSIdeqLf28XLN49ma1e+iV8wlkOoosLSqGa6k=;
  b=HS3DMAM2Dksnbt9tQ9T266Es3WoXj9uyHSwzi8qOFZKPwBcP9GAn5AbA
   aKIlJqRZmlnW1WKqr2Yq67yVXuQTFYh07l6dpE2cQnZ5p63V3u1KOOpdY
   KrlMYwVJCXUlWLSiZGHtorJhMcnKX7kXlUQBvWtNecnBS5QyfLxfyCoQL
   Y4867QExsFWc7Yb3wrV5C4m7zxE8bMfbmUNXnoW2TWUWoEstbIlSzp8Fu
   mYLsYN4/2UAtkw3RJRZEBrGKpRmQ71FpLoMJBHikFj1DiF9m0T20MvBBr
   G4hDscm5FK9Dg4f83STBAj5CajIVd6AhimRz5zQkp/fOiK6RyjaHUwbgt
   w==;
X-CSE-ConnectionGUID: btbPfcffRLaqvS94v7xNEA==
X-CSE-MsgGUID: i/GtPEEoSUGJZwrfexfWCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89991715"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="89991715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 07:54:50 -0700
X-CSE-ConnectionGUID: RS3moWlUQn2lhuGZz7ONGw==
X-CSE-MsgGUID: G26Ixc8bTrCSSqM579KTeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="272182636"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 24 Sep 2026 07:54:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id D3CFB99; Thu, 24 Sep 2026 16:54:47 +0200 (CEST)
Date: Thu, 24 Sep 2026 16:54:47 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260924145447.GR106095@black.igk.intel.com>
References: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>

On Thu, Sep 24, 2026 at 01:33:01PM +0000, Kurt Lieber wrote:
> Hello - 
> 
> > Hmm, I missed that it's Barlow Ridge. That should definitely support CL
> > states. I have one here and it for sure works.
> >
> > What's the NVM version can you check? It could be that some older ones have 
> > issues.
> 
> The dock router (route 0-1, DROM 01ea:83b5) reports:
> 
>   /sys/bus/thunderbolt/devices/0-1/nvm_version
>   62.2
> 
> Read with the dock authorized and thunderbolt.clx=0.

Okay that's recent enough. I do wonder if we try to enable CL2 too. We
should only do that for Gen 4 link. Can you still take dynamic debug log
for me without clx=0 so we can see that it tries to enable?
