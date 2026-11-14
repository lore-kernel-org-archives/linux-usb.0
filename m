Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690462;
	b=PXMjnEghEbxiflfK9xm8hGOgNVn/+/JeBIIuegqkpv1N6gRI/Hg97QW6QEZuAe86Mgcw
	 xdhlwg4FXpDBmuuTd8ipQ4Nb62CccTDG1FclHKgY6zLDakj927BCPPTMnEPEAO1V8BSF5
	 Gz92mTAgaaKlWdo8LdgFqjHseQgR8K5lZkgoj3DxMb1RrpTZLc6XprJ7dwH5rh/uf4XRp
	 Ue6xPa9wTvDP8iIpDBtj7u8OZc7nAoJvLanfPwoo1iL5IC25HefdK9s8ZgEH54DpqTP65
	 ebhEcKgzcCSProKEMTxiyaBWPOWREqg7/UyAE2LBbYnQ393XW/BBE5ut8lD4Lqy5VIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
	b=EK0bigNKx/KCjT1P+unwZBbEa9rsnWD/da+sXhd58rLSMN0scGRmYs1USdPbE7bBR5sL
	 aWFAIcD+wCD2MZjVHytNkprxlRGZ4LiEar1RTEZ60snvI20zrm/i+7l4mQmFC2cEkSG88
	 VTCBXRzW9bu4gb0iXML0qO0czcxEv5mL03PBdE8yagU8vU8pICa/WsqMGeXhEBe87exHK
	 CSEnJqGNLtPG/cyG9ReYv22pnqCn9OGDxaZR3G2fv5jAXhxRXfGoWYnxYSg8Wvhqd/Jte
	 RTMRgF1bYtAK+SxnFsD3LZL0+8izS9eiU5tohTF91Mh9O+z1LfYVWbnZOBabjCgWioA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iMNdG1Up;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EED606A32D
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 21:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6EED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iMNdG1Up
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5361e313e63so36505651cf.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 13:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794690461; x=1795295261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
        b=iMNdG1Upsv6oTAO9gm7mCjljk8M/S+CvvgXtywU4RoQitKBxzrUwMVxEXtXMrhl89s
         IL9fbJPyWOuUe9dyy8KuuXfXR7r0aTEaLzPW9cRIuvj5kw5qxhEtCO/GNbrtedgYBjMy
         lpmE5SdWxfQ4Ooq8xF9kVPfHpuRltpH/CBf1n3igYsLyFX+kGHOksDfPDl/Y8qiXiv/5
         kPtbIgjOT2b7mt2aTNP8ErVerzFkljic3mTl7g/4YOhvfTme2OA7o79eq2iY8UJIrREU
         p21zAMkqsrlpOqf2V0DAPKGMEmxxezhOhETHNlxxcyW7f++U7k4X2um3DogPr0sWujBn
         /QJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690461; x=1795295261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J1RiYWC1Gtgqr6IRbxXgwNcNyxzKGHZt3TuIm+iR5m8=;
        b=L/Qw6nRXEEmdyhcjCS7veqPxYC8XNnNd73UoQ66pfdbJVgvxW05nWeISZH0zbDU+K3
         Y4NOapI94xXES0MhGHdeu/2mp61H+w2I9eXC57SsxSU+h21s8aH/HA0NVG3BllxOuVZP
         ekb3u6drBvjvUySxYZiQSbIUtBvLKrhQjT3sH2l4PAxKazMOou3ocF5QIqRH/Go0iVeE
         lRxysVX5z31IFLtiivQXOxRyuzD/gAq4sDE9G83mVIEZQYDysQlxceTC1TZrSv7ofbaU
         Z7KJ57t6u3VBdF+9x0UhBpTZO4L/ERi7XPqVFRXZX9O1CWSL8KuN0CbStZ8kXOj9YBa2
         wJAw==
X-Forwarded-Encrypted: i=1; AL+hErHdvHfmymu1p4EhkIjl6xp0kbdBoJQiSpd2tv20ZCWCX33RwKeCG7na8+g+TtcFgMh4yHT1rK0BbQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Yn/BhXqX9sN6QnRAWsoMvKCV+wK6cHH4aPktMx4qnXKpBghli
	jl12hbl+qyIoPHgfAN/LvOIGWRaoy2dxyiWH0zvS6k6kt/w/H3ivMcXlqz3CW6a0zg==
X-Gm-Gg: AYBFou2P6hNO0UxCEDE7sMwTBKo7yNiLsrNjwmSKlZbL9DTNH5mbeCYrwLYH/viVXsz
	f1nkzogzuzBOd9y6ShsAQtefpNb2223IAiTkrNK4wLbVUjfOoOw/B95YaVNmtI1jqCVBxoYdOVw
	GcJ9hlYtxBA5r+w5Lni83yBQTxcvG3927kz4pUbB/T9FeQCzG1YWKVE2UaCdpewX9+4dNLevmlz
	24mM4P+U1EEFdms7Z//56jsFtYdVj48xEGE9Pv4LL63+Vq+f36UDIhAUEGmpo8vjxw08eE2raM+
	NGAv231SCVy92jWtq0DAF7ac+nuCYJy4xWZomdOYdvCfySwleF3M9TxB/NUBrzFm4aIxvX19Rgv
	XMwtV6pOTWf1g6dz74eXAwTdfXGrci3391s3hoBF0lbayluZTqS9SGKQWq+mzqCz6+cAdVXUV5G
	GDvZtsPEObuJDVo4J2nfhfTq6c/WeUgpyWI5wTcajftuvgXRbcsaZnn6v9fESo2HBCHVLkP4Zj8
	H+BTiHnVBYva3Adly/LxQ0OyeJ2Oibxogyt7YPAurkCRB30yAzhFSNnM4DfcT7090oahfHBqTL7
	1nrGji8UlWG2V2DHylvmO4BdXP9hwjw=
X-Received: by 2002:a05:622a:5a16:b0:55d:10f7:8c72 with SMTP id d75a77b69052e-55d10f78ddamr26486191cf.18.1794690460564;
        Sat, 14 Nov 2026 13:07:40 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23c9b30asm50035736d6.2.2026.11.14.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:07:40 -0800 (PST)
Date: Sat, 14 Nov 2026 16:07:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v2 2/4] usb: gadget: udc: Forget a deactivation when the
 gadget driver unbinds
Message-ID: <cb1a0c88-0288-4296-bc0b-e3a7f2186593@rowland.harvard.edu>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>
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
In-Reply-To: <20261113-udc-connect-v2-2-f51b11f07eb8@flipper.net>

On Fri, Nov 13, 2026 at 01:28:17PM +0400, Alexey Charkov wrote:
> A gadget driver deactivates the gadget through usb_gadget_deactivate()
> until its functions are ready, so the deactivation means nothing to the
> next driver. Yet the UDC core keeps gadget->deactivated set across
> unbind. Only configfs resets it, from its own unbind callback and
> without connect_lock, so a legacy gadget driver that unbinds while
> deactivated leaves the next driver unable to connect.
> 
> Clear the flag under connect_lock once the driver has unbound, including
> when the bind fails after the driver has deactivated the gadget.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
>  drivers/usb/gadget/udc/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a1..84dc0820c2cb 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1647,6 +1647,13 @@ static int gadget_match_driver(struct device *dev, const struct device_driver *d
>  	return 1;
>  }
>  
> +/* Forget the state that a gadget driver left behind, so the next starts afresh */
> +static void usb_udc_forget_driver_locked(struct usb_udc *udc)
> +	__must_hold(&udc->connect_lock)
> +{
> +	udc->gadget->deactivated = false;
> +}

Is there any reason for making this a separate subroutine?  Just do 
the assignment inline in the two places where it occurs.

> +
>  static int gadget_bind_driver(struct device *dev)
>  {
>  	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> @@ -1705,6 +1712,11 @@ static int gadget_bind_driver(struct device *dev)
>  		dev_err(&udc->dev, "failed to start %s: %d\n",
>  			driver->function, ret);
>  
> +	/* The driver may have deactivated the gadget before failing */
> +	mutex_lock(&udc->connect_lock);
> +	usb_udc_forget_driver_locked(udc);
> +	mutex_unlock(&udc->connect_lock);
> +
>  	mutex_lock(&udc_lock);
>  	udc->driver = NULL;
>  	driver->is_bound = false;
> @@ -1734,6 +1746,7 @@ static void gadget_unbind_driver(struct device *dev)
>  
>  	mutex_lock(&udc->connect_lock);
>  	usb_gadget_udc_stop_locked(udc);
> +	usb_udc_forget_driver_locked(udc);
>  	mutex_unlock(&udc->connect_lock);
>  
>  	mutex_lock(&udc_lock);

Also, you may as well merge the 3/4 patch with this one.  After all, 
they are both concerned with the same thing.

Alan Stern

PS: I'll review the 4/4 patch later.
