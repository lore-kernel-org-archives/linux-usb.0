Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC14367B85
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786196651; cv=none; b=DeRrS7SelW9q7l87Dw5mQ8oSUMogF4enEHXhwnRws0r6BbZxwL1+gjQfEuWHrek/h3WyMagWhaQjwki3aSdhSbfu1baNzQ6DevPYT6Dtf1zuK58c8lkjCKBPnP5ZO1EeND7qqNpYNh/CChGWkMbU67G+y4vx5r1jM5KOXchoV/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786196651; c=relaxed/simple;
	bh=h9tPHOk1gQhG4ouk47fwwyYVuC+IgJZ3E7SuOkPILj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LG5jG8DxoUluwTXb5be4Zrtw/rPm5dWWMVXxTOsSnJYyMy5o8NpYhTUNY2cdESsuCR1S2c13S0iXSaLc66cRkMaRJMK19cvS8njyAL0NTa3/cpZUqyWQDKfzYOPaple8ja5bNgIQOchFQZQQpAIaafQ7XTsu9pMgnhGnEq7qj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=DiNHaLi8; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="DiNHaLi8"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51bfad59921so2940721cf.0
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786196649; x=1786801449; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eNRUNIMFxO8twZMqXfV4psRlK7NT7ynBzHponr24G6g=;
        b=DiNHaLi8zCsbSsGDisEA+0adbMWHCfBF/OiHFiedoyGDVG2yOfyD4XqkqCXaHpvTfm
         XGQ0d13qIdW3Z93tIQKSdRHwJ3SAXgOivPwAlTKJ5A5w/I6iEjFkwx0iWTkDTo4Of2sw
         BbKA0G/ZyqmmYxDwGVnU/vn4KKugbdfdZ0pK9hQFp3LyGGr14luE2Y6mCtLxoxOUyEMu
         kD+uGeFL1wM7EF0tOcepVy/qmBCH++XvwA1wby+iiHwiOe0FcUgvv8pNw4GXJtou/Zs8
         ElKzU5WvmA7OgMpjUkEg/M/fZvsMJU8zMyvt9kkkwSuGJXsO0bWs8uDFGp+5yfbKIaZC
         OQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786196649; x=1786801449;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eNRUNIMFxO8twZMqXfV4psRlK7NT7ynBzHponr24G6g=;
        b=Y6wSd8FIMwCp1iOsmi4KvDnC/fzgK9JZuMKKr4zgFYDMPQ4g3jgzj7WaW7RZJUYAAI
         tS9tquHFu6GT7yB+s0e0jpPw1Iw4kgMkOOHRTyM8/5GWMghYw6EAKUmvl7gteKuhx48l
         /8sapOCJc5iCWAF/CC3m5VpIgtlKH/W3Vbl7e/keeURpXNoKE1GRdp65EZcWWHDadnvw
         ngn3B2OYwxWDX0qSXwHuG+HHhsjwpW2kvmOJ5REX+B47+7XmC0ogsQBmNJoUEQ+X0Q0e
         1FfGKaw7f07n86rGaHK04m+K9lIrksXFcVlmy/ZsUDfjhRLIU67g8Mn+WXUANayJ38Le
         IJVg==
X-Forwarded-Encrypted: i=1; AHgh+Rqmn/AQEUkalz9cyB1zEF6zBZGaZquTKfgOhhuIecSW2jmTEqgpQWwdnXHyR8afCtG6l4wsdfpV6+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfLweGBTh3/YrDtzLkH/rLgJ+Fz+1nkdMbPIAfyS0NnLoMMiv8
	iuI59PJHXahtCWZVHb7Ypv7kamwJz1NJ5w4PzCMC2woM3U8MuGGC7hcC5qv3yHbQ7/OCk1EQN9b
	g0HvEEw==
X-Gm-Gg: AR+sD13ToXs6GEWBY9il+6DJD0wguBdxGAxQgr5ZYdZlKZnkvtIp0fcWYw2/GWmPzYw
	C9vtiHjt1dNwhUKvpD7dFwTF+KhxiukM5Q/OUi+mbh+bUtS6a2cpoylRPxf6KARbSIwnjyPQyT0
	pe0sKdBCTU9wZKRNTZ/T9kNhy9N03gkEECU21vkAQC1t7IyRwZhZcczJS8bFt1V1uyiFTfrcUNf
	1ojDvSOodP8RzYGolVGlRwGg5ilJJGGcqowaTUCnol5nIHBqQpG0dMIhZX21/JqGXsPvskVw77W
	YLj6slSwAemUkaY6SVuJWO15gNa4L+mz/tWfOuLcgavQgiKQ5QFB5M7Dg4/hX6Gav/Iuq4zHB++
	2sqGRRvAF6V+xGviwNIN/PDPxKf9DSgZihsGf/05i71AhdVgf1MMm/NXw6WXV54WcLcbQ2GG7d6
	vXQtu0E6KOWQIH3unI4Y5aOkMbgM8Zg1reX2jbASsfR/pdWSNvcDjTTO2lFz2CRQ==
X-Received: by 2002:a05:622a:1c09:b0:51c:a7e:4cc2 with SMTP id d75a77b69052e-52ce61460e3mr363116401cf.20.1786196649228;
        Sat, 08 Aug 2026 06:44:09 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d1659c1d8sm33663821cf.16.2026.08.08.06.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 06:44:08 -0700 (PDT)
Date: Sat, 8 Aug 2026 09:44:06 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: core: handle port status errors in disable_show()
Message-ID: <bf4b1120-e252-4f5b-baf9-faf8ed716b49@rowland.harvard.edu>
References: <20260808131601.75096-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808131601.75096-1-kmehltretter@gmail.com>

On Sat, Aug 08, 2026 at 03:16:01PM +0200, Karl Mehltretter wrote:
> usb_hub_port_status() leaves its output arguments untouched when the
> status request fails. disable_show() nevertheless uses portstatus, so a
> sysfs read may report the wrong port state instead of an error.
> 
> Propagate the status request error.
> 
> Fixes: f061f43d7418c ("usb: hub: port: add sysfs entry to switch port power")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/usb/core/port.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f591..0022473e526d7 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -96,7 +96,9 @@ static ssize_t disable_show(struct device *dev,
>  		goto out_hdev_lock;
>  	}
>  
> -	usb_hub_port_status(hub, port1, &portstatus, &unused);
> +	rc = usb_hub_port_status(hub, port1, &portstatus, &unused);
> +	if (rc < 0)
> +		goto out_hdev_lock;
>  	disabled = !usb_port_is_power_on(hub, portstatus);
>  
>   out_hdev_lock:

It would be cleaner and simpler to do:

	if (rc >= 0)
		disabled = !usb_port_is_power_on(hub, portstatus);

Alan Stern
