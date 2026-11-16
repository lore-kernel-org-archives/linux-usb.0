Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797941;
	b=XQEU184TQyl4kfAG6/7w6CCpGf9PKG/79JFgmATd5FTgMQG+pkCOPjFbxLwAshdIycgh
	 ypaxuxsz7YucFubEt4cYr3FaGEVoCdXYCKq+r75F2LpFAc/Ycu9nBrwAnIMTnYu4XLzhn
	 6iDePB5qx37pAgBcpb/bQXBRYMGGLG86vUnRDvBMKShwDNKLDLQp43sNtwwBEOhar5kA1
	 uZRfN8gBClHcLiWdUzAbsYGNgeEj2M62khu2JgY5xbCHrffv9m4TkCqfmPkRGCMAGXw+Z
	 FbHX0H8JJzYmKx0vwQAhbGrRLiwuoJA8yqJm6y7UJy9IDSmp2L8TtjIVTZwVNGMwuyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gTVvKoeRO3vAUTBTs7zrlZpBt330zx8LbQ9vQn+HrGw=;
	b=XB9FeEP35MSUjgQyTu23IKBl7fsWU37K7uqjwFH0v1YNGBtjRVZMdVfy/qysGsA5IW8N
	 au8aKGtjCn6ObqM8+TOzqMT6v/FEmxhOc8bkDYmM38U1uRXTRavt9LdGj0hSTysVFhD1a
	 9vnOlZWwsCkLeYHkv4VLiYQORbHgLFW949jymYWMAhHfIduAVDt+pOMlPMoPmMWue0/je
	 ujNjkZgb5EFbr3xeirmQ1dB/5lU3uSgARu3jgk/r/I4It/f6PNXzbLqsLbfkq2YMGMfdc
	 jeo6vcS0ptprBirvH8mxkcF97VVh+jBvCM4F1Zd5D/JltRMZjgiIZ6DuphxKPXhA62g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ejLiW8Za;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF37D606A330
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 02:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF37D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=ejLiW8Za
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53644b28706so19132031cf.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794797940; x=1795402740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTVvKoeRO3vAUTBTs7zrlZpBt330zx8LbQ9vQn+HrGw=;
        b=ejLiW8ZaykSOXsMfXPmplbBCYk0OCnOs1Ou+c/1bNy/OD8W9Oui2DA1s1rSf/d+Y6+
         QeGyaOyDtysCYEG4mvfjFpEiOifnfI2En2iQEaQMPD+hLhPVdEF/1Ne79VfbHUZgKcT1
         jtLQ93L+m7RKC2vh2Td/YYIK2NPRb6lYzaEpi3VASXjplYqjHD1GtCglXIEPZUC0Zrdh
         hdyJpfrJQGHD1zismU9cCjsuWKnMzlfxXsr55sWYUao47N2R80+M2Gq7S/wMIBJB3JFH
         uWeqJkj4yWvgcuBevgeypzwGx3Xo/u21mbsssMiTCDLCdvjns/cIMVsWP9kPA7NqId3m
         gmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797940; x=1795402740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTVvKoeRO3vAUTBTs7zrlZpBt330zx8LbQ9vQn+HrGw=;
        b=E5LfO4qRod0Q2f2Sm7mFKJ0WbN03FcNlCYyDXUHnQP67CwNNk4fgVVSTkuNqNHzp86
         Q9Pi+GNJyfmHgSO0JixO6X8JUu8PQE0rou/gMpSCCG2Ba52l9t6zXmM5Y1HSDHWBrSNq
         7g4m0EcZgzfOiZwGFOf575F4UkGqvGj1RJxIAaLCnUl9gQVhdGV49trmhvwkcOrMWaqZ
         hL37NnaPMeuUHCbcj6bvvpkDkt4vp8U7GPQlSKsncufAIhoA5uICw8yq7nO4EMBOEPjH
         lQcTucphBj/qcB40WrpV3vfLPl2hZ2h1l+vG1iSAMah+qYLDG8SgTNv4XUUy2HrWjI6d
         3/Ng==
X-Forwarded-Encrypted: i=1; AL+hErHvEkvbC7ajdVayHrD4YfzjOm/6i0WosY7RavO67l2XPFF62gackY5WdNFalsJHR7cjP0jVRRs2n+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D3EwYzz6eXc56bGK8PKAw8A22T5nwZ1rRF/ywVqs/8Ih5vvA6
	AZPv3MwoQ1mQWOeDwLQzZYxUdlidEdd+lI9WjWxlYds6RnKr4pjq44X1LzjZDDEZLw==
X-Gm-Gg: AYBFou3fUFgjmngvajVfWca9s/Esss9/aB7gZXODj6tJvyt/bRRGvkg7HbbG36oZSNb
	IxX3dyGx5Kfw0CozaqII6dMjM/aJCuO6FmJciAurH5Yhd86pBVud4xW0iC9Dnjpm9L1Mv73MS8D
	W3gVRyl/Mj6z5LdJH1YrdWgVSvjhgImGDjsYTFRujFbvmbFN8hbKyo+/rrQ+PVrVq4hlqSrSFiq
	jkDs/D2J5PmVMbyZKAioYfLg8AOKDrS1re0aaNbh1krfm3oDqSau7sK8YkX/tG86RTVYv0bwgDH
	2YqxS6LA2xs5Ur5ystWXNTg7LNQGKZK3UKm36wsZgLVmipiDOACbxCTJKGfemyxnBoro6COvt2U
	BcK6/eJxjRjTxxPNC7/h/ipCBD7KJr3ZkcjFEzNWIAjvraBE/9AZBhyn9D3zm9fvJViBHLMP0fD
	rOxbRuQMqxipKcgUJnNj75Bx1HqbIQEuO+cidobZxoyiz6H3bn1dr6hV+v7IHBZrFdXxUEhSuKX
	txL0fKW3wvnYqk3hV+AgPxOigQXUt2xq4qQ3Dp+y6VHJcd0mlLOqv35/m+KV2/qnCM2HMDGQMMD
	afknYGiv56iX0YZ4dHrPHhQqxs/qY9qEeM0KVIE6shUcu0KxAk7B
X-Received: by 2002:a05:622a:4d8f:b0:55d:2ac6:29aa with SMTP id d75a77b69052e-55d2ac62b3dmr78843871cf.77.1794797939626;
        Sun, 15 Nov 2026 18:58:59 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d2cdcb6c3sm33461031cf.7.2026.11.15.18.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:59 -0800 (PST)
Date: Sun, 15 Nov 2026 21:58:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 4/4] usb: gadget: udc: Decide on connecting in one
 place
Message-ID: <67c668fc-4b1b-4f8c-92c7-861a735b26f2@rowland.harvard.edu>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net>
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
In-Reply-To: <20261113-udc-connect-v2-4-f51b11f07eb8@flipper.net>

On Fri, Nov 13, 2026 at 01:28:19PM +0400, Alexey Charkov wrote:
> The UDC core connects or disconnects the gadget on bind and unbind, on
> VBUS events, in usb_gadget_{de,}activate() and through the soft_connect
> attribute, and each path applies its own rules. gadget->connected
> records both whether the pullup is enabled and whether to enable it once
> that becomes possible, so the paths misread each other's state: a VBUS
> event before bind kept the pullup off until the previous patch cleared
> the flag on UDC start. soft_connect also starts and stops the UDC behind
> the gadget driver's back, and its "connect" overrides both VBUS and
> deactivation.
> 
> Settle the rules in one place. The gadget may connect only while a
> gadget driver is bound, VBUS is present, the driver hasn't deactivated
> the gadget and userspace hasn't disconnected it through soft_connect.
> Have usb_udc_update_connection_locked() record that in
> udc->allow_connect under connect_lock and connect or disconnect the
> gadget to match, and call it wherever one of those conditions changes.
> gadget->connected then only tracks the pullup, as the UDC drivers that
> read it already assume, so the clearing on UDC start can go.
> 
> Reduce soft_connect to setting or clearing a disconnect request under
> connect_lock, rather than the gadget's device lock, and forget the
> request at unbind like the deactivation. If the pullup can't follow,
> keep the old request and report the error, so that the request and the
> pullup still agree. Leave starting and stopping the UDC to bind and
> unbind alone: the attribute is documented to control the pullup, not the
> controller.
> 
> Let the helper succeed on a UDC without a pullup control, as there is
> nothing to switch there. Activation and deactivation keep working on
> such UDCs, and binding them works again: it has most likely failed with
> -EOPNOTSUPP since commit 0ea39e030a80 ("usb: gadget: udc: Handle
> gadget_connect failure during bind operation"), but I don't have any
> affected hardware to confirm it.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Very nice.  Aside from what Sashiko said, I have a few small comments.

First, have usb_gadget_{dis}connect_locked() check whether the current 
state is already the right one before it checks whether 
gadget->ops->pullup is set.  No point returning an error when we're not 
asking the driver to change anything.

> @@ -1826,35 +1824,37 @@ static ssize_t soft_connect_store(struct device *dev,
>  		struct device_attribute *attr, const char *buf, size_t n)
>  {
>  	struct usb_udc		*udc = container_of(dev, struct usb_udc, dev);
> -	ssize_t			ret;
> -
> -	device_lock(&udc->gadget->dev);
> -	if (!udc->driver) {
> -		dev_err(dev, "soft-connect without a gadget driver\n");
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> +	bool			disconnect, was_disconnected;
> +	int			ret;
>  
>  	if (sysfs_streq(buf, "connect")) {
> -		mutex_lock(&udc->connect_lock);
> -		usb_gadget_udc_start_locked(udc);
> -		usb_gadget_connect_locked(udc->gadget);
> -		mutex_unlock(&udc->connect_lock);
> +		disconnect = false;
>  	} else if (sysfs_streq(buf, "disconnect")) {
> -		mutex_lock(&udc->connect_lock);
> -		usb_gadget_disconnect_locked(udc->gadget);
> -		usb_gadget_udc_stop_locked(udc);
> -		mutex_unlock(&udc->connect_lock);
> +		disconnect = true;
>  	} else {
>  		dev_err(dev, "unsupported command '%s'\n", buf);
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
> -	ret = n;
> -out:
> -	device_unlock(&udc->gadget->dev);
> -	return ret;
> +	guard(mutex)(&udc->connect_lock);
> +
> +	if (!udc->bound) {
> +		dev_err(dev, "soft-connect without a gadget driver\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* "connect" only lifts the disconnect, it doesn't override VBUS etc. */
> +	was_disconnected = udc->soft_disconnected;
> +	udc->soft_disconnected = disconnect;
> +	ret = usb_udc_update_connection_locked(udc);
> +	if (ret) {
> +		/* The pullup didn't change, so neither does the request */
> +		udc->soft_disconnected = was_disconnected;
> +		udc->allow_connect = usb_udc_may_connect(udc);
> +		return ret;
> +	}

This last bit is questionable.  Even if the pullup doesn't change, we 
can say that the write succeeded simply because it did change the value 
of udc->soft_disconnected.  You can argue for or against this; it's not 
clear what behavior is the most desirable.

It might be worthwhile adding a warning to usb_gadget_connect_locked(): 
If the pullup can't be turned on for any reason other than -EOPNOTSUPP, 
the user ought to be informed.  The same goes for disconnecting.

One more thing: Every time you call usb_udc_may_connect(), the value it 
returns is immediately assigned to udc->allow_connect.  You may as well 
put that assignment in the function and rename it to something like 
usb_udc_update_allow_connect().

Alan Stern
