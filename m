Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C4E3D47C5;
	Fri,  3 Jul 2026 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082210; cv=none; b=LEQ2dsh2oEUbx6af1YVM+DexVF78coIAGJ+KTkxxst7QaGpEFjohPxodJix7RLOLAwVYxY204uau7TVJ4dKu/ZuXegZUsZG383BVQtIzOOoxzuYqixpKXu/ZT0B0HTgRwFMzbN4+rm4DuNqCEXcg8PJwrbIqKef6Jd8LK8IjvOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082210; c=relaxed/simple;
	bh=YD83pODH7BAM2XrVwJTVpZ6De5DWC+VrSgVN33oNhTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKb8tR+Dak1zemHA8/3hXZmLglpTZha59IqdYNvfDpS0bKqm/c3ZliY7o6LHaUY/YljW5uN/4dKoJZjqcdo8iE/BY75OdK1Wcmk79b/7/xEdt+iR2gjtryTStuBizY+x7m0V/+J63Ek2TluaIA18UhSqHEtGnU3jQne85pOrv24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYhrNpcb; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYhrNpcb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783082209; x=1814618209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YD83pODH7BAM2XrVwJTVpZ6De5DWC+VrSgVN33oNhTU=;
  b=WYhrNpcbUvR0ogFktHr1DoDg3iak0JszrL9NwjigNpCLSkrqOWOMVIIC
   089vrKerwevL2GtnbqIMrs/PuzTMW15ztBcVmJbfGgiLkfCHPz3dJx23E
   va0dKUCXN3S4CSaeMmiULJ7snrEs/YTTcmHDdTNc20oB2wPLbzOCAT5qd
   yfuBrc1Y8CWpFXco1hJTPZRURg0M2pSZmtZkxp6c0bvalzpGhvncaUulE
   njRhB/4uVUZAktmtBorLuL38VvyQeiZyI6eLPL+LoIjOpW6913HHTuZPA
   JwRPYjN1l78vM6Vzy7POrlCkVCm9l6BEvewS1e6D0SzfrWVQT+kx3EwaK
   w==;
X-CSE-ConnectionGUID: /ueDyaUVS+yzoaXGnehNjQ==
X-CSE-MsgGUID: GBw2aUPkRXKnDmDxr1TBMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83928706"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83928706"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:36:48 -0700
X-CSE-ConnectionGUID: GyP9kc1CRhKZX8qQA4IuDA==
X-CSE-MsgGUID: gtDseMruSF+ZMjCs9Gx09A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="250454371"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 03 Jul 2026 05:36:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 0AABD95; Fri, 03 Jul 2026 14:36:45 +0200 (CEST)
Date: Fri, 3 Jul 2026 15:36:43 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	johan@kernel.org, akpm@linux-foundation.org,
	andriy.shevchenko@intel.com, pooja.katiyar@intel.com
Subject: Re: [PATCH] usb: typec: ucsi: ccg: Log firmware version and hardware
 info at probe
Message-ID: <akes203FaTAGM6fD@kuha>
References: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630130147.1385145-1-loic.poulain@oss.qualcomm.com>

Hi Loic,

On Tue, Jun 30, 2026 at 03:01:47PM +0200, Loic Poulain wrote:
> The CCG firmware version and silicon ID are read during probe but never
> logged, making it difficult to identify the hardware and the firmware
> running on the device.
> 
> Add dev_info messages to display the firmware version and silicon ID:
> 
>   ucsi_ccg 2-0008: CCG FW version: 3.9.0 build 0x0000
>   ucsi_ccg 2-0008: CCG silicon_id:0x1234 mode:1

I think that's mainly just noise. I think debugfs files would be a
better option for this information.

thanks,

> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 4463c1ae96bd..2715bb7b53aa 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -738,11 +738,21 @@ static int get_fw_info(struct ucsi_ccg *uc)
>  	uc->fw_version = CCG_VERSION(uc->version[FW2].app.ver) |
>  			CCG_VERSION_PATCH(uc->version[FW2].app.patch);
>  
> +	dev_info(uc->dev, "CCG FW version: %d.%d.%d build 0x%04x\n",
> +		 (uc->version[FW2].app.ver & CCG_VERSION_MAJ_MASK) >> CCG_VERSION_MAJ_SHIFT,
> +		 (uc->version[FW2].app.ver & CCG_VERSION_MIN_MASK) >> CCG_VERSION_MIN_SHIFT,
> +		 uc->version[FW2].app.patch,
> +		 le16_to_cpu(uc->version[FW2].app.build));
> +
>  	err = ccg_read(uc, CCGX_RAB_DEVICE_MODE, (u8 *)(&uc->info),
>  		       sizeof(uc->info));
>  	if (err < 0)
>  		return err;
>  
> +	dev_info(uc->dev, "CCG silicon_id:0x%04x mode:%u\n",
> +		 le16_to_cpu(uc->info.silicon_id),
> +		 (uc->info.mode & CCG_DEVINFO_FWMODE_MASK) >> CCG_DEVINFO_FWMODE_SHIFT);
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1

-- 
heikki
