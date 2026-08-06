Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDA538F935
	for <linux-usb@vger.kernel.org>; Thu,  6 Aug 2026 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024264; cv=none; b=QD5mJL8K2iYv45pgQgQVUisM87GPEfiIAs9YHKOKwOtvHa2TkrYUqgpCX17TBNMODW/vn31EB14sYMqkA58oxDOSy2h+TB0wAn6vYF8drEFrxi4BjNUVEkQVkuTMaTvwS/seGN1qXHTkoKaiFLC/E6vht8gHBB+EaAUWPruXLvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024264; c=relaxed/simple;
	bh=YQQj71Tk3KKw3pdo93rzoR5dlbtYCWkSMf5lauPULt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8hIfOEQ/0lhAkysNcZM5PFGFSrqd7rahO06FUJ3U6Hf9Tg7bAUBYlCgyJJmLcPx1U/qM5yoWBk3VlSHkqUWpFDk/k/CRQxquIdhb2Cmlk6PIxK1TTjxm2Bq9jb4fzUxLGF5R22wMtT8/dEaTxTNh/1I01fL8Y3ZmjVAsaKM5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=djlXAxVO; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="djlXAxVO"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e65e18969so77452085a.1
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786024262; x=1786629062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXpD8fhMfpcH4/rK/CINTt82CSW0JYY906XwzS8WpVY=;
        b=djlXAxVOGMfwZQN+Y89xaMqXMB0jlSDZ6/LXYs9ipu9JTHS3wr9wUdaUYon9e+qu2Q
         6rl8ThG8wE0lnxE0yYyb2b7N9W2WWdiPDfubWD+ZmkFX7SEZt9qLPnuQrIRcc3HQ+dIB
         Gq1GdiY/kqPWFE1vTObYuIoA9WE48hbbcWZA/UNPSLiY3IRxlL+ChevKzf2N+bGF2dsA
         t7rU4E4iVYJf9VBY6xb29bYYGK1s9iM/pefbh4kKPYjw191UlgbaMERb4L59MPW3m1B1
         79p0PCx5uk+wOQHyZCLZXNR9G+tc4zZpEwi3Cv8K6I4wDP3eQZdc+HRBqfBh4kPqTkQE
         7uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024262; x=1786629062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXpD8fhMfpcH4/rK/CINTt82CSW0JYY906XwzS8WpVY=;
        b=TRXfjCcwhSMKSgS1TMw6VLscM1r7BHiLlC+A9T44bWkMA067a4vurRDp35ZCfoZrU5
         vvsGCyslFNHKCMeC4c3nkAU7dlbTGSLXpgXki6oelgZCM7iaHQp6fAqTVg96F+FgdoPi
         OOd12P+T4yMWXhTpfnIY+qkWvOdX8EZn8JMwn2rDaXsyp1TKhjDGdbZHSAAvj35vpGae
         6JqbUo2wRLf4ftu8FLlTcR9MPdEmGd8LOvIi2uyw4J994FOdV/MAI++nttfra4lymYfL
         QYtK+Eb6wX+pA0JYdkyNj6WjHCfEodIyti9QJ3Pafdp8N/DjgNWGSxlcNUAGvCYlbnoB
         733A==
X-Forwarded-Encrypted: i=1; AHgh+Rqgg6vTaNiGQ7wPdYO3RzDLeILuHL14v3F/0R8oObjwd2VENln9JqnaeF0zymFGEXJFPD4+JN8SSEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu4j1gEo1hunOfRMiXdJ2IAaMUdLKnk3ShDMNybPLbEwB1EyRR
	o/B9spc0cdlwDhhLQ2elyRJP2Nu0ISKb90M+hcJf4WXH/jKzFD9ks9V7u0eLWZG24g==
X-Gm-Gg: AR+sD10XlHSeSHouDxaAKskNXfsbxCbXiBknDAciPd9Uc2V/3CowqE2zo/56i/dAfgu
	kJsU21clmyUfAmVrNPWCla5bLK8/mXL8LOSFT9zm+dYi9jdRQFibuwyD05riah8FqMIPem6zI1Q
	iSoy0zJmCF4FVTxY2yxFREcHBe8S+CABaJ/9wSHRlWqlmou/s6Xaov/wImbdO+atNVq71sp343P
	pZ5+Nq+rRS36XoIfx2q4mj4aK5syPQlQ5G+hye5bbUQZ19eJu5Qki/mKtrFhLaMdxyKIpLDgLYs
	0MPyGNXvyrIOlzNNQHUs6ajar44LqAymM54JxZPmVIApwkyy1wQ1QNzh2a8WXUyZ6AATlAAhhoC
	BsHwyCZya7NvxYFI6D7TstPpuwXdb8mxTTB7tz9+7194Uak492MDajr7cBEhVj273y2/KGGyYoL
	SJ6GKd8DdQbYSqtY2IWI9ZPat+3FLabe+3hZvhNzSlz6TsKn8eByUbMbWYS/2wADGboX0GXQ6jd
	PC7yOw=
X-Received: by 2002:a05:620a:371f:b0:92e:7075:941 with SMTP id af79cd13be357-9365959e5femr648645685a.13.1786024261713;
        Thu, 06 Aug 2026 06:51:01 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936582da028sm257577185a.26.2026.08.06.06.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:51:01 -0700 (PDT)
Date: Thu, 6 Aug 2026 09:50:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyan Xu <getshell@seu.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] usb: host: ehci-atmel: stop clocks before releasing HCD
Message-ID: <b7f212cf-2577-4c77-ba71-edda2124868e@rowland.harvard.edu>
References: <20260806060557.1747-1-getshell@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806060557.1747-1-getshell@seu.edu.cn>

On Thu, Aug 06, 2026 at 02:05:57PM +0800, Hongyan Xu wrote:
> usb_put_hcd() drops the driver's HCD reference and can free the HCD and its
> private data. The remove callback then calls atmel_stop_ehci(), which
> obtains that HCD from platform data and dereferences its private data to
> disable the clocks.
> 
> Stop the controller clocks before dropping the HCD reference so that
> atmel_stop_ehci() cannot access an already freed HCD.
> 
> Fixes: 501c9c0802d9 ("USB: at91: Add USB EHCI driver for at91sam9g45 series")
> Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ehci-atmel.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..bcd56f888ec9 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -177,9 +177,8 @@ static void ehci_atmel_drv_remove(struct platform_device *pdev)
>  	struct usb_hcd *hcd = platform_get_drvdata(pdev);
>  
>  	usb_remove_hcd(hcd);
> -	usb_put_hcd(hcd);
> -
>  	atmel_stop_ehci(pdev);
> +	usb_put_hcd(hcd);
>  }
>  
>  static int __maybe_unused ehci_atmel_drv_suspend(struct device *dev)
> -- 
> 2.50.1.windows.1
> 
> 
