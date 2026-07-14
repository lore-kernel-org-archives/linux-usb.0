Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C5745BD7B;
	Tue, 14 Jul 2026 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035859; cv=none; b=CKFrWFTeX/sobc9D5zbXsbqGtmeNB0eCLziMD2M+ZN7aextwW/GwQupkVyrI8VNdYWYwIMi2Qt4QGx20VzJDKwSJAHYp4TXOF5jBM0tQpobbC6tGv1dFlBmZO5H6CaJylSI7mIVrCdKYO7q8Rnn28GYgKJ3WY6AjRWm733GFKIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035859; c=relaxed/simple;
	bh=Ml0FqN1kKr+qcud1BCFPEmfFhl22ioFZO9ZvEfTHiY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpgATIsl/HpoctUZWdCD1joqQdXSR7lxkYlaJI2QHmhBk6b2/jZ5IayJRYL7PSzozth93ez4eJuZL94TQZunWKYslCDoww95Dj612iMLTBVMh/tJMBbt3UcQBk+OlWRkS+om0UJAknn78RFS7B4CytdcCWppdyL8Y6tk9bkYgpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZeYtZyg; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZeYtZyg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784035856; x=1815571856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ml0FqN1kKr+qcud1BCFPEmfFhl22ioFZO9ZvEfTHiY8=;
  b=HZeYtZygsj2JRobPZh6kd0AhxohyCaKhMk64zb3UX3rDLceBm5cMymUU
   3wApi20AUuwWQI2IHgWIHeMsiuCMNM1nGtc/vOOTX33j+vvucSNVwxkpI
   nwjKju9D2yiyGG1k9zxEDVA+5TaUkaWcNefL+rVka+FH85u4hldpxexxD
   lScxilyT0Ygls4iuuKLAraLqdFDKADbC5Lk7l86gZYiLdEIhJc767Hyrj
   qXm+KvpHNF1HKhhiP3WN5HgeB3B8GYr5UgM89oVA+wzTOYamF1sbBVY9m
   HaDzcvg/cCJnc25BXHyVC4LriLfAyg/LPAYE/PYXJ+msFlfzD1xE0ekmv
   Q==;
X-CSE-ConnectionGUID: A3auIXGzQua/exqnQP2WmA==
X-CSE-MsgGUID: eWyLELvgR+uytQlFAdsw6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95008992"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95008992"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 06:30:53 -0700
X-CSE-ConnectionGUID: vsb0KjZSRiuKBg8AC0aZFA==
X-CSE-MsgGUID: v8dTcYQpS+yW7FARNBnujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="249502666"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2026 06:30:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8859D95; Tue, 14 Jul 2026 15:30:49 +0200 (CEST)
Date: Tue, 14 Jul 2026 16:30:47 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	git@amd.com
Subject: Re: [PATCH v3 3/3] usb: typec: tipd: add TPS66993 support
Message-ID: <alY6B_9kGuD-0b8-@kuha>
References: <20260714061820.537792-1-radhey.shyam.pandey@amd.com>
 <20260714061820.537792-4-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714061820.537792-4-radhey.shyam.pandey@amd.com>

On Tue, Jul 14, 2026 at 11:48:19AM +0530, Radhey Shyam Pandey wrote:
> Derive power status from the STATUS register (0x1A) now that TPS66993
> deprecates the Power_Status register (0x3F). Add support for the "APP1"
> mode string. TPS66993 controller is configured in polling mode and only
> type-c flip orientation feature is supported on AMD Versal AI Edge Gen 2
> VEK385 Evaluation Kit.
> 
> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes for v3:
> -  Remove the unnecessary if (tps->data->trace_power_status) guard and
>    call the trace callback unconditionally, since every tipd_data entry
>    always provides it.
> 
> Changes for v2:
> - New patch to add TPS66993 driver support.
> ---
>  drivers/usb/typec/tipd/core.c | 64 +++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 9097b0d40a71..522f56742aa9 100644
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
> @@ -631,6 +633,34 @@ static bool tps6598x_read_power_status(struct tps6598x *tps)
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
> +	tps->data->trace_power_status(pwr_status);
> +
> +	return true;
> +}
> +
>  static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
>  {
>  	int ret;
> @@ -1026,6 +1056,8 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
>  	if (!tps6598x_read_status(tps, &status))
>  		goto err_unlock;
>  
> +	tps->status = status;
> +
>  	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
>  		if (!tps->data->read_power_status(tps))
>  			goto err_unlock;
> @@ -1034,9 +1066,15 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
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
> @@ -1072,6 +1110,7 @@ static int tps6598x_check_mode(struct tps6598x *tps)
>  
>  	switch (ret) {
>  	case TPS_MODE_APP:
> +	case TPS_MODE_APP1:
>  	case TPS_MODE_PTCH:
>  		return ret;
>  	case TPS_MODE_BOOT:
> @@ -1813,6 +1852,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  		goto err_clear_mask;
>  	}
>  
> +	tps->status = status;
> +
>  	/*
>  	 * This fwnode has a "compatible" property, but is never populated as a
>  	 * struct device. Instead we simply parse it to read the properties.
> @@ -2007,6 +2048,24 @@ static const struct tipd_data tps6598x_data = {
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
> @@ -2028,6 +2087,7 @@ static const struct tipd_data tps25750_data = {
>  
>  static const struct of_device_id tps6598x_of_match[] = {
>  	{ .compatible = "ti,tps6598x", &tps6598x_data},
> +	{ .compatible = "ti,tps66993", &tps66993_data},
>  	{ .compatible = "apple,cd321x", &cd321x_data},
>  	{ .compatible = "ti,tps25750", &tps25750_data},
>  	{}
> -- 
> 2.49.1

-- 
heikki
