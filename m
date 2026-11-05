Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911020;
	b=n957/DUxBFcKv4QDkuXnMOb9niAvOT7dBMaEl47OZj30fnrFHngoXu90LLAnIicUnGcF
	 YUWhOZE9860qSoIWiq21jK9ILSXekJre5ON72vlRN1H23L3hnK2FuSR6q2zGYeEyjyYiG
	 WWKhzsy6w34LR0r8b1d4VCkhSdHKAsY7b2qU2r1TVWDp8AYel1Mr7gtqGzwBiDsD3SXOx
	 uaLP7wd+0TOQpQ/kzuwkyZoLIYWuO1vQ5qapkhZCHmzJ2AnpbEUboplZVdleAklXuRnmQ
	 FvIeq/9Mk83GfVmMrb04xWeOYgpmtHgiZxNh6QeHd3tUkUvFQVyhFDfaj/POAV/LXng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
	b=woTJvqHv2r89Z0j8EExFgdfbDO9EN24+TfFeHPmkvRsBHayX4wRqB6dfEbknMS8VSigJ
	 xW1nS7ZVbk0yRf0Bq29jvxbE8j4wSNGYgBkXuvTUOl86WrqOMA7NtyZ1eExfFJ7zU8o4N
	 bYWb4HXXUv0p180p4YRJgPpaAdX0j4yA9fsIWHawvuCy0MV5th0OkPgsqZnw8khwY2b6C
	 OMUVoKv8Ie/6tWNRujku/PK0QQ8azNrKj1VSCRE/oiN10RbQbH1HeH5o5Bje3N8Mj+Rur
	 m5NNxHN+/lEPIL4ZHz8El+EUQXe5zutgbdg4Ukib5Z5iSo00E0b3iMBGmD/N2KZwjPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="I55E/0Ni";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3B6082BFD
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 20:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C3B6082BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=I55E/0Ni
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso24666856d6.0
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793911018; x=1794515818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
        b=I55E/0Nib0VVhCJ9Mkf3Mi5PRphdEGcBoErxeYbAlfv54FmPfHmMrcfERTTK5Ujfel
         hQNS5HA8thcGUcunGiTHLtGUCH9rFJ5ZyvYrHEyXQSM6W/puauTSD3zYyQQaPw3DsWVK
         i1eZ4wbKJUqwQskYAx8H7GuVoc7CVB42CrWl8z1cM49VBl3bMHGeOQJhXCmQrJP9cw4q
         LeHmmM+A794N9H4naJUOwRi8vLHTjCiQx/zJ4VcZ4b00DK8E8TbpJTdi2kyc0luNhtzU
         6T/jm8iOtIxs1gRdMf0NBW1fRejyZhHKFXGO7b5n+mfjFzYkTRq3kUpzxRYsnN4DAH6w
         bb4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911018; x=1794515818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFVwgOT0aaLDOnm5OSGliikQrCnjG+mZrD4LikZIekA=;
        b=JiOE16FBIK627WJS6DpMdixOp1wfv+ely0vf4xWOTYFM9Gx2sqX+et9pkdhl6x78JG
         mSt3K0uquRoiuqkCkwcuQEeFPggwbWSSUAOwjKH4qoVWlPtasvRA7zvIpUaf5vzc6bUW
         VDj6bqznSn0ae95b0iTXFzCZSYm/zKYhw77HqHcwX6pUTWYsZmldoYvMRMrk6vFd14YU
         yrPHGg/JR2VsEXEHVLQCNvY9g98wzjxH86JWZtA8DmKbmCx083w1fQhimUrKG5G9GtWU
         jUUHzWkdIBuoM1B2cN3qMgGZryrhRkxSA7wLVX2iLsuIdqALMzzieqZHvoXNM4P1M+LW
         t/1w==
X-Forwarded-Encrypted: i=1; AKwUvBy5zwtJBhG1xgCGaOl+7EF2JfVdxnzwuu07dPTNkBmmO98QbbH2e9Bdg8orh0Hh4uNpuKfNW1zSbgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8y27XgCslva/QvjIL417FCYPXd/XTIqN6tiPzsSVv6TbH/m5+L
	OJ9s61iGKe95fsh8jIV9k8JJkZ5D9/LDNJ1kPhL57d8L/pR8qQ0n6gnWAaFox3K/c58s63Mu2B1
	HQ0qSxHDb
X-Gm-Gg: AYBFou3v7dYmUz+rf52Ll6bJRLRdpOyzw6jguRb9+5QBdh27Rb4EWAg7q0pE0h/0qYa
	TNGSjWHV6Tj/N6aeSmJM5QT5QMycXLOhCzLnngt8BwlOPu2xkhm5xOs5It1nc8cIu912RSlX+4+
	5Mw781xur3jbt+/HLeWNBjuUiUY/uRf1TIEEgKstcM8ILgA9z7rTXZwrErTmJ3wPJvSQXohogng
	sa53be3kvn4JLV4qD4FtrOkZ9qwiy9hG2i6NsG6dhGCiGV9SZMscIaO5k+HMQwd5NlcBnqlSa/m
	ksuoei+JaB6+R9RU3jlM/rAjtnQz1byo54g8X2OiP53i9NCQXuUy3iYKrTMh82h/fzTqhnUYslB
	Dcu/8aOJT85LRY/+mAh/D5zpZ9ZBoQYxnnKpGMaprw6YpUENAkouNOSf3tCR+f66UAdMMkMl+kL
	cqJqSI7utBhucDaGGLO8GeOq5N0UvPV5k5erdVbb/iwErfUDkUyIXkxmjtUc38um/HxGFoMQfYa
	8aVQesiIASxcJu57io6qRUoVShMZ3GGEeg/UxLhEWsiauktW6obBo3m+W9bYGV+8FGFCJ45H5+C
	6/KHlvf57X52TUZI9dbwshz7+Zx1
X-Received: by 2002:ad4:5e88:0:b0:91e:7eed:7ce3 with SMTP id 6a1803df08f44-91ea965c4d4mr2244596d6.21.1793911018363;
        Thu, 05 Nov 2026 12:36:58 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acebb0sm3887666d6.45.2026.11.05.12.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:36:57 -0800 (PST)
Date: Thu, 5 Nov 2026 15:36:55 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: ohci-spear: check clk_prepare_enable in probe
Message-ID: <e46b0f2d-8b9c-449f-90f3-03231bb96c9c@rowland.harvard.edu>
References: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>
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
In-Reply-To: <20261026134019.3020-1-tangbin@cmss.chinamobile.com>

On Mon, Oct 26, 2026 at 09:40:19PM +0800, Tang Bin wrote:
> spear_ohci_hcd_drv_probe() ignored the return of
> clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
> and the error path clk_disable_unprepare() would unbalance the count. Check
> the return and bail to err_put_hcd on failure.
> 
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-spear.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ohci-spear.c b/drivers/usb/host/ohci-spear.c
> index 5aeabb051..9d93b3f86 100644
> --- a/drivers/usb/host/ohci-spear.c
> +++ b/drivers/usb/host/ohci-spear.c
> @@ -80,7 +80,9 @@ static int spear_ohci_hcd_drv_probe(struct platform_device *pdev)
>  	sohci_p = to_spear_ohci(hcd);
>  	sohci_p->clk = usbh_clk;
>  
> -	clk_prepare_enable(sohci_p->clk);
> +	retval = clk_prepare_enable(sohci_p->clk);
> +	if (retval)
> +		goto err_put_hcd;
>  
>  	retval = usb_add_hcd(hcd, irq, 0);
>  	if (retval == 0) {
> -- 
> 2.52.0.windows.1
> 
> 
> 
