Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54A3DC87B;
	Mon, 13 Jul 2026 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783933793; cv=none; b=dPJyD7wNJ30nu5lJuNED7ZUSMPu3f6L0PfNPpAw1ZcWkMtskYvCl28VZaZPob5NpgVcL3+cfogyuXBhGa54cmdscrl4hvf24t9cMNvhCpnHrA9DkGGzlyxXj/1Pyg+5p0UAj/JGx9Z1KwHVokH1fTa6VaZdYCZtP4IrtvvJ/MzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783933793; c=relaxed/simple;
	bh=9H7taMZg24FxD+NmsjA3EDLGW4D15fGj4ZrvY86oZM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfbDoWFi2cjPp3R/178FUEWWZBXzqFSJlg7sLKo5ZEbVZs0OUQRUw/8uWhoC8UpJlts2gkFJ16sq2StNsDa+y4ymzpcKJh9I5RESQ/DZvH0ghwv4el59Y3sc2ddRIVomoKfq9htL1X7vI+IbMkj06XHuyi6Ol2KHwOTczy9ypmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTo5zxFk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTo5zxFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783933792; x=1815469792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9H7taMZg24FxD+NmsjA3EDLGW4D15fGj4ZrvY86oZM4=;
  b=dTo5zxFkpChp4o3e829s2JN94PF0C2qrwA9qNqRzOokVRyGJgRFNvMoT
   BsabVU0YLVk7v33O/gbqkr0Nr9stHh7mwU/nxHK1/4bgid6+woxSQaD4I
   85+Wyi+rsI4K6V+Cnzm4pSvwVBmkh97gY0zhZw8UdSF2HYdoRnLDfqHcv
   M5ye6SxLckdJFCdBb2J+uD2GGmgcv5eCj3qF3YALQuhcq1BX/07s8T1Ey
   jOp4DvJ5e6gDXqPgHZCPTCkOR/rF7nyHi72+1TJcubDW1yrZ7yhdnGRcl
   rXO7qKPq0O2X4jtQDjP+9lmU1bOLR5e1R6tbiIcCIUjZYmRyXMOFyWViO
   g==;
X-CSE-ConnectionGUID: cXc7lO4QREugyqonJv+8mg==
X-CSE-MsgGUID: 80rI9t21Sbe4EJ15QRXYnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84502576"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84502576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 02:09:51 -0700
X-CSE-ConnectionGUID: tSe1OMQjQ2qjKtZN0W07FQ==
X-CSE-MsgGUID: mSvvld82TM6gsU1i3UJtRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278753720"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 13 Jul 2026 02:09:49 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 1491F95; Mon, 13 Jul 2026 11:09:48 +0200 (CEST)
Date: Mon, 13 Jul 2026 12:09:46 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Subasri S <subasris1210@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Use %pe to print error pointers
Message-ID: <alSrWr8kdg7BVHzs@kuha>
References: <20260709-subasri-usb-ucsi-v1-v1-1-74bed201e489@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-subasri-usb-ucsi-v1-v1-1-74bed201e489@gmail.com>

On Thu, Jul 09, 2026 at 08:13:33AM +0530, Subasri S wrote:
> Use the %pe format specifier instead of %ld with PTR_ERR() for printing
> error pointers in ucsi_register_plug(), ucsi_register_cable(), and
> ucsi_register_partner(). This prints symbolic error names (e.g.
> -ENOMEM) instead of errno numbers (e.g. -12), making debug logs more
> readable.
> 
> This patch fixes coccinelle reported warnings:
> ./typec/ucsi/ucsi.c:1026:3-10: WARNING: Consider using %pe to print PTR_ERR()
> ./typec/ucsi/ucsi.c:1156:3-10: WARNING: Consider using %pe to print PTR_ERR()
> ./typec/ucsi/ucsi.c:967:3-10: WARNING: Consider using %pe to print PTR_ERR()
> 
> Signed-off-by: Subasri S <subasris1210@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 92166a3725b1..bf896e5cefc3 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -963,8 +963,8 @@ static int ucsi_register_plug(struct ucsi_connector *con)
>  	plug = typec_register_plug(con->cable, &desc);
>  	if (IS_ERR(plug)) {
>  		dev_err(con->ucsi->dev,
> -			"con%d: failed to register plug (%ld)\n", con->num,
> -			PTR_ERR(plug));
> +			"con%d: failed to register plug (%pe)\n", con->num,
> +			plug);
>  		return PTR_ERR(plug);
>  	}
>  
> @@ -1022,8 +1022,8 @@ static int ucsi_register_cable(struct ucsi_connector *con)
>  	cable = typec_register_cable(con->port, &desc);
>  	if (IS_ERR(cable)) {
>  		dev_err(con->ucsi->dev,
> -			"con%d: failed to register cable (%ld)\n", con->num,
> -			PTR_ERR(cable));
> +			"con%d: failed to register cable (%pe)\n", con->num,
> +			cable);
>  		return PTR_ERR(cable);
>  	}
>  
> @@ -1152,8 +1152,8 @@ static int ucsi_register_partner(struct ucsi_connector *con)
>  	partner = typec_register_partner(con->port, &desc);
>  	if (IS_ERR(partner)) {
>  		dev_err(con->ucsi->dev,
> -			"con%d: failed to register partner (%ld)\n", con->num,
> -			PTR_ERR(partner));
> +			"con%d: failed to register partner (%pe)\n", con->num,
> +			partner);
>  		return PTR_ERR(partner);
>  	}
>  
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260708-subasri-usb-ucsi-v1-34dde97e0b61
> 
> Best regards,
> -- 
> Subasri S <subasris1210@gmail.com>

-- 
heikki
