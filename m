Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D543BCD33;
	Fri,  3 Jul 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091684; cv=none; b=jKtaEmQihxbHDS8suB98j5r66JurFDh+SiwIsmkgh4d+XsrG2i7krD8lcCv7jTLNrdKLRQpcguRgTsMKZzH5hljC1NSgSiP+R7ZMhAivqhY2hZ7Ed8QtVwzfNQBFNd9y7uCnfHO8gz31mxOKLlLYpLYpYbtzjDC8WjxKoiqWqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091684; c=relaxed/simple;
	bh=h2guPwXcg6MWY2DPLLcgvWBlF0osHOiMvd8iZJLBcQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoqLKtrq4LfF6k3GX724pqjiBYHxMs1SKOTaiD4GtiDXJkq4buyYEdYDkB1UKlOPV3tbfo5Y7fXYLvva83SCAV61Rbv+rb722C528msX0cfwku8BhLgGjWBlQNP3sVw4Ex18U5+YVUp0FCkJpO4FgeOB/X1grk87cQUiEzpZrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=egDrU3bx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egDrU3bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783091682; x=1814627682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=h2guPwXcg6MWY2DPLLcgvWBlF0osHOiMvd8iZJLBcQI=;
  b=egDrU3bxP6n5QPphMS/qEuIjYcTWkWWo4nWm555BOn7Qu9oGfv4DqIXo
   U8UKYefw7ih+2aTiqL0XZcmIQq3bqj4Loy+5ZZ2vqcVehTZIhK2gJTP1e
   RtE3ffCC2DepAo+KhiYArj+4gX0ZyFmhMPa9yRq3KqWtvY7B3boQ67tsz
   GqCZNY/6PLkIIghbRp1uJO5bavXTDyD3+x1nbEBYkOUj2sX9i6xKK4C6v
   /lp2ZUDTb+6zSaLZx19aKcZ+cxFd0UKF55feKJvwkF5JSkrThlLfokRKX
   6CFULjihC/vuUsADt4zSFVtlUmtIXn0S2W6RXopbaNPvKxDHVSs1lyGa8
   w==;
X-CSE-ConnectionGUID: Q3p2WWnsSUOr8HklZ8gi1g==
X-CSE-MsgGUID: t/YOnMVWS3yP9k+EfIwSZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87672812"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87672812"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:14:41 -0700
X-CSE-ConnectionGUID: TFF5+gmJTQyHoE8jVg4OAg==
X-CSE-MsgGUID: IfT2gKRJQvCABz9sKgTR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248686783"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jul 2026 08:14:38 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 613C495; Fri, 03 Jul 2026 17:14:37 +0200 (CEST)
Date: Fri, 3 Jul 2026 18:14:35 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: tipd: add read_power_status callback
 to tipd_data
Message-ID: <akfR2w7zX-gBCLU1@kuha>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
 <20260702190527.1820671-3-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702190527.1820671-3-radhey.shyam.pandey@amd.com>

On Fri, Jul 03, 2026 at 12:35:26AM +0530, Radhey Shyam Pandey wrote:
> Convert direct tps6598x_read_power_status() calls to use an indirect
> read_power_status callback through tipd_data. This allows variants
> (e.g. TPS66993) to provide their own power status reading logic while
> keeping existing behavior unchanged for TPS6598x, CD321x, and TPS25750.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v2:
> - New patch to add TPS66993 driver support.
> ---
>  drivers/usb/typec/tipd/core.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index d5ee0af9058b..a6cb233a055d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -159,6 +159,7 @@ struct tipd_data {
>  	int (*init)(struct tps6598x *tps);
>  	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
>  	bool (*read_data_status)(struct tps6598x *tps);
> +	bool (*read_power_status)(struct tps6598x *tps);
>  	int (*reset)(struct tps6598x *tps);
>  	int (*connect)(struct tps6598x *tps, u32 status);
>  };
> @@ -897,7 +898,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
>  		goto err_unlock;
>  
>  	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE) {
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
>  		if (TPS_POWER_STATUS_PWROPMODE(tps->pwr_status) == TYPEC_PWR_MODE_PD) {
>  			if (tps6598x_read_partner_identity(tps)) {
> @@ -952,7 +953,7 @@ static irqreturn_t tps25750_interrupt(int irq, void *data)
>  		goto err_clear_ints;
>  
>  	if (event[0] & TPS_REG_INT_POWER_STATUS_UPDATE)
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_clear_ints;
>  
>  	if (event[0] & TPS_REG_INT_DATA_STATUS_UPDATE)
> @@ -1026,7 +1027,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  		goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
>  
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
> @@ -1836,7 +1837,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  
>  	if (status & TPS_STATUS_PLUG_PRESENT) {
>  		ret = -EINVAL;
> -		if (!tps6598x_read_power_status(tps))
> +		if (!tps->data->read_power_status(tps))
>  			goto err_unregister_port;
>  		if (!tps->data->read_data_status(tps))
>  			goto err_unregister_port;
> @@ -1978,6 +1979,7 @@ static const struct tipd_data cd321x_data = {
>  	.trace_status = trace_tps6598x_status,
>  	.init = cd321x_init,
>  	.read_data_status = cd321x_read_data_status,
> +	.read_power_status = tps6598x_read_power_status,
>  	.reset = cd321x_reset,
>  	.switch_power_state = cd321x_switch_power_state,
>  	.connect = cd321x_connect,
> @@ -1997,6 +1999,7 @@ static const struct tipd_data tps6598x_data = {
>  	.apply_patch = tps6598x_apply_patch,
>  	.init = tps6598x_init,
>  	.read_data_status = tps6598x_read_data_status,
> +	.read_power_status = tps6598x_read_power_status,
>  	.reset = tps6598x_reset,
>  	.connect = tps6598x_connect,
>  };
> @@ -2015,6 +2018,7 @@ static const struct tipd_data tps25750_data = {
>  	.apply_patch = tps25750_apply_patch,
>  	.init = tps25750_init,
>  	.read_data_status = tps6598x_read_data_status,
> +	.read_power_status = tps6598x_read_power_status,
>  	.reset = tps25750_reset,
>  	.connect = tps6598x_connect,
>  };
> -- 
> 2.43.0

-- 
heikki
