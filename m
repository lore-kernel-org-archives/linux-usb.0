Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1358B3EC82A;
	Mon, 24 Aug 2026 11:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787570826; cv=none; b=iMJjWDGT8GddZKZxvt+KF53aA6NyhqmIeDxUIQ+BIAoiRhaCh17w0iMs2a+NNGjgh1xxZc7oQIzXWb4udLU/d6oeZ9V/fWT1udVMNRn3BJXBmyVtgDyjiFYqRq5naIsdSwVMZvO/bzjKfwJjJyGF8oxmgLv+32okwiwJH8z5zF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787570826; c=relaxed/simple;
	bh=zEB9WGDLJiyK3r+bFM8aLhoZ/9+q1IjnHaw1k8Va+x0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Smhu3FIsGdOU57J0sHyQJaw84o3u9hw5rr3vOpjQ2FshDkGY3De1jN+J94qyhTmxBFX9jWdTNx85FkynoaEeAUdocVK52X/iCg2aewR90BldBVtniryVMlFzbkuAdxwju8F5RD8NG7q0AM/RopMZan5ymplPGF5QlDCGjUJ8Psc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/bIgTUA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/bIgTUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787570824; x=1819106824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zEB9WGDLJiyK3r+bFM8aLhoZ/9+q1IjnHaw1k8Va+x0=;
  b=m/bIgTUA+RoGwqKXtHb/Hn54v5UV5zEZwHAZL8RKMEMs8apyb/g8EWLu
   sYo4e3aEsH829whgrZlxORR6hPH+enkMF+kuhrGHKEWou6xavuIPWD9Rg
   BdlXKNDiq2xZocvuLmedrpoZr6kGRkMV16Em3l4JUsQeU8XnNJDSxtmtj
   ULOxhTkZekqmt/u/hMY3Il9vzFLUn/dBgagJmxQvAuaUoZxD+AcCecZT3
   txWG4RkcFSL7trV6YSqWjLRYJcnPJyDEGt5O6qmdOzCbaK63Knw/bEymQ
   Carzx9VdTSMxx1sGAmzg7iKcxDHgA+vrzcfOqIVJQb1jLVqW+0vMFaT1B
   w==;
X-CSE-ConnectionGUID: WqD1m9AVT/Ov1lYZnEJ6QQ==
X-CSE-MsgGUID: 6Jd2yfltQmygoeCACvK7YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="98694045"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="98694045"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 04:27:03 -0700
X-CSE-ConnectionGUID: TfdGJTHuTqyrC4JzogHEyQ==
X-CSE-MsgGUID: XQ/zbOWGQBGUpKFqwNQS+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="265207173"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 24 Aug 2026 04:27:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 5EAF599; Mon, 24 Aug 2026 13:27:00 +0200 (CEST)
Date: Mon, 24 Aug 2026 13:27:00 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Badhri Jagan Sridharan <badhri@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH] usb: typec: tcpm: Support native battery energy
 properties in battery AMS
Message-ID: <aowqhDVzh4IR8Bm3@black.igk.intel.com>
References: <20260820-tcpm-energy-props-upstream-v1-1-0a0167863848@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-tcpm-energy-props-upstream-v1-1-0a0167863848@google.com>

On Thu, Aug 20, 2026 at 09:17:58PM +0000, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Some fuel gauges report battery telemetry in energy rather than charge.
> Add support for querying native energy properties for Battery Status and
> Battery Capabilities AMS, falling back to calculating energy from charge
> and average voltage when primary properties are not supported.
> 
> +---------+--------------------+----------------------------------+
> | Sr. No. | Primary            | Fallback                         |
> +---------+--------------------+----------------------------------+
> | 1       | ENERGY_NOW         | CHARGE_NOW + VOLTAGE_AVG         |
> | 2       | ENERGY_FULL_DESIGN | CHARGE_FULL_DESIGN + VOLTAGE_AVG |
> | 3       | ENERGY_FULL        | CHARGE_FULL + VOLTAGE_AVG        |
> +---------+--------------------+----------------------------------+
> Note: All properties above are to be prefixed with POWER_SUPPLY_PROP_.
> 
> Closes: https://lore.kernel.org/all/amVJ1u67qHENBQ5l@venus/
> Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Assisted-by: Gemini:gemini-3.1-pro
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 57 +++++++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index a8cd1959c426..0d7dc0b51c87 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -410,6 +410,9 @@ struct pd_timings {
>  /* Convert microwatt to watt */
>  #define UW_TO_W(pow)				(div_u64((pow), 1000000))
>  
> +/* Convert micro-Watt-hours to USB PD energy (increments of 0.1Wh) */
> +#define UWH_TO_PD_ENERGY(energy)		(UW_TO_W((u64)(energy) * 10))
> +
>  /*
>   * As per USB PD Spec Rev 3.18 (Sec. 6.5.13.11), the number of fixed batteries
>   * that a port can be queried is restricted to 4.
> @@ -1580,8 +1583,7 @@ static u16 tcpm_charge_to_energy(int charge, int voltage)
>  {
>  	u64 energy = div_u64((u64)charge * voltage, 1000000);
>  
> -	/* Battery telemetry is reported in increments of 0.1Wh */
> -	return (u16)UW_TO_W(energy * 10);
> +	return UWH_TO_PD_ENERGY(energy);
>  }
>  
>  static int tcpm_pd_send_batt_status(struct tcpm_port *port)
> @@ -1612,16 +1614,17 @@ static int tcpm_pd_send_batt_status(struct tcpm_port *port)
>  	else
>  		batt_present = val.intval > 0;
>  
> -	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW,
> -					&val);
> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_NOW, &val);
>  	if (!ret) {
> -		charge_now = val.intval;
> -		ret = power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_VOLTAGE_AVG,
> -						&val);
> -		if (!ret)
> -			present_charge = tcpm_charge_to_energy(charge_now,
> -							       val.intval);
> +		present_charge = UWH_TO_PD_ENERGY(val.intval);
> +	} else {
> +		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_NOW, &val);
> +		if (!ret) {
> +			charge_now = val.intval;
> +			ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG, &val);
> +			if (!ret)
> +				present_charge = tcpm_charge_to_energy(charge_now, val.intval);
> +		}
>  	}
>  
>  	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_STATUS, &val);
> @@ -1678,19 +1681,31 @@ static int tcpm_pd_send_batt_cap(struct tcpm_port *port)
>  
>  	invalid_ref = false;
>  	batt = port->fixed_batt[batt_id];
> -	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG,
> -					&val);
> -	if (!ret) {
> -		vol = val.intval;
> -		ret = power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN,
> -						&val);
> +
> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN, &val);
> +	if (!ret)
> +		design_cap = UWH_TO_PD_ENERGY(val.intval);
> +
> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_ENERGY_FULL, &val);
> +	if (!ret)
> +		charge_cap = UWH_TO_PD_ENERGY(val.intval);
> +
> +	if (design_cap != BATTERY_PROPERTY_UNKNOWN && charge_cap != BATTERY_PROPERTY_UNKNOWN)
> +		goto send_cap;
> +
> +	ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_VOLTAGE_AVG, &val);
> +	if (ret)
> +		goto send_cap;
> +
> +	vol = val.intval;
> +	if (design_cap == BATTERY_PROPERTY_UNKNOWN) {
> +		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN, &val);
>  		if (!ret)
>  			design_cap = tcpm_charge_to_energy(val.intval, vol);
> +	}
>  
> -		ret = power_supply_get_property(batt,
> -						POWER_SUPPLY_PROP_CHARGE_FULL,
> -						&val);
> +	if (charge_cap == BATTERY_PROPERTY_UNKNOWN) {
> +		ret = power_supply_get_property(batt, POWER_SUPPLY_PROP_CHARGE_FULL, &val);
>  		if (!ret)
>  			charge_cap = tcpm_charge_to_energy(val.intval, vol);
>  	}
> 
> ---
> base-commit: e1e6e541c5c9cf548e9fdc35fc26808c82074440
> change-id: 20260820-tcpm-energy-props-upstream-a493353f0054
> 
> Best regards,
> -- 
> Amit Sunil Dhamne <amitsd@google.com>
> 

-- 
heikki
