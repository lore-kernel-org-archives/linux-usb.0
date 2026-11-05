Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899479;
	b=F5STsGD+0+Oce2B0FmWT/nCVGUUfjdeyWYGSBPvWWSKbhNSUOVc/IsL7LpRI9s6GAU2x
	 c3TusYGRZW26jmiS6zA7mR3FmeZ+MOuhkmbTikfT36KbLpDwZzNJIdnwSmzHpghCupTqj
	 dERJQMjqHnb+ojk519Z6f+4be7OII5xG8fc5afhnIr4TuJ7YIF8pYn3hEttU2BLbSgCRj
	 e2UTO/SDE/wGjOSUfNgplt/Y3ysslm0sURptE6sYavwUaWvTYI3eq3pgDlfpvPBMtVm/n
	 vU6RyRgPXY3vDmhik61ycK8WgNdBGqtodhiPYBvrTNrQuJbZHCRtGAF8Hvi72tnXboQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
	b=KtxDjgq91SnsKTbGEmk/kojJdLMQFuV6rssMbK9O9AifacqmK6rPU/IGlCQy8kgpaEXT
	 lFZ4w8V5bbNF9WzDHFFZuSlDiDWxfiMMboEk/x9YHmcDvI6SwJhN0AjfOIhvDRxDBe2SG
	 KxAZf1/NOBJDPUgMYfYSti1ChUDY4wnDWXGsHgfCvxPNdaHnpGYAqy6i1Pg6CRtsOXhIk
	 rWJcykN+tZ6eKOySOPwQ2QAPgF6guHZksa+CupXrIeJXt3lAecj/Xz7503UE8H3G+nT8v
	 Q03AVDRXxX8a/WBg7qrTh9tuhJiCZirMija+/3IBZb+bbILOjwMwGJJTe0bXOGOQbHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OXXcUxth;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E65606D839
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E65606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=OXXcUxth
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so29631421cf.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793899478; x=1794504278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
        b=OXXcUxthtyymPU3fwfbcr40/daOdZ4UuV0IOhK3r7k3BfuoZd0x2qWahN2YNfUretu
         Tvwnl0KFWoKOeZb7Eb3uBsqzIqq8J25exR7V5CgkLuEPZfnZT4ED35Z0b9rlaw575Jgj
         FQy6EYxV5onXU0wpKN8YyESt8CkDTpTTkNBn9V25Xj56jakQJCIeQ+jbdgqM3xEfnuQB
         l6A1FG/uOsFRxdidxCtIsyNflhv6dRW8a6chHrMU0u2dgaNP3KFe01+lBZywKoRsUbeP
         mAwXyFk8XjT9tW3AtUvUEUaho7CfMrUWwbB5j2cn7aptAgB87xrCSo1TqcjbSZYZh8xc
         JpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899478; x=1794504278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
        b=xYKtKSwXALdBHUNkgB5zxb88M21is4ZJjY8bynBVQx0QrDWxAXpSnTIkIHQPRR9rG3
         Jt4Zhr0oEM0PT3S3QHSGhRkttsU0lqW6iELznpwH2LydI2i9hXXDMNj/dMN20hvA8Adi
         U7iDe6Lk+Qe5J5cN3ckLMu+mwB2gAedLHM87L07nxSdwpmE2ZUPe7vGsqU2lPoV4jmIG
         7/p2rvPR1vy4+oNJXpFVSB7mA5IkNzLevSMwr2hjJ9uzOzr0LTAyOJt8Yfz2S+ukN04S
         wjIwZXMAKc6pwi60pwY5+7rFdoPNbXjnhbYV9HrD/G5I+O5vsktmy0v4Xvay0RjLxhd4
         Z58w==
X-Forwarded-Encrypted: i=1; AKwUvBzfYI4iNfPbNvx1lHxJVPU5+RLLay+StJn+T3ovbKDdECWfHQwpw6QytQAEAPUU6CETTs1zPBCxg0I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vQyPbAIxLyiLOKxoxFQSQIltlJMK+WqVCV0+kiufF7gJLE8+a
	ikwNAD5Lw7D2+Xdzk7qbEGfE0Qq99ipCOwY1SgRxbcpZ3IhpyeyiW/oB9EWqIAAwug==
X-Gm-Gg: AYBFou1cE5MPAZSIvAat5YbkxfskkB2d3jcPz0Vt/yCGzH59D5+0W2YUDLUQjrONXzp
	U6xwkP18wakPtGU4+/uojyA9PPYvsc3PQf7zJ3Qx+7CSccfqdtnKkD3cg6nVb5+IEdKtDOG59Ye
	yyKKf4xxVcIQIUoy43BXLXZcpYiqHz2udKT8X/aGwlS5EXY83E1b7IyaIS/4Z2/H04CoK5BDy7e
	iNpfALqQUlBUSqF7TbuzSEMq1kgtVDcTXivpSkWirJhdbMVw8SCP4JOa5eeLp8LkELs8Ej77CHY
	OsDWcYWH/H4NB/Z2Bdke9f7L+pkrafF/iQc8ei8a+TOJt0bNnaMhuyZICcbMiuS3gOOhdBThJEx
	qL5T9B9xONI1NeoYxODKk7uKdj5uQIL3fxcrfw7cgb8WCRAM/FWO43Vip9evB7/5QAUpmG8PmsB
	gD0XR6tvNaM8FNhxQGCLr9iw6yRosGZKiN6E8qc4jEvs6bfFKF+omdqOtZLLPlUh2MK+IPcHPjJ
	olISrPVqjgUy3TgePyEzocOA/6MTZntGceuBMfitfiGPeS59x0fz3QvbX3l0OGRklDF3QqqKxkA
	GFTR+Zh8aw8TZ7qxkGNgVII+NmcU
X-Received: by 2002:a05:622a:2515:b0:536:52ae:d92c with SMTP id d75a77b69052e-542b6e55bebmr328898701cf.35.1793899478212;
        Thu, 05 Nov 2026 09:24:38 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm57130131cf.14.2026.11.05.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:24:37 -0800 (PST)
Date: Thu, 5 Nov 2026 12:24:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/17] USB: Lock registered interfaces during manual
 driver binding
Message-ID: <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:18PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Interface claims hold the USB device lock, but device_bind_driver()
> requires the target interface lock. Without it, trust-policy writes can
> race admission.

This says nothing about usb_driver_release_refused_claim() and the code 
related to it.  It is an incomplete description of the patch.

Note that nothing prevents drivers from using an interface they claim 
before that interface is registered.  For your scheme to work properly, 
you should make sure the claim is authorized when 
usb_driver_claim_interface() is called, not when the interface is 
registered.

Alan Stern

> +/*
> + * The driver core refused to bind an interface that a sibling claimed before
> + * it was registered, and dropped the claim. Let the claimant release the
> + * interface instead of operating it with a bound interface but no driver.
> + */
> +void usb_driver_release_refused_claim(struct usb_interface *iface,
> +				      struct device_driver *claimant)
> +{
> +	struct device *dev = &iface->dev;
> +
> +	device_lock(dev);
> +	if (!dev->driver && iface->condition == USB_INTERFACE_BOUND) {
> +		dev->driver = claimant;
> +		usb_unbind_interface(dev);
> +		dev_set_drvdata(dev, NULL);
> +		dev->driver = NULL;
> +	}
> +	device_unlock(dev);
> +}
> +
>  /* returns 0 if no match, 1 if match */
>  int usb_match_device(struct usb_device *dev, const struct usb_device_id *id)
>  {
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index a738d03c23eac..d35a7710c8ef4 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2264,6 +2264,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	 */
>  	for (i = 0; i < nintf; ++i) {
>  		struct usb_interface *intf = cp->interface[i];
> +		struct device_driver *claimant;
>  
>  		if (intf->dev.of_node &&
>  		    !of_device_is_available(intf->dev.of_node)) {
> @@ -2277,7 +2278,14 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  			dev_name(&intf->dev), configuration,
>  			intf->cur_altsetting->desc.bInterfaceNumber);
>  		device_enable_async_suspend(&intf->dev);
> +		claimant = intf->dev.driver;
> +		if (claimant && !try_module_get(claimant->owner))
> +			claimant = NULL;
>  		ret = device_add(&intf->dev);
> +		if (!ret && claimant && !intf->dev.driver)
> +			usb_driver_release_refused_claim(intf, claimant);
> +		if (claimant)
> +			module_put(claimant->owner);
>  		if (ret != 0) {
>  			dev_err(&dev->dev, "device_add(%s) --> %d\n",
>  				dev_name(&intf->dev), ret);
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index a9b37aeb515be..293340a48b6c5 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -49,6 +49,8 @@ extern int usb_set_isoch_delay(struct usb_device *dev);
>  extern int usb_get_bos_descriptor(struct usb_device *dev);
>  extern void usb_release_bos_descriptor(struct usb_device *dev);
>  extern int usb_set_configuration(struct usb_device *dev, int configuration);
> +void usb_driver_release_refused_claim(struct usb_interface *iface,
> +				      struct device_driver *claimant);
>  extern int usb_choose_configuration(struct usb_device *udev);
>  extern int usb_generic_driver_probe(struct usb_device *udev);
>  extern void usb_generic_driver_disconnect(struct usb_device *udev);
> 
> -- 
> 2.56.0
