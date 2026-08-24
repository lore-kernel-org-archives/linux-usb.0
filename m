Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6327E41D21F;
	Mon, 24 Aug 2026 12:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576221; cv=none; b=bY2wQEBXNzKXt7JosllY84o8LFiPF9JHberDogGHwZ0OUHM7NHWR1BmhdmKukE42BeutrDFe/OSFkMrzT6Vc0OC2ZS05MiKKCkbOO+j9gOAzrMRUtm0ThrOgCxMILCra433oDu4lMJo3OwBFad9N9CmZLIztYbczwLrRUxrq72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576221; c=relaxed/simple;
	bh=GgpHYAT/E86CmboL+Xoz12ZWwa8Ooc4QRV1wrzF0WsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvaZAbJQNvEkjMiuVndrkE9yWDZRALmWPGZjpACiwbp+lyJRbqHhqvxnFCVpqqLmszu2eA56ehoFSm9EVWYj705U7BjeL4GnGscld+sfCw/W9as/7QXQfYFEqsdTu44IuTGuIyq6fNI4q7O8Wr5hWp58wMKfthdVxLhsmN0z41w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxNinfIo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxNinfIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787576219; x=1819112219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GgpHYAT/E86CmboL+Xoz12ZWwa8Ooc4QRV1wrzF0WsQ=;
  b=JxNinfIoHwRqJyuEaKwWDgdaHUstLJEpwoNF9MWVW5Yj1YV4c9Nn+j0d
   HDNvLsZjYvYC+u4d1nfkTlueJIDgOMaT90wUmHwXlHnjWfyFTR9lgYzH/
   2dhsMk+MNc2U5qcD/nzwWQzrG7dUbUqY8pOfmTsOzH2aYRSdWCq5H43Fx
   uyCuflQJn6Qik3WSpLqOkY5vCXUx35GMftjEQEsr1oZkyCCCk32jvWZXl
   E3qHALJedHigv+SKWJQwxKlHrxDxWn6+PzuBbmNNZqNflusrwFrtEtTvt
   YBX2slk4puqOvGc7ADR2Y8ljO99npHb2yj4dt2EDhDoocb8KHTdfgFZXZ
   w==;
X-CSE-ConnectionGUID: 4Q4DB1I0S8WR9zrTmb54gw==
X-CSE-MsgGUID: vdhqwfPqStS6wArwUpWVJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="110808580"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="110808580"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 05:56:58 -0700
X-CSE-ConnectionGUID: GQg1CTjrRGyeN7lykMCahw==
X-CSE-MsgGUID: ZIO7cRbWT8G6R45+CbAyPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="267555812"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 24 Aug 2026 05:56:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 92B9C99; Mon, 24 Aug 2026 14:56:54 +0200 (CEST)
Date: Mon, 24 Aug 2026 14:56:54 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply
 regulators
Message-ID: <aow_lhZd3etwHVzl@black.igk.intel.com>
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net>

On Fri, Aug 21, 2026 at 08:16:35PM +0400, Alexey Charkov wrote:
> HD3SS3220 requires VDD5 input to be present 2ms before VCC33 is applied,
> or else it gets backpowered via the 3.3V rail in a non-functional state
> and wedges the I2C bus, bringing down all devices on it.
> 
> Enable both regulators in the datasheet prescribed sequence if provided.
> 
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index d0de5a2488f9..b53455abc048 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -49,6 +49,9 @@
>  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP		BIT(4)
>  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP		(BIT(5) | BIT(4))
>  
> +/* Minimum time VDD5 has to be stable before VCC33 starts ramping up */
> +#define HD3SS3220_TVDD5V_PG_US				2000
> +
>  struct hd3ss3220 {
>  	struct device *dev;
>  	struct regmap *regmap;
> @@ -358,6 +361,31 @@ static irqreturn_t hd3ss3220_id_isr(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +/*
> + * Bring both supplies up in the order the datasheet asks for. Powering VCC33
> + * first can back-power the device in a non-functioning state, which grounds
> + * the I2C bus and takes both this device and any others on the same bus down
> + */
> +static int hd3ss3220_power_up(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(dev, "vdd5");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable VDD5\n");
> +
> +	/* Nothing to stagger against unless the board describes both rails */
> +	if (device_property_present(dev, "vdd5-supply") &&
> +	    device_property_present(dev, "vcc33-supply"))
> +		fsleep(HD3SS3220_TVDD5V_PG_US);
> +
> +	ret = devm_regulator_get_enable(dev, "vcc33");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable VCC33\n");
> +
> +	return 0;
> +}
> +
>  static int hd3ss3220_probe(struct i2c_client *client)
>  {
>  	struct typec_capability typec_cap = { };
> @@ -379,6 +407,10 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	if (IS_ERR(hd3ss3220->regmap))
>  		return PTR_ERR(hd3ss3220->regmap);
>  
> +	ret = hd3ss3220_power_up(hd3ss3220->dev);
> +	if (ret)
> +		return ret;
> +
>  	/* For backward compatibility check the connector child node first */
>  	connector = device_get_named_child_node(hd3ss3220->dev, "connector");
>  	if (connector) {
> 
> -- 
> 2.54.0

-- 
heikki
