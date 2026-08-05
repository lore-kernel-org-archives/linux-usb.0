Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6C45199B;
	Wed,  5 Aug 2026 12:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931980; cv=none; b=mcP6VC6al3Rrw2I22nAcCqIsahQ6JJuUQzz8wG/PTXEtF2gaThHjY97K3TgPR0nhxdrPxf34pvbBKUcYZ7RbiWQEyQmTfqFBTOpOyag2Tc9OaNFAItE3TTDrBnCl9EQgx2iMeFpgSdzmXvYQLo4sSSy1aCkeYwpwE7iSUGdqHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931980; c=relaxed/simple;
	bh=5ijllbdsV/FH4IkEjrIYuPh6CC2tKw+DyF/rMHbH20U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNleWW+W09iBe1r60yvZM+oza5MttnPgLRWjPV7CoGp4A+C1x/wyHUbZ9Y7LPxNnIBihmWXDr22cuT6kDW9MRFEycwosjPUHkvXAcoitdPIPtjE6otJyaLdGgw0Gh8/RB+2dgTDEq3MkDGt7ExxBLbOqT0+evXKfO+TuljZU83s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFCx+Vdy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFCx+Vdy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785931979; x=1817467979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ijllbdsV/FH4IkEjrIYuPh6CC2tKw+DyF/rMHbH20U=;
  b=CFCx+VdyL5pF9VZDNMR3gSNKvWHz2VvO5+JfFLtF0mH0XWxrmcP93XkV
   8WoD2TH1Smy15W+mEfBpdNb8trsZkzXsslW346Fv0XZmb+tL95LGAQ1qO
   FrJNBZD7GgiKLSqpUdivzDDZZ/H2sfxOZDovHM6V/lrzLUFt3Wy7E8AQF
   A4724fdd7THRr2WKN9Z8bf0jRG26b3l4gV8b1aBd7ByczTgkA6u6/f8Gu
   Kl3UoP3soolzFirIrr5kiHjBs6XR8bn6owY9MtHBF7TytIxglL+c6K2nL
   O0ivgr66+DkF0mjph0DTI01bZJweywfF6IQaVMS3g3fqJBlfLE+x+9PoG
   w==;
X-CSE-ConnectionGUID: 1KDH2AdNQ0qyUIa8HA/pxw==
X-CSE-MsgGUID: CBWnKggsQ/m46GwbcaLvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90387646"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="90387646"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 05:12:58 -0700
X-CSE-ConnectionGUID: FAkFdOu5QsCP4pHGOnociA==
X-CSE-MsgGUID: Nh73dU2XQFKj0cMs0CYhEg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 05 Aug 2026 05:12:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 3B2DD99; Wed, 05 Aug 2026 14:12:55 +0200 (CEST)
Date: Wed, 5 Aug 2026 14:12:55 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:USB TYPEC CLASS" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 11/11] usb: typec: Remove redundant
 dev_err()/dev_err_probe()
Message-ID: <anMoxwOHNqg9VPHu@black.igk.intel.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
 <20260731035448.252289-12-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731035448.252289-12-panchuang@vivo.com>

On Fri, Jul 31, 2026 at 11:54:45AM +0800, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/anx7411.c               | 4 +---
>  drivers/usb/typec/hd3ss3220.c             | 4 +---
>  drivers/usb/typec/mux/it5205.c            | 2 +-
>  drivers/usb/typec/tcpm/tcpci_maxim_core.c | 3 +--
>  drivers/usb/typec/tcpm/tcpci_mt6360.c     | 1 -
>  drivers/usb/typec/tcpm/tcpci_mt6370.c     | 2 +-
>  6 files changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
> index 41df115912b9..2c41e00819f8 100644
> --- a/drivers/usb/typec/anx7411.c
> +++ b/drivers/usb/typec/anx7411.c
> @@ -1529,10 +1529,8 @@ static int anx7411_i2c_probe(struct i2c_client *client)
>  					IRQF_TRIGGER_FALLING |
>  					IRQF_ONESHOT,
>  					"anx7411-intp", plat);
> -	if (ret) {
> -		dev_err(dev, "fail to request irq\n");
> +	if (ret)
>  		goto free_wq;
> -	}
>  
>  	if (anx7411_typec_check_connection(plat))
>  		dev_err(dev, "check status\n");
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 3e39b800e6b5..64648686bf8b 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -436,10 +436,8 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  						IRQF_TRIGGER_RISING |
>  						IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>  						dev_name(hd3ss3220->dev), hd3ss3220);
> -		if (ret < 0) {
> -			dev_err(hd3ss3220->dev, "failed to get ID irq: %d\n", ret);
> +		if (ret < 0)
>  			goto err_put_fwnode;
> -		}
>  	}
>  
>  	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
> diff --git a/drivers/usb/typec/mux/it5205.c b/drivers/usb/typec/mux/it5205.c
> index 5e1a120b2e3b..2ab2ba6a3cbd 100644
> --- a/drivers/usb/typec/mux/it5205.c
> +++ b/drivers/usb/typec/mux/it5205.c
> @@ -250,7 +250,7 @@ static int it5205_probe(struct i2c_client *client)
>  		if (ret) {
>  			typec_mux_unregister(it->mux);
>  			typec_switch_unregister(it->sw);
> -			return dev_err_probe(dev, ret, "Failed to request irq\n");
> +			return ret;
>  		}
>  	}
>  
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> index 998693a61839..52dbbbe53691 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
> @@ -542,8 +542,7 @@ static int max_tcpci_probe(struct i2c_client *client)
>  					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
>  					chip);
>  	if (ret < 0)
> -		return dev_err_probe(&client->dev, ret,
> -				     "IRQ initialization failed\n");
> +		return ret;
>  
>  	ret = devm_device_init_wakeup(chip->dev);
>  	if (ret)
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 881ffacbfd77..d4010ea5183b 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -167,7 +167,6 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(mti->dev, mti->irq, NULL, mt6360_irq, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), mti);
>  	if (ret) {
> -		dev_err(mti->dev, "Failed to register irq\n");
>  		tcpci_unregister_port(mti->tcpci);
>  		return ret;
>  	}
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6370.c b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> index 7d6c75c70985..2e85cb05ed37 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6370.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6370.c
> @@ -168,7 +168,7 @@ static int mt6370_tcpc_probe(struct platform_device *pdev)
>  	ret = devm_request_threaded_irq(dev, irq, NULL, mt6370_irq_handler,
>  					IRQF_ONESHOT, dev_name(dev), priv);
>  	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to allocate irq\n");
> +		return ret;
>  
>  	device_init_wakeup(dev, true);
>  	dev_pm_set_wake_irq(dev, irq);
> -- 
> 2.34.1

-- 
heikki
