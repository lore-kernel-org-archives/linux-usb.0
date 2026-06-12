Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F8B370D7C;
	Fri, 12 Jun 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258245; cv=none; b=TjmTMkLxPk9qSGW/HlY0adg8DRqO6yZ2r4/vkBe+sVTnWTMfP37+tjhNoT7qsMT531ERk3daoGesUOVN+3+4YOg9V1W7CG6gASKfU3Lx24tcFhWVJdvtvsIlTvQgA3HgJ6GEMvD/AjPeFxBNetmibI2CanIB4qruZ7/u+vUuGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258245; c=relaxed/simple;
	bh=WIdVpF6LlhGU5tZ0WHimYkn3DkmNQ+eQ1VkluK51618=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gINgXSvv7lv4a/eN3IT0Z7S1nWKOO8sw+xy+Fk8lmFgmDqzw8aKOMoOUGSfSH+ZRkVroo9EScroILoqWr7pZmBb/12zzEO0aD8f1qW0tAHixNniv5L+VWoz8oSBdX/ZEK1wsK+wktZVjgJ2U1zcYXcg68zO4T4RO7ia6BbjBAsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X5fvQT++; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X5fvQT++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781258242; x=1812794242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WIdVpF6LlhGU5tZ0WHimYkn3DkmNQ+eQ1VkluK51618=;
  b=X5fvQT++U+vz9F9pjZXQHNEn8u+FlvBdyN4xDfPXjFFANHK0oaZVBCfI
   P37efPhxgFUbhMh8ZYHhpkWXdtr2Sj9icpxpKYtO8F5/IemgO5yqbUe4+
   EgwpH0EmPqwAyxTnF3rtgyzipS0Bw422/chHu1zHQQcti1tl7NHdpH/z8
   D4nQOuEDLFDnVz9b9MQ1mfL6xzFhUZKvBWSLFFYXJfBWYzDUdFU4cPoRq
   knQGxrAvBRSWb+0gwiz9FCjBxACVGafUzaSGzI+/eCOgjUDSRll2omusA
   XzVM0XvpDxtjJTLPqNrCX8cJCUMKd8zrmwrlGN637GeOmgycOQvVUvTti
   A==;
X-CSE-ConnectionGUID: 9aq3MeqaR0S3AGcNczD+Ww==
X-CSE-MsgGUID: N2+0P5o8R1OmCaE6Bb/Ixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="84654896"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="84654896"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:57:21 -0700
X-CSE-ConnectionGUID: /FEnqrHxRga+bEz3Y6jLNg==
X-CSE-MsgGUID: hhwIXqWqTSG9RItDlQKYUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="251725591"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 12 Jun 2026 02:57:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 8388D95; Fri, 12 Jun 2026 11:57:20 +0200 (CEST)
Date: Fri, 12 Jun 2026 12:57:18 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ucsi: huawei_gaokun: support mode switching
Message-ID: <aivX_t0QnjHg5lW7@kuha>
References: <20260607101844.820064-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607101844.820064-1-mitltlatltl@gmail.com>

On Sun, Jun 07, 2026 at 06:18:44PM +0800, Pengyu Luo wrote:
> The USB PHY (QMP Combo PHY) is always initialized in USB3+DP mode. In
> the past, there was no MUX, and it was unnecessary to set it, since
> MSM only supported 2-lane DP. But now, MST and 4-lane DP support has
> been added to MSM, and a MUX has been added to the PHY. To support
> 4-lane DP and mode switching for gaokun, get the MUX and set it.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 55 +++++++++++++++------
>  1 file changed, 41 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> index c5965656baba..95b7b77b726d 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -18,6 +18,7 @@
>  #include <linux/usb/pd_vdo.h>
>  #include <linux/usb/typec_altmode.h>
>  #include <linux/usb/typec_dp.h>
> +#include <linux/usb/typec_mux.h>
>  #include <linux/workqueue_types.h>
>  
>  #include "ucsi.h"
> @@ -82,6 +83,8 @@ struct gaokun_ucsi_port {
>  	struct gaokun_ucsi *ucsi;
>  	struct auxiliary_device *bridge;
>  
> +	struct typec_mux *typec_mux;
> +
>  	int idx;
>  	enum gaokun_ucsi_ccx ccx;
>  	enum gaokun_ucsi_mux mux;
> @@ -226,19 +229,18 @@ static void gaokun_ucsi_port_update(struct gaokun_ucsi_port *port,
>  	port->hpd_state = FIELD_GET(GAOKUN_HPD_STATE_MASK, ddi);
>  	port->hpd_irq = FIELD_GET(GAOKUN_HPD_IRQ_MASK, ddi);
>  
> -	/* Mode and SVID are unused; keeping them to make things clearer */
>  	switch (port->mode) {
>  	case USBC_DPAM_PAN_C:
>  	case USBC_DPAM_PAN_C_REVERSE:
> -		port->mode = DP_PIN_ASSIGN_C; /* correct it for usb later */
> +		port->mode = TYPEC_DP_STATE_C; /* correct it for usb later */
>  		break;
>  	case USBC_DPAM_PAN_D:
>  	case USBC_DPAM_PAN_D_REVERSE:
> -		port->mode = DP_PIN_ASSIGN_D;
> +		port->mode = TYPEC_DP_STATE_D;
>  		break;
>  	case USBC_DPAM_PAN_E:
>  	case USBC_DPAM_PAN_E_REVERSE:
> -		port->mode = DP_PIN_ASSIGN_E;
> +		port->mode = TYPEC_DP_STATE_E;
>  		break;
>  	case USBC_DPAM_PAN_NONE:
>  		port->mode = TYPEC_STATE_SAFE;
> @@ -287,18 +289,32 @@ static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
>  	return idx;
>  }
>  
> -static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
> +static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
>  {
>  	struct gaokun_ucsi *uec = port->ucsi;
> -	int idx = port->idx;
> -
> -	if (idx >= uec->ucsi->cap.num_connectors) {
> +	struct typec_mux_state state = {};
> +	struct typec_altmode dp_alt = {};
> +	int idx = port->idx, ret;
> +
> +	/*
> +	 * For every typec port on this platform, the only mode-switch is
> +	 * controlled by its qmp combo phy which consumes svid and mode only.
> +	 */
> +	dp_alt.svid = port->svid;
> +	state.mode = port->mode;
> +	state.alt = &dp_alt;
> +
> +	if (idx >= uec->num_ports) {
>  		dev_warn(uec->dev, "altmode port out of range: %d\n", idx);
>  		return;
>  	}
>  
> +	ret = typec_mux_set(port->typec_mux, &state);
> +	if (ret)
> +		dev_err(uec->dev, "failed to set mux %d\n", ret);
> +
>  	/* UCSI callback .connector_status() have set orientation */
> -	if (port->bridge)
> +	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
>  		drm_aux_hpd_bridge_notify(&port->bridge->dev,
>  					  port->hpd_state ?
>  					  connector_status_connected :
> @@ -307,7 +323,7 @@ static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
>  	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
>  }
>  
> -static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
> +static void gaokun_ucsi_usb_notify_ind(struct gaokun_ucsi *uec)
>  {
>  	int idx;
>  
> @@ -320,7 +336,7 @@ static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
>  	if (idx == GAOKUN_UCSI_NO_PORT_UPDATE)
>  		gaokun_ec_ucsi_pan_ack(uec->ec, idx); /* ack directly if no update */
>  	else
> -		gaokun_ucsi_handle_altmode(&uec->ports[idx]);
> +		gaokun_ucsi_handle_usb_mode(&uec->ports[idx]);
>  }
>  
>  /*
> @@ -352,7 +368,7 @@ static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
>  	port = &uec->ports[idx];
>  	if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
>  		dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
> -		gaokun_ucsi_altmode_notify_ind(uec);
> +		gaokun_ucsi_usb_notify_ind(uec);
>  	}
>  }
>  
> @@ -366,7 +382,7 @@ static int gaokun_ucsi_notify(struct notifier_block *nb,
>  	switch (action) {
>  	case EC_EVENT_USB:
>  		gaokun_ucsi_complete_usb_ack(uec);
> -		gaokun_ucsi_altmode_notify_ind(uec);
> +		gaokun_ucsi_usb_notify_ind(uec);
>  		return NOTIFY_OK;
>  
>  	case EC_EVENT_UCSI:
> @@ -429,8 +445,15 @@ static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
>  			fwnode_handle_put(fwnode);
>  			return PTR_ERR(ucsi_port->bridge);
>  		}
> -	}
>  
> +		ucsi_port->typec_mux = fwnode_typec_mux_get(fwnode);
> +		if (IS_ERR(ucsi_port->typec_mux)) {
> +			fwnode_handle_put(fwnode);
> +			return dev_err_probe(dev, PTR_ERR(ucsi_port->typec_mux),
> +					     "failed to acquire mode-switch for port: %d\n",
> +					     port);
> +		}
> +	}
>  	for (i = 0; i < num_ports; i++) {
>  		if (!uec->ports[i].bridge)
>  			continue;
> @@ -502,10 +525,14 @@ static int gaokun_ucsi_probe(struct auxiliary_device *adev,
>  static void gaokun_ucsi_remove(struct auxiliary_device *adev)
>  {
>  	struct gaokun_ucsi *uec = auxiliary_get_drvdata(adev);
> +	int i;
>  
>  	disable_delayed_work_sync(&uec->work);
>  	gaokun_ec_unregister_notify(uec->ec, &uec->nb);
>  	ucsi_unregister(uec->ucsi);
> +	for (i = 0; i < uec->num_ports; ++i)
> +		typec_mux_put(uec->ports[i].typec_mux);
> +
>  	ucsi_destroy(uec->ucsi);
>  }
>  
> -- 
> 2.54.0

-- 
heikki
