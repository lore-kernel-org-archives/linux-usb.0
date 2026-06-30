Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF40392823;
	Tue, 30 Jun 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813178; cv=none; b=sPmIYrslnqUSMcd7B9QQmDWcHykqm3uAjwX1vOsvJK0lb42xVKSl70NCzYXOXoBcvAqUS84hNtNJjdjqva1qTX5yPuhOJC6YI/RwULA2xsppFoI0nczm6xKiCw7w/ZSt2SDo7kwNdQw+g+SYI1zchIzf6KcTL4/zcfOz5JwcnEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813178; c=relaxed/simple;
	bh=URimKHKK4TzlFiMj9FPPeFJAuVBNGtuyJYKG2pBd02k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsRLQUo3AYYaNIWQbEsqBhHtd+2/taA13s3OWbgQL59dOmNmsQMxVYAobpBypHdE6amnuVgQV8I1y6+0hCT9idLr83iUc0b2Js2earWrrfTi6P546LfulQwvcu5kqA/g/HowFJgj3FtPvC91MfuYFDNWdNnGFZR8kC2DFCCqddQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CtQaF605; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CtQaF605"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782813177; x=1814349177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=URimKHKK4TzlFiMj9FPPeFJAuVBNGtuyJYKG2pBd02k=;
  b=CtQaF605WfJtCTXLr/u/L53Ow3+bx5ObPG9JZr3tBlUbAanDDaZGE+CP
   +fQk15bOV9SZ4TC1j0Bu2yQDucNpKF4qkJTF3j3itvh9bV677xGKzdcuh
   8Cu/q8S+bBE2nLP4VHIXbZAnyP6FWEobRJHAq1mIRaVwV9sRXS7P6ZnST
   WvlQm3zckWbaJ0/dk8oKUFx4g2KjL7GBSmScY7qI5s2XADQshEzEZ61K1
   Bobd16tzHj5ab8UXe36y1nPN2UQTT1IYBjEIDsdpsCvDS1Bc9SlPrC5NZ
   u0aXJ9GMltsG6WDRjiy8ugo1DS+e9GF6qKmhmtrthlZLBwgU5cQmCqt2W
   Q==;
X-CSE-ConnectionGUID: PuVdIlzBQ3CXz4thh0oQyQ==
X-CSE-MsgGUID: +u7dOcE/QbGF53SDBotYnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="95028138"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="95028138"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 02:52:57 -0700
X-CSE-ConnectionGUID: nWQAsKLURECnr1SruYehtA==
X-CSE-MsgGUID: dcapQQyrRYC7qy7AafHwaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="247760791"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jun 2026 02:52:55 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A44FD95; Tue, 30 Jun 2026 11:52:53 +0200 (CEST)
Date: Tue, 30 Jun 2026 12:52:52 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Jameson Thies <jthies@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] usb: typec: Add helper to check cable altmode
 support
Message-ID: <akOR9NJau40R1FG9@kuha>
References: <20260626142702.1941182-1-akuchynski@chromium.org>
 <20260626142702.1941182-2-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626142702.1941182-2-akuchynski@chromium.org>

On Fri, Jun 26, 2026 at 02:27:00PM +0000, Andrei Kuchynski wrote:
> Introduce typec_cable_altmode_unsupported function to evaluate whether an
> alternate mode is restricted based on the connected cable's properties.
> 
> Implement validation logic that parses the cable's identity to catch
> incompatible setups early. Alternate modes are restricted over:
>  - cables lacking an identity header
>  - passive cables with USB 2.0 speed
>  - active cables unless they have corresponding plugs
> 
> The function returns false if the cable is not registered or the identifier
> is not set.
> 
> Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in V3:
> - Extracted core verification logic into a static helper function
> - Added an enum to handle supported, unsupported, and unknown cable states
> 
>  drivers/usb/typec/class.c | 71 +++++++++++++++++++++++++++++++++++++++
>  include/linux/usb/typec.h |  1 +
>  2 files changed, 72 insertions(+)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 0977581ad1b6e..e9f34eb14ceff 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -1429,6 +1429,77 @@ int typec_cable_is_active(struct typec_cable *cable)
>  }
>  EXPORT_SYMBOL_GPL(typec_cable_is_active);
>  
> +enum typec_cable_altmode_support {
> +	CABLE_SUPPORT_UNKNOWN,
> +	CABLE_SUPPORTED,
> +	CABLE_NOT_SUPPORTED,
> +};
> +
> +static enum typec_cable_altmode_support
> +typec_cable_check_altmode_support(struct typec_cable *cable,
> +				  struct typec_altmode *alt)
> +{
> +	struct typec_altmode *plug;
> +	u32 speed;
> +
> +	/*
> +	 * Check if the cable has an e-marker, supports modal operation, and the
> +	 * SOP' altmode nodes are created.
> +	 */
> +	plug = typec_altmode_get_plug(alt, TYPEC_PLUG_SOP_P);
> +	if (plug) {
> +		typec_altmode_put_plug(plug);
> +		return CABLE_SUPPORTED;
> +	}
> +
> +	/* The identity is not specified */
> +	if (!cable->identity)
> +		return CABLE_SUPPORT_UNKNOWN;
> +
> +	/* Non-e-marked cable */
> +	if (!cable->identity->id_header)
> +		return CABLE_NOT_SUPPORTED;
> +
> +	switch (PD_IDH_PTYPE(cable->identity->id_header)) {
> +	case IDH_PTYPE_PCABLE:
> +		speed = VDO_TYPEC_CABLE_SPEED(cable->identity->vdo[0]);
> +		if (speed == CABLE_USB2_ONLY)
> +			return CABLE_NOT_SUPPORTED;
> +		return CABLE_SUPPORTED;
> +	case IDH_PTYPE_ACABLE:
> +		/*
> +		 * Active cables must establish an SOP' communication
> +		 * node. Since that check failed at the beginning of
> +		 * this function, this active cable does not support
> +		 * this specific altmode.
> +		 */
> +		return CABLE_NOT_SUPPORTED;
> +	}
> +
> +	return CABLE_SUPPORT_UNKNOWN;
> +}
> +
> +/**
> + * typec_cable_altmode_unsupported - Check if a cable restricts altmode
> + * @alt: The Alternate Mode to evaluate
> + *
> + * Returns true if the connected cable is incapable of handling the altmode.
> + */
> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt)
> +{
> +	enum typec_cable_altmode_support support = CABLE_SUPPORT_UNKNOWN;
> +	struct typec_cable *cable;
> +
> +	cable = typec_cable_get(typec_altmode2port(alt));
> +	if (cable) {
> +		support = typec_cable_check_altmode_support(cable, alt);
> +		typec_cable_put(cable);
> +	}
> +
> +	return support == CABLE_NOT_SUPPORTED;
> +}
> +EXPORT_SYMBOL_GPL(typec_cable_altmode_unsupported);
> +
>  /**
>   * typec_cable_set_identity - Report result from Discover Identity command
>   * @cable: The cable updated identity values
> diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
> index d61ec38216fa9..10a783b738efd 100644
> --- a/include/linux/usb/typec.h
> +++ b/include/linux/usb/typec.h
> @@ -337,6 +337,7 @@ void typec_unregister_cable(struct typec_cable *cable);
>  struct typec_cable *typec_cable_get(struct typec_port *port);
>  void typec_cable_put(struct typec_cable *cable);
>  int typec_cable_is_active(struct typec_cable *cable);
> +bool typec_cable_altmode_unsupported(struct typec_altmode *alt);
>  
>  struct typec_plug *typec_register_plug(struct typec_cable *cable,
>  				       struct typec_plug_desc *desc);
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog

-- 
heikki
