Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FBE352C5C;
	Fri,  5 Jun 2026 12:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664019; cv=none; b=lg+0ALYZc/y0OKLb3WOg9aqdYT6+UjD2iLtGEvAZICJXNIBUwMRCerUbDb4Nko4TPhWP5pIPgsnXF8cvgk3H5UC8qNHcyBjnc3bTju7XmFQnlVv8059oXiIERAYtSr1H6s1U2vIlawPep9L8gY168li0dveuZxOHUf+eHJlxy9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664019; c=relaxed/simple;
	bh=+GTbV+AWOPVtrMfnxdb+YCUo3NReWOIopZNNidDpoVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZ3dVnAK2f4C9zCGXhlZv+OxDabPj5If3fVdl3evo7ya34SzTEvAk8SSPggNEVNV0u5Xr098nqq314QOcpFHxSbYGYpitdlrYzIytpUB//00KzrQQPvFFGKmaKjCQhyjQDNowCgOayihKpOh/CLGu/2+17i5JC4TsERAkKNVLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7YPQ1mj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7YPQ1mj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780664018; x=1812200018;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+GTbV+AWOPVtrMfnxdb+YCUo3NReWOIopZNNidDpoVo=;
  b=U7YPQ1mj4xecHHdtH70SJhpXww0Mj9di73+YB2lCbJTept3YtTSEwfqn
   JRLqlNM7af5ZQ8M6w7TgASTiC8Y/9onzQpINAcX++YdAekPfDZ2zLy4wt
   FkXaeOcjfvnS4c3IFqxIYfJuS5FQySHhJCnigTygOPHOoBHNYbl91kYBv
   wRJJQ4OTAUIX+jnwUdb6supxK2mPP2AkSTjD37Lp2b7dElMz9na7UA3Sd
   cg4WFKW1hAa49l/XUm3FQAPeYV0aUk7VPa0uijzSVKRrAwpz86jePNpjJ
   jKBG0L+/2bBYGbr85u43kYVJwOjOmpDLabyrAiP6w4fX0a/GQcGpyPD4i
   A==;
X-CSE-ConnectionGUID: ZDt+b/8DSiW7HPnfxGK+ag==
X-CSE-MsgGUID: LRzSW9GySs+EKzEC14adnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80633487"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80633487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:53:38 -0700
X-CSE-ConnectionGUID: 5eD9KdOoTZOHWnIkrDuWQQ==
X-CSE-MsgGUID: Qy4nykPuRFGiq4RW9UL8Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="240649810"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 05 Jun 2026 05:53:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9CC8B95; Fri, 05 Jun 2026 14:53:35 +0200 (CEST)
Date: Fri, 5 Jun 2026 15:53:31 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Jack Pham <jack.pham@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ps883x: Fix DP+USB3 configuration
Message-ID: <aiLGy9uw3oNhpcX1@kuha>
References: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-ps883x-usb3dp-fixes-v1-1-d19bec3a6d26@linaro.org>

On Mon, Jun 01, 2026 at 03:55:02PM +0200, Stephan Gerhold wrote:
> Commit 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()") introduced
> two regressions:
> 
>  1. The CONN_STATUS_0_USB_3_1_CONNECTED bit is mistakenly written to the
>     wrong configuration register (cfg1 instead of cfg0). This breaks USB3
>     when using USB3+DP adapters.
> 
>  2. The switch-case fallthrough block is inverted: Currently,
>     TYPEC_DP_STATE_C (DP-only) inherits the USB3 configuration, while
>     TYPEC_DP_STATE_D (DP+USB3) is missing the necessary DP sink flags.
> 
> Fix these by writing the USB3 bit to the correct register and swapping the
> case statement order so both states get their correct bits assigned.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6bebd9b77726 ("usb: typec: ps883x: Rework ps883x_set()")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/ps883x.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 1256252eceed..c9bf4b4c2ba1 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -118,12 +118,12 @@ static int ps883x_set(struct ps883x_retimer *retimer, struct typec_retimer_state
>  				CONN_STATUS_1_DP_HPD_LEVEL;
>  
>  			switch (state->mode)  {
> +			case TYPEC_DP_STATE_D:
> +				cfg0 |= CONN_STATUS_0_USB_3_1_CONNECTED;
> +				fallthrough;
>  			case TYPEC_DP_STATE_C:
>  				cfg1 |= CONN_STATUS_1_DP_SINK_REQUESTED |
>  					CONN_STATUS_1_DP_PIN_ASSIGNMENT_C_D;
> -				fallthrough;
> -			case TYPEC_DP_STATE_D:
> -				cfg1 |= CONN_STATUS_0_USB_3_1_CONNECTED;
>  				break;
>  			default: /* MODE_E */
>  				break;
> 
> ---
> base-commit: 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef
> change-id: 20260601-ps883x-usb3dp-fixes-32c09e9bd6f6
> 
> Best regards,
> --  
> Stephan Gerhold <stephan.gerhold@linaro.org>

-- 
heikki
