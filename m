Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525953;
	b=XEtu/2YHo35z6fA23Ex4VHz/EZjvaUhPQw2l2BjE9FI7i0ySfNHd2A9uk0DW+IxbL7sk
	 wgkzgzgpbLUIxySAXimh9g+CxsbWZF6AEkCuZdvzOWUuiVorpbUWZBt3HyHdHCMvOiO/+
	 SS5gCClNQTi4dhr5jaG4TNK14wVSEgOBZvpcKJTPnBuZndriiQF4YIHoZWNC+9SajxJ+S
	 EpzrJxfA7cvJZpqPZP92zjpgO2g8TjDpNddjj7fRXMtgczK21DCfSgi5EkNkMaGMTvIRq
	 q8CMq6w5VDEf9/KGuByTr0rn6uwUdI3NZMTeEuuxXDGzNLsxAQEc4NTE0p+CIeC4qdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
	b=Qt4vJJjLG+/2LT8RiILnr12socEHg44opuJLq7cZbXm01L/pdYyrucBNdO62su7BybeM
	 Dk21ma2L+FcM42S0/03sz3abrE16qTtvDNArhHqIqFHTaZuvlnmn7eIBI4c/wx5bQPoae
	 Dlx5al/xHo/f6I5la+DFBdLTCGArYSOlZcfuPXyEtBzJZdU+W7zAbl/GN5x7hqvNCvBfy
	 M/viUCaeKu5JwcFrfCWnQbKTQcFvz+rWv1NtgMgkw/YhHr0doZlDruXGFfac8Sp62WQWJ
	 SUYHiwK5wY0PQuffLi5RzYkw/hVR+Fapw5AkbHTdWjVOaXNicdiZH5cSB3sxf46E1Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uNI1Z34g;
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC7606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 19:52:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uNI1Z34g
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5364042eecfso519471cf.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 12:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792525951; x=1793130751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
        b=uNI1Z34gD8pS88g49jQxXOZaBvAGB0cBTDIgRmV6x9KW0twHtFcBQlmx6HA/N2Fjon
         p0wEvG0VhrjjGEBCWw+b+VEbzx5e5Pvvi1KlFE7YPYuvGBL3xC2gz690oFUYpsLhSbRR
         TB4tO5JFjx3mSwEqQOaRU65X1milSpXqeeJc+F+JN2FeC294yraLg6MzCTMvAcWr0geA
         oQJLuE25SLr3CzajQWwEr/RoHxDGs1XFnpzumziYtG5TMi3GQdF/nURm9jfNB3YUrVGM
         zB3oFo6091mIAa54aZ/WZkZ6oCmPLQgWbgqbGQV8mc44P1oPJ+q75ShSFIiVtr9yvNts
         gFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525951; x=1793130751;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UIlLpTslQoJi/WhjaJsyed+o5SEcLwojJ1nZYarv590=;
        b=vClvUcxkK58Kh8Vlo8AL5DD/pVIxA4PNYTF/m6DJjeyOyALhcv+3fGUaohpExx5uVr
         FXAFqij75Nka89C6QwQUVWYt217lRrptGMebtNxHhzW8/tGZ1BjN/8kSjMK/NkYAcqnC
         K/T1De2WPiscyORtJiZEuIW00xYxINwmp+/CPVaDZ0KyFhx8If+MEKkejQ550FFEidgB
         DOypgOul5S1vNlBkhfGgfEN1T6GJfiL3kyYelOHZWDNfSzGmj4jvGl2hDB6xZNPpM54z
         qRFvJgKwJsarlfuBjyvf1NNLyOVZ1QWOmBvwGKic1GY9g8nFxDUPe447LNgOyu/SKycD
         E0yw==
X-Forwarded-Encrypted: i=1; AKwUvBxTkQZg8kLL2fUt7qKX/6ZPMAx4PHezBa/uzqRqe+xB87c6VVZnnFxKSS6305CTzO46Oy9MEKaUalo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjfKEZfJMkIKeIis6DsPlUsYwEYAZP3Sjm0/KOvATjNupWWC/6
	dwzKNcqZTEMqvlKw0FJFHCx/0yKycEufb1WAc1Wvr/3Pf/M7ZQkGKC2/UbbLHqsG8Q==
X-Gm-Gg: AYBFou00e0HW4n5jIrVTGvMqwjwa17wqY5VHiWP3y+foZN4/QxihVFYdVcIMYkAC5Vj
	4ZDmIyIx68Wm0+iEAhIADv8478Tf64QX1394E4Qx2LE1xSXqPhz8jYK+QvtAa/35LaQPc2E3YsF
	qQIu0TaEI5VQ5dsOlbHqaSySz9lLM00rUNu/fUw70AD1OoGcUOA0ZbWFkTEpslXCDvkpMmTqulm
	hWESGYYBiqRiQ4nrYX3IvYGPeiBeir0cfTWsWGw1R4hsc5uUsNelPjlY4dCC4zvZ2a8s3U/SAFw
	Lwvl4p8JHoUXlIwwUZwGyDVCr7ev8FHjdD+gX2pgWw0F+WTfWMEb4UHlC6o5PonJUpemfhEZ4IF
	RCQDSy9o67WE2JTGKVPQiw8qxMe2aTON971Af48VAs7GYE6ONuZu4zjC0qHaUXLFEEHl8DNDHMZ
	uJ6HIoAYD4EGGlwTWs7UGImCD0ySLQmdCPxUATjPbkB9XceMslm9y2RQaKB64CzCXoHeJ5Is3cb
	Q==
X-Received: by 2002:a05:622a:229d:b0:535:855e:6e25 with SMTP id d75a77b69052e-5364604517bmr169421111cf.47.1792525951439;
        Tue, 20 Oct 2026 12:52:31 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53698ae6077sm3873891cf.6.2026.10.20.12.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:52:30 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: hcd-pci: avoid double disable on surprise removal
Message-ID: <a25e2100-e01f-49b7-b794-da1027dffedf@rowland.harvard.edu>
References: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>
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
In-Reply-To: <20261020-topic-hub_pci-v1-1-bccdaef0344f@oss.qualcomm.com>

On Tue, Oct 20, 2026 at 05:05:39PM +0200, Konrad Dybcio wrote:
> A PCI HCD can be surprise-removed after suspend_common() disables it
> and before resume_common() re-enables it. Avoid a second call to
> pci_disable_device() in the remove path when no enable reference
> remains.

Does the double disable actually cause any problems?

Alan Stern

> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/usb/core/hcd-pci.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index cd223475917ef199511311eda5c6aaef073b0ad4..34c4d352b40c40c54cf17c30fc264833ba05bcd6 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -348,7 +348,9 @@ void usb_hcd_pci_remove(struct pci_dev *dev)
>  	usb_put_hcd(hcd);
>  	if ((hcd_driver_flags & HCD_MASK) < HCD_USB3)
>  		pci_free_irq_vectors(dev);
> -	pci_disable_device(dev);
> +
> +	if (pci_is_enabled(dev))
> +		pci_disable_device(dev);
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_pci_remove);
>  
> 
> ---
> base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> change-id: 20261020-topic-hub_pci-903b8c18d17b
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> 
