Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B453AFB01
	for <linux-usb@vger.kernel.org>; Fri,  7 Aug 2026 04:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786078658; cv=pass; b=qadZos5R3vq+1FuzSXfOG4vFFQzHFT/TCyecehZ5vr8UGrKhjiFG4Tp6pXi8RYcfXRgkrZ+kkL9VF3pP8Hj+bZjUHDAFTD7WyHvt/IUg5gxSeaL4SyUyedwJrL5tDCIem7P1iwtu1RSkGt+5yW3Z63QAo0teaAEjYQLqbhdQTWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786078658; c=relaxed/simple;
	bh=fuV2w3QsYdqjcL/mLCP+ZwdqV7DB7Ir3cm7vFKQ0UYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JT5xKxTX3UA1fI0BE3IMwVNQKuYFB3KSrIUKx+p4rpOcvS9DZnDqbahPYirn5XacTF3okpP8BBxmoHABUZ1148Vv4oN2i4REtxuUNR1fl6UFkOKyYgIUF9/Omo5YJjYXOh3XLfWwyCWdyxJZgg+imXHrQqfxXADJTf2r50pMQYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B65+qWwj; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B65+qWwj"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab973140bso41222775ad.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Aug 2026 21:57:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786078648; cv=none;
        d=google.com; s=arc-20260327;
        b=FFfYa9yhyPISLPXFVuJxvYjDLrH/W7FsX6BWYs1sqcxIwFnUpDfyrJH6o49ICwroML
         D9v0xJ0y6SUxwbel5yHx26XQzlaVJnUNP7oGO3cG4XRWLZ30GoyUP6Kv6bDwPv7CwuQE
         ArSZujjYj7oerRvTJ2c/SsRsFgmIX1mhlyJcC/xuk8AUvJ3JxainuBkMoCp45kFbapfH
         HDl9m91EZdL4FOYEj5/y201NiLH4iEfGRUXIB5kDEIuFTrz3MNoqzUynHY1TWLwhgDY+
         OltIPUe9mDDzgoOlvVEekMW6bFL+shxZyKwlJ18x/kxyQi2DDIPtDO/hQTbSzW19HJ1f
         5JAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        fh=jhsNd5Mfeny5JZXBK+atWYQoDNhwUXfM+T5ROYEL4CY=;
        b=Qwt4g5RN2YDW7mHNnf5QD1hrus1zPLIL6DQQalZUOFesIfmsfnZA2aSsFehjqOLW7j
         A9/nScp3QbtZEs/a0UpFJ/P4f2y3S6/K95vEf/0rlBK9EMnwfWYl/6hdH7ua2LrW88Hd
         9wTYRX01Zo0DTxNuthSdFSpxqhFeekdDqb9i66th/VAkvNJFt3CDEly2siOmVVzpq2Ti
         f8yjDBCeNh1pICfD/n1u8RcyCJ9TuOIdMT1ng5rpgvf83lrZSyqSumHsmuWwB3guuTdM
         byFxNm2RvibMfNLpEdZk9psf2xvkMSjLdqZPRwW0+pa0XXYuOd5IH5TwH7vy3HswWZFO
         0FbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786078648; x=1786683448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=B65+qWwjrpVVtD3q6qAiPKX+pP4k9udFL9wrzkqY9usNmxcVIuzzIsnL4V9ny5IqBF
         TwxNqj0wbfVfVGlR9j7VgRpz67bw/t99oPIoPbieyaJOSvMCtq24HZYHUpg4gqKYMBz4
         J5QqCO94iMfE2qCo7loGhk31SGETfztbD/TvzbpVHcvhWBovoMfa7yyQezTSVIiSv9fT
         /EDKx5molh1LDyv0ICFR5qngxMrxOIw0KPTtQFtry5ajwDHXN5gxL2xlzhza/zo+HJFy
         XDmFm4T8ueTMSewJmI37AOR5dLoE5gMJg3XVLcY1bvlXXHu6PKd+7NLjQoDEOCbdCxDK
         wGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786078648; x=1786683448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DL9zt+iaIT8X/6aHcZfiY4XxFYWf6572yFG/+Vl4euI=;
        b=YA7vP/JloB5UpXdhbvYbjeY2lGFoFyG+5sT913AFVOdbJi+VIWBkF/++4BGc7nx1J7
         snS8fGlTIHO3IH9R5Ruo9klPGq6sXoYpujtsezKUo10oLOhbqfajMZ1CcY8uuzd6puzD
         QS5dN/6jO/+S8kgT4BgRkB/MqTclv0mTSkHxSjpZRSbwRJ4gjbGADxp+2RETBVaDioQF
         XBUg0lAfx6PBnGY3TPkHHUCQYZoZq0wAnVVCtxUDonLoylWPCGc40rt9qL16Qn/Jx/6i
         srqPXQFCrgO5udHI9VZDP3naHRSWIjQrXc+tV6nerX8Vku1BySPgsA/6ugMfuLASgCJV
         bTZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqxupR/iV+JbMMOURiM6uIbHYhc4XyhkzxZoZaOpuNFlbXQyYLZ6XWgvX2g/SNpBOSgpXiDLeLVoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRHGy7IsLh4QocquX0zZirpPQuAxokpdJBr3nnfKFOUX9Zjr/
	XPPRZjBUQpMkQ3aT8Kyrc2ghFdM3naPjT71GBioHtpdmR7H5clU+ZHMsb+iQFz+SuzRtoPP+Esu
	QRPXpzV26/5KjzL5theNN8KRj20E+ISw=
X-Gm-Gg: AR+sD12bUYk3ST2vUbY2sfM6ASssgCkOgYNJyTKYvnYY7PaLkmTM9cTjSR12RhuK4Mw
	vgz6iU1ttXoqFlS3uT1gwd2Gqk1B4mjje2TNkeCwRZZph2d4C5fnHkt3+Vptzwlb40HfDroC5QU
	lffg2eUZovpWNgeMWTsMq+r9BueY8Wq14hZHBK2/HWmmTeCzFmAKHgh9rQ6ByRE9ph1jKOkCNTB
	VuXOryeH3IBg9a5qvrNWM8KyyUbOldl+DLSKtzYh156CYTbdi2lHto0/nOuOUOe7oPLyJF8fDw7
	wlUpgMEsXAks9A8POn1//aSdlTpKoINcct0Gzkm0yM1PRCvDz4EdrOYBRBX4peYs75nfP3TL4ja
	JmtQb1hgW8heSay3T6mhJwKxDAEAbvXDELiWarl9admgBSiKCJtbKE6OP
X-Received: by 2002:a17:903:1b70:b0:2d0:cc92:f7c2 with SMTP id
 d9443c01a7336-2d0cc930325mr247857335ad.1.1786078648456; Thu, 06 Aug 2026
 21:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806065254.28204-1-phucduc.bui@gmail.com> <2026080623-repressed-griminess-e3fe@gregkh>
In-Reply-To: <2026080623-repressed-griminess-e3fe@gregkh>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 11:57:17 +0700
X-Gm-Features: AUfX_mwRnOY7VUq-ck_xwOmg8y-ARldqTcX5XmuIOCDKQs-VxTrkOjINteaUTxY
Message-ID: <CAABR9nEfPqXAt8wDo597qDS3b3KMaHeF6-swAFg9RLanapDnBQ@mail.gmail.com>
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from
 IRQ lookup
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Chen <peter.chen@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-usb@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thank you for your feedback.

> > From: bui duc phuc <phucduc.bui@gmail.com>
>
> All lower case?
>

Yes, I=E2=80=99ll keep it lowercase.

> > Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> > re-probed when the interrupt resource becomes available instead of
> > continuing probe without an IRQ.
>
> How was this found and tested?
>

I found this during code inspection while cleaning up probe functions in
the Rockchip ASoC drivers.

https://lore.kernel.org/all/20260806052136.21034-1-phucduc.bui@gmail.com/

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure, including -EPROBE_DEFER. The driver
handled positive IRQ numbers but ignored -EPROBE_DEFER, continuing
probe without an IRQ instead of deferring.

I only compile-tested the change. I don't have the hardware to test this
path at runtime.

While reviewing this,I noticed that -EINVAL also deserves to be returned,
not just -EPROBE_DEFER only -ENXIO really means "no IRQ".
I=E2=80=99ll update this to:

if (data->wakeup_irq < 0 && data->wakeup_irq !=3D -ENXIO) {
        ret =3D data->wakeup_irq;
        goto err_clk;
}

I also found another issue in the same area:

        if (data->wakeup_irq > 0) {
                irq_name =3D devm_kasprintf(dev, GFP_KERNEL,
"%s:wakeup", pdata.name);
                if (!irq_name) {
-                       dev_err_probe(dev, -ENOMEM, "failed to create
irq_name\n");
+                       ret =3D dev_err_probe(dev, -ENOMEM, "failed to
create irq_name\n");
                        goto err_clk;
                }


the error return from dev_err_probe() was not assigned to ret,  so the
error path could still return 0.
I=E2=80=99ll send v2 soon.

Best regards,
Phuc
