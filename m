Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676496;
	b=qmrG/l4BzQK8CUiyRDHQIhHsDzjtS81eS6Qo4kLfj5kyD/jgo71naAMts9gG002TJDqG
	 1jVHh6i/dIUNTbk9+uBBlsPalLuVSJvKM6NjG7iQJK/Ktg9uqa8d3Lm/oLJt70/t6UNEG
	 WBp7c3DBJi7TUelZrFbQXfra7vAfjoBx1tJ2Jb+Zuus8+m2OgJ4RlHo4rYuFDu75yyoR+
	 IJcNFUGdF7HHg5U2XxPUIU3LhfRyEM1d6AOgn4spwlRo3+7briZIZ9zqx7ZhNM1+V+y/B
	 kNEDY2C1a1PetcOYRSR4OMniZUWmZqoFCCzkJWsQLByvkdSNfutxlgViYgVripMp2Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676496;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kUkqbe/Er/dAeBIaOZOk6FQuM5olju2+gHoJPhRgfbQ=;
	b=VI7ARktJAgp2ldqQTjqUsdwMsNj6Z+FAqcFWD0WEl9CE+2ez3TnQKIpFAsR1HTvMdYa6
	 qPt0AVK6oGZCbe3J7Rhmrwj9qW/bUnujU7neXVVfANJ0mrxlkhMcJdhdteGSjbkmyTGEi
	 nb2gPNQXom4/le1s8pficpI5PKKTC6ngJ2ut7B2mrdi1PPgF87RDdgKOVw1ntUU4EHBjV
	 kC5pZyUVxYOTHIyPtJ5B5ew5Co6dDPOJKCBkzIM8QluZ5DZXVdDIPFHqOuGkegwWt8sA9
	 f+fGnd1syf8MXt22FaG7f7P8ek2JGFVJ6/jIXNuZqH5y77TjGXz8UwXBaJ4uywcPDGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GEdYloiQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E85606A31C;
	Thu, 26 Nov 2026 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GEdYloiQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2101F000C0;
	Thu, 26 Nov 2026 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795676496;
	bh=kUkqbe/Er/dAeBIaOZOk6FQuM5olju2+gHoJPhRgfbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GEdYloiQLNVLeE0Q/vS0mk8EvMRpOBjWOG3hajQ993MfVyBT6sz0Oqf9qBz3Qi89c
	 kAtPJzRnka0FGULYl39bXk57sWVIBixHwdROFW5ZwGbBhMlGXmTiXuy3jKRqFi0l1Z
	 bQ+ZPJiSYETAnlf3Lp/j1fvgzDY7NaeJVpWufgxc=
Date: Thu, 26 Nov 2026 08:01:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: phy: twl6030: init work before comparator and clear
 comparator on teardown
Message-ID: <2026112648-slot-unwed-d4dd@gregkh>
References: <20261126065139.127-1-luob87709@gmail.com>
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
In-Reply-To: <20261126065139.127-1-luob87709@gmail.com>

On Thu, Nov 26, 2026 at 02:51:39PM +0800, Bin Luo (University of Electronic Science and Technology of China) wrote:
> twl6030_usb_probe() publishes &twl->comparator via
> omap_usb2_set_comparator() before initializing twl->set_vbus_work and
> twl->lock. If the OMAP USB2 PHY invokes twl6030_set_vbus() before
> INIT_WORK() runs, schedule_work(&twl->set_vbus_work) operates on an
> uninitialized work_struct.
> 
> In addition, neither the probe error paths nor twl6030_usb_remove()
> clears the comparator via omap_usb2_set_comparator(NULL). Because twl
> is devm-allocated, a subsequent VBUS callback from the OMAP USB2 PHY
> dereferences freed twl memory and schedules set_vbus_work after
> teardown.
> 
> Initialize twl->lock and work items before registering the comparator,
> and clear the comparator with omap_usb2_set_comparator(NULL) before
> canceling set_vbus_work in both probe failure paths and
> twl6030_usb_remove().
> 
> Fixes: 0e98de67bacb ("usb: otg: make twl6030_usb as a comparator driver to omap_usb2")
> Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
> ---
> Found by code inspection; not compile-tested on ARM/OMAP or runtime-tested on TWL6030 hardware.
> 
>  drivers/usb/phy/phy-twl6030-usb.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-twl6030-usb.c b/drivers/usb/phy/phy-twl6030-usb.c
> index 9bfcb2c..a9da7aa 100644
> --- a/drivers/usb/phy/phy-twl6030-usb.c
> +++ b/drivers/usb/phy/phy-twl6030-usb.c
> @@ -355,26 +355,26 @@ static int twl6030_usb_probe(struct platform_device *pdev)
>  	twl->comparator.set_vbus	= twl6030_set_vbus;
>  	twl->comparator.start_srp	= twl6030_start_srp;
>  
> +	/* init spinlock and work items before publishing comparator */

No need for this comment, right?

> +	spin_lock_init(&twl->lock);
> +	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
> +	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
> +
>  	ret = omap_usb2_set_comparator(&twl->comparator);
>  	if (ret == -ENODEV) {
>  		dev_info(&pdev->dev, "phy not ready, deferring probe");
>  		return -EPROBE_DEFER;
>  	}
>  
> -	/* init spinlock for workqueue */
> -	spin_lock_init(&twl->lock);
> -
>  	err = twl6030_usb_ldo_init(twl);
>  	if (err) {
>  		dev_err(&pdev->dev, "ldo init failed\n");
> -		return err;
> +		status = err;
> +		goto err_clear_comparator;
>  	}
>  
>  	platform_set_drvdata(pdev, twl);
>  
> -	INIT_WORK(&twl->set_vbus_work, otg_set_vbus_work);
> -	INIT_DELAYED_WORK(&twl->get_status_work, twl6030_status_work);
> -
>  	status = request_threaded_irq(twl->irq1, NULL, twl6030_usbotg_irq,
>  			IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>  			"twl6030_usb", twl);
> @@ -404,6 +404,9 @@ err_free_irq1:
>  	free_irq(twl->irq1, twl);
>  err_put_regulator:
>  	regulator_put(twl->usb3v3);
> +err_clear_comparator:
> +	omap_usb2_set_comparator(NULL);
> +	cancel_work_sync(&twl->set_vbus_work);

Why these changes?  You are doing multiplke things in the same patch,
pleaase break this up into smaller patches.

thanks,

greg k-h
