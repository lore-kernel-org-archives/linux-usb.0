Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777433;
	b=CmXOzx3B8S1FJLl/YbwtG/i1wGA0uUcDUoJAGAMQI1mxi9EDDeoGsCm2YNmzhTBB2Nk6
	 /w6Jj8jXr2IY3jrFco3drV6Q68bIs2ZZfJL/Klf/NB4FxA2gTLU58bO38i7LuMMnY1Py2
	 aielptKpV6dRC6mnmt9nybbFlnH62T5yLThuZOoH4eFkbOdMTtbtW+t2Jrpx2idxisZV2
	 IPOEhudQMqU8K6HmUgkFsa4W5KO4Q5ey6FRL8VTlE6FWOvcW76YvhLIQCmGI8DoxUFhyP
	 Ljpx0mZYnnG9aDQpV7fTEpaHEm2r54lxTmUrkbaV+6ulEaCZ0Iw5JBdIsyNm5LzENIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777433;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Last-TLS-Session-Version;
	bh=GcKjqxPTty7UJBOpaS0p7nMe8iT/y4UnYY+fdrHm9N0=;
	b=IogWYDl0jJLT1t7ac2ELkhXmdnSAbUcFu4lET/BJCg/7MIqYacs+7BDuuYdi4nEwmqOK
	 N9lAMIUCKNDM1WKsVtk4JCGOCvaFtkdx/NMOtctb2xrY3d8/ApS1Ft1jlbc8V5wep5GcC
	 k1OV2JG4YxoldKdZ/gPr1zQl2uldIRgW7YiG46qi2mNoUZD+UdiOh45tGSi213uE9MrGa
	 YyP1UZJqHtr/OuqqImfupvsZsRsEXFRgzlQGGHWYoZL+i0KgGapCEiD6KLPnb5k1dMhyQ
	 29WxpIzx5VxWP43JV4um0n5Js14ZGoLO+szQ2ufhlyW7S1YA/GsmaUF5prAQBcUm1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xmo+Gcp;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E407A606A31C;
	Fri, 27 Nov 2026 11:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E407A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=0xmo+Gcp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8CB041A17AF;
	Fri, 27 Nov 2026 11:03:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 620976049C;
	Fri, 27 Nov 2026 11:03:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91C5111E6823C;
	Fri, 27 Nov 2026 12:03:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795777430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=GcKjqxPTty7UJBOpaS0p7nMe8iT/y4UnYY+fdrHm9N0=;
	b=0xmo+Gcp9L4V5/yIei1Alx0Wrct+LnGna4c5PkZpUj9Mxja9sb7597jQzUthjp1XpKWiuD
	o1aGXJTBNj+m/0JtFgg5YzdaPruJWZkyCEW0l6fxCUVibhstf9HRtr5ZatkJvWjyCHo4y4
	YndD7kHvSNm/RJWEwEr6f28FNLYzAr1yFTKo36aRo5lVaOZD59Y4mWhqGj2WgDTqcyCqpo
	V1RoITdTv76E2d5RvOvjVZ06SPUo9dONSpek4aQhei0ZpHXZye1wKRTjSlLvFzDJkMsZr0
	Kpbr9bygjj4xKaK0VKzgZbXr+nGKzI7ZeKkHY6fCs0J8LvzyFUJhcB9lXYqM/A==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heikki.krogerus@linux.intel.com,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 12:03:49 +0100
Message-ID: <7Btt4YglQaCq982N5FWq3g@bootlin.com>
In-Reply-To: <20261127110213.17642-1-romain.gantois@bootlin.com>
References:
 <20261126093819.76480-1-blfizzyy@gmail.com>
 <20261126093819.76480-2-blfizzyy@gmail.com>
 <20261127110213.17642-1-romain.gantois@bootlin.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParts1f-7MSPR1KoaJNuPl08eQ";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-Last-TLS-Session-Version: TLSv1.3

--nextParts1f-7MSPR1KoaJNuPl08eQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Ajit Singh <blfizzyy@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: ti,tusb1046: Document no-hpd
Date: Fri, 27 Nov 2026 12:03:49 +0100
Message-ID: <7Btt4YglQaCq982N5FWq3g@bootlin.com>
In-Reply-To: <20261127110213.17642-1-romain.gantois@bootlin.com>
MIME-Version: 1.0

On Friday, 27 November 2026 12:02:13 CET Romain Gantois wrote:
...
> > 
> > +	priv->no_hpd = device_property_read_bool(dev, "no-hpd");
> > 
> >  	mutex_init(&priv->general_reg_lock);
> 
> Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

Apologies, that one was meant for patch 2/2, I'll resend it.

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextParts1f-7MSPR1KoaJNuPl08eQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEETFOGm0tqZfYwVxBymGofZEoxB4MFAmsJY5UACgkQmGofZEox
B4PnCxAAoYPzub8H6YOYxPZYXqpuxHQ2f6soeBWPM2n8Dc52QG1RXEqL9kOcFg2v
M0rrXhh1RqwZGzlpqFZpockGmoRM/Az3vMWvvSW8ypQtaOzgTUE0PMIpduwEX6Qz
Tp9WOhEi5zYa/IE/1Sb0d+WImQNq63/59Esn4iiWrqQiX2RLwtJXzomWrxDO6ikh
cxFMB6Xk7QjZYf02vmFJeTkZnImVeksHVv6Vizi2Rq/JgyAiJeUQooBIEgg3YUom
NelGYEaChSH2JwxV24YDrK9MpU/bCrSEtUdZ2OTFLItSgkE1ywtoxpl8HOmbHdCc
VGRUBZwDl9Vp7+9NtmH8aUCZxrgQHnkcpHeXk9l77r81mJN54qVSTT/z3B3EDgU1
G2UpE8DBNFCnmaTT9ZBtC6D1lRq0AK6SVyqHA9VDWm0UZzSTXhHJZAkNPwYniNwO
MBefe+8ZYGt8FZ/bKvXD/yjr8qqYzUmZvJPd09tsW5H611HpR5mQj0muM2YS3TMt
ZIqic2HAiaT3rApqUotURth9DhlzKKMx20mv/rUHUX+mexHjUiXfGhsaZ6kJSWqi
7UeTmY5LmmB1t4sBQQqHc0JxUuS5tsbiYzS2FNCztpflp/EuHS15EThKShRhaESa
MLkAyu3ANQ6hKsp4TIlDpodcDR+L4Khna8d6VI2LxLg1EfpO2Ic=
=RBUs
-----END PGP SIGNATURE-----

--nextParts1f-7MSPR1KoaJNuPl08eQ--



