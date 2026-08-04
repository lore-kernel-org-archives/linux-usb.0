Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D312E8B64;
	Tue,  4 Aug 2026 05:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785820367; cv=none; b=N52TZl3AwDutc1z/PdpVZlL31RU5B1KkcD8bPQxrUj/9pxri1WPOv/Xtt+HKHgKG5qMV/IVzqV92bnUEFb+Rjy0yEUPs/60edpbR/SZrKtsplXBCMkdqf6PCZnc3yo2GJ53dsOo1bUQG4b2sqV91HAEcLn/SDRFs6WxkdO2DgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785820367; c=relaxed/simple;
	bh=vjNtVXss0UzYeW0sRXrC+QJmIiNoq7AuhFCw7wNFC7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1CZeTmcuw2CAMACW8TFCc8hgtby7gMxrR8A15EgYNK1W6l3M0D+sZrIvID0Lt0OszaS+LtOK5u5+NcEpYTRulZnxlsX1Ogpp15gdkOcj0LqG89rtuJ/v+YIgHCfA2dWCNPsjiA1soBxmZbJR7SDRyQDIbUmWyf/uqk37pe4udI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=v6H5vSe3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="v6H5vSe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108121F000E9;
	Tue,  4 Aug 2026 05:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785820365;
	bh=SAryejrsmAfw5TD6eW+vk9FwM9M+Muv+o9njCQm5uHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=v6H5vSe3bZ+n7f2QN/3F+aGV1Z+/mW/s3aL79QwX0opSJU3BivDaPlSdV7DrQAqBi
	 8d4R8VoCtC7r9s2tu2yshr6RpHBd9rH2sDLIygmf2WB285YStTAVzr9m9syFPFMV69
	 CjGX1qt8g7TCg5w8Edbiu7MQD7l7CGTaVPzL/af4=
Date: Tue, 4 Aug 2026 07:11:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bolewara@gmail.com
Cc: Andrey Konovalov <andreyknvl@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: raw_gadget: fix use-after-free when UDC is removed
Message-ID: <2026080448-grandly-jockstrap-4115@gregkh>
References: <20260804-raw-gadget-ep0-uaf-v1-1-07878773da15@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-raw-gadget-ep0-uaf-v1-1-07878773da15@gmail.com>

On Tue, Aug 04, 2026 at 09:55:29AM +0530, Anuj Bolewar via B4 Relay wrote:
> From: Anuj Bolewar <bolewara@gmail.com>
> 
> When the UDC is removed (e.g. dummy_hcd unbind via sysfs) while the raw
> gadget fd is still open, usb_del_gadget() destroys the gadget device and
> its name. raw_gadget keeps a dangling pointer in dev->gadget, and ioctls
> dereference it after releasing dev->lock, leading to a use-after-free in
> dev_err() when usb_ep_queue() fails.
> 
> Hold a gadget reference from bind until unbind and clear dev->gadget
> under dev->lock, so ioctls either observe the gadget as unbound or keep
> the device alive through the reference.
> 
> Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
> ---
> The gadget device embedded in the UDC is destroyed when the UDC is
> removed while the raw gadget fd is still open (e.g. unbinding dummy_hcd
> via sysfs). raw_gadget keeps a dangling pointer in dev->gadget and
> ioctls dereference it after dropping dev->lock, which KASAN reports as a
> slab use-after-free in raw_process_ep0_io() (dev_err with a freed device
> name).
> 
> Fix it by taking a gadget reference while dev->gadget is set and clearing
> dev->gadget under dev->lock on unbind, so ioctls either observe the
> gadget as unbound or keep the device alive through the reference.

Nice change, but did you forget to add an Assisted-by: tag?  This patch
and changelog really looks llm generated to me.


> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 4febf8dac7c..acc6e4799ee 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -303,6 +303,8 @@ static int gadget_bind(struct usb_gadget *gadget,
>  	dev->req->context = dev;
>  	dev->req->complete = gadget_ep0_complete;
>  	dev->gadget = gadget;
> +	/* Keep the gadget alive while the device holds a reference to it. */
> +	usb_get_gadget(gadget);

Comment is obviuosly not needed, AND you should rewrite this as:
	dev->gadget = usb_get_gadget(gadget);
right?

>  	gadget_for_each_ep(ep, dev->gadget) {
>  		dev->eps[i].ep = ep;
>  		dev->eps[i].addr = get_ep_addr(ep->name);
> @@ -316,6 +318,10 @@ static int gadget_bind(struct usb_gadget *gadget,
>  	ret = raw_queue_event(dev, USB_RAW_EVENT_CONNECT, 0, NULL);
>  	if (ret < 0) {
>  		dev_err(&gadget->dev, "failed to queue connect event\n");
> +		spin_lock_irqsave(&dev->lock, flags);

Please use guards() instead here and the other lock you use.

> +		dev->gadget = NULL;
> +		spin_unlock_irqrestore(&dev->lock, flags);
> +		usb_put_gadget(gadget);
>  		set_gadget_data(gadget, NULL);
>  		return ret;
>  	}
> @@ -328,7 +334,19 @@ static int gadget_bind(struct usb_gadget *gadget,
>  static void gadget_unbind(struct usb_gadget *gadget)
>  {
>  	struct raw_dev *dev = get_gadget_data(gadget);
> +	unsigned long flags;
>  
> +	/*
> +	 * The gadget is going away (e.g. the UDC is being removed), so stop
> +	 * using it. Hold the lock to synchronize with ioctls that check
> +	 * dev->gadget and may dereference it after dropping the lock.
> +	 */
> +	spin_lock_irqsave(&dev->lock, flags);
> +	dev->state = STATE_DEV_FAILED;
> +	dev->gadget = NULL;
> +	spin_unlock_irqrestore(&dev->lock, flags);
> +	/* Matches usb_get_gadget() in gadget_bind(). */
> +	usb_put_gadget(gadget);

But, how can the reference go away during the bind/unbind path?  THat
shouldn't be happening as the owner is not the driver here itself, so
the increment shouldn't be necessary, right?

thanks,

greg k-h
