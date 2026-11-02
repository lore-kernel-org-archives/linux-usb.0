Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630857;
	b=X6J/9jsc7M84hEse4W0oqh5FVFXlVmo7bufnFXCIJrTz59EEyNwWhXVAROwokKuZmKjs
	 f6/XR6cAfBor2FpggxgHly1tlpnaM4gnIJuV6sT8Ck+n3oO3Yk14qvtwiWZu/wpczKAKW
	 Lo3xKOBmoZqY3o7Pl8DE4a1T07e7J3iaPnzaPeO2zD+nLJW1x0lNvcknJH84mOyYjaE95
	 8xs6m3gewL0h7sJTPVMXlGUTlX2wvX6elaJ5A4Mf70spuQ96UnW7Ic/8TIufMn5FHK7LK
	 ahSPhO4s0v0VXYRz9Diz5dQIEPGyAPCCKZuKUTPJMyAWMQECeLodIFUOC5u8K1KJdEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Disposition-Notification-To:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
	b=iDjj8g1AjwZ0mtPFPVlm6WcEHgOTc9hdNsdqvGNBfgDpRDKtnUORSER6wr2iQJ1XASuN
	 8JCh9LaR8h74gy7it+sDfdq1DX6Wc/qxuQOj5sJhG6M1kne7W35gYhIFnVfIC3rrVa37g
	 u2oYGekpVvXMJa+7PveFv7ubmsVDGcOftFGMfThjeJJMuGAj68um8So5ClzEf5uVIurDK
	 jaVWNUC3AGcrKkAktRV7pQXeVQX3wTpXSe4cIFIOl9vEKyZA7Wf2x0UGohdRikh5gZ26Y
	 A9BjJe9YGTFQTuTOYIjTicZ55i46kUB5l1RM1tZ2yeQA9u4wqD6/kE0Tt/1F3K2go8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOOwiHKI;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479F5608361F
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 14:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 479F5608361F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOOwiHKI
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c33700b6435so77775666b.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 06:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630856; x=1794235656; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
        b=vOOwiHKIig3GV4B3RMpyXaNnJvZaW5WHqMXuZALmn7YyIgw0aneM5TYWVq80XIixV8
         u6RJ5fNn41M/8veQNr5jwps5Ukj8gbzp+KDPFKohS+eLwVXBvdV2KgVdB2NE/Xr6mMEv
         IOSwnRj0EH2SiqK6YOcEsUKaKvoP7KgasR2XVmt47RJox7gaPctJublgkpgb5eWGZPFa
         VxRmjb/10Ns7IOqFCEZg4nXBN9kF+/fZ6DDi/FlUD74LsAHY6q4rm+kUcYUeVDdcDGKv
         KALPkMWB5q0tNLogDjZHsJVT4/wzvBadCiJKYDJhkt9pDx/aS29KY4Pwl1MNLVnUh65X
         o0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630856; x=1794235656;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :disposition-notification-to:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gFxWaAr4e8pvWdps+x1ea8YchRLnBYcg9irtyuiJvGM=;
        b=lKmWn57+kw6LKddDLmjoI6Fnh+0shIgUJ56+FAxGxlqaZjWu/jwjZgXyKEcfw7MrA8
         d9fxscoi3ashmp0CoEKc6HCwWNZ+/D2NlCd+RoqrZHPujnMdwuHObqQqdmpbMdaq7+R7
         TeRk2rUtnCMY1B5y89hzqZMdmAVn9qUtwqaESOWGwqBRojT9hCabhhlpoG2I9xvgShHl
         woRPVbmaQYiaeinLnu2fZEL3MM6qXdXAXPcm5L96ulxk7/MXXADUiFjD1+/f29cWsqvT
         KTqerL56TOOMJ9HlMQoG0P6APmCnbJbXNod0VOuKEaWN4HYthRqYuH2vG8LCkT2ZC0mp
         TCUA==
X-Forwarded-Encrypted: i=1; AKwUvByveFfP9WH555iQb/BvUJimIggEEMd5DQhVD14cSSgto69gUrGAJ7jtFVjEpBpGy35qOuIOzL/GSh8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JHHNoYdXTdW1EK3wKOJL/2VBWIrptaDaQigSsC4cE2ZpMy0Fc
	3xSj9+VtwWxgMhSUs6k9OZWtcD/z5xTf1UiZl82wNvyCVIQgN4yDvezI
X-Gm-Gg: AYBFou2M5YIswMJVJ/clbzMTqI9PFq+vwD9TloHG2TfpyrPVSFcx+iEveGgS1loRIhr
	BkJwLZGhe3vB1Xmx+mSeWRID5ms3ZfLsr75mcr6BkdNx4v/kBTBN3MgsPUpNMKp4/3WQDsouryR
	c2wObrWy9PshSAwLTyAxitnCeGWcuuH7iDE28m/IPQZbdPu0dr8LSs9yzWJYShM9NwCTtpMnMZu
	i4Y7/wxuLHEcTSSrp0s6ZbTErpbKlLNLUPOwT6loOm4Kz6Gi0hs8ZmfWp6WN7Kj8+LGdFuE+32o
	09mUVAjPAJx4H5q8ymqehUYG8aerLuXxQbBvau3BB4xmJWNVSBDcu48pdU9KFAPMBijp+o+IAdH
	opvZCCQQkPUFhWBjl9jttD+k8iDf4k/KfOCoVE1IO0TdTqjgTZEETePDtY56THOi7kALYMZqgXA
	eJ27BoaC8FiRR90Ma4lL9kXPPjx3xdluf3wxkwXbMHXTPkw7Bh1JyJT1aQGNYT8ID07tG1+z3nn
	E4ow3Rs1W9RQ5P56ioAPEUbOhWokWaTVrM8W3XeN+mW+imllOP6ir4BStS1q0K2jB8kTOE7wAVY
	GfE2ql9GUB+6Mzw62d2z+P3hf4if54eMUXxn5RSQiqhaWFCIM0uQhAUNNAXA+cX1HFz49iUUEui
	W11T+jspNF5wryQ==
X-Received: by 2002:a17:906:6a88:b0:c2e:3698:dbba with SMTP id a640c23a62f3a-c4ca7a72e75mr879925866b.4.1793630855489;
        Mon, 02 Nov 2026 06:47:35 -0800 (PST)
Received: from [192.168.1.239] (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe4a9a1sm400030766b.58.2026.11.02.06.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:35 -0800 (PST)
Message-ID: <bb43e80f92a82e1a27077a45606a9c7f2678ddcf.camel@gmail.com>
Subject: Re: [PATCH] HID: pidff: bound the unit exponent rescaling loop
From: Tomasz =?UTF-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: Shengzhuo Wei <me@cherr.cc>
Cc: Oleg Makarenko <oleg@makarenk.ooo>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires	 <bentiss@kernel.org>,
 =?UTF-8?Q?Micha=C5=82_Kope=C4=87?= <michal@nozomi.space>,  Paul Dino Jones
 <paul@spacefreak18.xyz>, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Date: Mon, 02 Nov 2026 15:47:31 +0100
In-Reply-To: <auig8ARnvkEoAagA@kernel>
References: <20261029-b4-pidff-rescale-exponent-v1-1-3ba54accf767@cherr.cc>
	 <bbd1ec87a9fff50b189f74cbd21e1d5bddf41136.camel@gmail.com>
	 <auig8ARnvkEoAagA@kernel>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-02 at 22:40 +0800, Shengzhuo Wei wrote:
> Hi Tomasz,
>=20
> Thanks for testing and reviewing the patch.
>=20
> > Should we maybe add a warning to the driver that the time exponent migh=
t
> > be out of a sane range? Sane range being, say, 10 to 0? This of course
> > would have to happen during init stage not to spam dmesg.
>=20
> For the initialization-time warning, would -8 to 0 be a reasonable
> exponent range?

Yes, I meant to say -10 (not positive 10 obviously) but -8 seems like a
better fit here.

> - -8 is the lowest exponent in the commonly used signed 4-bit HID
>   encoding.
> - 0 allows a time unit of one second.
> - Positive exponents 1 through 7 would give time units of ten seconds
>   or more, which seem unusually coarse for force-feedback effects.
>=20
> This would only be a warning threshold: the driver would still accept
> the device and leave the rescaling behavior unchanged.
>=20
> Does that match what you had in mind, or would you prefer a different
> range?

Yup, that range is great.

>=20
> Thanks,
> Shengzhuo
