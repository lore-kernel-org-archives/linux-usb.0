Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187290;
	b=zR6sIH5OaTLfAFHwWSYW4VOnsA1UWl3tKGjp0V0j0/mJDLSsiEi4TfRqJmWw9X1QU/hy
	 oqbHG/Kcz6upoyvQ9xaGUzuUY//8EsptE3zo5LXwf4PYxiokjtBmlnDgVStM9Xz8mgjUT
	 8McMQPwmutYOFE7VX3aJ+HbCQxg2hqAymGGalPwIN1n0snxwXx1wcnTXMUDo7eNq9n4fe
	 tm/Rs2z1VAoGBPSbc/P7Pzk2K2dP6J96658rPuDDFRfB+nHcaq5GmihrDhyO3UCOA8GKB
	 OpxZ8CxkD/G8Wuq45ZceSj/j8l9aWsV03FrCCj48AOfv4UJ/+YU6JixT5ctnRkfoorw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0rrE4PahKjZtrWlnoYgsDKaA50KKzlmoDKZo+9+qI8w=;
	b=y6WDxQkOL1g3UYcyxSpubGP2tQgqPQ6Z8IQxeoS6Mtfh6ZejdckzWkIZy2si1mzcKJ/b
	 3ioMCmcN73yYlYJm7eX9guyoUluhn858cGKD3O2jeCPVhveL8rxE8RbZBi/ZxYjaPP1G5
	 +1/FxAtK1IZLmFRBOqzh/RZDzYibzclCut76t9d3r4pohyRMjTDNcAd4D7pWDeGJq1kQe
	 aWJH7Ary13yHTAt1M6pQqZ41Ar+PUTyrH7j6ydW0loM0f3fvbBDMuh5LMMJr0zrrvjD4+
	 uHPQDFOVO7yIn2S22Yc2QQihKRqrqzULLH4/HOifqWbzu57d3Sj1whx70FZ8O1KXgwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPOj+QBF;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB766606A32C;
	Fri, 20 Nov 2026 15:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB766606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VPOj+QBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795187290; x=1826723290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Joi7ljOpyNUOHj0kjn9+KmYWPueeoVlKk14XtGNF+3M=;
  b=VPOj+QBF6pK/ASh2I8CDqkPIVPmQ2fmSY+4xWIZZglFF2fiSLOV8c+pQ
   M5P/bkgJZeeG/t/tKx6H5x1MHw1uYESB6MvWMBkQT8WfD5WCiT/lcpo3c
   nI6gwlW9cYKYG6KtEIm1sCVtSa84q3emdskvhbsWjTlkjTBXsZ9Bh03Sm
   m0M8zbZ+izNmxlpXvgbY6S4ffn+krhghznmBugg4yL0Mce+jzDJYV7E/F
   UijQrYfZ7YAWjmqGxMYKJ+JzeYwzrPvBHoSpxtL7h6zvM3ULTxDC8d3+z
   oNcM2MPJLcxLwgHl0lSFDw0C/I8nrHetxDcxqAz845epPKHUFD7s8y/Hj
   g==;
X-CSE-ConnectionGUID: lD+BemAYSSmimKoASwe7pA==
X-CSE-MsgGUID: H5qjJyJoRniBB8ZwGgqQRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4109927"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4109927"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 07:07:51 -0800
X-CSE-ConnectionGUID: RFBtQqFOSuqKfSctIZ+rYw==
X-CSE-MsgGUID: +FpWI1IdRCa64TkVQ4ZQIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="10702529"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa004.fm.intel.com with ESMTP; 20 Nov 2026 07:07:49 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C85A799; Fri, 20 Nov 2026 16:07:47 +0100 (CET)
Date: Fri, 20 Nov 2026 16:07:47 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Ian Rogers <irogers@google.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Elkin Cruz <elkin@google.com>
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
Message-ID: <awBiQ0S1hYnm-ngo@black.igk.intel.com>
References: <20261119170853.1529676-1-irogers@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119170853.1529676-1-irogers@google.com>

On Thu, Nov 19, 2026 at 09:08:53AM -0800, Ian Rogers wrote:
> In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and the
> default switch branch jump to 'done:', which logs 'currsrc', 'mode', and
> 'misc' via dev_dbg() and passes uninitialized 'currsrc' into
> rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic debug
> is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc()
> jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
> initialized.
> 
> Return early on error paths in both functions instead of jumping to the
> post-success dev_dbg() trace.
> 
> Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
> -Wconditional-uninitialized enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
> -Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardware.
> 
> Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
> Signed-off-by: Ian Rogers <irogers@google.com>

No stable here either?

Thanks,

> ---
>  .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index b2ad31e85b5e..a1595b8b53e7 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>  	ret = regmap_read(pmic_typec_port->regmap,
>  			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG, &misc);
>  	if (ret)
> -		goto done;
> +		return ret;
>  
>  	attached = !!(misc & CC_ATTACHED);
>  
> -	if (pmic_typec_port->debouncing_cc) {
> -		ret = -EBUSY;
> -		goto done;
> -	}
> +	if (pmic_typec_port->debouncing_cc)
> +		return -EBUSY;
>  
>  	*cc1 = TYPEC_CC_OPEN;
>  	*cc2 = TYPEC_CC_OPEN;
> @@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>  				  pmic_typec_port->base + TYPEC_SRC_STATUS_REG,
>  				  &val);
>  		if (ret)
> -			goto done;
> +			return ret;
>  		switch (val & DETECTED_SRC_TYPE_MASK) {
>  		case AUDIO_ACCESS_RA_RA:
>  			val = TYPEC_CC_RA;
> @@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
>  				  pmic_typec_port->base + TYPEC_SNK_STATUS_REG,
>  				  &val);
>  		if (ret)
> -			goto done;
> +			return ret;
>  		switch (val & DETECTED_SNK_TYPE_MASK) {
>  		case SNK_RP_STD:
>  			val = TYPEC_CC_RP_DEF;
> @@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
>  			  &misc);
>  	if (ret)
> -		goto done;
> +		goto err_unlock;
>  
>  	mode = EN_SRC_ONLY;
>  
> @@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  	default:
>  		dev_warn(dev, "unexpected set_cc %d\n", cc);
>  		ret = -EINVAL;
> -		goto done;
> +		goto err_unlock;
>  	}
>  
>  	if (mode == EN_SRC_ONLY) {
> @@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  				   pmic_typec_port->base + TYPEC_CURRSRC_CFG_REG,
>  				   currsrc);
>  		if (ret)
> -			goto done;
> +			goto err_unlock;
>  	}
>  
>  	pmic_typec_port->cc = cc;
>  	qcom_pmic_set_cc_debounce(pmic_typec_port);
> -	ret = 0;
> -
> -done:
>  	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
>  
>  	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
> @@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>  		pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
>  		misc_to_cc(misc));
>  
> +	return 0;
> +
> +err_unlock:
> +	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
>  	return ret;
>  }
>  
> -- 
> 2.56.1.708.g77570a6a1d-goog

-- 
heikki
