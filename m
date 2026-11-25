Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617343;
	b=VM+xRb3MVAhK70Ahj+M7PfHqBYIwWLI0RlGotG5p/7igbcqSKR4srmRhJrIktuT0tb71
	 IlZJhcZF9bWGwxSFO2uDBTXDIu9LJjSeYHkrAm5O/vGxgjN2JV6lTK/aOhoVJoHBQCsUJ
	 V5f6JT2h317ZYE8QWi/FpQknBoRRpG0xvqDULYuT5wTdaLSf0tSBEjGjzmuTDzVCqBGki
	 YaH6wN15mHdhN7j78Ht+PKVjGi0sxzS01Z/DYeVmpyqMlai+DgnOebsDLpfkWoM7KUdKy
	 t+EywVwbXin7tiiPPUbhA7hN4r81B6AFdMnDM0JnW7G2HnkO+L9VlXCn8cdxff6ocDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZEChbe07XcS8VyFGE2E+prkuKsnUUoiLjh3WmKMknlw=;
	b=GHvRpCTPkEbileJmQBmhKvqa6L9/peDzJzkr74Pbi6hrJpH/dj8XBN2WMMoXzUgDaJ/O
	 rB5VODjZpnxl+VdWeXnhpT8D4+xq7BZb67LWWLEzLHF0o4HtsPj/SmCJSeU3P6M6D6VcX
	 tqAouvnDwsqlgLeLfTAHkAu3fNw18eBS5WDJVHZJRNzr6dpBpPNyhgv/r/JccUY7Yfp4O
	 ZRqCbtzL8FAlkRdX5X8/44j4bmtqYTQzeAZnDuIHtK9IbJ2yDRThQwmBHbrLuGapf+TGm
	 GzFnQ424itaWlvJHRZwNkT9cOIwXMF3lNswXlSzFvbwoRY3ALflpgnzTGrng+75zCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iUayklwr;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C3606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 14:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 353C3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=iUayklwr
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-921365696d9so41406886d6.1
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 06:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1795617342; x=1796222142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEChbe07XcS8VyFGE2E+prkuKsnUUoiLjh3WmKMknlw=;
        b=iUayklwrU1PG2k6O4K+7E2RsYgwQjeelhy4qUu1w1laVhgVKKEzQFEsZLbXcW28eOv
         kkox1y2v5pajz0OHbrJorz87RMQUGckKOEsStB7D750l0+zCO+gSPSfcs0CWq+wj4mkP
         ho1qLESpaq0/NPY39gCNx3CpWsiX/MwxbOihWyOYOVcck9z9Hu+HOAaj+fRGG6ERW+CX
         uvmi+VJQ+qFnSmfmdMJ9wLnA4lNCPOYHEh5pGzD5u3ohAJRVP2nU3UfGxGVDpTvFFNIA
         0wcGRu8u037a3rVcJqfjtxYkH67xfJXnX9PawBIBPaTeA8wrqJbAZu5y9lmrb4jAQB9q
         HNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617342; x=1796222142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEChbe07XcS8VyFGE2E+prkuKsnUUoiLjh3WmKMknlw=;
        b=Jl+B4lofATXhSfFHE+KQxg+Oj/BTNf6ri7zCtsnA9Rn4MFR+WSVGmRhRjr1A8dAcrQ
         c+xM7BnpO8gjR1RPsullQ9yK0yWzPHfDOCCM7NQgVwNIr/Q3G+nNzwrdcGyjIn75k9ZY
         7TlJFRNv45RaxcEh0J837QZHHPFAf41sbgtLWAnLFdHBfu3dKkSdiOXVa6PJ5rHYgrXH
         owaHoJYqh8LzgQFsuLDNpd0cAjMC/yj9s5ufaA2H6fD7RvXmsD7igZlvF8pSjE/oXtyk
         dEs3UtGKijBQRN2vsr3/w3VLS9KJtGCVBYVZnVN6dzOYGqrwDQCFsLy9UcLsnJaT2cc8
         ewlQ==
X-Forwarded-Encrypted: i=1; AL+hErHufTFEqOzMiEuKx5t/pKw9ddz2+uDpojSyh4gA4LI2RQ2TZjN4WdULnHV3HxX87e5KJfKEFBXB6Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dvOnEKQMSzu03fkj9rh1yHOs/u9I0kTbcm8DD457bUNPNomhB
	6cvcEGR0WVkqg/hNtR4AnhmtVTj0SbjeyzvoN6O6tmdBkscpL8ApUeD9LuJOLh2OYw==
X-Gm-Gg: AZFdTZfI/srhzs9H6ojXImkPBE+W0jIX4gs6BsGh34p799bfvy0Noytm5KKQehNDMq7
	b6Job1dMQGAInhqzMHs3ajPUqOfisCYyyoATwcznjbVDHyDtAYPaU9jfbejia1S5Nsba0VK4tAD
	ppbeCRf7TI1kHFb4o/xFIzUZ17eAOCYfc8MyE7Msc6Q6Ldwyc6050hew9x92bawTTpD7wc0h4uv
	teIVeQq6S0brByDQ7luBsQ4tQy5/KhuaoLSCgho5ibx/o1jZ7d5yy+qK5WCLTBAbvTisSY+bxJg
	LTVaZwwPSHUuaWAU4F84LbWNTMP/WbQjb7oK8fbAoGBPRY5kpod1ncgukDJEu7CNOvx8Fxm7ydX
	6XObXp4JBdokozH7rw3gyzSU3rlp7CTkGK3mtnzALJFXhWWO5tUdQUzWIdNnYdEVW8H4WPhORWN
	qn34Bfn+8luXjq+IKUA6DyxKavlJGNJUpSlx3yxRrmtNk4jUiMCj0CFj8GuPlKDzLGXKeP8uskR
	/epIoHe+zfD3gMZXBHA0hUbt/b0v/yae1/t32geifCm6QdCtgkqAJosxQR8mUJw4f70mNJiJuZA
	AVgjUkraFjh8d6ZqUhfHbQXzjHJrPQ==
X-Received: by 2002:a05:6214:2a48:b0:920:f523:b033 with SMTP id 6a1803df08f44-92134ac19b9mr335925696d6.29.1795617341974;
        Wed, 25 Nov 2026 06:35:41 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::9a34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d0e35sm163215246d6.20.2026.11.25.06.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:35:41 -0800 (PST)
Date: Wed, 25 Nov 2026 09:35:39 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Aristo Chen <aristo.chen@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: udc: do not fail bind when the UDC has
 no pullup callback
Message-ID: <722603d5-ad2b-44d4-93b5-a629ceec9305@rowland.harvard.edu>
References: <20261125092004.15562-1-aristo.chen@canonical.com>
 <20261125092004.15562-3-aristo.chen@canonical.com>
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
In-Reply-To: <20261125092004.15562-3-aristo.chen@canonical.com>

On Wed, Nov 25, 2026 at 09:05:30AM +0000, Aristo Chen wrote:
> Commit 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure
> during bind operation") made gadget_bind_driver() fail when
> usb_udc_connect_control_locked() returns an error. Before that commit
> the return value was ignored.
> 
> usb_gadget_connect_locked() and usb_gadget_disconnect_locked() return
> -EOPNOTSUPP when the UDC driver has no pullup callback. So since that
> commit, no gadget driver can bind to such a UDC. max3420_udc,
> fotg210-udc, fsl_qe_udc, goku_udc and snps_udc_core have no pullup
> callback.
> 
> The core cannot control the pullup of such a UDC, so there is nothing
> for it to do in this step. Skip the step during bind when there is no
> pullup callback. If the step runs and returns an error, the bind still
> fails, which is what the commit above wanted.
> 
> I do not have hardware for any of these drivers. I found the problem
> with a KUnit test under User Mode Linux that emulates a MAX3420 on a
> fake SPI controller. There the bind failed with -EOPNOTSUPP:
> 
>   udc spi0.0: failed to start max3420-kunit: -95
> 
> With this patch the bind works and the emulated controller answers
> SETUP packets. I did not test on hardware or with the other drivers.
> 
> This patch and the test were written with an AI coding assistant.
> 
> Fixes: 0ea39e030a80 ("usb: gadget: udc: Handle gadget_connect failure during bind operation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aristo Chen <aristo.chen@canonical.com>
> ---
>  drivers/usb/gadget/udc/core.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 577bc15f61a1..aa6226666eb5 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1680,9 +1680,12 @@ static int gadget_bind_driver(struct device *dev)
>  	}
>  	usb_gadget_enable_async_callbacks(udc);
>  	udc->allow_connect = true;
> -	ret = usb_udc_connect_control_locked(udc);
> -	if (ret)
> -		goto err_connect_control;
> +	/* Without a pullup callback the core cannot control the pullup */
> +	if (gadget->ops->pullup) {
> +		ret = usb_udc_connect_control_locked(udc);
> +		if (ret)
> +			goto err_connect_control;
> +	}
>  
>  	mutex_unlock(&udc->connect_lock);

Your patch may conflict with this one from Alexey Charkov:

https://lore.kernel.org/linux-usb/20261117-udc-connect-v3-3-9413b491d213@flipper.net/

You should look into this and see if any changes are needed.

Alan Stern
