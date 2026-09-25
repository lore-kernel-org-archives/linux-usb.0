Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9523F44D7
	for <linux-usb@vger.kernel.org>; Fri, 25 Sep 2026 05:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312491; cv=none; b=kuW+ApAknzb23wwbF7dGgu2AWthaGpb90+iHagaLGvPqUuZLJI1QOAr+8OWG9QLifAvZthXR/K/Wd9g3B0Mr0hA4fTX6uSEaLdwHh2dhZp5LGEVwEfDpz6TOXPJewMUO5XHPfomaM4G8HkLwMFTGor62qG32WgrqebrMGtbA0GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312491; c=relaxed/simple;
	bh=FWbX/jSSeGgUML9H4sco4i9sWeeGlB/8G5SKBcDRj+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdavA/L7OQ6xzynZIZDrhjLMqblLV4up4+ZJ0ssC1BNbGmk3+fUdjRv4EfL9YOXxltWZyawBaTHnKfS9YQzza/SvgFylwSyfYWguGEqfuMJt0ga3xWS8gFPaaeKgnTM4/M6xz2eJpCnRPGidqvxqhVEqdwo68jlCC1N4fzruU6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RmlY9qvk; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmlY9qvk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790312488; x=1821848488;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FWbX/jSSeGgUML9H4sco4i9sWeeGlB/8G5SKBcDRj+o=;
  b=RmlY9qvkoVl9p6RU2yb64GqDhL4ctWqAErg77yEXiKrM+yM1usUknOJy
   5khwObcsFZ6G5joVCuawTDOIx1PGqUF/0s9SMTvvqd+cF+F/ccmn9dvxw
   KiPXag5AeqjXI1tpDVeYt1h2n9GpwmThmyyHlhbdeSPJQtImCjsuPiUKn
   H3eIoe4t2pjbBSCKSlmnxpO5R8mmJpoNK2iE/qsx4CmTzYwZewqERDsLH
   0iXPzECRFh8JBwE3HHuFiZFnU9kNraQ4u5tuWHzFhQPMSOpHjv7ITDSTu
   VtlbaLg/Fk07SFlgJxkaliDObEnS7vtY1Cin9Hz42iuhkE3H+ygAE2RFR
   A==;
X-CSE-ConnectionGUID: FTb7QjmkTbKh6VjPhQKTsg==
X-CSE-MsgGUID: e4VOWQUVQNqsY1xz5wuLkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89862708"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="89862708"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 22:01:27 -0700
X-CSE-ConnectionGUID: 0YOAWFvjT2+8UcrGni245A==
X-CSE-MsgGUID: OtWrxyFdQGWsrQ67m/JyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="273323565"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2026 22:01:25 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 310FA99; Fri, 25 Sep 2026 07:01:24 +0200 (CEST)
Date: Fri, 25 Sep 2026 07:01:24 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kurt Lieber <kurt@lieber.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH] thunderbolt: Disable CL states for the Anker Prime TB5
 dock
Message-ID: <20260925050124.GT106095@black.igk.intel.com>
References: <SJ0PR15MB4696D491504DB667AA8E0617A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924073514.GM106095@black.igk.intel.com>
 <SJ0PR15MB4696C6AB0D4FB7C86C420008A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924101046.GN106095@black.igk.intel.com>
 <SJ0PR15MB46960A6F15BCA58C0726C908A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924125729.GP106095@black.igk.intel.com>
 <SJ0PR15MB469651A447568D8E66757EB1A3812@SJ0PR15MB4696.namprd15.prod.outlook.com>
 <20260924145447.GR106095@black.igk.intel.com>
 <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ0PR15MB4696FC97236D81E59D40E142A3802@SJ0PR15MB4696.namprd15.prod.outlook.com>

Hi,

On Fri, Sep 25, 2026 at 12:02:28AM +0000, Kurt Lieber wrote:
> Hi Mika,
> 
> On Thu, Sep 24, 2026 at 02:54:56PM +0000, Mika Westerberg wrote:
> > Okay that's recent enough. I do wonder if we try to enable CL2 too. We
> > should only do that for Gen 4 link. Can you still take dynamic debug log
> > for me without clx=0 so we can see that it tries to enable?
> 
> Dynamic debug with thunderbolt.clx left at Y, dock plugged in (route 1,
> DROM 01ea:83b5, NVM 62.2). The same sequence repeats about once a
> second. CL2 does not appear in the trace. What it enables is CL0s/CL1:
> 
>   thunderbolt 0000:00:0d.3: 1: current link speed 20.0 Gb/s
>   thunderbolt 0000:00:0d.3: 1: current link width symmetric, single lane
>   thunderbolt 0000:00:0d.3: 1: link width set to symmetric, dual lanes
>   thunderbolt 0000:00:0d.3: 1:1: CLx: CL0s/CL1 supported
>   thunderbolt 0000:00:0d.3: 0:1: CLx: CL0s/CL1 supported
>   thunderbolt 0000:00:0d.3: 1: CLx: CL0s/CL1 enabled
>   thunderbolt 0000:00:0d.3: 1: TMU: mode change off -> uni-directional, LowRes requested
>   thunderbolt 0000:00:0d.3: 1: TMU: failed to enable mode uni-directional, LowRes: -107
>   thunderbolt 0000:00:0d.3: 1: failed to enable TMU
>   thunderbolt 0000:00:0d.3: 1: USB3 tunnel creation failed
>   thunderbolt 0000:00:0d.3: 1:12: DP tunnel activation failed, aborting
>   thunderbolt 0-1: device disconnected

I just tried on my side MTL/PTL + BR Hub and works fine with CL0s/CL1
enabled. Also checked release notes of the NVM and there are no mention
about issues with CLx with the one you are running.

There is one more thing that we can check though, can you run:

  # tbdump -r 1 -a 1 -vv -N 1 PORT_CS_18

and provide the output?
