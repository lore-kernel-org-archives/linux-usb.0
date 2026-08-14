Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABD63EBF02;
	Fri, 14 Aug 2026 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703830; cv=none; b=jwYvHy4424h2+rhw0LP0piT/1IfNsuT+/WgXl2hjQ6OIeRt0oE6nqhlQqr8IyoN2+dTpaBGU5Y1rDYtZ0tvhkOy8D/nCrsYDcFR9yU7le30+JwahT/Gcn048lvth0cQ8lvpGawg6ChUO96LzhIopP+j+KQaC8hptC2TgJy2qOmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703830; c=relaxed/simple;
	bh=p69RouqMpALXee3UEOkmmOzgGp30XErIRh8g+uHdd9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxCa9rDFHjAs2VJJ4KI2IEnoCmD56BzAQTOSpzQo2l2aTZGugAEgbTiIvuKajM47Bg4MeRCrYvQywvg3nUNXOXRbHJAoFx4YNHiIGt6FLUmtGVEG1MworTfo90tdw44USaDWDFk/mzRY1ErSISkYz4/x9V0uH/SzAivxyCT5MNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJ2X7S/9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJ2X7S/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786703826; x=1818239826;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p69RouqMpALXee3UEOkmmOzgGp30XErIRh8g+uHdd9M=;
  b=TJ2X7S/98EgFS/OW8GR1AsVupkMhmHOTEsBr+OuQ8N+Zt8nUCtHpc3mB
   1s5rC+5tkd/f6BpozLMXnGdWLAKf1c3/gr1xed2rVMoKwy3GLBSkShpWa
   LKNLeDatZRlOxnIl9Va/6mmQasG4k0YQsC0ISU6luUdb1uJrFq7KJ0tIC
   aMXnsoJ23VBSrHmZxN1EW7BJvpvlhQD5MFEYyFabk5pCuJjfRGhm4SFiI
   hR6LUGUFkITvbGaPvVBWcEEhUuG5erRb5PXiON/uVVP6J4QEAcf7OeJ3G
   jIEJXOgPoCd3vvVBFp7DhVOvYXLYn9yHX8htzVZSimTXe1S4bXME+QFRd
   A==;
X-CSE-ConnectionGUID: WvW23hxYSWSTpv8ZngTjIA==
X-CSE-MsgGUID: qJ1dFs4xTCC7U3yCGO1aKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="91157715"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="91157715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 03:37:03 -0700
X-CSE-ConnectionGUID: 6C4pvVPiTqG+lndfzT1K+Q==
X-CSE-MsgGUID: A7t0kuppTuGEpPVbhyNc0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="260923733"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 03:37:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9528A99; Fri, 14 Aug 2026 12:37:00 +0200 (CEST)
Date: Fri, 14 Aug 2026 12:37:00 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: William Bright <william.bright@imd-tec.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Handle connectors already attached at
 init
Message-ID: <an7vzBaar_e_K3uk@black.igk.intel.com>
References: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-ucsi-cold-v1-1-72896abf51c5@imd-tec.com>

On Thu, Aug 13, 2026 at 10:38:40AM +0100, William Bright wrote:
> After a cold boot the PPM may already have a partner attached without a
> pending connector change to report. On a CYPD6125 the CCI register reads
> back 0 in ucsi_init(), so ucsi_connector_change() is never called and the
> Type-C mux is left unconfigured for the already-attached port.
> 
> Fix this by additionally checking the connector status of every
> connector and call ucsi_connector_change() for connectors that are
> already attached. Whilst also continuing to call ucsi_connector_change()
> for connectors that report a change via the CCI register.
> 
> Fixes: ce4c8d21054a ("usb: typec: ucsi: Fix connector check on init")
> Signed-off-by: William Bright <william.bright@imd-tec.com>

You need to CC stable.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index ecbda2a3783c..740ae4a14f7f 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -2136,8 +2136,11 @@ static int ucsi_init(struct ucsi *ucsi)
>  	mutex_unlock(&ucsi->ppm_lock);
>  	if (ret)
>  		return ret;
> -	if (UCSI_CCI_CONNECTOR(cci))
> -		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	for (i = 0; i < ucsi->cap.num_connectors; i++)
> +		if (UCSI_CONSTAT(&connector[i], CONNECTED) ||
> +		    UCSI_CCI_CONNECTOR(cci) == i + 1)
> +			ucsi_connector_change(ucsi, i + 1);
>  
>  	return 0;
>  
> 
> ---
> base-commit: 55431f6adac42f818a0c76594ce2c6c02fe1034d
> change-id: 20260813-ucsi-cold-b35e11991b7c
> 
> Best regards,
> -- 
> William Bright <william.bright@imd-tec.com>

-- 
heikki
