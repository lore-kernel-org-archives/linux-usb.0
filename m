Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794550085;
	b=W9+Ky6d0ejMpZX479q8mdXBTH7KZ9lpKB9hQsiwYypqo4M8Q8Ad9nfWETOiIVVPwXKi9
	 ETvamzBjSNjKYInpLpnR5uoyAAyXKXidFNuT8jhaNtWHYrDzaaD4DyLSAVTsa9Ok0OBR8
	 tRGVtMGvvd2JGUgyrqCJ36jq8ER/Rh0LWsbpTJc6wGiO8VokuwqqDCAoGRthptu2Z47ve
	 ehZkli2bB/+/RWE0LTfnBmfXuhhnG3ZvtGsQJmnoh90UBaprEUvS4YzXugjWkzzQ4sFq1
	 8MYvCXfepBsyNFiBkaHhbNJIVSpnnCq054loCf0U5DF7elKA1Vw2Pqgw2QKSLJUrMQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=26A4aPgJxTCdFcMyIZSLE7eGxsYpBIDGl9yj/Yls13k=;
	b=0pHXORgPW2oSSZ5f5oNViergMnJobinSVnsandPexca6p0Bp03HS3SqxKcu1hlb7sVS/
	 F6R3+Jqs1umpeLaFxJYgIdWcPaLmklpVC5rMV8t9qttfngSFIna5KVMI93H29pQwKxOX7
	 hhJSC9r1X6Gu/K+bgBby81HYCrlFw1EfBG9+H9IN8l+aU5mu5kQrbEFPmoJ9fbFPRLTbh
	 OBccsLJ35j4ggnyL+i/3O7Rl5w/86UJd9WiH/meiVBOabeObyYDnbWKe65gOR6kJl1luN
	 lSnfiAGvmVh+/y110jX90Ag2dNHsaVG8xFWuVtRI45Yods0pd6UQNVzlSalKPvEzRWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqQPAg2w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59471606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 06:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59471606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XqQPAg2w
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb1224533so93669a91.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 22:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794550084; cv=none;
        d=google.com; s=arc-20260327;
        b=N5TEWokpfyY+LI8Lhbb5m08kIQn7hn9tokEL3weAIYXp73kfmLDE33dduzx91v8E9o
         Zt4R0E/A/gDnBdF58mXGKD3PUYzJll3ZtR4DY0NMZTmWpXLuiATWeJjcabNIxGAx0rYr
         DzhKYaZn6X7t348f/3HWYBi/I+r93j3wSrbIg0RJzhni9xsbKhOB96bB5crqDT6RAWNL
         0pHjml7brdFVIOpTF8zxgVBtoXmdRlYNvdQoyeDg6s+Aff6aVc4qC0IHVZ5I/g4Z6hS0
         hAbVyWQ0Mcr9s8xm4cwbY/bCVRZIg/3qO7NGAydvbd081nM0OR2qLepRtHD1XQjCAPXv
         XqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26A4aPgJxTCdFcMyIZSLE7eGxsYpBIDGl9yj/Yls13k=;
        fh=+PeS1Nz+SWnaak8dO+FiHpx3TbFCIsF7vmNu1L4eK74=;
        b=X0X/CtjKG+xeNGtiyNzKzP24swOtg/zC7KaKWYtg+Ea7mg4Qm2CWkrVcxfoOZZLgdH
         CgMcn3pQtBMWdhbcBE1TsDrfC+tzyCEAyZmcL0zNeTPENaHMo6L3Fx7lx8tgZ7Rga19N
         tRE8krQ2MftQ1QsfVMooBPrZJSszgyYxiMEdqHpviqChh+g9oTEyEUry0BXYeROiwnrT
         70upHuxNtZ3Y/JRL0Nd7A8VfMWhMU1ogv+GtGkVKfH0mgSvDSPX4XQZvxtIoVhzN9ez/
         mAp+WpXoHmLr5hreDNWhM+PUlA0ZRGQDDbP4wQqh6uvtBM1IIo1QkXzLZ+s0F0sjvaY/
         Vy5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794550084; x=1795154884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=26A4aPgJxTCdFcMyIZSLE7eGxsYpBIDGl9yj/Yls13k=;
        b=XqQPAg2wO5ObYLSJ60tvagDHEEqP3Em0l/W0NQSA6kdagkLZ043Wop/TCnLuUVnf3w
         x/vsvW8PT5r9yyFCZepTCoKzi/Tb7r7QryKwZXTE3f7K7jy5mpMtwrq7am3T+aa5x1dX
         tp3XjPZWx2eJSWtKrNiOct6kcdNbexshA7iv8XLeBp7QNAfUUxzx6/WSThQ7B7YUKSql
         vKZp125E3dV+HnPwa78G6eHA2ASRHQlltoNj+neu7jsZRYqpt2x4bT0uzMSzw3oLkisK
         Uxt3XRqoI4JSO52BlDp0lQ15HLyOkSf7rY6u7Su1VIOu0fp9AsPwoNRSjI2fpbQFNtvr
         G1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550084; x=1795154884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26A4aPgJxTCdFcMyIZSLE7eGxsYpBIDGl9yj/Yls13k=;
        b=KNKMDVf14kazk1DO4mcaSnwaik4TNPNpLsWBL3uVu7xS0/jHI02YNqQbdU0aXzCJom
         AnXxDPnokfKtf0mK/qCpdMAy2MIsPFfxP5WjIbk+/1BVYq2FtDZ4pPdLe/+olCQ+spPZ
         OMBXLYwPc/5uh7dbKB6x0xhYeUPkwuUgseSQJUCLc6PRFoqCDV3TqlGXpk9R5ASPhJAg
         rmgBex/rqjWoRXGmv9aPxEsS3VaJcWxoeeZQb/UDAIBkXJvO7BatOlqEkF9wXza7eG4a
         bfAUZfysFnpk2OrKhSuly+XsWq9EEoVVEB+7l82v0ER76Iy35cCvrDBhUZmScLc9SKW8
         BGcg==
X-Gm-Message-State: APuU4Z82thkGElxHi9YgPdsyLeyZJG74OaiUkqBvEr6NHauOVoXNhBRY
	cYlW5OBdC467AExSupgVifEcM56P6UAWwZtAcf/vnsKgVT3KodLNkR4dxFvTSUKjbWKeGpIGOWt
	T5ikyE3/Fl+FUBAUncAH+E4VWaBy2DnA=
X-Gm-Gg: AYBFou3Jcau9X2cW4xF8u3YoHxQpzZ6OSiD5j/huyAIzQOtQMYjvjbJd8/I8dhFGX4R
	LpxO/Ys28P6RVEmuZFuthp4I7WWNTIia4eblVlm5V+jlfP/F5DRqj4KuRlfsKimjaQc6zN4E8eE
	Dzh3C05sExr1y4SiBkASIE/bG2eCUQ2C71MfZT/FEE8hyg9RRqW0eGJnnfn4AAxpVbIatC7tiG6
	0AWSU5EqLR5HpxFsOxQ8Yp6PIAcNtoIHbxpJ0hati/AxJ7ej9moOVUDOIuFfZUwTR60NHvvDUPu
	/ZSi/4ozFe27emSsr9H6bkA8HusqC/APwHN5pqrJCmfvPhxayYKqJzIbEQE2owWlAGUIPgHKHqT
	LjRkesARyMYEi5yTX3ZoNppQ2qmo8VAPDoMfSrA==
X-Received: by 2002:a17:90a:c88f:b0:3b0:9a3e:bf8b with SMTP id
 98e67ed59e1d1-3b1b0b5d63amr2053645a91.6.1794550084439; Thu, 12 Nov 2026
 22:08:04 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112160448.41566-1-lui2012qwq@gmail.com> <20261112160448.41566-2-lui2012qwq@gmail.com>
 <179451113091.3909038.17914676412025517919.b4-review@b4>
In-Reply-To: <179451113091.3909038.17914676412025517919.b4-review@b4>
From: Chengyu Liu <lui2012qwq@gmail.com>
Date: Fri, 13 Nov 2026 14:07:50 +0800
X-Gm-Features: AclHuK9Lr_yXnIkN3j5RcGH4UR8BkPHdICqoNnYU0U9QDO8Oz1UJmXvDJz9L57U
Message-ID: <CAE=Q7=4=OX36KCU1TNA_aLp4U8b4EpZE=1XkrKj63JATKFhefg@mail.gmail.com>
Subject: Re: [PATCH 1/4] usb: musb: cancel irq_work after masking interrupts
 in musb_remove()
To: Neill Kapron <nkapron@google.com>
Cc: linux-usb@vger.kernel.org, b-liu@ti.com, gregkh@linuxfoundation.org, 
	tony@atomide.com, bigeasy@linutronix.de, balbi@ti.com, 
	shimoda.yoshihiro@renesas.com, robert.jarzmik@free.fr, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 3:18=E2=80=AFAM Neill Kapron <nkapron@google.com> w=
rote:
> Shouldn't all three cancel_delayed_work_sync calls be moved to after
> synchronize_irq? Seems like these other two work queues are subject to
> similar style issues.

Hi Neill,

Good catch. The static analyzer I wrote only reported irq_work, and I
missed checking the other two work items in the same function.

I checked their scheduling paths:
finish_resume_work can also be queued from the IRQ handler and
musb_port_suspend().
deassert_reset_work can be queued from musb_hub_control() before
musb_host_cleanup() removes the HCD.

I'll move all three cancellations after host/gadget cleanup, interrupt
masking, and synchronize_irq() in v2.

Thanks,
Chengyu
