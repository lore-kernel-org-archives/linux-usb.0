Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852579;
	b=GUDDo5AOBzbwoTBu1jXF8ZX6LBTD3wOMYx56LdSGtzA4iq7gH1N8dpuFwCnGphrwJBaU
	 EfBFTrnmic100Dyc5oe9Cu6KgrECiZehHF+QulfbZSgy4fUu+Y0D+hoSP7NFXZd4kXM63
	 ppmgzWDfVPznW57/1JYancM6j9UWIgd+mIqVuJyIfMVCOR90b2mfllX+dYOX/TKTXAU9e
	 ZjnfWs0s1p6YoWWI1a6cabm3m7x4jG4QQQ6/blDkMkNCPy9x8VXVkYxUVfXG76sobyPhn
	 MnG+db3e9ZF5NpubArrEEMU6o22JVusLeMurORjOO9Kx956eeBjoUj6UhtQzvvC6k0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
	b=PnST9WLfMWCwm30BdjZ5D2UUUbRKAJqmrnul6TSMOkcgSwiLXyPFkNxzE0DS6nZaF/FO
	 AgCrldVXucLsPKnEaMO35wSB0cl3mPIg7raePFzqH2wTKR+yCwPNfp5yhQ/VJmJW75U3r
	 Y/a95bA7vc/KfRmdtQyZ+DBn+ioDva6cqxTwuLUCmTbnq8PI/B6iWq1MJmb+aBl61JFT+
	 rRJCQf+BD2kvt+eTKBF3gWiJqBy7tsagQ6ZBNVA8IA3QVobwFAPja79gY9jlHUGDRHNqO
	 CFxnSmw9pJrs2nFTRgHt8wA+8L3Fy5ePRy5YcRjYIGeqmA5efYqitPCx2aW+77HO4bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GeRy+i3M;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5BA606A31C
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B5BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=GeRy+i3M
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d2d380f6aso19772761cf.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794852578; x=1795457378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
        b=GeRy+i3MQMXywul0vxJ9pHX13PP75Fk1JqRn5p/rlbd+MsBD9xgk3CWFVTYVKvFcW4
         lDEqKb8vgmDvjPxmbWR1U8biLABMv10HyoQx0mRr0PJ9TuoyujpjVEHtE8MHwXcIGCEJ
         x27BO1fB1awUus3VV5XgQkwTEvSUFeW1MrW9CT77tNDyHm+FhrJlMW3gXJiq6HCZWoaV
         hkmN6JdLS2YXl0RFGCBawJyUVhy3LgHHLxNMJxzsiioTN3bf/SlBdR15oT+SFwfqrL68
         vrOEEYGWQ3KtCbBUkaKx1BPRZU+Q5pIcpJeFaO38Z4oqs2a6FbDRw4cPtu12rXlOoYs2
         EcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794852578; x=1795457378;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=okvp8C0zuSE2GrsT9KtMaCBqr1Zkfu7oGXcl3aeW/jw=;
        b=jM9E33dT7evDrawZBCL9+P5yXpL3WhMfMp6jkyeOnIgGUMi2kxjuxYaQ7kk+z6UzFM
         zOdmwG4t5bWnslLYR1E/iZDxHQAAoEG2SNCpuiVJ9MlPDY+LMUNEk+B7Q4z30lHzdtPx
         ov4F+Kiutq9HSfE5nVNVVDX1hMgp+RuuBQ+Q1TNFrI/K5Wg6Gn0Fxm4xBRHMj8JDy0Yi
         c3Z5mFKz30AzC7pYfAXXyTwHlJoAJ+UvBaP38zC7qrkk3JbCKDz5NrDUggd/q5Gz8iu7
         DWAa5lN/2IRb/5viVZbU+bT1lApZKgUh9XOI60yeTZps+Zf9P0TYFaGHQY8GCw/vnpzV
         QgPg==
X-Forwarded-Encrypted: i=1; AL+hErExYx2eqZPtTOelvM+Nze2Pk8ZvodM+SlziiRnF+3jiZnUvqNeSOHP/VyKleuAGRPg4AsFTpn0DDHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tYZSRpoefa/Ed176hNpq/Qhme+4s1wGUkEG1R1V3T92f3uxco
	ZZXe+tUvqO3e5sL00Ybon/9zsuSYVS69au5hgWD5VqSD922e2lwVcLaSIrfj+Hj1uA==
X-Gm-Gg: AYBFou0kCSk99H9D4+t3SS4CfHDLLAdhBLGb+mPeAAOyHOoBVIH5+NmTdKf233ef9wg
	MlSLL3G4zNwxoJmv5kaJSV0LJRnSeJ9uL9OZtgmeIeoUOmhyRgpqUwTHFnOVBY0e9WW5Mkkz71O
	aTbhD0VQn14+8i9pi9cdltdQtF3ZyfaQwIuZrHaIZ5K0bJD57fQnMr+nqm60cF/HufVT+LTHByP
	39AbfB67ft2jHThSfJItDEE3zm5httzpKzUEyuWgUwVeftiwoPFeI3HM704ACOOU2LJUPyDIewl
	LYViZZOJPpBj7bgVyRiD0XH/KfcxpBA463apgtRZsSfzhyGR0H/0m1iknvlti1NO7GkdiYiR2CI
	Q+rTa+NSKKm4ri1hzqw4q567WT9+ZU7j1Apwon2YX7pzeksnHzJVGD7R+F4lcKaQjCHSLs4IG7m
	1fepWc8VsIsyhYhhHmslF+ixT0T0fiXJoL4789Ki3sXRAe5UqmQIc1J1aAUmKiKOahm147hk1Aj
	aFDKtQVp/YXohTRqlzeItRme5mWuvbUD/l4r1lTy+1m4qc6FyJwcfiqUhzUbXUs6g14u6GJHFkm
	AkKwycyGobvKb2jOj5O9suJmza55JKK9Sk/FgMdqnaBXsreBD9U=
X-Received: by 2002:a05:622a:580a:b0:535:7b01:1ac7 with SMTP id d75a77b69052e-55ac4390e7dmr180243411cf.6.1794852559307;
        Mon, 16 Nov 2026 10:09:19 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c42b6f3desm62496871cf.27.2026.11.16.10.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:09:18 -0800 (PST)
Date: Mon, 16 Nov 2026 13:09:16 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Gichoon Han <gichoon.han@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-sched: Don't let a bogus siTD remaining
 length underflow
Message-ID: <5ed0f4b7-beb3-4059-9e12-b9738af65d91@rowland.harvard.edu>
References: <CGME20261116052855epcas1p403c518b90d70d98752ad0ca2d9ac05e9@epcas1p4.samsung.com>
 <20261116052851.2272125-1-gichoon.han@samsung.com>
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
In-Reply-To: <20261116052851.2272125-1-gichoon.han@samsung.com>

On Mon, Nov 16, 2026 at 02:28:51PM +0900, Gichoon Han wrote:
> sitd_complete() computes the received length of a split isochronous
> packet as desc->length - SITD_LENGTH(t), where SITD_LENGTH() is the
> "Total Bytes to Transfer" count the controller leaves in the siTD.
> Nothing checks that this remaining count is not larger than what was
> programmed.  If the controller reports a larger value, the unsigned
> subtraction wraps and the class driver gets an actual_length of
> nearly 4 GiB for a packet that can hold at most 1023 bytes.
> 
> This was seen on an ARM32 system (vendor 5.4 kernel; this code is

The type of CPU doesn't matter as much as the type of EHCI controller, 
since you're talking about a controller hardware bug.

> unchanged in mainline) with a full-speed UAC1 microphone behind a
> high-speed hub.  snd-usb-audio trusted the value and read far past
> the URB transfer buffer:
> 
>   Unable to handle kernel paging request at virtual address e8756000
>   Internal error: Oops: 7 [#1] PREEMPT SMP ARM
> 
> The register state at the fault is only consistent with a wrapped
> actual_length coming from this path.
> 
> snd-usb-audio now rejects such packets (commit eed0e9583a29 ("ALSA:
> usb-audio: Drop capture packets with bogus actual_length")), but as
> noted when that was applied, the bug really lies in the host
> controller driver,

Actually the bug lies in the host controller hardware.  Not the driver.

>  and other class drivers trust actual_length too.
> 
> Treat a remaining count larger than the programmed length as a
> protocol error instead of reporting a wrapped length.
> 
> Link: https://lore.kernel.org/r/87se19ufoi.wl-tiwai@suse.de
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gichoon Han <gichoon.han@samsung.com>
> ---
> Compile-tested only (ARM32, W=1) on linux-next.  I could not capture
> the siTD contents on the affected hardware; the wrapped value is
> inferred from the oops above.

So you have no way of knowing whether this patch really fixes the 
problem?

Alan Stern

>  drivers/usb/host/ehci-sched.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/host/ehci-sched.c b/drivers/usb/host/ehci-sched.c
> index 57d07d1c2dfa..12a10248a4b6 100644
> --- a/drivers/usb/host/ehci-sched.c
> +++ b/drivers/usb/host/ehci-sched.c
> @@ -2241,6 +2241,10 @@ static bool sitd_complete(struct ehci_hcd *ehci, struct ehci_sitd *sitd)
>  	} else if (unlikely(t & SITD_STS_ACTIVE)) {
>  		/* URB was too late */
>  		urb->error_count++;
> +	} else if (unlikely(SITD_LENGTH(t) > desc->length)) {
> +		/* controller claims more left than was programmed */
> +		urb->error_count++;
> +		desc->status = -EPROTO;
>  	} else {
>  		desc->status = 0;
>  		desc->actual_length = desc->length - SITD_LENGTH(t);
> 
> base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
> -- 
> 2.25.1
