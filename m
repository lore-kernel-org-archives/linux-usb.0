Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617774;
	b=yxUwpx60xQsjd5ECPEV7U9gUHeREC1/5AN7MpnW4C2DGR/BPS526K2FwL/Y2tCuJ7sBC
	 o4IxFM+DXO9ruP/ckUMykaZ5Es6RvxedmrWSy/dg5rRVzlLvo2jefKU2fTGboVdKAWAe8
	 TIiDEPoehCsBxCyLxJMnlrRiTDvLoCMgizlYOqU0wFKisom2BvInwnQeK11/aQvdNmCnM
	 3DiY+fvfjKM2jNvLUIKUKNzYyRxHWXxHfqUiPm9YxDprR2DfLagoprB6UtJxcV61vTFiw
	 AcXoY2/Dkn58X2wspyvbgHEn5/E87OUfGNcw+cL6sei/g/80Tfn0XzOokOhFf87zosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
	b=tGOcslv59CNJTctHRhVWTmcYLqlKWuYLX1nRNRe47ZsKVrgHKCTHvw1lMjPm8me+j9G7
	 t9MZQnqTzNMEBFvZuxR1QMu9U0gwiBieObZd378HGTJcc8GsofODkIOPrs3HzBO3KkVak
	 +y2vwsreH6uVK1HSVx/IcP5uyj6L47ptB2VlkQHObf1/jL2bamDI5BPOuxxBM2Om68OIX
	 TZ+GjpVkUxJpCRfVqvX82a9v5pkH50DcYgQv9MpOIIJwBR6XQNhRYkf86cClJbzfqyMOl
	 SADynY13w2oszgKA/K6+/wG0lDwd2nIbbRVa3X4mgSgBCOhlYB2/qirMhwt8LgWesgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="EZW3/ZuY";
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6540606A327
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6540606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=EZW3/ZuY
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d3563e50eso38426941cf.0
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795617772; x=1796222572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=EZW3/ZuY9WExbtSmj8DEkIib33heZdtGlhNDFx+tWdjASShaGJG9l1m82Kj/MaL+Fp
         dpSIbAnEHbFlVz+hIeuZe2jUZo7AJHmM9qcPUK5q4JUVqrygllkLlH5tKigPAwlBeJEB
         9LB10PLPNriJ9LdP2TBPATITfz7dOocLcdPXlVrWDP+RhnNxnuqb2E0hJfrMM+wCq9Jj
         0kjnypjQJIIlk11Kkm8Toq0P5eSeNb2pMa1k0pZ3FpVxzPKKXpMeyZeumx/o0vJkVbcZ
         vPXRC8FrppaPLwV8HvL9WH84Z2AFAp0gZ44kP+l6CyLkE5MwSC6VlDY2fKA7gEMmX/Xv
         DhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617772; x=1796222572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pe1ZMe82aYurb6rarn1VrDghVHB1DbUnPtYdYIQXQBY=;
        b=alBA0P/OMyo2mzn3gIb4t1lfuVpFCJYAGHpQtzBIVSvmQXnNyj1eX4bDKxLlkJEv85
         Fb3CVsvpOLYT39kjAcdWcOiOqdKf5hAwgqHespkwMp2Q4jRgas+mOSA3YqkavNlvtriX
         ET8xoS4YQiiYYNGOW0KiW7b17kfhW5l8JPqWt8OoKWYNqK4pLfWgfhL3TGsWsoWDhoK9
         BKJQDKhPwh44lffhqZOQ2G7umYAmhJMn0fP95xErWDfbZiVErug9O0VnXH8K8M41ZxMr
         WKZMChb2ACzVT/KL4F8aiSrHEzm7TgBmQ6o/HL8J9EdryZxo6UpOD/rtWMConQoXiwNu
         7HUA==
X-Gm-Message-State: APuU4Z+ju2KWgm9OuX9UzKnLnQzK0fQ0TKfWrg4yETZFe5AzzdgABOjl
	ieT0LO/fSIu7IZJ27dX5Ro9JJj/XwWrQmVWlEIq46qpnKOYjCGuNBbyKK1ZXcqad0g==
X-Gm-Gg: AZFdTZf8br6Js1fjeUeDiWGTX1NuM+s2cQXCAFkL78IOCGc2zNg8quhzO11BgWWNAdQ
	97FOKSjGbLhL1dL/zxAlLPg267ExubiSfRh21ERZAQdTMck+jC+L3dfbsDkXxhuVJnMIUXZeItp
	Z6urHK6Tn9hOFs/U1HxPB1FtRHSt81yJtLPrd88UvLTBG4YCqbI52X0VIaFWeeJs4Bogat8wuwK
	Meu8gdAOwGuPuwmtA/pRW2v2JaKGGweDI9hwmbEolTu+o7DAWisrH9j7pVmGyCTOTq96Osr8+Mp
	M2poPRQ9RF10Gvwn+OtnK4f8xFjajNH6oL4+TmKfB+ND5MQ6BNV+O0hbkUMguCfp0vD5A3re4Pq
	2FU6jepFoOQBC3NeJjjnqBuiRB5ld6e5zU54MXYvdoKDpoyekasJ4Ozfk10FEi0InFLUvkv7xXP
	61TNvNLkNwdcJdM1ni4BxXb/kbK8XoaN5spkQamHsdmU6FKqBAAuyBMeXI2h8PEtvizbgRWgtZp
	BovlxmzcZshpc6Fp5lxuI3akP3qXHqRPAgGQezCI50rHa3M7Ci3GVL5JIuFQHR0foG0ZHU+BTI4
	3K9wQJ3HiJxKeW/P8GgmNhFpHe7T+A==
X-Received: by 2002:a05:622a:a19:b0:55d:33e0:abff with SMTP id d75a77b69052e-55d76933293mr358229581cf.6.1795617772385;
        Wed, 25 Nov 2026 06:42:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78e4fc12sm154986831cf.0.2026.11.25.06.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:42:51 -0800 (PST)
Date: Wed, 25 Nov 2026 09:42:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Kettler Christian <christian.kettler@stiftung-kifa.ch>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Logitech BRIO (046d:085e) stops answering control requests when
 hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq for 60 s
Message-ID: <6118ad01-65a0-4357-8118-3122479b554d@rowland.harvard.edu>
References: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>
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
In-Reply-To: <3cd5f994a6260960cf7751d6383f2b9afc1baeb5.camel@stiftung-kifa.ch>

On Tue, Nov 24, 2026 at 07:56:35PM +0000, Kettler Christian wrote:
> Subject: Logitech BRIO (046d:085e) stops answering control requests
> when hot-plugged together with a USB-C hub; usbhid probe blocks hub_wq
> for 60 s

> 1. Is there a known issue with the BRIO stopping to answer control
>    transfers shortly after enumeration (with the usbhid probe being
> only
>    the first request that waits)? Would a quirk (e.g.
>    USB_QUIRK_DELAY_CTRL_MSG for 046d:085e, or an snd-usb-audio
>    control-message delay) be worth testing? Ignoring the HID interface
>    alone does not help.

No similar issues are known to me.

Go ahead and test any quirks you think might be relevant.  As for 
whether that will be worthwhile -- who knows?

> 2. Can the kernel recover from a device that stops answering control
>    requests during probe without blocking hub_wq for every interface in
>    turn?

No.  The reason is because the device might stop answering requests on 
one interface only, but go on answering them on other interfaces.  One 
non-working interface shouldn't prevent other interfaces from being 
probed, if they might be working.

Alan Stern
