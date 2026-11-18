Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026155;
	b=ZN/Vxysg4pkl90XI9+PCSn7pC4D30uBCHtqWZqhX3nMVSBid+67eh2RAiOMCWwya4MY9
	 5oex1JwqaWkWv43qjCJJficC2bhVAFhGu2466KWaChNLThWK2FF7HC8S6sD5SmxwTY6Gw
	 6PLA9zGd/Oc+cHi/SKnXOxFuwPbihzg4D/xfBf7e/5FfHnYRPrj0xH8PLejSsIoWk7Qbq
	 /BYWO9H2l6Rj0IYuLrsN7mIyN+c06y95MAxOYZ3kWO0LzEf82veO4/PYLZ2rEmvYCFB/Z
	 MedObFU4Y8Bjj4lvpRVSn1ll3hLoZpt4zlaA5Jkoprke0wMHTFwa7rT4jl1PbYKZxsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
	b=wSSTHzZ/talvqzVH8/Sdw62VSJ84M85WzwcYQDaKUNrB/QoGwnVOnHix5S3zf8Vqecjr
	 7HbrW/RMLlKdsUFKniAK0qVcnqiZXkNSpflPdhTmufJCqDcuTYvxu/zjFdjPqQGhnuaP/
	 xbLhE3ixfSkPQLy4LHFYPQOUpAhVsvRCTQlrpv80Osi4309EDgMPr8SBqzwFxbIK4KD2x
	 5c6ngC3imJujr7KSfZNVA8H7UXTKk5nhtmufU/PXYorfa4KWuHzYGp19jVUIemp+M7Hhy
	 37b9ogNGSveH2xGTOotkDiWTyyfM2yag+jksi6VpreMKLHCMXVD3OLAU69FqcU+4S1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cnXGQc4f;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8FD606A32C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 18:22:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D8FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cnXGQc4f
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9497a167a6aso10341885a.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795026153; x=1795630953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
        b=cnXGQc4fX2GKsWf2r8Qtk5ghyw0cgOyRGxVeq6PSdtK1Mit8DixMVGBAztBwq1SYyv
         Nh2ZxIn5/Jb2AH+7Lwu6eBwhI+h1l2aDdnqm58QsUmqbOis8XxNoLg9TYN0c1GiBlFUz
         3/vpM/zyeOwZvchrtfsful8LjthcUANs1ocWGSY0hVVSwfM6eFi6cS0bAUnDQKZ1zoK7
         Oci7ZXeXmKBV0n46NGoNgGbQOskzNVRKd//mXimvXDhj+U43XHR7Gyls57Y+x4RLz5Z7
         qPICM3Cg0qxwDjeHJjM79Gk3Lu6KfDU5TLhQtwXow16Fae1+VOEAyvE/TCtPhPd8jNkI
         zGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026153; x=1795630953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMKQOV/DxCkrPHKAtfr//ClygiL+UWH95ly6S/Oee6o=;
        b=Mq4Rfe/2XfN9bQMgj6UqOo/9edxiWDSuU9h1jBNGB4MGliyTMl2KGVl9Sxiig5od9R
         nwn0xKESBtQpNzC48Lkfw/MVPCrg82v/qY+7UYBvA+YHTymtLMKmHpjpWggqiF5rIiqe
         TSJgVSp/R5eBZpHVyn8aQwYK4zyiTHudZSIXDZQnIkTgK6i+cMUqEAajm3g6xaFykxFJ
         gXOoO0UuxOZ4vaj2boCEamwkk7A3N0jR3mZfu9/W5re1Jvrb5gCrBVKvPztKxBG3EyUc
         eaKCHzhbiSYuSCwlkTreVW9S13CbL5gM6WO7W/Gea8mR/yH5DEhv+iq9GiERTbl5x0au
         F0mA==
X-Forwarded-Encrypted: i=1; AL+hErG5IXeGV+oagOfw8z/doK2HWPgphSGmw+hwUuZG4H/Xnz8wED8oleN3YV3viLS9MGpOBkJm23WhP50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QkTXQXnZfgkUBqzJkSZhnI0Pp7SklLj6C0cYrRvPZ1F7PZGmZ
	r0PrQb5P5yKBynsIZpnGtZewc+ci5lHJRQ2NW5CiH815vJ3RlDT1JCIkfWfrRa/9YQ==
X-Gm-Gg: AYBFou39RVUaDztKPtX1uV8mIq33982/SkRSeo32mOQoI74+UQEOwWBLCm6M+5rHnWn
	hEgvAryrls8aTyUEH3zKDRBBzuQZZ7fKhdqd6oZOREEQrlc07pbzkyxdeOzdqvNeZ8Je/A8oo/5
	t3UFPDx68EQIm2DbDdCxzeU9SuC/q3ddq1IgxGig2BBscnnGccGRBMzMm44gEfLyaEWcx0Gs+Ki
	aC8bQJAC1RU//pncYmXLBLTKcZ4ivBaqVu6+kQoZPj7lPl1leUo5NxEUw6GYNupw6iKAq1ta7DD
	+gwDGRHOKRRHuTM6q/iPNRgIF8UvXz8oZ3BENuaCJdIQSt6H+WjU7HtCCGv+/qv2HPPvJn7nvqc
	do39SiXloD8AKvjrknqdCQPeloDij/A+8L+n8VdODKGrbMxYxg6PjORxmJAXhSWugrvFYl/wLj6
	ZKDl5rsjCIIZbxeg7aH4nj6scJ7zR9fDsuGJrWeF0NaM/tHQ4qKIvKQLxQ1fR3xO9qknBV98I9w
	QWc4bOh9A96g6wVRVIyZ8+cyJ/Yv/VKoQaUhEwag0mmwqNQryf8CiHRusCKeAIFsDdAr1cBfOmO
	RNZqWiJqr5R3jwqYx6bsiYagA6p0RgTExvg+8WqQ5gLsnKHLYIc=
X-Received: by 2002:a05:620a:2988:b0:949:5cb8:6bd8 with SMTP id af79cd13be357-949a8bafce3mr60524085a.22.1795026152815;
        Wed, 18 Nov 2026 10:22:32 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b767dd6sm242351385a.24.2026.11.18.10.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:22:31 -0800 (PST)
Date: Wed, 18 Nov 2026 13:22:28 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3 3/3] usb: gadget: udc: Decide on connecting in one
 place
Message-ID: <0790eebe-a009-4617-a62a-e1a6578446a1@rowland.harvard.edu>
References: <20261117-udc-connect-v3-0-9413b491d213@flipper.net>
 <20261117-udc-connect-v3-3-9413b491d213@flipper.net>
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
In-Reply-To: <20261117-udc-connect-v3-3-9413b491d213@flipper.net>

On Tue, Nov 17, 2026 at 04:48:09PM +0400, Alexey Charkov wrote:
> The UDC core connects or disconnects the gadget on bind and unbind, on
> VBUS events, in usb_gadget_{de,}activate() and through soft_connect,
> each by its own rules. gadget->connected means both "the pullup is on"
> and "turn it on once possible", so the paths misread each other's state.
> soft_connect also starts and stops the UDC behind the gadget driver's
> back, and its "connect" overrides VBUS and deactivation.
> 
> Allow the gadget to connect only while a driver is bound, VBUS is
> present, the driver hasn't deactivated it and userspace hasn't
> disconnected it, and re-evaluate that in one helper whenever any of
> these changes. Let gadget->connected track only the pullup, as UDC
> drivers already assume, and clear it at unbind even if the pullup
> refuses to switch off, so that the next driver starts clean. That
> supersedes the clearing on UDC start from the previous patch.
> 
> Reduce soft_connect to a disconnect request that is forgotten at unbind
> like the deactivation, and leave the controller alone: the attribute is
> documented to control the pullup. Keep the request if the pullup fails
> to follow, so that the next update retries it, and warn about such
> failures, as nothing else tells the user.
> 
> Treat a UDC without a pullup control as having nothing to switch.
> Binding one has most likely failed with -EOPNOTSUPP since
> commit 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure
> during bind operation"), but I have no affected hardware to confirm it.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> @@ -766,26 +773,20 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
>  {
>  	int ret = 0;
>  
> -	if (!gadget->ops->pullup) {
> -		ret = -EOPNOTSUPP;
> -		goto out;
> -	}
> -
>  	if (!gadget->connected)
>  		goto out;
>  
> -	if (gadget->deactivated || !gadget->udc->started) {
> -		/*
> -		 * If gadget is deactivated we only save new state.
> -		 * Gadget will stay disconnected after activation.
> -		 */
> -		gadget->connected = false;
> +	if (!gadget->ops->pullup) {
> +		ret = -EOPNOTSUPP;
>  		goto out;
>  	}
>  
>  	ret = gadget->ops->pullup(gadget, 0);
>  	if (!ret)
>  		gadget->connected = 0;
> +	else if (ret != -EOPNOTSUPP)
> +		dev_warn(&gadget->udc->dev, "failed to disable the pullup: %d\n",
> +			 ret);
>  
>  	mutex_lock(&udc_lock);
>  	if (gadget->udc->driver)
> @@ -809,6 +810,10 @@ static int usb_gadget_disconnect_locked(struct usb_gadget *gadget)
>   * Following a successful disconnect, invoke the ->disconnect() callback
>   * for the current gadget driver so that UDC drivers don't need to.

I wonder if we need to look at this.  The current code and the code in 
this patch both invoke the ->disconnect() callback following 
unsuccessful disconnects as well as successful ones.  This seems like a 
topic for another patch.

Alan Stern
