Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910900;
	b=H/IlikBgVnBiJSL2VB8HExH2+KRnN3XqnZXoHCBaf/pPsgsPmNwxswbnoosWrnJicioP
	 KeR6E0itAN44XaoC+O4C0p9iuRPl0o8QlzldH771mo0hOJ3So+L8e3hkQ6ypE6e6QqQmP
	 5OaR3WY3zr6Z710gmlOxu85Jz2Yzxp2JqnS2zGRssHLQo4q/adUUBRLdkx9KsJvXN96Om
	 8Y5/+sFZHtLryy39q1FdILCqBMsRYnsTHmbuhEmog1IswX0ZbmFrGGqVLtvmargZV6dFE
	 BkJh+nvy3Lt+xZeoE2723qwBvysFhfF99oVS0CKXfeDZAL2Ljiyop6UZZzbiMq5+ttQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
	b=Zri4Cg3O2FFgK7NzcKOmrHDcwHeGN9Am14PiZJHmJDZD+VM93t5coqdynuq4qx+9Hu8a
	 RYkH9rG8vnNTdpggXrGnmBozrCHlPoxWolFjfwLLERsq94kUpvGYPMKft95QcwCWwG+c0
	 gk/jLyZOjBo92rH6HFWGr35rRAkFkzeUGMuDYRlu+KgSDOlJrt+lciWGLxF2430F3vqxt
	 6+oQR5dooWFA1g24RmBj81wqxdH4Hd1pmZv476JBWdXI7ZY5i2NpBr/BP2874+/0jV4iV
	 L/okHeo6h9dWoaevqZTXJKcUz0r7nlyVbijQqUL8kObufE3PrDvFOEg28JpL7/5e5sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfDV8RqH;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C31606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfDV8RqH
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a3c08d6928so623c88.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910899; x=1794515699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=tfDV8RqHdxq2Tir67Fgi3R8YmRMnkFni198pbJyN+2f/wlgyg1u3H/zAskp5NHkOv7
         tIdkAuAZ8WUJ1kMmFVB+y6fHOz8B/caj8wD6aThvegmX02BzNu06iJykZNQp0y6aCkds
         RlikDnWVU951ugzrT3mYdlzvFKlHh7U4jsRYSXIG1h4+jf8Ji6Bx4VcBvQSsJCCbdeY9
         mB7Z2NGEfuJN8Celqb7oNC5peWi2IHdFiN3NSUJbZlwldHAE4GnOhIkhY+aC2WxclROa
         S4gSdge+AsM35XlqkfzkRHJ1/+Vy2cjQlMpoMljhOELSER57fCOwoNKU+WxKYNt0B3OE
         B7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910899; x=1794515699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=d3gX0yW/mW4r6X/dCL14TWy2k/PNfZ7GLgOlFprp58k4/o/1xWmPTxcAk+77LQFJmI
         +pYK4S3/tRxW2zy6oik457WfsAp1oTvBeTBN47Gt2PvAg8Y/PlA1HnGcIEW8PK1bTgmw
         9wYQNhDY4Dik6KDHnk/ZLZLKfpRwW9/DRi5zmGRKRFxgiLbW7BCbU6RtCxPGNND3Vv8k
         Z785mKBHXCSPtOlXtGr93t3MoGp/uukNNK3EWqlyLROamtVobX66B87Csl2j1xcdmB73
         0wKiDb57hEhgcG7frgs1KKTBFR+IKqyk3BarhwGzSHGdnyDIgPpymE8iuX84Hbjcfxv7
         0uFQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4tO/Lyg4mUKo4XwSUpG1JIW9f/sXqBZWT16U/vAWVXOV5F8JaBXOi0Fd/+pmSj0HiwS7uNQwMdOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xXGFtSRAPLOqd0IMqWeERc3gyZUth0Rnm7GmH7JXjCDsw6B0+
	rMKnrRgZ9EBAbdLg/zP14r2tx3FTFAzNx0BH2iCCXZ4vdX/gJLzGZfUL
X-Gm-Gg: AYBFou2zWhDMZVzZfcsgy0wyvrqHEZ6SZ5V/NF6o3YURGQj9cCo6iYiqoz8NF3Bb4Cb
	mxgUGzgRE7I3TBFDgMLxKj9FW2UUN/amgOuH5MqH5O20ZC197YP490j7vMGYkyeSPOow9DoaYnL
	nLctDnLgbgJPZoVAHojv5DbgPPtfdIpdqW2Sm3cTMhIx+6j3WLQaxxjVTY55WLUltCWgoYMX1ls
	eli9xZO7ZSIUzQApxun0ruqIcNS2CuwTXLmgDifWj5YoTgvGFLlq3xjdBvA1gAYXkehMd0U3J0U
	+ch8Rcc6b2eD+jweaiN33T1gvCeTEYrbWbNWEm2XVrH6BDhmSDyrUWftWEHZaFB5zxrSYhI+UP8
	cte7Nxx5pl3f2SAlY+c8Yd6knfxnGkfVfGeVffcf7XNMdNS01K0xy/eh5u/vx09aM7ejH7SugYh
	M4BeWVv1l4PwMlfh4X4fVOQmxWuNErFsDTASSPB+QueoJ7LpkKddx9lTwNBCti13+FGdRxnlBPQ
	JL2fDTEEZ3L1K0PuYWb6F61fK6rOwEqBv9SqpxeGkpLGgQWqf9AIWhw8pAM1f3aChKQqGfmGwPy
	hYgUI74pOM28AgZDlfIM7eA4OyBgeVOmVEPqohS1wvXxs0C+4y81iwdTYFNk4oCnero2aC8=
X-Received: by 2002:a05:701b:2050:20b0:166:5552:780a with SMTP id a92af1059eb24-1b25d31e5a2mr163714c88.8.1793910898553;
        Thu, 05 Nov 2026 12:34:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722ed274sm649631eec.18.2026.11.05.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:34:57 -0800 (PST)
Date: Thu, 5 Nov 2026 12:34:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auzno3uoL5Pfojfl@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
 <auy2plYVi723Qt42@google.com>
 <20261105191940.GI8298@unreal>
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
In-Reply-To: <20261105191940.GI8298@unreal>

On Thu, Nov 05, 2026 at 09:19:40PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 09:05:29AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Manual serio binding connects a driver before driver core can admit the
> > > device. A rejected binding therefore arrives after functional setup.
> > > 
> > > Keep the port ID check and use device_driver_attach() for the existing bus
> > > probe path. Driver core then serializes admission and handles probe failure
> > > before publishing the binding.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/input/serio/serio.c | 24 +++---------------------
> > >  1 file changed, 3 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> > > index 54dd26249b027..604440244c1ca 100644
> > > --- a/drivers/input/serio/serio.c
> > > +++ b/drivers/input/serio/serio.c
> > > @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
> > >  
> > >  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
> > >  {
> > > -	int error;
> > > -
> > > -	if (serio_match_port(drv->id_table, serio)) {
> > > -
> > > -		serio->dev.driver = &drv->driver;
> > > -		if (serio_connect_driver(serio, drv)) {
> > > -			serio->dev.driver = NULL;
> > > -			return -ENODEV;
> > > -		}
> > > +	if (!serio_match_port(drv->id_table, serio))
> > > +		return 0;
> > >  
> > > -		error = device_bind_driver(&serio->dev);
> > > -		if (error) {
> > > -			dev_warn(&serio->dev,
> > > -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> > > -				 serio->phys, serio->name,
> > > -				 drv->description, error);
> > > -			serio_disconnect_driver(serio);
> > > -			serio->dev.driver = NULL;
> > > -			return error;
> > > -		}
> > > -	}
> > > -	return 0;
> > > +	return device_driver_attach(&drv->driver, &serio->dev);
> > 
> > I am not sure how safe it is, serio (and gameport) have pretty elaborate
> > structure and locking rules because they can recurse into themselves (to
> > support case of Synaptics touch-pads with pass-through PS/2 ports).
> > 
> > But this call is for user-initiated probing anyways, I am not sure if it
> > even needs "trust" handling.
> 
> This patch does not change the locking; the lock was already held on paths such
> as the rescan path. This change makes that explicit.

Does this enforce synchronous probing?

Anyway, I would like to get rid of this special probing in serio core.
Given that the code path is only triggered by explicit user request I do
not believe we need to worry about supporting trust notion here, so
please drop it from the series.

Thanks.

-- 
Dmitry
