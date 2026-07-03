Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3A412264;
	Fri,  3 Jul 2026 15:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091875; cv=none; b=AUwwPBubhxQL0H1WuvoBlPtjoSO4UGLcizl+vA5ZSg0xqOlG/ikD7X5w33V96Oi9tYhSUtT2a6ACxZAFXpVit06+LtlR5zPtI+lGdayLvVJnFbIzmqrv6weigCkQcgXg29VE5WkdSO6pFCRjJrhN3fINsNcaiKCA2FeDXzE8kAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091875; c=relaxed/simple;
	bh=DTFuba9lMW26ABwlpQpgO9/+ZuHu6wq9laMF1cbh4mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Al07Am25TgW7ensYUGFWA8rhacniLAYMCseIvniMQUzSyEJkMXz7HwwRHMTNp+c0xjXp0xTGHjdCxZqmFo8FEDYIX24uNe4Latap5N4P9IFfBaLlB77VPsqYOycL5Du+YGlpqCYWTfLdD6Z/C1MZ0hDWL8wDfAhWZG4rsEk3H5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RRZHU1op; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RRZHU1op"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783091873; x=1814627873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DTFuba9lMW26ABwlpQpgO9/+ZuHu6wq9laMF1cbh4mw=;
  b=RRZHU1opOh3DqXGdPGCPpcB7B5eaUs0NasU8AJZH/VX4+N2rFQgFreuz
   MZWsHlNkfeqj6FuiR04T8BmqGuJ7Sn6KDsNcUwdv0HJ7tQ/1sBRSHjAeX
   ayvbYf30fRH/wrOML1HobNjbz0zJTdc0gRforqLXhlRzkCATfXryNdZS0
   /vgXIVLh4YPPgJM+URwfa/CzV/SFJGoCdR0e/oHyIB6bHDla9RbvRNLEr
   g46mfe1titm5m1pQZqXINmBjbk94oOoK+UPTye/C/J1SzEhR2VCAQsFu1
   HvJNqOJC8I+b6Wm++b0rYp4xP13VpxMen0+pCrpkyPnttW/JacTWoicyf
   A==;
X-CSE-ConnectionGUID: E1x8GEUmRuiriWM4jqHERg==
X-CSE-MsgGUID: +UhuGefMS06M6zuFBBXg9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="71368719"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71368719"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 08:17:53 -0700
X-CSE-ConnectionGUID: 6BmQNrH6RaG8hlBYsuBVmQ==
X-CSE-MsgGUID: z0kHvM2JSM2u2yuBTLLQCA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jul 2026 08:17:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id E97A195; Fri, 03 Jul 2026 17:17:49 +0200 (CEST)
Date: Fri, 3 Jul 2026 18:17:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: typec: tipd: add TPS66993 support
Message-ID: <akfSnKaxki9FCDww@kuha>
References: <20260702190527.1820671-1-radhey.shyam.pandey@amd.com>
 <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702190527.1820671-4-radhey.shyam.pandey@amd.com>

Hi Radhey,

On Fri, Jul 03, 2026 at 12:35:27AM +0530, Radhey Shyam Pandey wrote:
> Derive power status from the STATUS register (0x1A) now that TPS66993
> deprecates the Power_Status register (0x3F). Add support for the "APP1"
> mode string. TPS66993 controller is configured in polling mode and only
> type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
> VEK385 Evaluation Kit.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> ---
> Changes for v2:
> - New patch to add TPS66993 driver support.
> ---
>  drivers/usb/typec/tipd/core.c | 65 +++++++++++++++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index a6cb233a055d..d2394d23a2dc 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -130,6 +130,7 @@ enum {
>  	TPS_MODE_BIST,
>  	TPS_MODE_DISC,
>  	TPS_MODE_PTCH,
> +	TPS_MODE_APP1,
>  };
>  
>  static const char *const modes[] = {
> @@ -138,6 +139,7 @@ static const char *const modes[] = {
>  	[TPS_MODE_BIST]	= "BIST",
>  	[TPS_MODE_DISC]	= "DISC",
>  	[TPS_MODE_PTCH] = "PTCH",
> +	[TPS_MODE_APP1]	= "APP1",
>  };
>  
>  /* Unrecognized commands will be replaced with "!CMD" */
> @@ -631,6 +633,35 @@ static bool tps6598x_read_power_status(struct tps6598x *tps)
>  	return true;
>  }
>  
> +/*
> + * TPS66993 deprecated Power_Status register (0x3F). BC1.2 is not supported
> + * and the remaining bits are redundant with STATUS register (0x1A).
> + * Synthesize pwr_status from the already-read STATUS register.
> + */
> +static bool tps66993_read_power_status(struct tps6598x *tps)
> +{
> +	u16 pwr_status = 0;
> +
> +	/* Same masks as TPS_POWER_STATUS_CONNECTION() / SOURCESINK() / PWROPMODE() in tps6598x.h */
> +	if (tps->status & TPS_STATUS_PLUG_PRESENT)
> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_CONNECTION_MASK, 1);
> +
> +	/* SOURCESINK: 1=sink; STATUS.PortRole 1=source, opposite convention */
> +	if (!TPS_STATUS_TO_TYPEC_PORTROLE(tps->status))
> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_SOURCESINK_MASK, 1);
> +
> +	if (TPS_STATUS_VBUS_STATUS(tps->status) == TPS_STATUS_VBUS_STATUS_PD)
> +		pwr_status |= FIELD_PREP(TPS_POWER_STATUS_TYPEC_CURRENT_MASK,
> +					 TPS_POWER_STATUS_TYPEC_CURRENT_PD);
> +
> +	tps->pwr_status = pwr_status;
> +
> +	if (tps->data->trace_power_status)
> +		tps->data->trace_power_status(pwr_status);

Is the condition necesary? Is it possible to get here without that
callback?

Thanks,

> +	return true;
> +}
> +
>  static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
>  {
>  	int ret;
> @@ -1026,6 +1057,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> +	tps->status = status;
> +
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
> @@ -1034,9 +1067,15 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  		if (!tps->data->read_data_status(tps))
>  			goto err_unlock;
>  
> -	/* Handle plug insert or removal */
> -	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
> +	/*
> +	 * Refresh power status before connect - needed for TPS66993 which
> +	 * synthesizes pwr_status from STATUS and never gets POWER_STATUS_UPDATE.
> +	 */
> +	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT) {
> +		if (!tps->data->read_power_status(tps))
> +			goto err_unlock;
>  		tps6598x_handle_plug_event(tps, status);
> +	}
>  
>  err_unlock:
>  	mutex_unlock(&tps->lock);
> @@ -1072,6 +1111,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
>  
>  	switch (ret) {
>  	case TPS_MODE_APP:
> +	case TPS_MODE_APP1:
>  	case TPS_MODE_PTCH:
>  		return ret;
>  	case TPS_MODE_BOOT:
> @@ -1810,6 +1850,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  		goto err_clear_mask;
>  	}
>  
> +	tps->status = status;
> +
>  	/*
>  	 * This fwnode has a "compatible" property, but is never populated as a
>  	 * struct device. Instead we simply parse it to read the properties.
> @@ -2004,6 +2046,24 @@ static const struct tipd_data tps6598x_data = {
>  	.connect = tps6598x_connect,
>  };
>  
> +static const struct tipd_data tps66993_data = {
> +	.irq_handler = tps6598x_interrupt,
> +	.irq_mask1 = TPS_REG_INT_DATA_STATUS_UPDATE |
> +		     TPS_REG_INT_PLUG_EVENT,
> +	.tps_struct_size = sizeof(struct tps6598x),
> +	.register_port = tps6598x_register_port,
> +	.unregister_port = tps6598x_unregister_port,
> +	.trace_data_status = trace_tps6598x_data_status,
> +	.trace_power_status = trace_tps6598x_power_status,
> +	.trace_status = trace_tps6598x_status,
> +	.apply_patch = tps6598x_apply_patch,
> +	.init = tps6598x_init,
> +	.read_data_status = tps6598x_read_data_status,
> +	.read_power_status = tps66993_read_power_status,
> +	.reset = tps6598x_reset,
> +	.connect = tps6598x_connect,
> +};
> +
>  static const struct tipd_data tps25750_data = {
>  	.irq_handler = tps25750_interrupt,
>  	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
> @@ -2025,6 +2085,7 @@ static const struct tipd_data tps25750_data = {
>  
>  static const struct of_device_id tps6598x_of_match[] = {
>  	{ .compatible = "ti,tps6598x", &tps6598x_data},
> +	{ .compatible = "ti,tps66993", &tps66993_data},
>  	{ .compatible = "apple,cd321x", &cd321x_data},
>  	{ .compatible = "ti,tps25750", &tps25750_data},
>  	{}
> -- 
> 2.43.0

-- 
heikki
