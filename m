Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795756301;
	b=dwHWTNG7JEcSN/Cl5IZjulXnTFRpQhmDHjoq2WLKenZoCR00Ud5hbMAaPRnI5sDikplG
	 H7kAKvrrrwRmxqR6/gIpNu1EieubLLzF/UeU31bS9uJBprByaPT5UkycSQkRCiDAMRa1b
	 zkJ7OFCKOiUvOTcc4eGyREy0nUuZS+VdtoVcyKcWWI6ooFaXRQPiZGFzDue00tuuP8hXC
	 W/7fIoiSjSvmam4fbwEOk1tg+k4/uVcfnMpM5nfN5za2iDi8luDO7PMGIVter3+KiQ13X
	 fTeWgXkaNh+avjieSmc7qKCK+I7iaJIHt+l6g10eLkgQF1Iis7EdqSBvhPn4/Nwm1lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
	b=PHcoLUPOuRuNw4Zv6ampypHjKZFi2UF/3od5/50Niq7BY+7OIg/XWhqpoFmYj4rWtCPL
	 GFztDeajrCnUtzjUaUZazWd3IohzywxrXufSvLKN0hW6pIbIwRU/eNRDrj233LiMlSFxQ
	 7T7YkugYl2elNNYQxo/UilnTc2JBF+vy1IREsYCzymXMp8IZTTRaofxEg6eKdIPfgNMrg
	 cB7GNCg4ij5Jcs7IOHDKedCwuLBA3HFqmZHVNo73E7DtHwkUaSXM/9fVjuB2COI3Wa26A
	 lnGHYXTzceFW3yqewNG6nXPkaxk+jK0RgubwqXF2uV7TaXS8pe1+j+cyme3HR1xdtfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A8606A31E
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 05:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7A8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BOD8TyNc
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b589050416so1700509c88.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 21:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795756300; cv=none;
        d=google.com; s=arc-20260327;
        b=VJtQyD5knrZ+za+bymtEzlF7+5moSXf5ShPyAunMN7Vggw7SsVdubh4fCNGjmk2gsi
         2wyc+daG4XDPmyGta7uH9LsX95mmPynFp7jz/YNOWsYpcKNGEli4J0YP807TPcNiYzhy
         KcuRl8PMYu1HhIwd76X1tA+eK2MvDkPzMbYcJxtib1ekICh2HG9Uj2ewo7moNT8QU5yD
         KhZq1EWydTaawtOLGnpdlnqbhFix5Ys9UE79B/o79RXrNtnPmNAqv0bjeFkmTAxr+3Ug
         RrS5whEpltuCVFiPO6nwwn9pwTq2bFWQwKHkt05hbiZpIUTl/MB2mIR44s+ZS1sc4aen
         1iKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        fh=L/i6epgOh9NYLgFmn96OR3q6wiSmLgYXybk4pNhZEB4=;
        b=qlV+R1RzFx0EbPsIWJ4op6PFLSWIVO/2qL2CfZbBsz8MyBM5jWjP0dV7GXeeTWRti4
         vuGu/02z4MMgkNejewrdGpY2sAk9swvtJ0BBcT4EkEjxC9c3H1djk2NKZ8P6LNc2Qz64
         JsFMtDBcL+MQEgBFXfjnYE/XVvrX/ClJQCtnnG+YQnArJ70LR5mKngVRGpR+xyOvqKMa
         vFjAi51CZoEGT0gpSpNis7w+3LvK8lBKRRusEF6lTJS/EiQ/VqDVgSK3BUGjMxz15D6r
         GJAYrocS7qljVfIFXNGADEyffrn6H5nN/NWE8BRkb2gybz7qXrkoNQhJ/DgxpFMooMw9
         45Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795756300; x=1796361100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=BOD8TyNcZN983BLpvCaoE7KEH9OSMQWvE1uxjOE58sGkTnhvkRSxqNCtzUeb4JCLbD
         DGWln2zxPhYbh9HiZoMmRJPYhBT654feOs5WV5DJa9KMzGQHCJF3AEOkm/ipYrX/p3b0
         iz3UANNhR0Du2gasf2+qwYrLkFCaXMr7QQVE41fGAD3hXVBZhOAsB/CUBT7u7VOD2+Kq
         +76pAtBadMloSJ7GizpXubPlsePq/yh39zP/FnfK/0qIZDXVjLEwTOn0LGynDXEC4G27
         G+RwHnnh5qz9a9Vs/j2HkCMN4PBmqWZx8bJ5Xlg2mGi8XVVz+QAoxC/u6zbebUnXGc2k
         2G6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756300; x=1796361100;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qmFinXlRdGL9t34+mLPwrAd0judk0sTSkDIqNRwhWAw=;
        b=fK38ZK6njIyYjsW04QF0q1+XgXGjUOwduPlcLxwiO+/huonWbmO4foPUAfkMyTKrAE
         XIfdhG8MYwtEOcHBZ/O1DeKuVfJOVxVjqIf/DvkFbgoOcoC8RqwKI3E+FmJQ+p8Lcp2S
         +/qghAQHCXhn1hT6lX+7mS1MaHPp0t6TYbentBSMzpAJgJYZkDfEjg40RM5JoLQMjBDN
         EEzEVfiuBrUtAMHCr/19iVpTw4dSe2QEEapsAEwAyYG5nUT5S10FyFPvYMbg6AiCClDS
         ggjWuso2pj2sfwz7gXiujn+2Cfy8oZ2f5MLxEJ4eaSp6Kq5IslYErPkAheNLk4tfpB+X
         BLEQ==
X-Forwarded-Encrypted: i=1; AL+hErGrD/VIvnoQ5QHx2d3MOgJ5MiJy5F9Jar94/0HO4WqJ2+Eq+hoAqimf/qo30j5nCv//69HP6oehH14=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o98XEPKL6EvHxRPIYVZ/VRJlllO65UGCzxyg5xfmoHVPy4gY8
	hg7g3a0JMzhkQ+PacsGwnZSA3mhhN8EzGfZNZJrSCSSlW063/ND4XMXaJXU2Y7bLxDzRAQ0TIk0
	HXhMCXGoAR26b94Im6lkZdXsSs8EqNLojeiQFoPA06wmK
X-Gm-Gg: AZFdTZcEfATYcswoekKAZHrFg9CH/hyJy3uJ4C0gekihkcEPozMBd2/GbpIGLV4nD1L
	pvCWfm0aC1QjTk4dhmxPUlaxZVyY8utTwT3Q74K4fRdR0IA/igsQsuTYwv7qFIvJnyS/2Lt/ayL
	rnQdFPoN+vNEEdutJVhdxMTBSN2R6QxBumRXxau2pqaoEtL0ZtDeAgKPwuxeHffW9RwnfF4mSHg
	ZBKY1ti4O0YtJtIAnaGaxKZNpG3ujw5cTnvu8ChHmCCdYe7azGIrKtcstObZAOc/HE0kG9Y8Ms9
	l/eX6EER/2Uyf7MNkKfA4G4NxrIVuWNR5ANJgUp13etb3ahQX+qCH/K+qx5jJmL0deDUfeJbAQg
	zfbD7H7VXoFueT4gNv0xIdWwi9tbj/LUl1mzQteEqYrrtRcnk1GPgIwY9zbR5Kxag2GjR
X-Received: by 2002:a05:7022:299:20b0:1b5:7c7b:c1f3 with SMTP id
 a92af1059eb24-1b57c7bc2a9mr11684307c88.15.1795756299924; Thu, 26 Nov 2026
 21:11:39 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
 <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
In-Reply-To: <awjwkhoHNOPcHz0o@hu-petche-lv.qualcomm.com>
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Fri, 27 Nov 2026 00:11:28 -0500
X-Gm-Features: Aa3M54oUYQNaKcIPjhELzJMo12Yt9TjJU4-cZ7AYDd5pB9PvGwmXBVlBMZtq_nQ
Message-ID: <CADy1qsbhYnvSoV_M6o2vWk_0-EjVxtw9oYJTDWazeSS2ZPTabg@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types
 on unbind
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Thanks for the review.

> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type"

Done in v3, for both fields.

> - Add to Cc for stable tree.

Added.

> - It is not needed any more.

I deleted the Assisted-by lines as advised.

> try to send with patch text.

Sorry about the attachment. v3 was just sent inline with git send-email.

Felipe

On Thu, Nov 26, 2026 at 9:53=E2=80=AFPM Peter Chen <peter.chen@oss.qualcomm=
.com> wrote:
>
> On 26-11-26 14:41:24, Felipe Infante de Castro wrote:
>
> Good caught.
>
> > Assisted-by: OpenAI Codex
> > Assisted-by: Claude Fable 5.2
>
> - It is not needed any more.
>
> - Add to Cc for stable tree.
>
>
> >       int                     dm_hs_phy_irq;
> >       int                     ss_phy_irq;
> > +     unsigned int            dp_hs_irq_type;
> > +     unsigned int            dm_hs_irq_type;
>
> - Change the name from "dp_hs_irq_type" to "dp_hs_phy_irq_type" to align =
which
> existed code.
>
> Others are okay for me.
>
> I not sure if Greg could get the patch with attachment, try to send with =
patch
> text.
>
> --
>
> Thanks,
> Peter Chen
