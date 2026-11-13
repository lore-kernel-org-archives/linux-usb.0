Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579583;
	b=IluHPWA90qoF1HIrrHD3akLGqL+Or29hak/Vv1cQcHq9N5ELH+wJCHdlMtt/miGlH+ND
	 rW0Emp3MEuPEHJhKH4deaDU/ydvnuc7pP6b0Q39x7nu5mPpFQoebCADC+5R2Wcpap3LGF
	 SyYC18+IJgVQbPvuIebXBZkLdJLn9u643LXUYw2UZwFhBXD7MZDOqM0GAyZ4q5rvgEKOx
	 ghBwEM1vW2K6tIyRL95UCn+RTqGYiizrrEKAz0yFxiVbMiqV1hOWevBHx1fC4P/QYGJNJ
	 Fc5ytIhksgtmY7Z2l5ziyJadL9ipqO74Qxw8DyW7utcCc51B9FkglKZIyVrgdAhLA3w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
	b=Am97e0Qeevu8oPk/IVvJI5uAiuRiCaE4Pv7zLT+UQ7pooHQYxEGNmNlA9p7OI8EKnNnV
	 v5QFOAEDfRRPM5bhu+dCSarIomuZZpYJcypPIlis2f2FgZ8lXF563N2J2FNRTUAZ9IfOt
	 Uc/Ghvtw3+bYSwi8fAo35MJNttkjbNGHyWLRfUACvBOOY7/mOTS5nAGy2DAGIGCpl624b
	 lH3xzLYZDuwsaWdrPfo5Z+yYUCkbZXhXHY+h56gEPhURj7CfgVhniU+xzRorDLtQUaNlV
	 pg3Przv3GRdtbpxvVWgpTpv1h7WM8hS+6MaIFet7D0cwx+Y/qHRxLp9vzPGw8piTTNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDE2606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 14:19:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEDE2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CuGpuG2K
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b70192ebceso2687905a12.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:19:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794579581; cv=none;
        d=google.com; s=arc-20260327;
        b=V2vYLc2plsCq2NjpvJ/GCPLCcRI48hYDl3a3j7kGIKFOWCu17/wfln5MGd7WW+WAku
         v+fbzUL/VKOFqal/xYg66X2TklWrR00+7KSRUwfjwCHLFkN3nxIIK03C1x3J2ZlwKMqk
         8Ftcdvr9n79BIDeLJ5Yc+lmZeezyz2Pw327swcH/kRzL5BLRWPfeDMSheTV/c4GLWYZA
         aqhR4RKsA6p/UCo+GcscV06EZdloLm5lSs61Yw34CCMNaXaHwHD3Yax/TwnaHvXDjw9a
         N6IW8Sa4t8TmRTZ+zydaZNTKzRVFhtTTMIs/JWWn2VG5CSL4I0Ew0yNcv6oq6BUCc4np
         0/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        fh=6gT5t0P2acCaF4U/31kJMCgFk/nU4GXF++mh55x1UQs=;
        b=NM4w86ddUeMHwqXL7oauJRCaD1Z8k4LcICPtf3N2ImZ0HV3EseBprjiwa4dho8V3w+
         76ga9JqmbYyeb2GAPT81dAS16+LA966Fl2VBTiuAj+rxrRZlceX7lyfVMki0VuvG4y3T
         1Ghq+T7X991lbsO3w8Vb3mSfLc4EjuEdsHp9H7vvjKxhbuNq0SuGBrTkE9Oj2UyVWMhb
         4RRm5+O3RQTLb9QIYy8pWEA/8ywTGtEsunZlc9SRVURk/psLaY6veQ5refpfVdu81eGC
         QvD9Wc+CG7cLsHNxXWTweqJ6Yczc+q5eb30S/ODuGnJkNlwWxdaoJKJAVyyD35ESL8dj
         pRTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794579581; x=1795184381; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=CuGpuG2KrPPwcJdQD8Mt4QLipSoESTVXmGWzGuhZt8UmoCgk+cMoOBoU5i9VRwNi4w
         rh2Zg3s0Qlf8jDtUgOWkJovpMlnNGIKgGnRxk15hcW02DhYIdQd7kHVNzO4nP2kmBYuY
         JO5na0F2kV6uQXP1SDKHOaTGx8kevs75jbmgy7joxXBX0QNEok1leCrTJA8Nu7gZ255a
         7CBFWO2oXC4Q8ggcij+pFbu5AYxoSXoDL73541MhIxQko8FsqYlhTe4A3Ma59QcjXblC
         qu0eJh3jxnWjLKplHD9g2cxma+qPJBK817xqdFV81tftlroFD3zKtakJjJNPfITIznsI
         Gx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794579581; x=1795184381;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UQz+H7cn2Le9wS7K0KEa2cZaaDDd18moRjfqMi19tl8=;
        b=moNt2p5AA+w3l5mxoV0kO7to+xGG7idTn/HgBoB2nUotPl0dmUwtmui9rLXbx0quXY
         dSuOeX92fXl6vrpDijOEYBqe9gevXs8sAtToEISLzfCTZqsmeytsbOQh+IRi0N603xwd
         xZY/VHXVQJFA0dpKFbQ7u9Tmxduv6S4t9aA5mrn0J5S1mSsoH3XmSiG8gesz225RAHiv
         j4Y1Z+pwstUwrQW4xs5V9v8q4Qj6S2mGoWPh5wyG9e7GNF0I2b2fMR/hE1Cc+13nGij6
         cI9HHxf6sy5OfEKS0U0lJmlodjHPiTmY2Y3+i7SECheEWoSjZn7N0VQ/g1d8fgBe6KUs
         pDjA==
X-Forwarded-Encrypted: i=1; AL+hErHDs90B3vGmNvraOWnsLVWTgRqmvxLW+mUbnPRrCJadgJytZo0yPZi8DtWvbHoOhx34vvYnkg7mXO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+npL8ZsEserFxAA59I0v/Wh1xGEbu5tiYl/KPKlxYP1JByiQ3+
	cOOlyhRc3YcmVrY+Zcizh0MnVOrOMUF2qNHw8rTFOL5BcBmEss8HPuYUOJ9bKYQYrgA+VrhQ+iT
	eAw5uG1z2mGQomqGtiZQaFClog7kc9EUkeyQlHvbbcQ==
X-Gm-Gg: AYBFou0+9C6g6m7sRo4GhRUtzF32qQ49tsFVsymbVEdMzx1UYxl5iUgY8wwdop+A3fu
	H7JPT9sjS0y/S6rysCctHd6NHpckD25kGzvm6gnpt2yLu6hawv8Hrgy/zt2Y5+QfFyXxjTgLYuH
	AjKgnckMJj+w52Yy2YeYsVFRoGiNYL/zdZMswe7P7AfJCPfKEF/w8Wh7Rocw2fas7Xg3ScCqTb7
	SNT5AeSIkCh3tW2rqqJzca9RAG9qe357WbKckDkbN5Un0iHWUtMMryMfYDlrlwYw+gOHvk0+cyR
	8KP3RlUxS+6b865TRt0hItrpBJprLYQvjPZKuw9EYQ0SMNSamXkagV3tj5QEw7b6c3dt+Wwh2d4
	6hxGLImkfpzZTfLrG23WMhiR8ec+zZDA8cpzkkEI9ammtlhrLV0l9naLypsoZldZ5Ho7uFA==
X-Received: by 2002:a05:6402:a6cb:20b0:6b7:aca7:2264 with SMTP id
 4fb4d7f45d1cf-6b7c0be4e2amr1723925a12.9.1794579581264; Fri, 13 Nov 2026
 06:19:41 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261105121432epcas5p30c05ba935557ad6dd59514ef4d834e96@epcas5p3.samsung.com>
 <20261105121401.1661711-1-selvarasu.g@samsung.com> <20261105121401.1661711-3-selvarasu.g@samsung.com>
In-Reply-To: <20261105121401.1661711-3-selvarasu.g@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 14:19:29 +0000
X-Gm-Features: AclHuK9BtJmzcgRQKlrlAtXVpG8_cOgWPWRM5bnocNCGOV2wnBohhrKZoowVukc
Message-ID: <CADrjBPruky8SZYpX=MgsMjiKGUJhOhVu9j3Z+9JgJbizmcxSjw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] usb: dwc3: Add Exynos8855 to the generic platform driver
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, Thinh.Nguyen@synopsys.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 12:14, Selvarasu Ganesan <selvarasu.g@samsung.com> wrote:
>
> Add the "samsung,exynos8855-dwc3" compatible string to dwc3-generic-plat
> so the Exynos8855 DWC3 controller can probe through the generic DWC3
> platform glue.
>
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
> index ca69ac0eb07c..069b265c9808 100644
> --- a/drivers/usb/dwc3/dwc3-generic-plat.c
> +++ b/drivers/usb/dwc3/dwc3-generic-plat.c
> @@ -236,6 +236,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
>         { .compatible = "spacemit,k3-dwc3", },
>         { .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>         { .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
> +       { .compatible = "samsung,exynos8855-dwc3", },
>         { .compatible = "starfive,jhb100-dwc3", },
>         { /* sentinel */ }
>  };
> --
> 2.17.1
>
