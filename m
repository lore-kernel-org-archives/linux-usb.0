Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410755;
	b=wtpxfyPMgEvY33IN08eVlVuIWWwu0F/DIIZloCf9wTgH4TZr17QBBovYcwy/bWLNWVLQ
	 6HigsixCb8fHwoH0CQAbA+U8kUb3knVXnIGNZxtXbnOBeowRZ9B398vMqm1x2j/YRT+IE
	 C0fnO7sEmwLJK0n4aDwpTEh6+52XUvTkQRdeF+EUKDEz9TkT2+TKZfMdGHTPEM0XKDcp2
	 051JwcmvsntE1A9u517FT1H/uyu3b6dNJvXbbC6Aq/0X8aGFo2DpKVH3m03F7r+qhFmzd
	 YivY5P0RLvhG1hliVKoYuKqgK6iZQDVU9UqBJl8Ligfl76cwaAaEyZ0ooIDGRZvPSnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
	b=rtlD95XzeDxfiEGzAZzcsBs8gowCpU2ouCgNhhTcvl/8/A0C97O0HbG0RTIxBDXn1K2y
	 FYpAeSjzMrvTXVXNDb1qe0CKRflm0hqbNpytvzBLdk0DLc67EIaMQKATGZnaAAZSSHuaP
	 ggz2JEY8y8nwlVgqXYYImQfqiHw4XfNm7OOsMCqMRy8D9O/VkAAvBk4IvJPhGK2SK1V/g
	 prTiXp0kqhCWbteyeNru88PUeuN8ChrbFmPm7ERFyXfJ1gbjIDc3VzJ/4Ka362dOFAkz0
	 3m3tGIjOewjsRjQi3r1moCDuxqiASHp0xTE/DWk0+0rfrXp6QXcwIrBEFUOUpnCuKHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nNGvMAIL;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451DE606A324
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 15:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 451DE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=nNGvMAIL
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53bb57f1310so36235001cf.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 07:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794410754; x=1795015554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
        b=nNGvMAILLhIgpSoaRMs9TXupHeAJcVzXWR7e4jlC4QcIAGFon1n43zEsGUnQzyYj4T
         /cqjz2kPZtxEXRtaRzUeNuobDbt1po0n1thnjWj5aBlikM9PiREmxVOKIH5N+qfSNCf2
         1a80QphSH/bW4nH/V1F5fUP0LGuFqRQc4GTK6zZrtcBupN/GF+bvddj3vrPtrwXsq3+3
         alTS32l1WW9pXSSkHhFjvHpoXthbHSBfJnIizENmzz5znt7G1HpmNReXq/1vumc2S97p
         YukMPBPqoMbQgaHGDnd6nJqH2FhAiCxTX4lfAhQmczRTG59MmUjR8YswEsLNeZe/3uii
         eHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410754; x=1795015554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVuhmpTOxkpymn0weSleRGrGxCwyKmh4kNc2qrZbhPg=;
        b=DcW4wjGMXwbp0FlXJz6QATt9FGA/G6PO2UgKulpJJPsHKoRXVYG35UDEaDNjSkILus
         F912ZarnmKkSxwcW5YI9Ta4krWeC7FVEwJDODj3gutpaML+cfFLo44s+o+dG5tlxClNt
         NRzaoU7SRg+xFzXmnwwhIAxB4ykMAgk1JTIPeeFdsV5J26dmGHebKmlg1EiiUoBiRSlw
         E/CqdN5xbuMMEb4V6KpSg26MRLdmtEM9wJadHyqd2MveNP2xNJ50iEyHLXHeu5WSdPLq
         AHe5OGT/gEDkTmhEjNa+52ShPtKoxEyJJafddB/a1sCvkZLboKCxh8mkRjp8setdPgPr
         XndQ==
X-Forwarded-Encrypted: i=1; AL+hErFV7tSOluld0OpZAI+Gh8G981VmRmGqRgpsLatp451IVHL3T0PU/MG19Iu0XpqyyBzp56jk7eCWvbo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ml8DOk9W/1xEwOd9pk6MvBEWpWbKmv3AI6EPd66hOWvYzjGfo
	xrtu/9qzap9jD8pKGW7w1Usdm3uscTS2UAnWt+ADWHxYLTXHfVWLXBQjjABsYQ/t9g==
X-Gm-Gg: AYBFou0ghsjSeZ8jZb5PNEZ0fgiHdU4rHfLFxoVjPEgRWxYWTxBxlyl66BVQdCyiQUh
	DEEQVC20Rf+asGssd2DevuW5aL0zIodrBx+r3O64SE688pIq3BkKTmejlCZCD/hMAvhdgXx2sYM
	nDoyr3LeRM6LG6mf70R/DJD7jOntPulNJ1CW97raSlJsc/oAsPIJUXiF0DdbCuK2hsX4vqGhSf9
	lBUeOq4j/u8VDWSnKC9XdybQBFSjEVvtv4KavlxS007qRX7SYoJJVzCvPyC8OBj18WMcHpiy3to
	IexvVdvdv5LYmF/r60tuhUm4CQpK5Is2yZOwpZzLgsnR4sOwTcgJxMrudAdFbkU6wNcDtzDcoEO
	VprFk9iHKWPiXHWIAfJByodtCtjrs+VxnlZjwH590d5tS/RJsrhUjt10EwKhubNdWqkqQY07MpV
	G47SxcU0HmqrVzH9U0o+6cbukfg+Vh4IkzUnWNWadKEnoX3fXaKWWUD0saetOjYVU9gKCvw5CxK
	UiOnkNjKgLng/PO+yiq9VAws/5lgG/s5jRJJFI1Ec1w3aSPCPYvydy3GJVkHVh59OIU24NqYfvF
	e5L+Yuvoqdf//QJLyrlSoVxyNziM9pJjQh8BBhipSg7zRLuJf2U=
X-Received: by 2002:ac8:5dd0:0:b0:535:fc2d:b7c2 with SMTP id d75a77b69052e-556c1391522mr40169741cf.33.1794410753989;
        Wed, 11 Nov 2026 07:25:53 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9425c5sm52788841cf.17.2026.11.11.07.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:25:53 -0800 (PST)
Date: Wed, 11 Nov 2026 10:25:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb-storage: onetouch: Fix potential use-after-free on
 input failure
Message-ID: <c342c36a-df9f-4bf7-b96a-a4609f128b0e@rowland.harvard.edu>
References: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>
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
In-Reply-To: <20261111-e5624093d6-usb-storage@mail.sdu.edu.cn>

On Wed, Nov 11, 2026 at 08:23:03PM +0800, Guangshuo Li wrote:
> If input_register_device() fails, onetouch_connect_input() frees the
> onetouch state but leaves it installed in ss->extra. USB-storage cleanup
> then calls onetouch_release_input() on the freed state.
> 
> Install the extra state and callbacks only after input registration
> succeeds.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 17efe155253e ("USB: onetouch - handle errors from input_register_device()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/storage/onetouch.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
> index 49d281f7bef6..e09b3c6b9a6a 100644
> --- a/drivers/usb/storage/onetouch.c
> +++ b/drivers/usb/storage/onetouch.c
> @@ -237,16 +237,16 @@ static int onetouch_connect_input(struct us_data *ss)
>  	onetouch->irq->transfer_dma = onetouch->data_dma;
>  	onetouch->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
>  
> +	error = input_register_device(onetouch->dev);
> +	if (error)
> +		goto fail3;
> +
>  	ss->extra_destructor = onetouch_release_input;
>  	ss->extra = onetouch;
>  #ifdef CONFIG_PM
>  	ss->suspend_resume_hook = usb_onetouch_pm_hook;
>  #endif
>  
> -	error = input_register_device(onetouch->dev);
> -	if (error)
> -		goto fail3;
> -
>  	return 0;
>  
>   fail3:	usb_free_urb(onetouch->irq);
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> -- 
> 2.43.0
> 
