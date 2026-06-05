Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32019352C5C;
	Fri,  5 Jun 2026 12:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664076; cv=none; b=NfYGnZdeAoDwEV33D5y8o9xkO8DPGQqkUOwow0OjVFg0iPwuOEA9+gRe60zZdnv8spYoQ/m9dwdWJJNExIJ4hsUkI2Fo5xLlLuq4fbqVGRVGPyqaoJg768kvUOGzSeGp0SYvUV/zwNXPp6IKM5G7Le8PukUulgo2IrI+KSLR4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664076; c=relaxed/simple;
	bh=9q2EOjEYzucfwZE27n9HHxlF2pa40wmeAG44iYdB/Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eoCXV+oEHEa6eOyggYehO1nEdnG6gwAoLGWEl9olDHfaTmv3pKmUWb3vGz2QZYOMGiakhnwb7xmrz6fsKfh7Hw0saokERv9djvounrynz6dnTApZOA7P9KKCsay9WVMTVq0ph1Rxf0VS3HUTVFfo6Fl+Y+OSJwsAO7HxAo3+naM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFSLINQy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFSLINQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780664075; x=1812200075;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9q2EOjEYzucfwZE27n9HHxlF2pa40wmeAG44iYdB/Qw=;
  b=CFSLINQyBuD4WA3xDauZz25hfOjzqw2W19iJsji+3GAED2/240tvHLZS
   wyZ0Rk7b4RJo31EE4loHbgCxCw9FsfbpIpTif/y3CLmU98+SttDSPG6Ku
   vzC/zkQyAocrsd/9fn+lUcFvXOGFp+v9MyeM/hhMGBirS1YGtgx3SaRbh
   4pKTNhy/TDrz+ekRoATm6uUFcJC41vuaI1zbgDU3vY4hcyAO1UpJe6XqM
   Y9Nr+PTSx3yblRW0x7iExzNt0c51nnUKj26pmAMqCPcBMbqQcpU0bNlIx
   kDuCAiq8YKv2nIftSLM3jIL9J6lb+UfjAetwU2h3lsZoGnC1E2ytRiafF
   A==;
X-CSE-ConnectionGUID: h/DsiCZ8Q8ecSifdnZ7BUw==
X-CSE-MsgGUID: Yq2tLr8sSEu6r27W05YhrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="80633527"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="80633527"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 05:54:35 -0700
X-CSE-ConnectionGUID: IIpzaYtdTY2an8B9zR2rGA==
X-CSE-MsgGUID: K5KPzYivQ8aX4FfQTCearQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="268766018"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2026 05:54:33 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id CA62895; Fri, 05 Jun 2026 14:54:32 +0200 (CEST)
Date: Fri, 5 Jun 2026 15:54:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andy Yan <andyshrk@163.com>
Cc: gregkh@linuxfoundation.org, badhri@google.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tcpm: Fix VDM type for Enter Mode commands
Message-ID: <aiLHBIYmexWvmlha@kuha>
References: <20260604105059.18750-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604105059.18750-1-andyshrk@163.com>

On Thu, Jun 04, 2026 at 06:50:24PM +0800, Andy Yan wrote:
> VDO() second parameter is VDM type (bit 15): 1 for SVDM, 0 for UVDM.
> Using 'vdo ? 2 : 1' corrupts SVID low bit when vdo is non-NULL
> (2 << 15 = BIT(16)). Enter Mode is always SVDM, hardcode to 1.
> 
> Fixes: 8face9aa57c8 ("usb: typec: Add parameter for the VDO to typec_altmode_enter()")
> Signed-off-by: Andy Yan <andyshrk@163.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
>  drivers/usb/typec/tcpm/tcpm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 55fee96d3342a..3674e1cdde57b 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -3061,7 +3061,7 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
>  	if (svdm_version < 0)
>  		return svdm_version;
>  
> -	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
> +	header = VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
>  	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP);
> @@ -3109,7 +3109,7 @@ static int tcpm_cable_altmode_enter(struct typec_altmode *altmode, enum typec_pl
>  	if (svdm_version < 0)
>  		return svdm_version;
>  
> -	header = VDO(altmode->svid, vdo ? 2 : 1, svdm_version, CMD_ENTER_MODE);
> +	header = VDO(altmode->svid, 1, svdm_version, CMD_ENTER_MODE);
>  	header |= VDO_OPOS(altmode->mode);
>  
>  	return tcpm_queue_vdm_unlocked(port, header, vdo, vdo ? 1 : 0, TCPC_TX_SOP_PRIME);
> -- 
> 2.43.0

-- 
heikki
