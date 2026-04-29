Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90E3C0634;
	Wed, 29 Apr 2026 10:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777459232; cv=none; b=jsKAvvQKfsPCZJ4yLS7iGr4HH9BEtMjp2/FBRnYMWp8n9/TURlTusBm1UtbQdyiVJfyUYT2NHR6W0HSWuldPh5A/aQlRmZukbz/eWUD8A+Lyn/Ybqbu1iCdpwndBtZzCdRDbG9M0AnX5PlBtjQnMI4D6u09F+cN0UG00o19p8xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777459232; c=relaxed/simple;
	bh=mMWE0WuEVR18JsXmxqLojKDlsYaU2ziLhr1ctstoqLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc1kTn0RpvXzemMvG4C2FxxWXfcH0Xvr6z/yjfsVr0UQJToSoHXXI9cJ+u65Ag7rs6VpiKjejbnp/q2MSBCO0UCNIZ8H946vDOL1Mbi90eTfwyXThAFsjaTWr33faHn2SyW23Nu0SBB0F+EAEvVRQwDYyqPsDeF3VEB/UAQM/Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fw+jFTug; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fw+jFTug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459230; x=1808995230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mMWE0WuEVR18JsXmxqLojKDlsYaU2ziLhr1ctstoqLI=;
  b=fw+jFTugIcmeYcyZx/gZYJYGAEUgawzs34lkg3L0Fblud6TRHp8qRaGo
   PdYp6YdWNknkaLcc1CHNWvwXr3cljAcnZFvh8Q++8jzoLnW335F4KV/p8
   ETYC8gNMPV8bhrRn2lG8ZFuvuSRpUtz87GSFjSyddBC0FWmD/DRjcQ3gm
   G1NlDG082+2ttU0GJhN9WXuZRkzHvme5dV4ygLsTxpXRAico7vl6vvp6O
   0pOya+LBX60cMSfWUUEf+jfQ3c1ihcas23LUtzbpIZ9S7qSPdkvkxBEll
   A0kdQuBdSSxNu4g/nA0e2l4Ab2RO0cdA0OZwYquBzdOCaNgVQpDJcPTjA
   g==;
X-CSE-ConnectionGUID: 3Jn9eaD0RTGFFoh06J7zFA==
X-CSE-MsgGUID: HjcBY84BStOZoo6G9OWVeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="77550445"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="77550445"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:40:29 -0700
X-CSE-ConnectionGUID: 6jjohVBrRb+MAox0t8M/iA==
X-CSE-MsgGUID: K7qJk4BESeurfnH2ZjRo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="234238819"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2026 03:40:27 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 6E76595; Wed, 29 Apr 2026 12:40:26 +0200 (CEST)
Date: Wed, 29 Apr 2026 13:40:13 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: fusb302: Fix resource leak when
 devm_drm_dp_hpd_bridge_add() fails
Message-ID: <afHgDbQ4w0Vo_9LH@kuha>
References: <20260428-fusb-v2-1-aa3b5942cabb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-fusb-v2-1-aa3b5942cabb@gmail.com>

On Tue, Apr 28, 2026 at 09:18:21PM +0800, Felix Gu wrote:
> If devm_drm_dp_hpd_bridge_add() fails during fusb302_probe(), the original
> code returned directly without cleaning up the resources.
> 
> Move bridge registration before the IRQ is requested and route bridge
> registration failures through the existing TCPM unregister and fwnode
> cleanup path.
> 
> Fixes: 5d79c525405d ("usb: typec: fusb302: add DRM DP HPD bridge support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> - Fix Heikki's comment.
> - Link to v1: https://lore.kernel.org/r/20260421-fusb-v1-1-0a9dd64e785b@gmail.com
> ---
>  drivers/usb/typec/tcpm/fusb302.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
> index 889c4c29c1b8..9ab1277b7ed1 100644
> --- a/drivers/usb/typec/tcpm/fusb302.c
> +++ b/drivers/usb/typec/tcpm/fusb302.c
> @@ -1751,19 +1751,22 @@ static int fusb302_probe(struct i2c_client *client)
>  
>  	bridge_dev = devm_drm_dp_hpd_bridge_alloc(chip->dev, to_of_node(chip->tcpc_dev.fwnode));
>  	if (IS_ERR(bridge_dev)) {
> -		ret = PTR_ERR(bridge_dev);
> -		dev_err_probe(chip->dev, ret, "failed to alloc bridge\n");
> -		goto destroy_workqueue;
> +		ret = dev_err_probe(chip->dev, PTR_ERR(bridge_dev),
> +				    "failed to alloc bridge\n");
> +		goto fwnode_put;
>  	}
>  
>  	chip->tcpm_port = tcpm_register_port(&client->dev, &chip->tcpc_dev);
>  	if (IS_ERR(chip->tcpm_port)) {
> -		fwnode_handle_put(chip->tcpc_dev.fwnode);
>  		ret = dev_err_probe(dev, PTR_ERR(chip->tcpm_port),
>  				    "cannot register tcpm port\n");
> -		goto destroy_workqueue;
> +		goto fwnode_put;
>  	}
>  
> +	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> +	if (ret)
> +		goto tcpm_unregister_port;
> +
>  	ret = request_threaded_irq(chip->gpio_int_n_irq, NULL, fusb302_irq_intn,
>  				   IRQF_ONESHOT | IRQF_TRIGGER_LOW,
>  				   "fsc_interrupt_int_n", chip);
> @@ -1774,14 +1777,11 @@ static int fusb302_probe(struct i2c_client *client)
>  	enable_irq_wake(chip->gpio_int_n_irq);
>  	i2c_set_clientdata(client, chip);
>  
> -	ret = devm_drm_dp_hpd_bridge_add(chip->dev, bridge_dev);
> -	if (ret)
> -		return ret;
> -
> -	return ret;
> +	return 0;
>  
>  tcpm_unregister_port:
>  	tcpm_unregister_port(chip->tcpm_port);
> +fwnode_put:
>  	fwnode_handle_put(chip->tcpc_dev.fwnode);
>  destroy_workqueue:
>  	fusb302_debugfs_exit(chip);
> 
> ---
> base-commit: 97e797263a5e963da3d1e66e743fd518567dfe37
> change-id: 20260421-fusb-0e7085ce431a
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>

-- 
heikki
