Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3A1273D76;
	Mon, 23 Feb 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858524; cv=none; b=KiGXxZx4IbQrzskb0z9qaNLVpLQIhE11sMianXfQjbLQWsZk1CYSftA8OXLWZ7v0vROX/0FmkcjGseYVTCKlf59QK8T5+ckeS8+9K/ZWaQDGx1FVs1+uDTPThmjFXWXNwb7hDtttxp20+/tYEgSvoYseg1c0tNUv6uXLaAuGQUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858524; c=relaxed/simple;
	bh=5IbrP43YuwUMRwawyvo7eC4LnK4C/CdOF8gk03etGpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxRtKpqxox5mEJoWEFllde+fzKwi9Tf9u9JkInUd/WFhXU3oXI+Dgrep/tiw1yA2OIuYw/e9hjQQ5QYQj6rsGZEMEerfc7N61tTsHq3uOX2upkQqkUHFjZag5xEn/3M7kOX8otie7pXRbxxGR57tX8IcCYH9LjrOPfN2FfOISM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrMxQk1D; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrMxQk1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771858522; x=1803394522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5IbrP43YuwUMRwawyvo7eC4LnK4C/CdOF8gk03etGpw=;
  b=PrMxQk1Dz2BaNA+tuh2hBuDFSbZvbWQLDj4/UY+ucT/IQhe92PKLVWNk
   j66vbB33xtquG4jBTpPNLeF1CfQud3t12Hc4wF5IKDWPVZpfYcxTRnKHZ
   X38UTEK7uo1b5XGmz+ENBoUpEu34OfUOTJzgu4gB7JVYQoPT8ds/I6WCZ
   YH8sNDoRPL7NJUh6uOKeRHpCesfzyl+r0zs72RBRBvkxcIgv7gvzyiq3W
   uKuFBqWG4uBj7qolDhD9Ol8cFw0yXhljYxzmutxH9mz1TVTBxbEXyywiH
   G5T7NmM/2LORqIU/Movhnq597WUbeQoyG/jVqvs0cSmk5auRU2qv6E65R
   A==;
X-CSE-ConnectionGUID: 1cfmq2klTjemsv33EHB2Qw==
X-CSE-MsgGUID: r/qgdBA/S+OxbgH6N3NLGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="90261324"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="90261324"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:55:21 -0800
X-CSE-ConnectionGUID: QGgQYAeuRXC9C/lsAvv2XQ==
X-CSE-MsgGUID: QTmotb0FQC+7y4arImpo1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253306556"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO kuha) ([10.124.222.123])
  by orviesa001.jf.intel.com with SMTP; 23 Feb 2026 06:55:19 -0800
Received: by kuha (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:54:44 +0200
Date: Mon, 23 Feb 2026 16:54:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 1/2] usb: typec: mux: avoid duplicated orientation
 switches
Message-ID: <aZxqNJCsUMaBlMmB@kuha>
References: <20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com>
 <20260213-typec-mux-duplication-fix-v1-1-70076a7c5691@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213-typec-mux-duplication-fix-v1-1-70076a7c5691@collabora.com>

Hi Sebastian,

Fri, Feb 13, 2026 at 08:23:28PM +0100, Sebastian Reichel wrote:
> Some devices use combo PHYs (i.e. USB3 + DisplayPort), which also
> handle the orientation mux. These PHYs are referenced twice from
> the USB-C connector (USB super-speed lines and SBU/AUX lines)
> resulting in the switch being configured twice. Avoid this by
> dropping duplicates.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/usb/typec/mux.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
> index 182c902c42f6..db35b7398343 100644
> --- a/drivers/usb/typec/mux.c
> +++ b/drivers/usb/typec/mux.c
> @@ -72,9 +72,9 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  {
>  	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
>  	struct typec_switch *sw;
> +	int i, j, k;
>  	int count;
>  	int err;
> -	int i;
>  
>  	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
>  	if (!sw)
> @@ -96,6 +96,18 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
>  		}
>  	}
>  
> +	/* eliminate duplicates */
> +	for (i = 0; i < count; i++) {
> +		for (j = i + 1; j < count; j++) {
> +			if (sw_devs[j] == sw_devs[i]) {
> +				put_device(&sw_devs[j]->dev);
> +				for (k = j; k < count; k++)
> +					sw_devs[k] = sw_devs[k+1];
> +				count--;
> +			}
> +		}
> +	}

I think that check could be done in typec_switch_match(). Just pass
that sw_devs to it as "data":

        -        count = fwnode_connection_find_matches(fwnode, "orientation-switch", NULL,
        +        count = fwnode_connection_find_matches(fwnode, "orientation-switch", sw_devs,

And then in typec_switch_match(), probable as the second last step:

         static void *typec_switch_match(const struct fwnode_handle *fwnode,
                                         const char *id, void *data)
         {
        +       struct typec_switch_dev *sw_devs = data;
        +       int i;
                ...
                dev = class_find_device(&typec_mux_class, NULL, fwnode,
                                        switch_fwnode_match);

        +	/* Skip duplicates */
        +       for (i = 0; i < TYPEC_MUX_MAX_DEVS; i++)
        +               if (to_typec_switch_dev(dev) == sw_devs[i]) {
        +                       put_device(dev);
        +                       return NULL;
        +               }

                return dev ? to_typec_switch_dev(dev) : ERR_PTR(-EPROBE_DEFER);
         }

thanks,

-- 
heikki
