Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794411616;
	b=06jGv/G9uMzaAT6Xhj1ehp0wjsYnRDcNlMj0hqtz6A8hqZoEyHsBiYD54cP2xpopFtro
	 vpa7PYM6HMS+J9MITtD2j1Tro4rVIFOf4CmwYkz6Ks+vWNpuZ7UrScHo/kz4DRpRCRsDc
	 6APvL5pPrVcyuni/sDpGcUNQ41uuS49kJ5K6osA3fvrErV2ds6pNNloUx8N9AAJwCkHT6
	 s57M6hJEVRiX98FjW5dU5XEVlA9cxz7LYW69pPG8FeKRRzDe3hC/eh1Nh70czM3IThLzX
	 FYR5gxS0U/G1QXwIeNLZrCBiyExvkPh2+I+2MltiB5rcQtT2dAnPS6K5Jwel717eKIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
	b=HTffdvsc/Vo1nuSxXE/hubWbmcs9FNjj3I09bJCQzNct2prtyF+GO4XPihCXgispX916
	 sXO2W2pbKyx92kwBcYCI6UaAjcZ1Cr1HB3NuBGzw4ZiSwvZ01UiQX21zT57AehLtrgtty
	 afG2WtxdMCWS5NjTZlIoFmOAOQjUMgroT/RRZDbBNX+DbAcXnn46clVI2uPLRvIiA3LXl
	 Th6OZ63nxGKJadHb6Nlw6QJiygxtVqZKEObbAR0s9yuggVy2apUaq+mSk/fRHi56jYYX+
	 m3Bu0tdi/DJNo0o6slofF4xOp+Yg6cNsYETPCSWlgE7Eb5T8Vs4RVIyY8JOw+fG4Oug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUVIlqux;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70917606A336
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 15:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70917606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EUVIlqux
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so6762149eec.0
        for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 07:40:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794411616; cv=none;
        d=google.com; s=arc-20260327;
        b=TtfdPepidGiY4OB1QbKHo7bWc/rCUip3tOwIZ3qxwkh8+XkisQZYcnZ62EB+IQl4R9
         MJe+e+G7jPYP5IzdhPTWz1DP2XiKyawnzNELLK51tEkPsS8vUbLo1bVldCOdJXsqurbk
         nAhsZ6q7/sus7zSMAGO9v8TrUm8bXyW7Z+FTE6QquZY6kc++EQdwXd6yrDk2aaBVb20N
         DvvTAms2uXdWg7rVMktXMUskWGtiibaJXeZ8sLADFRTWEYv1wcTURyXSk2ylBcdx3gRx
         FyUJGvhhCf3BF1xAr/axe09s8kDbU4uK0rU1zQD+tNfoiu+P4JJpafR+pCkJSWWurVyl
         +tWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        fh=66z9i6PAtrB/c9/jYNw+4xwru74+HKKxGZOb0g54ndk=;
        b=G9iONoTre4E13XzXg5quUg3vttIZgFb8dnIlpv9jhFZDgloARyZzazopShjnspUVay
         5ssy6VFlWrN32NRAh4qoRsGGaiQce8GDPhDw1lYr1txbS2iv4JK4CZTqsGVVYVmSfvPH
         cT6FCXfMxlWcZdb1miKGr7xKVvi+FgjZp/p0rmz1UhNE8En3jlNfCdXRMh5JTJnxp5uz
         aViPur9SLNO6e/LBGxdlGO/IFlw4BBXB441EBNlrDKZepQn/l+Unu5RJK9W1VfLOj8JN
         fuc0iuoPrKxC2griU/bucwUVF5IJp4k8zHVYbUhibqNbC/+9TPGlLkCz+5upJR2JU+jC
         ywGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794411616; x=1795016416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        b=EUVIlquxammoSTN9iurX3iFNjZ9wQuiOwUEdWPlRwWkDWX7hi/f6JjeG2Y7i9JI1Ew
         EV418Eb2te9j2g9OKOB5NyTsETaciNBq24TUMcA/cSgN4RTLoPnPNmtlfbR6gpXucI0/
         LLIZbo4FCfTIe35Vpi9XX6oawD5fyAeigI1kGO6T+iLKmgRuTSa6VblTz3fIZ6Gv9rHm
         pVJ+il0AA5mMuKec2C2133edzkW4+/j6TP5iWkZQHzi1fUR5QZgSi5VhkPbBJoHi6d5P
         1BlTYBQaI/XMdcItwa3pDxmHNxl7QmHb4EbgZDhmIHV2cjzQnEVG26rTA8jMtNowhJHs
         el6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411616; x=1795016416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxe6EHHyTC6tFnKkI3FHL/YYHiwBPYFWFLZtkSdQDic=;
        b=zCRw1bQKFBe7mUDROfcPNW2GgGsaG8l2DHAUKTZ5dLPRcQ8xykkOoqndANudJMaX/Y
         HjK292YRkXt4xUPGQBaPZF/+ukNhN9l3CZZNRuzFKG3OOQWyymKcGj1Od/oKajdOmhAb
         mo74YcJZsGlPjO/u+/4QmLo9Jv7bfGx5FKwisoGIA8p7ukHhigi9qsSZpe5JklH/PFbf
         oJ2CfzsLiCZAtF9kXiqXBeIRNjIJf3sPQ5FZ1K3H4e1iy9MjFEdv5faaiKRw/OYzSzbv
         CYsm578WrKKbuEZdsbg39/ImBSfqijTrqCGvUZAtRuNXBl9kR7ZqQpEDPE1JIrXg7Nj5
         Ne+g==
X-Forwarded-Encrypted: i=1; AL+hErEm+hE2O6ieMIwmJrT3cS0UaiOPMcqPSGVkNePBkNalWWZmhpSwgSbBryt0Wjl1xAaXXIpnwiHvtrw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mMyRVQgWNJ67UiNiKn2v3+A1fT/uIC6mkDVtXkkSbK+O6Htus
	iTLFHRBFQLPZMTkywyp7BdWzYmcpunT9zrKoebeFenMGA9uUcBLOuPPkRViss9ZOsfTkPD49Ihe
	aYOx86RWe4zG37nTCu+enLPGqFPOnYnMNqqRLlsk=
X-Gm-Gg: AYBFou0Ypkwb+u9h2MuGRTULkUuEXsuLM018RtRLDusfZbmO+9jR9fGcECRlcbDzb9l
	Y3TBfX1qm7zHokmaFBFqNPefRkNSH9m9cuhfOP/ac3HTndGRMvmSLYk0G2ilN0qyJ9AFRtHbXSk
	JQ4UxvnrsYp85oonEjIUbyZjWKfS90PgZSmRfqSIJ1Pg6DAP6w+LCGriZZ1959zozGY7ZRZ42ab
	HPicOW6P7kw6wR/qDTfXr58hPhJU4Nkg4Nuz5KWDf0li8qXw5Ordnxpqp5xBQzSfV4F0TB86Tjf
	tw2eoNml+4LHe83EUUDDe+GkU927IClmRCOIkhsw2ylvcKYwUDXu9bHQ/PZs21ulwuBPExJ+QON
	MA5/ndzbN2KnHyBsOuFryv6rDFNLua2efMi9/Lvd8EM7n87JxrWEEva4R+Ec7TZR/EuPhMUr7yd
	7az53/eyVY800+pdcq
X-Received: by 2002:a05:7300:8a19:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-376854b7fbamr3110380eec.8.1794411615515; Wed, 11 Nov 2026
 07:40:15 -0800 (PST)
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111041446.3072716-1-lcy8047@gmail.com> <avSD8X8aRtT--4iK@black.igk.intel.com>
In-Reply-To: <avSD8X8aRtT--4iK@black.igk.intel.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Wed, 11 Nov 2026 10:40:04 -0500
X-Gm-Features: AclHuK8YYwgVK0aL7BIkYdbexCHW2lBFLFnga8S1u2LfgEZ_-aTqTN5xvJ2oqzM
Message-ID: <CAKefsHtCtM-kUvw++2PN0tOoAuzHPYZ1YwSBX6jJ4KM1g3dHFQ@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From lcy8047@gmail.com Mon Sep 17 00:00:00 2001
From: Changyul Lee <lcy8047@gmail.com>
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation

On Wed, Nov 11, 2026 at 04:04:17PM +0100, Heikki Krogerus wrote:
> On Tue, Nov 10, 2026 at 11:14:46PM -0500, Changyul Lee wrote:
> > Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> CC stable...

I'll add the stable Cc tag and send a v2.

Thank you,
Changyul

2026=EB=85=84 11=EC=9B=94 11=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 10:04,=
 Heikki Krogerus
<heikki.krogerus@linux.intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Tue, Nov 10, 2026 at 11:14:46PM -0500, Changyul Lee wrote:
> > typec_register_altmode() stores the return value of altmode_id_get()
> > in an unsigned int without checking it. When ida_alloc() fails, the
> > error code becomes the ID, and the alternate mode is registered under
> > a name such as "port0-partner.4294967284". A second failure on the same
> > partner then fails with a duplicate name:
> >
> >   [    0.423055] sysfs: cannot create duplicate filename '/devices/plat=
form/altfail/typec/port0/port0-partner/port0-partner.4294967284'
> >
> > Return the error when the ID allocation fails.
> >
> > Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> > Signed-off-by: Changyul Lee <lcy8047@gmail.com>
>
> CC stable...
>
> > ---
> > Found with a static analysis tool we are developing.
> >
> > Reproduced in QEMU (x86_64) with a test module that registers a port,
> > a partner and 63 partner alternate modes, and then two more with
> > failslab (task-filter) making ida_alloc() fail with -ENOMEM. Without
> > this patch, the first of the two is registered as
> > "port0-partner.4294967284" and the second fails with -EEXIST and the
> > error above. With it, both return -ENOMEM. Same result in three runs
> > each.
> >
> >  drivers/usb/typec/class.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 54c7810b563b..29fb13ca9f28 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -641,11 +641,14 @@ typec_register_altmode(struct device *parent,
> >                      const struct typec_altmode_desc *desc,
> >                      const struct device_type *type)
> >  {
> > -     unsigned int id =3D altmode_id_get(parent);
> > +     int id =3D altmode_id_get(parent);
> >       bool is_port =3D is_typec_port(parent);
> >       struct altmode *alt;
> >       int ret;
> >
> > +     if (id < 0)
> > +             return ERR_PTR(id);
> > +
> >       alt =3D kzalloc_obj(*alt);
> >       if (!alt) {
> >               altmode_id_remove(parent, id);
> >
> > base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
> > --
> > 2.43.0
> >
>
> --
> heikki
