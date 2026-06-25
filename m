Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A393E639B
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782403714; cv=none; b=ntcN3S0GgZsZn1BArSbbMOJDKrO/G1dAAorzDygOEWjX8RM5taMac4YgE19HNqmavzojmgElbfeu8izdeikh154+p32RRLoqdC01mfBMnQ65uduGX091X/fm1RJkHf5z2u2nyY0d2R+CU/DVx92rvhwU6SoGRjxtrV7AVWAkN2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782403714; c=relaxed/simple;
	bh=txA3luw49KQYaD3e0kkYooetbGz2U80FDkOLBGwVA5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D85IhreSsffHK3NCrwYZP0x/vRw5OphsVS5iVzdPj2EL1RnBiOKhYTDOJ5FE0jnDZ6dqMZ5E3VpBVc79I8NJsOExhci0R9JjQ8jFBrkWfk9pgtIFy+kYw+K5ewu4RKIvm27cGHovPiAfdNN9u/wp4YbZv2BSpM91FPgHqQjgl6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BzZsPfVd; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BzZsPfVd"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-920d6e3963fso5934285a.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 09:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782403711; x=1783008511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug4SbaeJ/1EYKpxKC0dJskWinTAS7LmFXgKf0w7V/S4=;
        b=BzZsPfVda2GFeJl0UtWa2juzVDwnwSa9vyvdf3klmEMIy5vQ02QmOu2XQ2KB4XL4VS
         Poc9XgzmVwSNdXD3WeWvUy8Z2EaOovXb5yleDpvaUIjpW/JdFBHz1JCyqDp9BxwN0VD4
         EAKeyYKe6InGC2wNH3vZKn2oXlYlVAKmEba84z8PrSP9kmWrdjcsLrobDTDzLqlVxJ/o
         GUf91FqJqs8vZqRLm4u6zInTH4LZTJ2VlvmqKjnV/v6+VciSj8l8eZzARAbeKjlHMAyd
         fvefW1Ukocxz4amhgWEtXHo3eEABGY3IDFMxgThpRq2HEjxW+MVrP4Dh39Cf8CL7tdDi
         WBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782403711; x=1783008511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug4SbaeJ/1EYKpxKC0dJskWinTAS7LmFXgKf0w7V/S4=;
        b=WFHOdTyRrZIL3WS92Z0DL4q5bxBdMIQmLGhCA/S2SDgJk9HFR/6l6tAxMgvz/9qAgp
         MQwNpfNUT/yn08Uu8AjfFTlCZazPQYdBo6vetOg5Vybq1L6p+zgzw3xL79PQ++U7TWiv
         e5+lyel39KNDIOeF9LBEbrTOQSCI6lhR/3cGh6aVNqigSJJy4Khix9LFVvzpm/eUcRnz
         nHR9CvbYCxzJVfEZMaq15dFAFYbEHOjwHbyAZ7THi2Nx/JASpEAsG3WWqX/bIZnd3Xrv
         jDZFXxFng+j0d2HPETKFBvYWR4ewoej1UZPI/X/NpXklLAf+CqfyjMLXdGxy1dMS3uhp
         Ph4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+jgJlu3M0RL2J7bltJlHT6z/qVCnFJBvT7BVeYRCF1txFeKz2OFr7KYzkZf7a4AyiJFYVcIQCb8B4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKnA1x9RxHPeDJC0MgDceJmZZSFfEicXmFZuiaSUQa3rOuqEdg
	RoWXgRC+F9fzkziQ8BsPH8Z1lRQQ27fNLAbV14XloHhkS/+a/2gKzshi43h9StH38Q==
X-Gm-Gg: AfdE7ckxA9rnvm0z3opYNFyjmc7lnIV/8iWFFKHSIYl3TajXJMApQU2F8jDo8DkX/Lb
	F+VJM8C5NfbvStSkf/hMONqdPv0QVXwukCvvc7FruLS+q8E265oR/no2adFHI1OyEHCca8I32dZ
	skW10HH8B4iUhlMdMCqyZSngU6aDOT+EJfN50WVXvMBcQDjwk09cvUoZJJrRFlek0XE0OSfkkeP
	zkz4WyYD0OjvtMGxHF/cbT9sLhuYkIbs9hgT5PKhqJIvJS2OBsr/B0yp8PSdEO+cwQNO0nXiL/B
	LCJ6f+csoZpbBq/hFRcztnpUkcjK7ZFAvOOlJdHoXKsl49gDBFIi97jZa13n+u7hH9oaoyIevBJ
	S3l1UPZVu+MPf3rOP/yDXulouI9/rL8UoxRlEx3ty0Y/9e+vdqdAWkkH09MfCMrN/4J6VfujXPe
	oO/WvtG658LoayciqCPc+O2eSd/+Sph9R0
X-Received: by 2002:a05:620a:4409:b0:923:8612:f15 with SMTP id af79cd13be357-9293bd3b210mr434367185a.18.1782403710911;
        Thu, 25 Jun 2026 09:08:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926004ac1b8sm842832585a.36.2026.06.25.09.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 09:08:29 -0700 (PDT)
Date: Thu, 25 Jun 2026 12:08:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jimmy Hu <hhhuuu@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: udc: Fix use-after-free in
 gadget_match_driver
Message-ID: <ae8d0b9d-ba7c-429d-a660-30e4d175599d@rowland.harvard.edu>
References: <20260625073705.803880-1-hhhuuu@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625073705.803880-1-hhhuuu@google.com>

On Thu, Jun 25, 2026 at 03:37:04PM +0800, Jimmy Hu wrote:
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
> Fix this by ensuring the udc structure remains allocated until the
> gadget is released. To achieve this, introduce a new
> usb_gadget_release() routine to the core. When the gadget is added,
> usb_add_gadget() stores the gadget's release routine in the udc
> structure and takes a reference to the udc. When the gadget is
> released, usb_gadget_release() drops the reference to the udc and
> then calls the gadget's release routine.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Jimmy Hu <hhhuuu@google.com>
> ---

Looks good to me.

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

> V2 -> V3:
> - Fix column alignment in struct usb_udc.
> - Remove redundant NULL check in usb_gadget_release().
> - Add comments explaining the lifecycle override and error path cleanup.
> 
> V1 -> V2: Rework the fix using a new release routine in the core.
> 
> v2: https://lore.kernel.org/all/20260624030154.393004-1-hhhuuu@google.com/
> v1: https://lore.kernel.org/all/20260526070635.839701-1-hhhuuu@google.com/
> 
>  drivers/usb/gadget/udc/core.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 60340ff9edbf..f6da12b553a0 100644
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
> +	void				(*gadget_release)(struct device *dev);
>  	struct device			dev;
>  	struct list_head		list;
>  	bool				vbus;
> @@ -1362,6 +1364,17 @@ static void usb_udc_nop_release(struct device *dev)
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
> +	release(dev);
> +}
> +
>  /**
>   * usb_initialize_gadget - initialize a gadget and its embedded struct device
>   * @parent: the parent device to this udc. Usually the controller driver's
> @@ -1418,6 +1431,14 @@ int usb_add_gadget(struct usb_gadget *gadget)
>  	mutex_init(&udc->connect_lock);
>  
>  	udc->started = false;
> +	/*
> +	 * Align decoupled lifecycles: take a UDC reference to ensure it
> +	 * remains allocated until the gadget is released, requiring an
> +	 * override of the gadget's release routine to drop it.
> +	 */
> +	udc->gadget_release = gadget->dev.release;
> +	gadget->dev.release = usb_gadget_release;
> +	get_device(&udc->dev);
>  
>  	mutex_lock(&udc_lock);
>  	list_add_tail(&udc->list, &udc_list);
> @@ -1462,6 +1483,12 @@ int usb_add_gadget(struct usb_gadget *gadget)
>  	mutex_lock(&udc_lock);
>  	list_del(&udc->list);
>  	mutex_unlock(&udc_lock);
> +	/*
> +	 * Revert the override and drop the UDC reference to prevent
> +	 * leaking the UDC if the gadget was statically allocated.
> +	 */
> +	gadget->dev.release = udc->gadget_release;
> +	put_device(&udc->dev);
>  
>   err_put_udc:
>  	put_device(&udc->dev);
> 
> base-commit: 502d801f0ab03e4f32f9a33d203154ce84887921
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog
> 
