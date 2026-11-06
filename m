Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794005614;
	b=Fog2Q4c+tdzV4IH7FsuCXtrmFVNuZTGFhnXo26fl5az/KWP4XyZcTEvi4IH1rR7Cu/5h
	 YYzp336I+a8p2R1oThjCUoWsjMgTcYEwM3E+Ohcm41juoj5EzNhwi280eAaG382fouOeB
	 LSd3UudAm50mayOVthLDr2PSgOqri2PctFyy3NmbN4g9Xkb0eQeszMObQxyWKQX2wrOH1
	 qiu3hs0WP5lnOCwNufEV56ZzRw7nISCDbpzSRo45UloxBoo1MhCU1LTfX2t/bvb8cMsU3
	 km1ExVDM5DX7sD7l2WieL8+4d4wUbwD4oNmJzOkfqh3jYOZksCDWGYaxPomMAXVrReQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sSB5kA2sCC0oefKI12UlIxBnAOpCjGCbUUG2JA3fwCQ=;
	b=scPw+i503+BtsG8KHV5YHTNJFaBMKCV6XrVfkkh4GKsMkTVmbzfqExet/CBvanXzweFl
	 TQkEF1TKnxcVCQ6NTjXIPrliQMx224Ex3mhhge1QA5+Xgf6GobuViEs9FkVky4toSep5y
	 qdwHADq7aagOu0XpR6NM2QlbqLmeQuVIye9Kdl9mVlyIi6LmjdPK6RX7j43umAW98klEi
	 puvqSWyy6L3zujKMsqckQ73GD4uGaFU8Wy/kInEd2Ve4D5P+Xpcjswu+eavwOo1bqnflQ
	 qa61ZLo53q4SZamsFoILpzgkFntig+nT99mCHKGkqf/BPXee4NOVpJBDouvkdxDf3sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ngf60APc;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88439606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 22:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88439606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ngf60APc
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9e53d011eso7225335ad.1
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794005613; x=1794610413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSB5kA2sCC0oefKI12UlIxBnAOpCjGCbUUG2JA3fwCQ=;
        b=ngf60APc1jd9uQ61+lSE3wI8+2AQ/KUTzRqCJ0a1nHVfZhB60iz6WCTTqhcVkxd63G
         XkD7y3TOJFxndztoZdVXK+Uhz/lOUeUlpTPbnY7XdlF2+Joc5/SizPwlYF8bSa3SNF7y
         5nAyrkIdW9QNpurev2xtEebx71cqF0BvUbfPWPq1TWaZrxYi0t1HvdTD7n+SEL87T4VO
         n0dg9EIJO8pUmYX8WHfjMCOLIw045a3x1QaF/CuRZYAUx3nwEbXgslB8VCg2enmDejEF
         J1bnCPxs3gXYKDZIxcGtYIA05Fr9eJmdGhU5pSnYvEalTpwIf7xjRHC2rSctgTcU1yFb
         H5Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794005613; x=1794610413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSB5kA2sCC0oefKI12UlIxBnAOpCjGCbUUG2JA3fwCQ=;
        b=cej7wk0XH750/UYD9yro8SAsikzDqSqP5htLb/vnY5EnkmrJ++BWg9mekemrp3K19G
         8zsjXZ9GtkzAY6OYu7jfvywDCTa+5ortCKwSdrsJhfOov6wIiacFWidQ5nzmv197J6ks
         1reDjQw3YOsscMFyRg4Zh+WA6MmQ1wx+wScmKgZJ/L1a5t9ZJFcSafrGPWcNzLeeZD5P
         mz9WGIQBqKtlb4OqXjoWbz/ceBLazR6ipyUwTqjNmVG29ZFiLbwluPS6thik49sEPe/Y
         mKO5J5VEtuj8lRshMJU3DJNInYazk+YoAvQL9oeoJeMQ0gGlPzKBHhWcOduCPV0ZkCrC
         kyIA==
X-Forwarded-Encrypted: i=1; AL+hErH1L7EFiMNWF30ZS+Gs5+jPyXAWKp3KlR5Hgg/9P/DPovPs0tdXEfOaVlupWe3idk1Vy0PYrqUJYmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ErpC7XulN5NenMzS39TUR7VNgz6DYVGOJATVqQY3E8gZp5vOq
	JJrUguzz1nIYz3Ix3gLWhk3TFgo2muZHYNGVaVPToQ8xOjhGBh/sqeQwRAR7y5XRXgLbvgpi/O/
	NfOMveQ==
X-Gm-Gg: AYBFou3BbvHkANw04lEaTL+JucmkJtxUf5YzdLHeaUDHOTWX5hzEp30K+hkJgtRy4xw
	lR110arHv1khcxvZA5GFFCE8IbkW0dSbSSAxOU+Xucpi43dUF5/BzynQCMxJV2fc/VtV+FqUdpf
	631vBJDbqze0KoITMX2tURsf+p2eAqwYVeST4xtkkZRO/rm3UR3ryT17b0lKjprn/MfnJtVejTc
	XdTM4EN+6tBeysoD/0snpYsQ4U3K+aXl3CFAOnYAVqq1NwzwKWQGo2XeA03m5ZxjLFs8RF37D7Z
	nqH0XYo7V0N2aUKsXp8ckXCL10XTdKVbx3YYWuaUx/DpW+OloR6szUSPiB0riHniC8iB87D4Q3e
	MDXJz7QebBW4umqHde/nS3RDVB1SmOFKBbEbXjaP+qUBUXSY3CawMFsHsarsDLUyXkJWama9O6p
	qsPOO7LEA+bhH7MTXurVrNROGlAGTkOPyAK33571zX2APEI8WHuvtWiY21nBocDd9Dediy9VL7Z
	mfSMzhISQZDgBkXKlU2jBjHOJBHEre+4GO3tnxeGauFUoik5XI8pyr2ooXj/gMIzVnB90q/4XOx
	N5SuC9abkCkw81sqzgA6cdQJoMWOUPp0XQ1YiA0l9sQGOnWxWc9AJGM8uMrRjZCyAcOJ
X-Received: by 2002:a17:902:db02:b0:2eb:3599:aa2a with SMTP id d9443c01a7336-2ed41e6527amr47850335ad.56.1794005612270;
        Fri, 06 Nov 2026 14:53:32 -0800 (PST)
Received: from google.com (162.127.105.34.bc.googleusercontent.com. [34.105.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d80de7sm9144625ad.59.2026.11.06.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:53:31 -0800 (PST)
Date: Fri, 6 Nov 2026 22:53:28 +0000
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
	michael.bommarito@gmail.com, linux-usb@vger.kernel.org,
	xiehongyu1@kylinos.cn
Subject: Re: [PATCH 3/3] usb: gadget: f_fs: Fix mmgrab()/mmdrop() balance.
Message-ID: <au5aaGJzgMwEw-3j@google.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
 <20260901120908.14386-4-ingo.rohloff@lauterbach.com>
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
In-Reply-To: <20260901120908.14386-4-ingo.rohloff@lauterbach.com>

On Tue, Sep 01, 2026 at 02:09:08PM +0200, Ingo Rohloff wrote:
> This fixes commit 5eb5c72c72fe ("USB: gadget: ffs: fix mm lifetime
> handling").  The problem is that the previous patch calls mmgrab() for
> reads and writes, but it only calls mmdrop() for reads.  So with each
> completed async IO write (via an USB IN endpoint) the number of mm_count
> increases.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 9dec09d06ca9..0be989c7c23f 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -884,8 +884,8 @@ static void ffs_user_copy_worker(struct work_struct *work)
>  		} else {
>  			ret = -EFAULT;
>  		}
> -		mmdrop(io_data->mm);
>  	}
> +	mmdrop(io_data->mm);
>  
>  	io_data->kiocb->ki_complete(io_data->kiocb, ret);
>  
> -- 
> 2.55.0
>

Hi Ingo,

This looks correct to me, and has been reported to me separately. Can
you resend this change on its own ahead of the rest of the series and
include the Fixes: and Cc: stable tags as Hongyu already pointed out?

With that:

Reviewed-by: Neill Kapron <nkapron@google.com>

Thanks,
Neill
