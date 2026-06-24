Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E2C3B42D1
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311910; cv=none; b=NxnI6uTAOcz0wBE4BO60Kf85lOrWbdK9X79hOWBcymMsMN7uQ2lnxmF5tTyaFb5aLhpWp0Bb8apydy9UoyRnU+kp57aDJ2mlnJhLuQL9/ocBRpqk08yysi+aCd3a0s5MugbLvdLEMIUKXuAdzuEiizPEv3PlLLWwRreMWewaanE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311910; c=relaxed/simple;
	bh=Ag2dMLJyxsxo2yKyBiVG3MrdVzSXXfqSu4U59syt9qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr4+oXtnWkH34/rxT5UEXjwtvttYkA2SEJIr0b7xbhSq2Bc3ZjABa0sVYhWlqXM0ywoKH7zg7Opuif2xrqTGmNgh9Sex3zuSLt3aerhnSn3VppGg/y8FbVg2+BwyifpZhrySS7RhM8KaaOHRTOlumxCTKgNu5jHJ2Q80KmPqZJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lNdpJaW1; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lNdpJaW1"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8dc09919aa2so19151296d6.3
        for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 07:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782311908; x=1782916708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4TwTbCnVZ8bBjyLyd7NRPMpWOFSAYz6ZPnesPypTyM=;
        b=lNdpJaW17qPMoH2yUAMnqM8j5XpcPExFLbf+hhzalZihNNYvpm0EzeafdSjEpDDfqf
         L4b0TKHbbHnCCCxSykgNT67gv2ENUbipEx2f599phE3Oilw9BELJE2VCF7Wjs+VjYMKP
         bpsUOTHWGelmvINcBqFjniRmo+iH3XlZU2v5rhaImUm6k8oXNiLEiDv839GkUZDXhcJw
         9Yf04yaDRX125DQ29z9MN3CrpZfcnVTJMHWyh+wOrHXgc43LmQ2vbr/kwC/EleBely0F
         3vo8QWr/EasLXRCTqI7GOgVOm9IPLIbR9VGHIYV9Pb6oHUtuUU7BI7x/pUT0dX81gWOu
         NPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311908; x=1782916708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4TwTbCnVZ8bBjyLyd7NRPMpWOFSAYz6ZPnesPypTyM=;
        b=RIDQeYMrP4FwLpupJQxxLaMtCFCkrDZOTq4KYg3vjEtZNZ5jx4c4S8f4kvtUWuaFx8
         C9K8a22FZbQJqdT+4kUUXdkCskMbFaSv1wePmRsdIjjKNAyvHdnI0Z3PyhT4OngkA7i1
         JcY+Gjw2dDUGNVHFas2e7FGvoViqwLVh/Jw+q8MQJ26Dre9jWAH1jv2BGUbx8iYDOhUR
         J1Xljora0xH+1csrn/yvlfygE33O6HBGEQehlVwJGw1MwY/b2v27pvlTOBpGnkw8wT9W
         m1u4e0/Oc4XOl0JricW6htgUllANOVRmNabjtUWUv1lb35aAylGzms/5ydU3wzNMgh+r
         VJhw==
X-Forwarded-Encrypted: i=1; AFNElJ+rPRQsitAOKcdoMCxmARkjDhhpHAihLfjY+9lyFvjH6NalbmjlDQ/nLSl96AgPNMW4uVLDBslsxFg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxio+L81hl/zIDmHQRFFSXCQQdFJZH8VzIWdUicL+JOtpnUFqR
	1KzLE7v/1yumw/EU2x7MNbrftXeW4/w/ZD8eW2YeBnFu6zIsnZ9AoANcSEwF6YT2s2F1rr2YVnN
	rUjY=
X-Gm-Gg: AfdE7cmPw+TieeE0FwXMw+7wwpYkbx/yZTbIPjsonhhn/fh1/d5P7CJ2KC1sq2EJcSv
	fYLrsQ+GN5jBxBLXxI+ruXdjsbo8Ps1BqXh1nReLYXX858dVQAnPYoanhaEz5vamGlQz8hTuyDh
	SQSMBXqJLilEKjGgXaMs5hFAcreFbwc4qKxaL2bPDLZFo+hSMoKTaszirf/vBu+/Zgn+d0sHS4V
	d/6UjJlY5HEesd9lvwBrjity19r8K+z8J0mMozxTKLt5oPJlJdSIcgskWaSx7qXf24+Jfd/PLh0
	gbvFmuTFvOQWGeLcZD/yiF9abFEIKwmH/ZSq9t39EDBtO8b/z/ixfARkwu5qQZoyXMMiHbEywuH
	ofbl3qZQrEvfClshs9Nfkd6suQp3Iph1XvfY2Ho/2jMmsyCtM0sXDCkqNPDW1fuGveGXulEmwIA
	cby0bsprohuVcPz5QwaIvj+iCy213Kycia
X-Received: by 2002:a05:620a:2950:b0:911:9a7a:8076 with SMTP id af79cd13be357-9277beeeb53mr668661585a.8.1782311907591;
        Wed, 24 Jun 2026 07:38:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92600c7bd89sm569510685a.45.2026.06.24.07.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:38:26 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:38:24 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jimmy Hu <hhhuuu@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: udc: Fix use-after-free in
 gadget_match_driver
Message-ID: <079877da-315a-4ed6-b344-35d9954a54cc@rowland.harvard.edu>
References: <20260624030154.393004-1-hhhuuu@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624030154.393004-1-hhhuuu@google.com>

On Wed, Jun 24, 2026 at 11:01:54AM +0800, Jimmy Hu wrote:
> The udc structure acts as the management structure for the gadget,
> but their lifecycles are decoupled. A race condition exists where
> usb_del_gadget() frees the udc memory (e.g., via mode-switch work)
> while gadget_match_driver() concurrently accesses the freed udc memory
> (e.g., via configfs), causing a Use-After-Free (UAF) that triggers a
> NULL pointer dereference when the freed memory is zeroed:
> 
> [39430.908615][ T1171] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [39430.911397][ T1171] pc : __pi_strcmp+0x20/0x140
> [39430.911441][ T1171] lr : gadget_match_driver+0x34/0x60
> ...
> [39430.911890][ T1171]  usb_gadget_register_driver_owner+0x50/0xf8
> [39430.911910][ T1171]  gadget_dev_desc_UDC_store+0xf4/0x140
> [39430.931308][ T1171]  configfs_write_iter+0xec/0x134
> 
> [39430.957058][ T1171] Workqueue: events_freezable __dwc3_set_mode
> [39430.957287][ T1171]  dwc3_gadget_exit+0x34/0x8c
> [39430.957304][ T1171]  __dwc3_set_mode+0xc0/0x664
> 
> Fix this by ensuring the udc structure remains allocated during the
> match. To achieve this, introduce a new usb_gadget_release() routine
> to the core. When the gadget is added, usb_add_gadget() stores the
> gadget's release routine in the udc structure and takes a reference
> to the udc. When the gadget is released, usb_gadget_release() drops
> the reference to the udc and then calls the gadget's release routine.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jimmy Hu <hhhuuu@google.com>
> ---

This is basically right, but there are a few small issues noted below...

> V1 -> V2: Rework the fix using a new release routine in the core.
> 
> v1: https://lore.kernel.org/all/20260526070635.839701-1-hhhuuu@google.com/
> 
>  drivers/usb/gadget/udc/core.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 60340ff9edbf..f8ce8694c101 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -31,8 +31,9 @@ static const struct bus_type gadget_bus_type;
>  /**
>   * struct usb_udc - describes one usb device controller
>   * @driver: the gadget driver pointer. For use by the class code
> - * @dev: the child device to the actual controller
>   * @gadget: the gadget. For use by the class code
> + * @gadget_release: the gadget's release routine
> + * @dev: the child device to the actual controller
>   * @list: for use by the udc class driver
>   * @vbus: for udcs who care about vbus status, this value is real vbus status;
>   * for udcs who do not care about vbus status, this value is always true
> @@ -53,6 +54,7 @@ static const struct bus_type gadget_bus_type;
>  struct usb_udc {
>  	struct usb_gadget_driver	*driver;
>  	struct usb_gadget		*gadget;
> +	void					(*gadget_release)(struct device *dev);

What happened to the column alignment here?

>  	struct device			dev;
>  	struct list_head		list;
>  	bool				vbus;
> @@ -1362,6 +1364,18 @@ static void usb_udc_nop_release(struct device *dev)
>  	dev_vdbg(dev, "%s\n", __func__);
>  }
>  
> +static void usb_gadget_release(struct device *dev)
> +{
> +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> +	struct usb_udc *udc = gadget->udc;
> +	/* Cache the gadget's release routine to prevent UAF */
> +	void (*release)(struct device *dev) = udc->gadget_release;
> +
> +	put_device(&udc->dev);
> +	if (release)
> +		release(dev);

I don't think the test is needed.  Even if the release function pointer 
was given as NULL when usb_initialize_gadget() was called, the value 
stored in gadget->dev.release would be usb_udc_nop_release(), not NULL.

(Come to mention it, that's a really dumb name -- it should be called 
usb_gadget_nop_release() because it's a release function for a 
usb_gadget, not for a usb_udc.)

> +}
> +
>  /**
>   * usb_initialize_gadget - initialize a gadget and its embedded struct device
>   * @parent: the parent device to this udc. Usually the controller driver's
> @@ -1418,6 +1432,9 @@ int usb_add_gadget(struct usb_gadget *gadget)
>  	mutex_init(&udc->connect_lock);
>  
>  	udc->started = false;
> +	udc->gadget_release = gadget->dev.release;
> +	gadget->dev.release = usb_gadget_release;
> +	get_device(&udc->dev);

What this is doing -- the whole scheme you are now implementing -- is 
sufficiently unconventional that it deserves a comment explaining the 
situation.  That is, saying why we need to take a reference to the udc 
and why we therefore need to override the gadget's release routine 
(i.e., to drop the udc reference).

>  
>  	mutex_lock(&udc_lock);
>  	list_add_tail(&udc->list, &udc_list);
> @@ -1462,6 +1479,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
>  	mutex_lock(&udc_lock);
>  	list_del(&udc->list);
>  	mutex_unlock(&udc_lock);
> +	gadget->dev.release = udc->gadget_release;
> +	put_device(&udc->dev);

These two lines don't seem to be needed; usb_gadget_release() will take 
care of this for you when it runs.

I suppose you could argue that usb_gadget_release() might never be 
called if the gadget was statically allocated by a modular driver.  In 
that case the udc structure would be leaked.  So if you want to keep 
these lines here, that's okay -- provided you add a comment explaining 
why.

Alan Stern

>   err_put_udc:
>  	put_device(&udc->dev);
> 
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
