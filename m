Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947851;
	b=Z2pV9s3Ogd+JktEgazbyvTZiSO6nLF6WhMurMQIo2FWmlN4txG3d+BFHOd52TqKGLKgG
	 ZzdWJ/jx+7QCMrmV7P6j76899RQjqcgQP0luywkDBF8JDgF0ra9YbBm8jzZ06p/CnmDWR
	 nmOYLTa7RqUsvE8zLfthnl3KZdTS6edycGrjc8TNDfkz81MpWGgfs7J7MbQqvxwahz8Ki
	 Jj5zvbnERDXtZKozMJbAd5TDhj80U0+nIa93S4uoWaGq3pzEWxes+W/OtzVZSEgj9CDNK
	 idpSfV69BvG2JZYJah+Ia8rHaZjKb1zwMacxdMZpV7mIv3XEnpLSnsdnsIZ3FgW/xIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947851;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
	b=PbbeNuAchwXouOON/XQvWkHRJbF9fzFFBs1dYMMnSRcSR3LnrrNoiLjLoiordisebdC5
	 ULFHaNNXCZVedJA61Rk751QNmZZ6ixok4d3dcYVcsb1PDgAWxDsU0pFERq5GeHRhm85ln
	 LZ0GqLnsmtA8LjrXIA3vGWVdgzobfzudzyCzc4lFrRjlXk+1uT0AjitA33arG4RR82Uxq
	 pkrtcTLlKSxxcVU/NfHXkw0VJ9xk3lMCjj/4Q9G+T8xzTPiJIuOhuVaRUQRVQjQQlvR1I
	 t+fKo5UmAhGHbO2fJrXqR4wJfT9DO3uLnUtEJSmk/AxT0AmRnPh3KEXdCFzz8l80rag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hUcgLnaQ;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62007606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 20:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62007606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hUcgLnaQ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-920fed989b2so1081016d6.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794947850; x=1795552650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
        b=hUcgLnaQ+SQElpouvg4p2BhtZ4Iev0t+HUWmXHy4nOG4uSaSNXppj/XNwBivKpTl/Q
         vksHTCRR1b7dXrGp25zpOF11vyXznTG1fjS+q+ee3iu7WpX5ZUUkVyYdlGVx7sMdHLSq
         jcptiQnGV5i+QqCFqDXZO9ET17+ecycfPG28wxftXf0E8G4gygKBoqshDqUDPqlKIAsl
         pmdu/bHK+iuE4ycri3z55lcemOy3JNHG/quH4E1Uo4wfM/4BweKY4aO5gtNNnws/T7ue
         K9NH1qs/7MhEWmEp6cIqh+RciztjqPv0TpkI884J7vRHrVPgQ9rSNj/NZCuqxCidybaN
         8YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794947850; x=1795552650;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6Tpo5ap6GSFoMGBO7jW2q44NoxntZjBeE2WFv53Tfc=;
        b=2WcUwbfokNEDBY5qzWjcabXrBHZ3qxNvZPxkT6/fTU9hwEoSoLDGHg12T52+5vlyIL
         niEtx0roLBU/QcJKtkbjnZrz4BBt1tXkzakUVpLudm14MJlK6FM+cfgfbzgqRQDVI8Lj
         6KA9s0K5RyAB7YpMJDmt1wpzNKp3GYNVvRxJ0R38WC8PO3hh7hTxNZLuF8GRwyIpjLsg
         4goB2ROeMIO+X2a+JqB1gZb7Z4KfRD+SfvuYx+lFdcsN+7pYVdbAjBxZPd0cOiRfmN2N
         GQyGze48uz3e4EXHl1/QOoWL3Ih5od4X9+BbHK8/EPffo8PRzRF2f5WBUspQpiInod72
         JMOA==
X-Forwarded-Encrypted: i=1; AL+hErFVUHDg3p8p04ljDCkAkG11JScTdpOEjFZEv099b9DH/DRh+Ob/sUh8/hhRCqoSQB7M9Qz6VEc8VKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tqM6Cvnd5kfmyHf7v3nWSJLlikFlqvSMSwq2vb0oX+q8oVRJk
	6j7a4GXuO1751/+H3gs49RHK3fRdlwYJCaj9gCOoE0Utv3NC0UzwrpV6R5MQwx97yQ30YAu6uK+
	xIwjCqg==
X-Gm-Gg: AZFdTZe8vD4BBQRWKvyOjMiq9QS3OmkdQQ34Deb3jCPsdVp5pJXCp5SvWLvmi0sY0Mi
	q3rDc78b1hohKPzDQCpUCsMSIGDL87pYWHotHq34FPoRe0gvQnM8ECfYndAxAaNEzuWXb+18QCk
	Jz5DjBLzpEKwgNcQ+DlI4Ze4Ne6a9i+AoZ7u3VJe2AGC0OcIUAQaHQRKwJywDD0z17MihDdQItz
	Ej0kZkEbM8qbRjFUuTZ4Jg76j7NQS/+UsGDQ0AsEp8E0XbhMiy62pYQWsVmv/+IzuBUPLpzbD21
	gwEPoMlEWBz8XFwCwOxRE5AxTcSrcgABkUmkXCRAG+TyqHnNcVzPA1OCCtm/TQ/jutzN6JKshSY
	8Agx7NB9nDB1pW049X1/WYUvR/IUCP/uSSc/Mtr5b4JOwpoUTfsQ0EBJB5IPXuLCAGxth+aZCsq
	Nau+qkB66GRIn7qrNAMLytcAmQHIhS2iUgQfT1qKMSfCa9fTFmjPe3Wwzd9xTDhQ4xcJ0rXiL2K
	hbdCE57vFUaZfApHt4hX7RmNZSfprnrrlzkbc6ypsbeyfw7XcReLI868hROGAcOx8t4JmfIPf3O
	5V/1CcZ+w/K+tgDBOc9Bmzw50d707w==
X-Received: by 2002:a05:6214:4521:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-92114f422aemr4503286d6.15.1794947850014;
        Tue, 17 Nov 2026 12:37:30 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f894csm3423466d6.4.2026.11.17.12.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:37:29 -0800 (PST)
Date: Tue, 17 Nov 2026 15:37:27 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Cheng Yongkang <teel4res@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: usbfs: reject SETINTERFACE while suspend is
 allowed
Message-ID: <44d9ed8f-c2c5-414e-a5cf-9dea30866574@rowland.harvard.edu>
References: <20261115163709.226641-1-teel4res@gmail.com>
 <36240a2c-0ecb-4b26-824d-84d782dc706e@rowland.harvard.edu>
 <20261116060549.370140-1-teel4res@gmail.com>
 <a7e6b6f9-9926-404a-b185-c9fcab5c9d10@rowland.harvard.edu>
 <20261117023858.467683-1-teel4res@gmail.com>
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
In-Reply-To: <20261117023858.467683-1-teel4res@gmail.com>

On Mon, Nov 16, 2026 at 06:38:58PM -0800, Cheng Yongkang wrote:
> After USBDEVFS_ALLOW_SUSPEND, a usbfs file no longer holds a runtime PM
> reference and the device can be runtime suspended. When it is resumed
> through reset-resume, finish_port_resume() sets USB_STATE_CONFIGURED
> before usb_reset_and_verify_device() restores the altsettings. The
> restore loop also runs when a driver bound to another interface calls
> usb_reset_device() from its resume handler. The resume path does not
> take the device lock, so a SETINTERFACE issued in that window passes
> checkintf() and its usb_set_interface() runs concurrently with the
> usb_set_interface() calls of the restore loop.
> 
> Fail SETINTERFACE with -EHOSTUNREACH while suspend is allowed. A
> program has to call USBDEVFS_FORBID_SUSPEND or USBDEVFS_WAIT_FOR_RESUME
> first, which resumes the device and keeps it from suspending until the
> file allows suspend again.
> 
> Fixes: 7794f486ed0b ("usbfs: Add ioctls for runtime power management")
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
> - Move the check before copy_from_user() and add a comment (Alan).
> 
> v1: https://lore.kernel.org/linux-usb/20261116060549.370140-1-teel4res@gmail.com/
> 
>  drivers/usb/core/devio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb9425480..8a032f4b547b 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -1531,6 +1531,13 @@ static int proc_setintf(struct usb_dev_state *ps, void __user *arg)
>  	struct usbdevfs_setinterface setintf;
>  	int ret;
>  
> +	/*
> +	 * Avoid racing with a reset during device resume, which restores
> +	 * the altsettings without holding the device lock. The device can
> +	 * only be suspended while suspend is allowed.
> +	 */
> +	if (ps->suspend_allowed)
> +		return -EHOSTUNREACH;
>  	if (copy_from_user(&setintf, arg, sizeof(setintf)))
>  		return -EFAULT;
>  	ret = checkintf(ps, setintf.interface);
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.34.1
