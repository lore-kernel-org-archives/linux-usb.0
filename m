Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883AE41A50D;
	Mon, 27 Jul 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785159312; cv=none; b=mzddiWG2iUM2opz2oUMi2nVUD2PHVlRd9oL+rApuEgwFC9T24ZT3CnsRtIEABkKOv0HVLFx1pQor/Jou4UzMlwN1hi1EZMZ6OyDW8Hz9RLBrLEOjeJ6LHoAAsdDjZPG8bQeVQgiHFBkW9a+7/xlOpekVcs1yNoMcAmdc0JsZKQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785159312; c=relaxed/simple;
	bh=HydDCbf25c4IBePyWe5fOUhH5Tx/fRp3Pg5Yu0ROnV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha50SydiTE8tVokCH7uYgobMu5ApcHug645dJ3nNEmrda982tLzs6c5nRQMI+b+MTEx2NWl1+2BKrV/63MYvs6H/qyNAzAEUvrM3P6/pH8YPY+vEobZO1xh8o487P2xF718n9s9MO9jkkTfBEw61O0OULC+9WMWb7Ay4sVfl2HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUGAN2TR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUGAN2TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785159311; x=1816695311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HydDCbf25c4IBePyWe5fOUhH5Tx/fRp3Pg5Yu0ROnV8=;
  b=YUGAN2TR3+6bq+KNgF5XrdX3/eOL+XPMPza1OFIb63Fy702UnercCDPK
   nTJzxxqjrPmjwhO+ks012n797dPB1vRm7OaT4JPoEZ2Ruv9sdVRM60cWd
   YSEsn2LuiEItSZtMYgbvNUmoKJ5O5/8O+B82h13CKUK13qcvwxRMtKLzk
   7vZZgcpYhn75+KCq11d1h9mBi733yZFOBuMS4D5pbuy2ZSIcpQ3XJVctt
   0ttyFbCsHqDo/G3T5vTGcxjlgTGiU5WMQRNwhZavid9JsjfGdNozL7wAk
   uaUlEboEXE1RXzZ7FR1RvlH4gX4hG1PNvbvoW08l4YzleH3EZUKy6XVBA
   w==;
X-CSE-ConnectionGUID: sf5DdIo0T9Gh1uZyMZ5W1A==
X-CSE-MsgGUID: qmGMYE7CT3eNEqGI2CXqzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89395660"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="89395660"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 06:35:10 -0700
X-CSE-ConnectionGUID: Xzul9p9NShC4vgSi+4W1Ag==
X-CSE-MsgGUID: hmyfe6J4SaeDPjv0j7eJwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; 
   d="scan'208";a="262908979"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Jul 2026 06:35:08 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2B4C599; Mon, 27 Jul 2026 15:35:07 +0200 (CEST)
Date: Mon, 27 Jul 2026 15:35:07 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	cocci@inria.fr, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 33/36] usb: typec: fusb302: remove conditional return
 with no effect
Message-ID: <amdei6iyJ_N3l8Vs@black.igk.intel.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-34-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723184538.3888637-34-ekffu200098@gmail.com>

On Fri, Jul 24, 2026 at 03:45:35AM +0900, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/fusb302.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 3319f6a2b0c9..d0ab247b24bf 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -314,11 +314,7 @@ static int fusb302_i2c_mask_write(struct fusb302_chip *chip, u8 address,
>  		return ret;
>  	data &= ~mask;
>  	data |= value;
> -	ret = fusb302_i2c_write(chip, address, data);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return fusb302_i2c_write(chip, address, data);
>  }
>  
>  static int fusb302_i2c_set_bits(struct fusb302_chip *chip, u8 address,
> @@ -375,12 +371,8 @@ static int fusb302_init_interrupt(struct fusb302_chip *chip)
>  	ret = fusb302_i2c_write(chip, FUSB_REG_MASKB, 0xFF);
>  	if (ret < 0)
>  		return ret;
> -	ret = fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL0,
> -				     FUSB_REG_CONTROL0_INT_MASK);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return fusb302_i2c_clear_bits(chip, FUSB_REG_CONTROL0,
> +				      FUSB_REG_CONTROL0_INT_MASK);
>  }
>  
>  static int fusb302_set_power_mode(struct fusb302_chip *chip, u8 power_mode)
> -- 
> 2.43.0

-- 
heikki
