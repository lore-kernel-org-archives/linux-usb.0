Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690192;
	b=ZqJ7u/C6xdT0GF0T7pUzCcwkYIXeaNKSjsV1gwbZKxj96+WRVn2IHuhz2JKwToBTrjfv
	 GSELYf72AySBFTyulF/7C4dFcXKJGHCcte5MA6Rf9VcgKfGPcJazH1YLCVsOelwakjSPj
	 0xm+IHZUa36Y8RGCKaUykby6YcYLaHG0hptnJLZOrsNFP2BaxewyF+nYiPjcddoA2uMRZ
	 bAN//525I814YvOIHpclHsho0wzk7iawYLjM8BmQeJMUIF2yBJSzN8V++rxfH1tHTFOy1
	 jSNI8is5IXzRrmC1rc22UE0LaCUhjMpIMJOinHSpkML/qT0O7+uERsuByRLpe/AzMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690192;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
	b=UyzSAN6xYsBA6yfJzPjl3q6h69dBqT+fou1kWRoBvDJMtavE7a6W37fxv0pc5prQMdAH
	 lUxI6DBjvgd9Sr7fi0IZfdqal6rVqR2T2t4LdWYiukX6gMHhUolmS8dNUinECih4LU9uz
	 J3p91ofnBJzzYkJcrrqAri84qsuKS5cxOHk+eC/7FnOLyzBekxvZbXklB9Zo2XTDhFt5D
	 jENkKqDDXV0ytaLnGPzhscWpGTwO3emLWQpp9R9d81uDLppAP/UQczsJIcuZE2GQJ1oyT
	 D621k3s2X/Pnd0pRm7iU7dvc8M4tpHfSpEYpFS2xdmZQ2OPZopntScNX+cRXO3iyi5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=njza3wTA;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6DA606A323
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=njza3wTA
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53644b28706so3124861cf.3
        for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 13:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794690190; x=1795294990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
        b=njza3wTA94nlZ4biRy1rA18jY9hYlEQqvtu6o8uuNZmpbwAyBvWF3zxdtdfC6KDZ7S
         Fb3onuJoOjLXeXKcU/4EXQ8jEuRnMkjTYTX7DXsYjlTGfumZaP17roaMT7KFPVF13oHE
         y8zDyzvIfgegWnYbs3dCWO9cs3viq+AzzRW8WRSvWg+jYOjpM3RAqfprMlaRJuJp82S8
         bpesaZdJf2oL16toVLPEBMotiWo00LN9egC1p6cFLDfbXVFycFylTjLEWbLhSyWNP6NY
         /rvqHv0xJtkvd4tY4azMTT+mgnrOcNjrlagBncohReHsGRYDysYwiT2VLFGnaW9yZnG/
         jFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690190; x=1795294990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
        b=XfVj6ogcdiEJB8Q2Ajn2xpA0SxkHAnVXDozgBno0luPv4MzaOqLRVL/36rt01NKcQW
         BUNOtaqTPaP9+H2Cbk16zPdoqJ5KGpvVpH1H3iR78j59yOd56ihn5xKykRToW1gsjB5e
         sWgJWKIumWkxnEfRtKcw+rI5lKoiNfZoHAbxI3ELFHWTm2F73TeAnqajJ5O1kZeDMJk6
         JavMo/SdLVsnc0SYoHDbLtCF/0Cv0JGIlPku2LxIUQZl6hHNmlBkHsgfHh9JS70UrD2u
         NWNLpiEMa/4aYkVJH0mlcuaPkL8s4qDns9vWbmJvh1bzU3fkTamEuJ9SL+Qf//STnCCb
         wLSg==
X-Forwarded-Encrypted: i=1; AL+hErH314d8gLlQxdgVt6N3CD6YtjGeGNyJX5F4Md2SXBmP0gsm28j+59czL4VJxPziC//V/1vgc+zf5zM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xiFSTJ08huxHUx2XIqACBcLJRgTS85WtvFFd8CXNEPxi8zjQJ
	Xxi9i+MjEIVgc/U7aahaWFfbDeiQGw+BIKvyabqLwKpjKbMPfMtPc3kWSPzzdA6cKg==
X-Gm-Gg: AYBFou15eO4fpE94yRbRdtfHJsIXrgtrW1RgTl/ni0RKaOJKGd8xg/qwcgvSIIDiE6M
	JW/LOVPCph7P4Hi9cDAuGxIw7ukGVxD97H68PreprEaqsXvFDi4X4SbeW3KCvfqoPBeQNub0qwO
	s04EmKtA8SJ+yEeq3LdcQFM5xuOH9FsdGYSnpU7ywYu+LhjfY0uekDDv0YPDuszX8w8HmalRZn+
	Up8OkOsToB5+8XchMsTvaFoiaxnAQwrr1RiTfxw4eA06ZH0RSQ2C9/4B4Pxp/NeY1pi0o0y+RfS
	rSRJvdj4ubjAK+FXpdA1F9Lr1z5kHAems+3Q4W2K4FXHtrRGfMRBRtjjA++5sM95cVV5QAnvIsl
	CvnVzqFUZO3JWSO+RU78vLlN5kpM5FBB4jXliXEVVxNWCtLiQQTzmzfVPTzE12tLTgcauVQTAlX
	+W0pErA4Z34xqkxfvHCFuCrXjrzoWBljvFu9flBbK1ogPpMcnVZg1noXHCk8wBLZUMEg9lNkTaF
	cJumTomT8KT9pZnrhFPdk7plUP9h0/DLRC/KSGiRyAzmFXDxIjDUuaf3PA/J4Xy63w3rhaABsJi
	TQH6hYvo59NFkpElnlP8rd/IYXKsu8gFsh3x2RkUSOdphuosB20=
X-Received: by 2002:a05:622a:5a11:b0:535:a5f7:d586 with SMTP id d75a77b69052e-55ac9089b1amr95896921cf.64.1794690190346;
        Sat, 14 Nov 2026 13:03:10 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d458fdsm50228666d6.9.2026.11.14.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:03:09 -0800 (PST)
Date: Sat, 14 Nov 2026 16:03:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: gadget: udc: Clear a pending connection when
 starting the UDC
Message-ID: <fac47d51-885c-4d83-be9f-860cf70816cd@rowland.harvard.edu>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
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
In-Reply-To: <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>

On Fri, Nov 13, 2026 at 01:28:16PM +0400, Alexey Charkov wrote:
> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
> 
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
> 
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().
> 
> Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index d5844384c368..577bc15f61a1 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
>  	}
>  
>  	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
> -	if (!ret)
> +	if (!ret) {
>  		udc->started = true;
> +		/*
> +		 * The pullup is never enabled while the UDC is stopped, so any
> +		 * connection recorded meanwhile was only a request. Forget it,
> +		 * so that the next usb_gadget_connect_locked() enables the
> +		 * pullup rather than returning early.
> +		 */
> +		udc->gadget->connected = false;
> +	}
>  
>  	return ret;
>  }
> 
> -- 
> 2.56.0
> 
