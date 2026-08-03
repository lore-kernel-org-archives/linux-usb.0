Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332FF31AABF;
	Mon,  3 Aug 2026 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724171; cv=none; b=UCVjMgKJ6JK8gF2DWABDR/ps3LmnxGnuQXm+hzWe8fKLOhEqClUtotNptay/qUdG4QnZmCM3OBkuidcDxM7V/yBeXlB9IaMiI7gdzn8mmJ63RYrUvsBprb+SEMWodVMZDHJAco/nnZFi7n+vWoOWaKDRIzlV1P4NWge947ZIhMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724171; c=relaxed/simple;
	bh=oGy2FgaJI9qMyrc7X6i6kJbvF7nXKLL0RXw1TwKWNl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEAvmjJ4k1af4IiB8uBSoK8A4qC8iUW47zyKDJSQcyUQW88zuGgvi97HAllL4U9b6qulf2ZZ5sG4vcs1F5IF+htrnamO28ZVYcY3mcjOHfGUdUeOijQ2ULlhb6E6RK41VElwhUsna6RNXoaLpNhkZw3TfcujOWejzF5i/GNS8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/akVfYX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/akVfYX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920681F00A3A;
	Mon,  3 Aug 2026 02:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785724169;
	bh=uIbs0bqvNQlF29Q2jcwWUQwhf4sH/xpjKuYqsfHIvso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L/akVfYX0OXSXtxqu5MLcUDkJj90JErhhuHgZ3/xAZ4NwbFB03PQQVjbepJNZp7wq
	 Gr5qYDdb0Vdk7sq/ZKdERTJj10MGDJfm0y6wZsnYKMZ3DGtfmXbCF6dlNMAUSSMNg1
	 LjHHDSkam14LyklcxFVxyXPB9MKpQFZq/Txi0aXQMX24aKiUJ3du2Bb0m84QaLvrVB
	 mJfftuYRMvGCzX89vuhQVJwrmtYto9gdGEWIPI9Yc5bRgHAeW/fQOD7tZzJq0FTl8j
	 Hc0NdASN1cuKIoN4PWiJ7lTWFtpy1Jet9QKyzkqLYhf7akOgFlZgHX1TqvSLe4+Oop
	 EZOEWLofL2orA==
Date: Sun, 2 Aug 2026 19:29:28 -0700
From: Peter Chen <peter.chen@kernel.org>
To: Pan Chuang <panchuang@vivo.com>
Cc: Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:CADENCE USB3 DRD IP DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/11] usb: cdns3: Remove redundant dev_err()
Message-ID: <am_9CFB7CNX8yaYy@hu-petche-lv.qualcomm.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
 <20260731035448.252289-2-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731035448.252289-2-panchuang@vivo.com>

On 26-07-31 11:54:35, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter
> ---
>  drivers/usb/cdns3/core.c | 4 +---
>  drivers/usb/cdns3/drd.c  | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
> index 504bdf13ea80..87122fb5bdb8 100644
> --- a/drivers/usb/cdns3/core.c
> +++ b/drivers/usb/cdns3/core.c
> @@ -449,10 +449,8 @@ int cdns_init(struct cdns *cdns)
>  						IRQF_SHARED,
>  						dev_name(cdns->dev), cdns);
>  
> -		if (ret) {
> -			dev_err(cdns->dev, "couldn't register wakeup irq handler\n");
> +		if (ret)
>  			goto role_switch_unregister;
> -		}
>  	}
>  
>  	ret = cdns_drd_init(cdns);
> diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
> index d2bb682e4552..42f13757d904 100644
> --- a/drivers/usb/cdns3/drd.c
> +++ b/drivers/usb/cdns3/drd.c
> @@ -509,10 +509,8 @@ int cdns_drd_init(struct cdns *cdns)
>  					cdns_drd_thread_irq,
>  					IRQF_SHARED,
>  					dev_name(cdns->dev), cdns);
> -	if (ret) {
> -		dev_err(cdns->dev, "couldn't get otg_irq\n");
> +	if (ret)
>  		return ret;
> -	}
>  
>  	state = readl(&cdns->otg_regs->sts);
>  	if (OTGSTS_OTG_NRDY(state)) {
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
