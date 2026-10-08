Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCDC483BE5
	for <linux-usb@vger.kernel.org>; Thu,  8 Oct 2026 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453836; cv=none; b=qZTFERTCamXL3m+/Ox4QpwmQOqQr45AAyHWrHMvNc54lq4Oa/f3kKr9eD9SedAwMhNtH2uC6peHF3SWBdtzE1NgdXAZOtFdBEBdAr0KloNhsHiCueDzDNSiBYEbOfQpTKNCm3tXZ0ra7clO29Bk2BsTNhiR6+nigby7BEQilKWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453836; c=relaxed/simple;
	bh=ae3MaH7Biys5wkddsi6q0kW8q0fS0FqQ8F6IANcIReI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GJhAgTzMPHYoZNwSHGh++xmfkoamKXhTfsu3xnTPITPWlt0oXdcLi418Nv3isTBxNEzqwZSuotdlZCeG+g7G23LesACjVaLX/KfPaCNqbpz7W1KODB/Xc0A0KjK1k1ToAS7zSvoQ79itNBkhwJ0HOWCNPgkvKKahPmOmyH9e7uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B1XfRFn4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B1XfRFn4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso1835352f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 08 Oct 2026 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791453832; x=1792058632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqTwlrRugZYsrL6sw16yPAZnlnhctXnnF/BVAgoHKZ8=;
        b=B1XfRFn4vOCkwN05LdTK3lNqEkmu46x3bYrrFYg63iPf5vzba+CRucq1cfhdOd/9yl
         7sw9ZcLB6SHix/xLLtNF8AYRmvTp4omhL2ANBIklKEnlG3sAOLyPV7zaG7q6b9E6fE1c
         1iHf7W4xrZVB0X63gTAZc9plfZcdL2Hq0aTE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453832; x=1792058632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqTwlrRugZYsrL6sw16yPAZnlnhctXnnF/BVAgoHKZ8=;
        b=WJ2GJ51a78gEo9RwuLfa1oc9fBIzYT/4vqRZjujey7X8J7QH5qMJKQ8NQsrfwzepTG
         xCnRCfbUL5vQMJtYd/SL+EXKXyPnVHo1HLLWiYbdlr684uBMt8PKJW9VbZlcnX7sFOTZ
         M5GTmZH0QEWsG/hsQNHtwBQJnE2kh1pXqO9Q3PlUM3lRK2RdUyMV4/xZSmBeUMrH3kVV
         qlMd3jhfhxqozEzlX0nItK9WmglZkct31DKyHsaJ9CPGB/qHpeQ+ALXFSlxktWZnw7lw
         H9EVRgP5RNJxCv5Ma+JyzUZAmUpj9KJS/ByuM2wZVZC0kNxUb/HEIxB3Z77CMuexG+17
         QIeg==
X-Forwarded-Encrypted: i=1; AKwUvBz1EgjDQAl03LouI+kTGCBy0aajfr09Jsz+cz1uYgAVikmVMXx4HrTM0eORBcUu3oAC6hmY1/mjhsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdvGWx1Acomb54ZxbecBy0SuuWbhz/U6d59WtZwBMiFgPjnYXu
	cBEOpTs85gFrzDtBOkvjfPPJMJlr89UHq6LXllKP4c1piJEbA9c1rG6QfSPWjXum+q0=
X-Gm-Gg: AYBFou3B60bAV1uItiHKNI8UfdpZ2xYG+76NwS1o49oYwLy+ixjxPTThQC+n0C6FXV/
	+U8gCrF+drT5lVf1JpApAveH6AsIPkjbsqa4u6zkYT2kh/x8c5kzESZ4scDArREuvEfcy2w2cdU
	e/72RimECRRJ/6sWeQtrmJWTah3ty6BmfJC/XwwV1DEjWUpVKgZgCxytlG5dt5wRvClKcxbrz00
	R6kBtZ7ebAjp7MRi4XR1tY20rZLkRlGNhRbtzO+YImi4lnhuwEWFlnbBDjY3FUN8x0FQJz9L3Gz
	4gsGO5Knv6Jp5d/tjVHgbz/T3u9viz7I2VJPFpatFf4z02me5V9KPrQ6W5+zDvZWA0aWgMA3Pgc
	a2gFTvkYBuz2KMFh+5LZCx8FwSfPHHvFE6POT93IvgUD2mNtzozxf7LcCqEzpqkZ2gceLzgVOF9
	w4fwEjSkpzmBMXVaZY3RtMWpH72esw8q1gl94ukLhfotlEdxSS4y9KPtquFrtNH0rjs5fL127+N
	HDBeLN6fnl8bklBP8x8FyiUM9s6Cpk=
X-Received: by 2002:a05:6000:18a8:b0:48c:77e3:6c8e with SMTP id ffacd0b85a97d-48c77e36d57mr7002555f8f.49.1791453831451;
        Thu, 08 Oct 2026 03:03:51 -0700 (PDT)
Received: from [192.168.145.89] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffe4sm8450807f8f.35.2026.10.08.03.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 03:03:50 -0700 (PDT)
Message-ID: <334b9688-093f-4181-a3eb-eca2d1c8755a@linuxfoundation.org>
Date: Thu, 8 Oct 2026 04:03:49 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: usbip: stub_rx: remove outdated comment
To: Oliver Neukum <oneukum@suse.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20261005125842.197848-1-oneukum@suse.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261005125842.197848-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 06:58, Oliver Neukum wrote:
> After removal of the BUG() statement the error exit can be reached
> and logs a report. Remove a comment saying otherwise.
> 
> Fixes: 635f545a7e8be ("usbip: fix stub_rx: get_pipe() to validate endpoint number")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..0ccc05b76c5a 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -391,7 +391,6 @@ static int get_pipe(struct stub_device *sdev, struct usbip_header *pdu)
>   	}
>   
>   err_ret:
> -	/* NOT REACHED */
>   	dev_err(&sdev->udev->dev, "CMD_SUBMIT: invalid epnum %d\n", epnum);
>   	return -1;
>   }

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
