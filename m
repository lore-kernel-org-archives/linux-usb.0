Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0630B509
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952808; cv=none; b=iqtSj0cUhGJtXkOnIYQiFi7UWO/KbblYQ6EqGKGITz42FPuZFOn7L5hlfCtwcww+6Ia05YZ5zmfGUqYij+Khk7Jn59ydHaVwAAuhBK4nq4VP9c+l4VW0vvOptTMIUqzRvXkvIDNnekOwP5Z+MKJGHS0eKNnyy+nbkSAgoCllZj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952808; c=relaxed/simple;
	bh=gLaOZ+0CJ5XcMWDzfplO2kHNtswCLwLl1vi3S0NcV2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRGr1Ru7ydtXfpAbmO6c7iavqw6Pha+IEV0ggS4XIrUFnZSyTztyf0GHbglpgtu4+LxfN0T9MXMt1wessnSRRUrmZASfvFvoVwRXJ91PJ0zT6r6fu586IOMf154KekKN7ndT9V/US8Li0JyI8QH74OUcdtAqDpxNS3DLCUE74V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=slUixl9O; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="slUixl9O"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8a3342d301aso66357176d6.2
        for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1776952804; x=1777557604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=czhe1w4ZM+L8EEg+cKkl72+4034NAZ9Z42uDRZvhME8=;
        b=slUixl9OugXUi2WshT35o6qReZIeKfs9NNgjC0f5wtlpa9AaYiBkrQHlX5Ruh1Vsxt
         yFTkBQ7sg9nulcuIAw+b8DJicJ8FpLrhZQ6tKDRZ18tiPFaUAKrtw5GHfTzNw9d7S4XZ
         oAVY4lmp6UVwqPxvWXTbmaxMRt9RrtDZ93H764q3RZ+Lt40XzMTOxwbqn42lzlKbn62g
         7eJ8pgUVPqI1nRSspLSWh6AwcK/y8orjrXILHvULMm2o5LU6JeeSfxCBVN0ghuz1NxOv
         40qeNxgOTmSJuQBP4fnGJQqKLz45Fx3yeMwyQMVJ1z+a3D38zpetE4fFtOIrITZ5zntm
         UIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952804; x=1777557604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czhe1w4ZM+L8EEg+cKkl72+4034NAZ9Z42uDRZvhME8=;
        b=GDSie03QeC9y37tumS5/mrASzNOMOSbBFnBDB/qy3CDmDoTMcGn8IuSSoj8Gez3iUu
         n6F2DKazidQEalZJ4wwUcdojybg5RAJxkhifz0ltDL7fACHNjZ23U2vj0gKUcqi9EBPJ
         z/tNdkbcwzZLeDJ0tA+JJQtvh5HgJ/UYE0xmjsFrIx87cKVODsZyV3sFWvjJ4KUaZBxZ
         PbkaTRh/jj0rckJATvRQKf18Fnr4qryu+LdzZhRpp/rinFKScX7wavLkyP1vkxqsWbBz
         Hd7Ox+3wgQyFB1zdg9y8ola0sZLBu/3l/W5qRVIsIUIIXfEQz1H/kq3qAv0k71PjSC56
         6ZfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3fsWkKUo953l75wAqtQmuNgTfIsT3FXoetEUu8UUXpDcpJ+aUA/67Iw8zTRlqz+h47B/SfjT3v/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YysDrjfWpLTQVUPrREwoOeI3/cAPZ7i01X8lULOfAj3TfU2FbyQ
	n+FyBxLDA5kBfKrC0AjSa+6uP6z1zEG8W3HI6LKT4HXdXm9CGtwq3Nf4h4I7nwAg7w==
X-Gm-Gg: AeBDiesnPLLSxz+CuoUVDBnwrmtuE8VybX32y4A6l1l9dEtGHeNGHjkS31iYmYApUiG
	F9WOxl8/W8a5utGJRpzwU1k7oy7TM+Pm4+FW0mwP5hX4WutapnOLvRfYmlzaR00mQQmZ6mV7Aex
	EmPKd+IFq1NrtLH+Cng8UUQOG8WD+LGxb2OzaSYV2PTqdYE11hmNm+WhQWYgVO6xHqwgTxGNJDm
	YaoOtXYkcGOZKiTSqQv988SQjLEqe+tOdDb/fLoqBco1Ida0ukIaUicm+V328aSNWVrMIpROsb/
	tkqwVFwIIHaRV0kP5UDLc6UOSuCvY3cD4qsHkV/rw6TjzURRI4LrV/vVruhQc55MJzKn4wWvUpW
	D33PJOdG6XH6G21ZsPdx6G2LqWL2S5ieV3OoV1ORxPjdjjgc9dlngrfYQpt2PiwALPpBohtMeW8
	rN5yPbws+HPTe3ERIUljQ3L9ZSuqmTa5E52Nuicnxuu+2gQIMuS/R/
X-Received: by 2002:a05:6214:4c8a:b0:89c:a2b2:8d44 with SMTP id 6a1803df08f44-8b028112da3mr383141476d6.39.1776952803365;
        Thu, 23 Apr 2026 07:00:03 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b205cc0353sm49200826d6.10.2026.04.23.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 07:00:02 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:00:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, khtsai@google.com,
	kexinsun@smail.nju.edu.cn, hhhuuu@google.com, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2] usb: gadget: udc: skip pullup() if already connected
Message-ID: <89b6a6ca-137b-49e2-a796-443e7cb58245@rowland.harvard.edu>
References: <20260423095355.2673035-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423095355.2673035-1-xu.yang_2@nxp.com>

On Thu, Apr 23, 2026 at 05:53:55PM +0800, Xu Yang wrote:
> The device controller may update vbus status via usb_udc_vbus_handler(),
> which tries to connect the gadget even though gadget_bind_driver() has
> already called usb_udc_connect_control_locked(). This causes pullup() to
> be called twice. Avoid this by checking if gadget->connected is true.
> 
> This also set gadget->connected as false in usb_gadget_activate() if it
> became connected while it was being deactivated. Otherwise,
> usb_gadget_connect_locked will return early and pullup() won't be called.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> ---
> Changes in v2:
>  - reset gadget->connected as false before calling usb_gadget_connect_locked()
> ---
>  drivers/usb/gadget/udc/core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index e8861eaad907..60340ff9edbf 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -712,6 +712,9 @@ static int usb_gadget_connect_locked(struct usb_gadget *gadget)
>  		goto out;
>  	}
>  
> +	if (gadget->connected)
> +		goto out;
> +
>  	if (gadget->deactivated || !gadget->udc->allow_connect || !gadget->udc->started) {
>  		/*
>  		 * If the gadget isn't usable (because it is deactivated,
> @@ -885,8 +888,10 @@ int usb_gadget_activate(struct usb_gadget *gadget)
>  	 * If gadget has been connected before deactivation, or became connected
>  	 * while it was being deactivated, we call usb_gadget_connect().
>  	 */
> -	if (gadget->connected)
> +	if (gadget->connected) {
> +		gadget->connected = false;
>  		ret = usb_gadget_connect_locked(gadget);
> +	}
>  
>  unlock:
>  	mutex_unlock(&gadget->udc->connect_lock);
> -- 
> 2.34.1
> 
> 
