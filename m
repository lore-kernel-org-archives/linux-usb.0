Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B3D385519;
	Mon, 13 Jul 2026 09:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935355; cv=none; b=H4bXcnoEfJE9g5MAfTe3fXaFe32jPkFYFTxOvYdp8Y/cBQUmRHrKA7YmcypZMcmkJlSRTdONO9gPv0CVIo3PP3dc/OoNA5m3gEhPh1WYcxMMD46RzASAZWsprsSDt1hOVhmYXOs2lZaJyQgQha+UohSq6MZtF5LMD+l1wpw5a1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935355; c=relaxed/simple;
	bh=jqqFzK4Xcd5DJHOo4Gt65nna5ZurpT7qbbZyeydS3NE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWKLCrznImJpvokO4lVLwhgni5Y8i1MIFpzibtk+0Rib3uP3lcYA0JGqMmjUSmrPQ/cDW2FQfqIkGkA29k/50DPTXW4J8JTGefEvTo9vyY4oP0kCf1Te5tBPdfIzsOof7FS+/hKGPZhKHytT38HssRZ8hhoe3J/uzJfK3OATVD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFej8AJM; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFej8AJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783935353; x=1815471353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jqqFzK4Xcd5DJHOo4Gt65nna5ZurpT7qbbZyeydS3NE=;
  b=NFej8AJMIdCrBrcmLwMBE5bfgbaP3ClqD/JnzQYOO9/6TC2xYRuQWLhW
   W04Rt3IViAtaUU+pK26dLB5rkTkOh9ls5Mty6eKevqUzrqlV3aAfEVHqt
   +/dibfrcoy53InaMkLZAdywAKMZygDpUEpqfzYdiyfkAUJnltwyn4OrrV
   JdErfHUfRlAio8Q8a97WXe94J34C39kpM7bZMsk8GHOstgRt9MLhkVC0n
   8MIqI0ObOskqfhthAu8vHaG/bC2Zf5Vma+01UHF9ohSTZK81U2NZeQbr0
   b6uHxtwbSJRPhK+g4EHC5XM2C905WUI5vJkixpTikPkx2CcTN6b7AEEDP
   w==;
X-CSE-ConnectionGUID: hd1MPEqJSd2hGUqpAZUCRQ==
X-CSE-MsgGUID: tyZqmuOxSraaLii8C2Vo6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84419009"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84419009"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:35:52 -0700
X-CSE-ConnectionGUID: yfRyndB0RbOLZGkK6vRoOQ==
X-CSE-MsgGUID: S1QVNxP2R0m8DYOhF/pjKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259086035"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 13 Jul 2026 02:35:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 65F4B95; Mon, 13 Jul 2026 11:35:29 +0200 (CEST)
Date: Mon, 13 Jul 2026 12:35:27 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julian Braha <julianbraha@gmail.com>,
	Xu Yang <xu.yang_2@oss.nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH v3] usb: typec: altmodes: select DRM_AUX_HPD_BRIDGE for
 TYPEC_DP_ALTMODE
Message-ID: <alSxX055MoxkdahQ@kuha>
References: <20260709062147.240-1-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260709062147.240-1-kernel@airkyi.com>

On Thu, Jul 09, 2026 at 02:21:47PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> When TYPEC_DP_ALTMODE is enabled, DRM_AUX_HPD_BRIDGE is most likely
> also needed for embedded platforms. Select it when available.
> 
> Suggested-by: Xu Yang <xu.yang_2@oss.nxp.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> Changes in v3:
> - Link to v2: https://lore.kernel.org/all/20260705065832.184-1-kernel@airkyi.com/
> - Use the same "select" as v1 to make things simple. 
> 
> Changes in v2:
> - Link to v1: https://lore.kernel.org/all/20260702022036.44-1-kernel@airkyi.com/
> - Change "select" to "imply".
> ---
> 
>  drivers/usb/typec/altmodes/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
> index 7867fa7c405d..b054c0b6a8d4 100644
> --- a/drivers/usb/typec/altmodes/Kconfig
> +++ b/drivers/usb/typec/altmodes/Kconfig
> @@ -5,6 +5,7 @@ menu "USB Type-C Alternate Mode drivers"
>  config TYPEC_DP_ALTMODE
>  	tristate "DisplayPort Alternate Mode driver"
>  	depends on DRM
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF

Is there really no way of making this into a dependency?
Doesn't this, or something like it not work:

        depends on (DRM_AUX_HPD_BRIDGE && DRM_BRIDGE && OF) || !DRM_AUX_HPD_BRIDGE

Thanks,

>  	help
>  	  DisplayPort USB Type-C Alternate Mode allows DisplayPort
>  	  displays and adapters to be attached to the USB Type-C
> -- 
> 2.54.0

-- 
heikki
