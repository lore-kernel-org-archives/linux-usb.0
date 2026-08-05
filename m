Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E298C453A54;
	Wed,  5 Aug 2026 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932226; cv=none; b=CChX/H0lXxj5E8PIudafi+J6oNLefJEwlEFajfcMjbXJGYUAHQpB4p2FPf8E5W6+23Ux7aFERXS82QQhvxwe7qiltlgov5fEqshEoBOxAmRxinQ6pakYPuMNpCWbj6oLgD9VD15bUpQAetHQrbs9buut/eIzu8owLtyNgbEMjzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932226; c=relaxed/simple;
	bh=ZNQ4FtTj8FhvGVayMarMB3GJRIb9KtXmdxr4taR8zQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enFXOP6jX1DFJ24tuGAKQVpDpJlvJN7s0ahexE9R1QePt3JupSXmgs2bqVxLPuOKTzBn6Z20yF6OYatczvfiyyLx80u0c+eY8tOZkYNbbAFvAw7bQk0lfo+XyC52KSpQXzNu8oJmj8KqE/kW39tRG0I6aDVvFXhuCBpuLjdTti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNsfN0w3; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNsfN0w3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785932225; x=1817468225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZNQ4FtTj8FhvGVayMarMB3GJRIb9KtXmdxr4taR8zQE=;
  b=LNsfN0w3r6HLKgvKODC0Xm+1U7NNoGLrnC3PFUF7KaX4cn1gzuyztTrW
   LUrNq2Sh/riq8IgT9Hq7paiVGSevGnmK+XhMMI3mD5C0VDx/teF4IoCLD
   XjyBQ3Y8s1XpOOiV9RNCnV9HfAeNWziYELuLQNgi/HYmiHFg9It+0/EIk
   ySL3RfPa6fXDNlOf3cxl5suRWotZmUpfaeZ9FdeN4xMZeSwYEtVLZAYDV
   yN9tLNvEBfUhmb1TL6yp1FyfAXAzhgUqqnBlF5dn1Xsw/fgbz7UcELVOv
   CkHXbpOC0GBNOd04heZngAB8yRcDwYAZgLzmrGp924M7dhwYLCnfX/SMb
   g==;
X-CSE-ConnectionGUID: GTWedPnvRcisFxOefBxsng==
X-CSE-MsgGUID: MPF2VMfMT9OyqpnlNXfrnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97150627"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="97150627"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:17:04 -0700
X-CSE-ConnectionGUID: 0MxJn81fRUigsswDvOHEiw==
X-CSE-MsgGUID: /4XKqQ0+TCqox/XzJIjZSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="261858954"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 05 Aug 2026 05:17:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 2E96C99; Wed, 05 Aug 2026 14:17:01 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:17:01 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: badhri@google.com, gregkh@linuxfoundation.org, xu.yang_2@nxp.com,
	18255117159@163.com, krzysztof.kozlowski@oss.qualcomm.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] usb: typec: tcpci: add alert.fault handling
Message-ID: <anMpvRaTmV0qY65v@black.igk.intel.com>
References: <20260731083529.2659924-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731083529.2659924-1-m.felsch@pengutronix.de>

On Fri, Jul 31, 2026 at 10:34:59AM +0200, Marco Felsch wrote:
> Add minimal handling to clear the ALERT.Fault bit which may be set in
> case of an over-current or over-voltage detection. At the moment only
> the IRQ clear support is added since the TCPC Spec mentions that the
> handling of such events is vendor specific.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index a56e31b20c21..d2d5bf7ca618 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -692,7 +692,8 @@ static int tcpci_init(struct tcpc_dev *tcpc)
>  
>  	reg = TCPC_ALERT_TX_SUCCESS | TCPC_ALERT_TX_FAILED |
>  		TCPC_ALERT_TX_DISCARDED | TCPC_ALERT_RX_STATUS |
> -		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS;
> +		TCPC_ALERT_RX_HARD_RST | TCPC_ALERT_CC_STATUS |
> +		TCPC_ALERT_FAULT;
>  	if (tcpci->controls_vbus)
>  		reg |= TCPC_ALERT_POWER_STATUS;
>  	/* Enable VSAFE0V status interrupt when detecting VSAFE0V is supported */
> @@ -720,6 +721,19 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  	irq_ret = status & tcpci->alert_mask;
>  
>  process_status:
> +	/*
> +	 * Handle nested fault before clearing the alert status to not
> +	 * re-trigger a fault alert immediately again.
> +	 */

Shouldn't that explanation in the comment be also in the commit
message? That sounds like the "why" part to me.

> +	if (status & TCPC_ALERT_FAULT) {
> +		unsigned int fault;
> +
> +		/* TODO: Add a proper over-current and over-voltage handling */
> +		ret = regmap_read(tcpci->regmap, TCPC_FAULT_STATUS, &fault);
> +		if (!ret)
> +			regmap_write(tcpci->regmap, TCPC_FAULT_STATUS, fault);
> +	}
> +
>  	/*
>  	 * Clear alert status for everything except RX_STATUS, which shouldn't
>  	 * be cleared until we have successfully retrieved message.
> -- 
> 2.47.3

-- 
heikki
