Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D2E3CB2E0
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 21:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786137581; cv=none; b=qfxVcerJuj6iiYuTkaBvtXTjGzMSEItIJhbocyT4ZFlmn13V6dfokyv5DYjBrGUobu9XlvZS6F54ZULRRT5DiUb81gWzBvuUVbqvL6+TEcMu/kf1Ssg69UceOcLo1/0pim1scUqMpYCKY9C5MVaJN2mg4keMwtfbeyUlwXPmdiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786137581; c=relaxed/simple;
	bh=mFekL/+ugTKD1+wRjl0r0JE483BIt+phCo5w7BcTpxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guOWeU/3/wgk7QefRen+v/k4eWNe9rdWTLYbncj/DLXj855dCfid6DbJ+9gAIi3793bCl6JUsfLd1fPML8jzSVDjewvSOlYr+TrVAoemi6whwFZykZ2JWaa8TradKEmp7o1ASMEhho+m/emURGcSAadb5N7s82gJugXVt3u9B0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ICg/7fG5; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ICg/7fG5"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-902e4af2d9dso19120286d6.0
        for <linux-usb@vger.kernel.org>; Fri, 07 Aug 2026 14:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1786137579; x=1786742379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=15FontS6fvOpmYz4ieCEw7eGM5J/B+J6GvKIpQSPeS8=;
        b=ICg/7fG5NxDbU0R13Ty6gosUSaUJww1qjzp/i5u3nxjxeQjCjDCvJ6qUMBEXTwmAKz
         V/XVsCCowpNwMiaao5eGBJB20p3SHOSLiecgoMmPulYGU7E7S3blgxFMdQDka3RgqBP/
         2ANp2qjs1kgUga7SWpk6VLJ5uWOioKnz3IE+6T5ihAlyqTGcyBEowsDPLp7bwbvR9mtu
         GurfdSynddbGQUoQvr/1hH4t7pJztr6I0zNrhz3pAvEGqQvf2enFQK8WhSkuLFyOQYUJ
         XIZek8/bWG+inzw5V0PaKyNfIxxlECcMrtRzm3UhQj++rhcVdGq1QFJ+OsX18pIRQRxm
         cZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786137579; x=1786742379;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15FontS6fvOpmYz4ieCEw7eGM5J/B+J6GvKIpQSPeS8=;
        b=NijjcplfOqEHijRyRQz7f7wKUXLYN8Ip3UCNdINCFNVZerYirkKFdQtvggHw84Ntk3
         l/u57XNvtdrNn07dN2oS6BMZHvXcmRvaUt5oXlXqKjhohiB8JDR6TjZ9ReIwdq26LG/h
         DpGVqehNnyx8+xlXNJ2WWlWpa5fTJnUY4JrOX8uUIeop19D+Q1LqLwG/fa0src0MZPd5
         AAOewqMQp6jzYfKb7N7MUtTHQtoO1fDjp4L+0TTvQ9IM46G+5y1KH2UhEXxhOpTSEtn4
         SqYeS8HjK4JXcCn0Rhj0HxcAD07Ht6uDaPqfsgbOBLOnh5lpCqbG0hGlAZ5gVTxeX/MZ
         IpqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyW7WiRIZ7V9e0ih5X188c7zYCyGhxodvsVCPBQsWzaep+76LIeyChq8YhJxKVBroJDjZFbHM+8gQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YztJ/FW6lSuwH4zi3BCI3+GVNQd2MCXdJyjtzZcOJAZGmxj605l
	tBNWQALV2Vrxp8jsYHDPyhDh7c0Bn2wGitFTFCcNjM6X5aA6GXbTB7Nx9+IhLh97KQ==
X-Gm-Gg: AR+sD100RdcIy+4Lrr38n2alAXwrfACvlMD1l57okmDD6HQ9sqIVBQQ0pfPgj42Qwcv
	H7Ul9iDw4OKQRGD9LeqDuw2zc6EjtFBCNRKyQyGwryyMz5Z5mX/iSNBGCKV5bJHrQQ4mTPTzyVK
	kgL//R/rNu23vFlri1tpv4Qs9IlhXpU1OR4MKXyt/TgeTKQn5Fr/aEu/1heKChTrA9BXIdwEdM9
	bMoeRp9avk987GiAj9NCkSt4FNR2VVco39pT1zx3vwsHQ8ApJeTcWwwNByUmsI34/DMVLz95SIV
	GaVbvJGF8VsUiSlVZmS5wYHq0zRHFJJ9rPauBKG2yh4lLVwbvA0pKM0b4JB0epw1jsKI63lxfyL
	27p+0es0Nh2CWBtL0fJ79CefuUyd8EB9/uT9jOZzePLhsvdFKtT5m3nnIIkDRCO9DAszoCZxDor
	y/idsScrbgTeoyp6y3a/qpcuh5Gd8CrF+CQt3yW4oZuz+4HolP/IxkQTrJ7bR/sw==
X-Received: by 2002:a05:6214:509b:b0:8ee:d9b8:8538 with SMTP id 6a1803df08f44-90a366ee9camr17587896d6.9.1786137578933;
        Fri, 07 Aug 2026 14:19:38 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a9329510sm17343206d6.35.2026.08.07.14.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 14:19:38 -0700 (PDT)
Date: Fri, 7 Aug 2026 17:19:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@ti.com>,
	Tatyana Brokhman <tlinder@codeaurora.org>,
	Kees Cook <kees@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Sebastian Urban <surban@surban.net>,
	Seungjin Bae <eeodqql09@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH 2/4] usb: gadget: dummy_hcd: fix false overflow on
 bounded IN
Message-ID: <30487b52-d20f-4d2d-b487-021304301310@rowland.harvard.edu>
References: <20260807075438.5566-1-igor.skalkin@oss.qualcomm.com>
 <20260807075438.5566-3-igor.skalkin@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807075438.5566-3-igor.skalkin@oss.qualcomm.com>

On Fri, Aug 07, 2026 at 09:54:36AM +0200, Igor Skalkin wrote:
> In transfer(), the IN short-packet path reports -EOVERFLOW when
> dev_len > host_len.
> 
> For IN transfers this is a valid bounded completion: the host asked for
> host_len bytes and the transfer is limited by the host buffer. It is not
> an overflow condition.

I don't know what you mean by this.  It is true that transfers are 
limited by the size of the host buffer.  Nevertheless, when a device 
tries to send a packet containing more data than the buffer can hold, 
the result is a -EOVERFLOW error, by definition.

If it weren't, what do you think _would_ constitute an overflow error?

> Treat bounded IN short completion as success.

Absolutely not.  This is completely wrong.  NAK.

> This fixes spurious failures in usbtest bulk IN varying-length cases.

What spurious failures?

Alan Stern

> 
> Assisted-by: OpenCode:claude-sonnet-5
> Signed-off-by: Igor Skalkin <igor.skalkin@oss.qualcomm.com>
> ---
>  drivers/usb/gadget/udc/dummy_hcd.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 29f671c7b319..5384806347ab 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1486,11 +1486,13 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
>  				req->req.status = 0;
>  				*status = 0;
>  			} else if (to_host) {
> +				/*
> +				 * Host requested fewer bytes than the gadget
> +				 * request currently has pending. This is a
> +				 * normal bounded IN transfer, not overflow.
> +				 */
>  				req->req.status = 0;
> -				if (dev_len > host_len)
> -					*status = -EOVERFLOW;
> -				else
> -					*status = 0;
> +				*status = 0;
>  			} else {
>  				*status = 0;
>  				if (host_len > dev_len)
> -- 
> 2.49.0
> 
