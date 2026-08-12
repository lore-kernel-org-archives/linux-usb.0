Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45535C6AE;
	Wed, 12 Aug 2026 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525348; cv=none; b=Pk3g0JjXM3cKp6/65UIvnJLBPyGwcn4tsf/ag4NKW30QMKe5i5jkKv5RzmjR5GQdAqjDND2Kf8hLso67wGGYl9/jkaVic6uXkc+FgG2d0BfCifr2GVrTtOe/VQ9PIMobCJE6T0DwoOa0/AIInDk2k0R7jysiCFl+Z2IzHiBw1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525348; c=relaxed/simple;
	bh=84Ca7HuCNmuKZ4KJvImhArvtkZE0orbR+KaxFrXTjC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kWgksvLC9I3gaFjwTi1+RK9MDM4DmGstoeGSJQEr+VIjsAzY28Vs9FQdbruXjzPnz0CA/aZKknYbOKq3jxkLaPxlj7NAiN1qTWQFJrhzd9sCPcPG0C6LlMpIbJ+xj8jTEOve+RaimYnhUBMxux685yePx+qBIQFRR3f/JVNfVUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/sbhZes; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/sbhZes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786525347; x=1818061347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=84Ca7HuCNmuKZ4KJvImhArvtkZE0orbR+KaxFrXTjC8=;
  b=l/sbhZesGgVF4Rv01tebHOWBbt5pZPBn/9ROg/AyxswCgIYfPK8rky1v
   2tGRs8SzItt6skUnQfRLmgBAhdc+oHRm/v5uk1tXtjSPWXo7FfGoMGm7+
   yYZMMGDxPKS3shP4OOqqIlim+AklpwdKOEotjaXL29OmPB8731IwTCTcj
   xid4va3LpFkurVqALNt/jfQOawBA3N3TW1IDUxywN+TzS1CEwan4UjuhV
   lV/cXQ6sf7oBmFKE2v1inuj6ZhL1TdSc6F/Z99RLwntexdYe4lv0keTD/
   Pn5G6t1yDknodL3MYGsRbpXmj0ckuGMW6ZAfBNAP0mLkzlZXJEC8w11Um
   g==;
X-CSE-ConnectionGUID: FNiANhTBQ4WOLL4yZIh00A==
X-CSE-MsgGUID: i5T5dtoZR6mLGfnLn2yuDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104454961"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="104454961"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 02:02:26 -0700
X-CSE-ConnectionGUID: D3LXyEvgTrarAk75+cUMrg==
X-CSE-MsgGUID: CrCzZPLzTPOceS3KBNdX4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259336031"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 12 Aug 2026 02:02:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8418E99; Wed, 12 Aug 2026 11:02:23 +0200 (CEST)
Date: Wed, 12 Aug 2026 11:02:23 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marian Rotariu <marian.c.rotariu@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	javier.carrasco@wolfvision.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: tipd: don't send GAID when probe fails in
 APP mode
Message-ID: <anw2n_2shZSin9NS@black.igk.intel.com>
References: <20260806085302.1307606-1-marian.c.rotariu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806085302.1307606-1-marian.c.rotariu@gmail.com>

On Thu, Aug 06, 2026 at 11:53:02AM +0300, Marian Rotariu wrote:
> When probe fails after the chip was already in APP mode (booted from
> EEPROM), the err_reset_controller path unconditionally calls
> tps->data->reset(), which for tps25750 sends the GAID 4CC command.
> GAID transitions the chip from APP back to PTCH, causing a second
> probe attempt that sees PTCH mode and tries to load the firmware from
> /lib/firmware, instead of reading the EEPROM as it should.
> 
> The err_reset_controller path can be triggered by -EPROBE_DEFER from
> the probe sequence. GAID should only be sent when the controller
> actually loaded firmware at probe time.
> 
> The abnormal behavior was seen on a tps25751d that has an EEPROM
> connected to it.
> 
> Fixes: d49f90822015 ("usb: typec: tipd: add init and reset functions to tipd_data")
> Signed-off-by: Marian Rotariu <marian.c.rotariu@gmail.com>

This needs the CC stable tag.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tipd/core.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 522f56742aa9..c2b235f3c225 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -1783,6 +1783,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  	const struct tipd_data *data;
>  	struct tps6598x *tps;
>  	struct fwnode_handle *fwnode;
> +	bool patch_loaded = false;
>  	u32 status;
>  	u32 vid = 0;
>  	int ret;
> @@ -1838,6 +1839,7 @@ static int tps6598x_probe(struct i2c_client *client)
>  		return ret;
>  
>  	if (ret == TPS_MODE_PTCH) {
> +		patch_loaded = true;
>  		ret = tps->data->init(tps);
>  		if (ret)
>  			return ret;
> @@ -1928,7 +1930,8 @@ static int tps6598x_probe(struct i2c_client *client)
>  	tps6598x_write64(tps, TPS_REG_INT_MASK1, 0);
>  err_reset_controller:
>  	/* Reset PD controller to remove any applied patch */
> -	tps->data->reset(tps);
> +	if (patch_loaded)
> +		tps->data->reset(tps);
>  
>  	return ret;
>  }
> -- 
> 2.53.0

-- 
heikki
