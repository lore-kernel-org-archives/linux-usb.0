Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7403DB64A
	for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2026 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785628416; cv=none; b=PY7a+CPiTD1a5A1v0rzjFRXdBd2hfPhY9Sj+Ml+dj6Zka3am7rmY3kOKaWvkaYK0Dr78MFKLYQmueVF0k2Sp4QXaXOMhok5f5NjXmWO57gyAAUdMtZ7J8RC0+b1uL2/dNfsnv8Co+RRkkxKGccDUYOK7YkgNgTIwerHdDBIR5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785628416; c=relaxed/simple;
	bh=e+rsG9MzxhJaJV6c5SXSPxe8Yy3+bJkISODYZAFNwUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gwG89YBAw97eFVku/nkYSs9bVPT2vryUQTPZ7PAWR/y5f3ch6BzNcrP3Yb6LWwUfCncprtl1rXtuSfVQfMYwIaCHHiGAQruoWwrJS32Wwj+7HERN12MBZoylBZuboGowGk/dypGeI1gcOZOtTocXDBJ334CQZl/ZxJ3McWUnU64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Gkp8fGCM; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Gkp8fGCM"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c05dcdf49so23078211cf.0
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2026 16:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785628411; x=1786233211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7vqUPPgydAt2IIqwdqtZaZWjZ8UlIgUm3LT5nWMNn7s=;
        b=Gkp8fGCMQccqkOYBoJX5lsGmFMl+M/HtU1P51HuHBbcFRNpka8MkUPcktsItslyonL
         KzdF8EzhVFwBnbn6NMGMyBj6i2ACdSQ3ZkcgfFsj6PrxHROBgpFLNF0rf9mm8HeqSMNf
         NFYhYzolOlQAvgd0NlY6mXdN2dMmlcmGh5etBo7KdCQ7HUOv0HWbLW4STF3IJRq9T1LJ
         G9Rtjo3TBPsBfPVmhca8U2Vp6JNIxguWWnzix2JFFWd12IeYUHNx0yaMrl8azoFv7OPI
         K4oEvNwzqHDFdQr75RBd7hGFWcNUpNAMv2ZxyrN9eceRoUplhvb15PIGCVY0R8S8olkw
         IAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785628411; x=1786233211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7vqUPPgydAt2IIqwdqtZaZWjZ8UlIgUm3LT5nWMNn7s=;
        b=mNnVnDLD0l+OtBJUWOXZaA+zYQMvww4HQQagVRt2PpyCaXd/19et9BZjWJ30KNFijJ
         YMPvfOSl+sJBV9jkWOZatN7m9wVjIsE4yt/8YH3P/AOv1P4LDSU3s3opa/N3s6lCx+Yd
         lV1V0mWJlTb8Dx6zVZZO3SrUIUQO7RT5s/u0CU0y8NNVcVorMHu7vG2u47AxSO1H2Ib7
         LMBQQ4DHtLT1CTcOxnE53V3UTICxaVdO6VthMyzdNuJwX/fkPwAQAx7+AePUpOUY4QBQ
         cImJjpQ6TxZFfgZj6xH+38Rj5zljksm3PcsDtC5IGf+CJdA3anC2O+14ce3Z6LFzCWnK
         bldA==
X-Forwarded-Encrypted: i=1; AHgh+RrgUm96OFdP1CTu0FAeO29qQr7BN65qEGroAzTiUvgyZ57ZnnXlIlVecEiDt3K4uV+eYXPui1fkYYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YygsxBsGcSh1rEHA+WeKWaDRjKQiPpG8QlJXiA7RWtPLiLxYwsQ
	qFhiZTMp+4F9w8YUtRHTOWHy0zNpYmI6foGfUxjZf+LJ5rYco61FfbJ/feuCQensy2lRwervWw+
	olm5CYA==
X-Gm-Gg: AR+sD13mluRo+lgo3ZxcIs28ZmX4Y+P0npIzKrvnWQQGqkl96IZhFc9gWzhF5VgFiTB
	OjXBCouFhv+2c79Sdl/L5oyVIrYEqWSTjswDR2Nhv21YJM6sEjc/lHb24KCwEmItnD2q9hU5yxO
	nBVwTSuI8e369lohMoVeI9wqXwOwby3gKocPF8F5o1+xSXBEiSTnpP9ORQsCv5TAj4NzBXsl7uG
	nd+sy+qxSdUbZqkGLIQKZgQzhHdkK7DAQTXZZEaDp/quV89fB8t3oD4N9TNwibDwfN1sYtiwnQ3
	uD2x+8F+iKP2e7HCn3EC2VJ6+/UQvo1R10WGb7428+y69c0/D+pqX/gk6ZSU+y67t6Ym6fJRVIF
	TxXw7mB8HrFoZuffuIefs7mOd1IaBU+ZDq18n3h4L9hqVUsuJxUQRWSSVpSlE4mLXgrSa7KGGJS
	9w4fhyrkhYGPma3Golp1uzO8dQZXvVfGo8BYB8vwf2MSMCWuhWLhR1EPhEQhq45g==
X-Received: by 2002:ac8:5955:0:b0:517:87df:d8ec with SMTP id d75a77b69052e-52b5666c4e5mr98606391cf.9.1785628410965;
        Sat, 01 Aug 2026 16:53:30 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4ebc1f13sm34825811cf.25.2026.08.01.16.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 16:53:29 -0700 (PDT)
Date: Sat, 1 Aug 2026 19:53:27 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: OHCI: drop unneeded semicolon
Message-ID: <45cdfa3c-4ea8-4e51-99fa-e0444e7b2454@rowland.harvard.edu>
References: <20260801191002.1383835-1-Julia.Lawall@inria.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801191002.1383835-1-Julia.Lawall@inria.fr>

On Sat, Aug 01, 2026 at 09:09:47PM +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.  All uses have been verified to
> have their own semicolons.
> 
> This was found using the following Coccinelle semantic patch:
> 
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i = i };
> expression e;
> @@
> 
> *#define i(...) e;
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/host/ohci-dbg.c |    2 +-
>  drivers/usb/host/ohci-hub.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-dbg.c b/drivers/usb/host/ohci-dbg.c
> index 9e0e06bbc..4c83a1686 100644
> --- a/drivers/usb/host/ohci-dbg.c
> +++ b/drivers/usb/host/ohci-dbg.c
> @@ -184,7 +184,7 @@ ohci_dump_status (struct ohci_hcd *controller, char **next, unsigned *size)
>  		\
>  		(temp & RH_PS_PES) ? " PES" : "", \
>  		(temp & RH_PS_CCS) ? " CCS" : "" \
> -		);
> +		)
>  
>  
>  static void
> diff --git a/drivers/usb/host/ohci-hub.c b/drivers/usb/host/ohci-hub.c
> index b3d734ab6..84d10a932 100644
> --- a/drivers/usb/host/ohci-hub.c
> +++ b/drivers/usb/host/ohci-hub.c
> @@ -33,7 +33,7 @@
>  		\
>  		(value & RH_PS_PES) ? " PES" : "", \
>  		(value & RH_PS_CCS) ? " CCS" : "" \
> -		);
> +		)
>  
>  /*-------------------------------------------------------------------------*/
>  
> 
