Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025004;
	b=iF0k1+Jgk/KlqdZcw7K6Wxyg/iQnW9bB9C+rorawbtHse1B6Ugph3aqAOqwiamexRYxy
	 RSG76dUXMelGhdgvZl9Flw+wGJBC4cvqMojXagUxneYDYLXwvc9zg6YHchv3AvnybksRR
	 f8ya/nujQxY9YwAANRcKOFD+A5vRgXn42l8HV0TH3IhWAZpMiDAiHabbKMTN8TPdhkKsi
	 X5tsCi9F8zzuysWLXkk9CP8DfgvYj45qMCEW5g6TYhf5dm782VJ9AuI39ESEh/UTZco2p
	 JOIGYypwbSGZYrf5zIWNXtMFiTv63lJD0TwlrNcQ9gbM2vk0FpNE9YfxoN+mCDcDWDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
	b=Ibdm0tLRyibTVvk/NzUm+5hxtGVJ6lpIenzfKZRyoSeZA1wwp+xZNFSypbWea9RTVl2S
	 uyxPY6YluZsrJGBWg2chmLdQYHt/RrAW0Cqc84fbmlkQ6fdNMQRGpS5IuYcAl8Xc/+tvd
	 IFTljI3E9K4lfz/3Z6wRV5yPWk0fzAJWNp93Y+ilolk4hiEjFBTb98g2mWWp9fs4W3Ups
	 X0zVeaeZlr+BhMazghF+NwFH+/QFoKEWGK/TTDm4rZ24E0qRNHYQjqghzabGn1qosalLa
	 kkTKYRavGsXiz3bnnNUTKnTuYT1rl8vowlF+qiVUuvRsk/+Sg1rRA9TPgDrHIwdn95A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ovT2sGsI;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A43606A32A
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08A43606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ovT2sGsI
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949680e6d83so130357685a.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795025003; x=1795629803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
        b=ovT2sGsIBDAgPrCx/LUVqTA2DoBZwhi1t3Ck+40HrcwHdf9Uw23m0X2L4UQ9eCuzpr
         VsRLx5L4hmk96p79gcCnh2MPtiXbJjUft+AzdOhVH+ilo393m9UlOacBl9sMilkkOCWN
         B9t0qUhd6w3NztjQgAp1ZafgeSK5JKKy7HGnoWBPOsOkEUR+iWPVJ5Bwt/zUSs8OkhrD
         s6v2G7rbF3yjJcimTmCvA48u1OJjxm2h2m3hppcD/I3k6MlsXN6AmNRS0VjzigaCh2AH
         oT1S2AHPeuLtqshQxEWylbyfaqS7D/Nd87L0VhtHu5BQLkXuEHVruRDO1aTbxu2A7XrQ
         cZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025003; x=1795629803;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ddfh5AdunM9T3f/FFA8YjicpmkRq3+rIyb33jbcm2s=;
        b=xKDTiz3Q0rolMlui+GRgco9HxnGUzvcZJkqE3oHk2XDsfo3y8WgX9JH1Il5d01mnvx
         2l6Ay+tHs+ftOSWKQFlMgANmSt15qry2M60KI8haBCZN839CqkFRop1W15mczssw5AeM
         G6/9Ao8lyp1/EvnGXRa8ZMCHhNpBPgZDUaibi2hROmv+VYi5uQeIgkLcCrZ9bLwJ8wOp
         4Rzj6R+2JgMkGAFjM6sxdZWrSt8mLFIz/2sYta4r1KBJgH+SIot2ipZqm3PuInsE4OEr
         PzNZUtmyWf7CoXmdmijgoSTXCH/REQJlkQ6CJrdtTs40GrtmlHhVcGWrb7NRRd9kB1F0
         4y8g==
X-Forwarded-Encrypted: i=1; AL+hErHLSwYPgPenLnFsAc3Yywdyi++0QRXlW54tNooYHTIJj9f6682M1ptq2tsujThuNU/XQg94nBgTSdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p47xf7SqI89wsP7Xbl/2NuNvErsWZ7wTmGpdP0jdte+CFw0+T
	riaYwlcnr2ix05AcsjLAfUkdDYlbAICyBJacuekvfJBR7OFAMeZy0r1IiavA4GJAMg==
X-Gm-Gg: AYBFou2xGXXQ6Pk37T217LFjlL2LkqUr49ENZ0a4WnzTCNL4I+k1nZ+V8GhWp5ZU7iG
	mX9h0aeK9wgpMXfhaWQi87nYCCwhK6eZSycoFnw78sNYOC6h+RGd3POLijvS5lXlg5vYJncGJN4
	JSR/dYx+1rInddnlHCXzJhu8B3vkZFPpmzBn35DVaomaQujLIHxn4nzN602JbY/BO2hI8WpQc9Z
	lMplwlNgAi7MKKTpMd3sJaEmqOeadoCGhK3fJyhBdXx6GIk749G1CaqYKcG+Q1dBn36/sH3JnzM
	0+Vvp8017KiRaTs7URr8HEA5CJ8TMFxcjcmPuF3R8b2B2Cdmm97TaxN2p/YnzO0zXzp24oYQuWH
	jo0kVyPv+re1OHS2oldRyPwd33VPjPSv2N78uPzCfjlUzII7ed1EAmScoJL3SuZIOfZcNh+bIVs
	8biwHHFrArtuV9PYB3rhNCzuiBadLLby+1FQaxAT+KftNkFU65NbQe5f32dKhScqJBU31eQP+az
	M7XVfdD9oS+Gn3U+SbB9wRQPBYnmWh5AUXOpGMkE+6/ZDTQGK93JcESmHSnkPqCeDIwtKamInE1
	9ysLJjWKNzdw9YWrFf46oeEqkPfoQQzkQa1BuuRUMppOATxC7pzP
X-Received: by 2002:a05:620a:2907:b0:949:5ee9:ab27 with SMTP id af79cd13be357-9499965e07amr577848185a.83.1795025002709;
        Wed, 18 Nov 2026 10:03:22 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b79e081sm233340685a.26.2026.11.18.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:03:22 -0800 (PST)
Date: Wed, 18 Nov 2026 13:03:20 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 2/3] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Message-ID: <571dd0fd-90a8-426b-8e6b-8898047f3cb3@rowland.harvard.edu>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-2-9413b491d213@flipper.net>
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
In-Reply-To: <20261117-udc-connect-v3-2-9413b491d213@flipper.net>

On Tue, Nov 17, 2026 at 04:48:08PM +0400, Alexey Charkov wrote:
> A gadget driver deactivates the gadget through usb_gadget_deactivate()
> until its functions are ready, so the deactivation means nothing to the
> next driver. Yet the UDC core keeps gadget->deactivated set across
> unbind. Only configfs resets it, since commit bf95c4d4630c ("usb: gadget:
> configfs: clear deactivation flag in configfs_composite_unbind()"), and
> it does so from its own unbind callback without connect_lock, which
> guards the flag everywhere else. A legacy gadget driver that unbinds
> while deactivated leaves the next driver unable to connect.
> 
> Clear the flag in the UDC core under connect_lock once the driver has
> unbound, including when the bind fails after the driver has deactivated
> the gadget, and drop the unlocked write from configfs.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/configfs.c | 1 -
>  drivers/usb/gadget/udc/core.c | 7 +++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 51df6d1d1487..c0f9e6625b64 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1849,7 +1849,6 @@ static void configfs_composite_unbind(struct usb_gadget *gadget)
>  	spin_lock_irqsave(&gi->spinlock, flags);
>  	cdev->gadget = NULL;
>  	cdev->deactivations = 0;
> -	gadget->deactivated = false;
>  	set_gadget_data(gadget, NULL);
>  	spin_unlock_irqrestore(&gi->spinlock, flags);
>  }
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a1..449b303c2f81 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1705,6 +1705,11 @@ static int gadget_bind_driver(struct device *dev)
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
>  
> +	/* The driver may have deactivated the gadget before failing */
> +	mutex_lock(&udc->connect_lock);
> +	gadget->deactivated = false;
> +	mutex_unlock(&udc->connect_lock);
> +
>  	mutex_lock(&udc_lock);
>  	udc->driver = NULL;
>  	driver->is_bound = false;
> @@ -1734,6 +1739,8 @@ static void gadget_unbind_driver(struct device *dev)
>  
>  	mutex_lock(&udc->connect_lock);
>  	usb_gadget_udc_stop_locked(udc);
> +	/* The next gadget driver decides on its own deactivation */
> +	gadget->deactivated = false;
>  	mutex_unlock(&udc->connect_lock);
>  
>  	mutex_lock(&udc_lock);
> 
> -- 
> 2.56.0
> 
