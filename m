Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF9377003
	for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2026 16:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783615190; cv=none; b=PiTSGUgVblcx1ykidZn04fLIDgD3p8Ycr19rXBjgaTOZTRKQpI9HlfZfoJ9CE6DD/TlaS1gW/7rOi1l6oJcrSIIZKJVpXxRAGd3WWzYSFlbqeky0mZfS6nM9uQvLc1zWWAA77LJeSxDB8b8qQSSP3YjUUTfohCQSORtWfJu5MHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783615190; c=relaxed/simple;
	bh=vaNwRoIjhye69eveL4rFSb3FVRqGKzDCxkgsIv4QOPU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mQmRwdesx+JUakkMngTa4/kjH68qEP5/AAGSn3gVsWdkfxrWuYda7uT2ztST2dFJGBQ+ZTcjLl9Pl7MbcB0xFXtJysATt+vqlJJ5QTJB1K/OHBVZGH4rpFWC9ZQk7pTOzkoML1W1PRg1C+U+3wpqof1+QSjMggueRUsevqneVRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYRabxUr; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYRabxUr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4629051c9d1so66778f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2026 09:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783615188; x=1784219988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YXX9nNx5eZSBjCWWcOzM36IZ91PUM/Pz7bOwY12g6SQ=;
        b=LYRabxUrBvMrZFo9MkOr6CJs0T7wAHRGT3VEGB15LZPDj/hcbRp+fSz8l3l6NwUI8B
         0n9kamORAVEdHvzwpIJhdtyHoHGtTdCkHG8v2SwiBQ+aY3jFmoJOdc8RcUZXA2PJ1ux3
         LdsHN1O9EPzbG+qd339KYLmb1pPeJH5+frWDuf2e9jAWSj0b+StmUG6UEZVlGTjvAXWI
         wJbQ/67g/lJ1ebSn6Ym18m5aXPfZWoqmKbO8wnqdCLU7UMC/uNPSIoVbOnUi685R8nO6
         IJQfQQeIMPCXYVxoKDPEg64usf2haR67Kgr+4gMDPF9R5tAEI+zvNuf57VwpmVnQwXlL
         te8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783615188; x=1784219988;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXX9nNx5eZSBjCWWcOzM36IZ91PUM/Pz7bOwY12g6SQ=;
        b=Ce5RWNr9e2NseNKoSDX+R6OmFq6Qi7qC7afPAEFsP3jc4kG9sTm4ZN7lDNKUqESjd8
         9sq/1/khVF8LMOJXP+Qy9VU0eJ+L37rmKcupQm3n69J5RuRaBNueg7BvbwRNM3XTtqrn
         yZBN7Qo1mPbD3GncFWPbW4ODjiy4hPuEABemrGuY6ixvHx09KSGyup3L8DBCwYoLYuet
         VAC8RFK3h/+Xk4jA3yiv7sAM9PrhvNKAsMe73DYvuWatuB2X3VgjYlJZFdEpiswq2uhE
         p6SGKCNx5flJTFUahhlMsjjDFPin8B2d+hB/u+/K0t9zHAHU8CbLmRwRVuA+yP5/SNTC
         1FJg==
X-Forwarded-Encrypted: i=1; AHgh+RouZTusRTPMB+tuX3i7KkUHla3pASsNnuyq1OQRCJavUf7H7Rezfl0nT1jCDWMSiaPS4a2Iugob2Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqCaHm8IIuSE0kcY21k+kiXMKCQyJ9BplyIrmO+GyX6+LrM0+w
	64nufDtN0hczz8UIOmJH78Rzdq9YTKoebpd1h64Z7p9FSggJ14opilPv
X-Gm-Gg: AfdE7ckR5WWDKp+js0uAenhaBFz7wHwgMMcVAdA7fVU4vxZVcQfoZxKew3BTyPPsvto
	yW21gdI7P52TpSLLd3oQURuiavuFzXIPf7ZryBKlN7YmcofBC8so06eoAYtPhggcY8JFCKaiLAC
	lxLhlsWv9vrJPz6wdHSjcyH3zXkKCCiwcNscHmfyEp3kIaTIc5VgonpabfRAD/O/P2B97Udfrap
	ZHi7yAoeqOPxZ238CMVfCObfqeez7w9s1DwX+uSmHU3rsSAh2NxLlILsY6H4tk96bfRS5xuvDOE
	8d7f06wib1SF9VLLfobWWxrh5midO45y1Yxp+sY3jSpkzqb3BIZLM/fDHFoLEiZJJ+ykGwPt0If
	l2tic7TgUONCEz4fYDThEsHaE3I3n/ZDGTLpnskEH+XkVIGCKqWF1pC9XMmKcn/N9YBegdui472
	0NDRb922kKeDH7zkSY0jgWrc3Xc7zEo8oz3HaoBV+1Oxq7ag==
X-Received: by 2002:a5d:588a:0:b0:47d:ee7d:c125 with SMTP id ffacd0b85a97d-47df07faccemr8178775f8f.40.1783615187636;
        Thu, 09 Jul 2026 09:39:47 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d83bdsm52545593f8f.13.2026.07.09.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:39:47 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:39:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Xu Yang <xu.yang_2@oss.nxp.com>,
 kees@kernel.org, christophe.jaillet@wanadoo.fr, xu.yang_2@nxp.com,
 hataegu0826@gmail.com, balbi@ti.com, andrzej.p@samsung.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
Subject: Re: [PATCH] usb: gadget: f_uac1_legacy: fix inverted NULL check
 after kstrndup()
Message-ID: <20260709173945.268a9917@pumpkin>
In-Reply-To: <ak64635tgUj3MPEx@SMW015318>
References: <20260625113154.1954813-1-xu.yang_2@oss.nxp.com>
	<2026070831-peso-aluminum-df0c@gregkh>
	<ak64635tgUj3MPEx@SMW015318>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jul 2026 15:54:03 -0500
Frank Li <Frank.li@oss.nxp.com> wrote:

> On Wed, Jul 08, 2026 at 05:05:03PM +0200, Greg KH wrote:
> > On Thu, Jun 25, 2026 at 07:31:54PM +0800, Xu Yang wrote: =20
> > > From: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > kstrndup() returns NULL on allocation failure. The condition was
> > > checking 'if (tmp)' to detect failure, but this is inverted =E2=80=94=
 it
> > > would treat a successful allocation as an error and return -ENOMEM
> > > while leaking the string, and proceed with a NULL pointer on failure.
> > >
> > > Fix by changing the condition to 'if (!tmp)'.
> > >
> > > Fixes: 0854611a19ae ("usb: gadget: f_uac1: add configfs support")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: Claude:claude-sonnet-4-6
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/gadget/function/f_uac1_legacy.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/us=
b/gadget/function/f_uac1_legacy.c
> > > index 5d201a2e30e7..e9f2632ce785 100644
> > > --- a/drivers/usb/gadget/function/f_uac1_legacy.c
> > > +++ b/drivers/usb/gadget/function/f_uac1_legacy.c
> > > @@ -914,7 +914,7 @@ static ssize_t f_uac1_opts_##name##_store(struct =
config_item *item,	\
> > >  		goto end;						\
> > >  									\
> > >  	tmp =3D kstrndup(page, len, GFP_KERNEL);				\
> > > -	if (tmp) {							\
> > > +	if (!tmp) {							\
> > >  		ret =3D -ENOMEM;						\
> > >  		goto end;						\
> > >  	}								\
> > > --
> > > 2.34.1
> > >
> > > =20
> >
> > So this has never worked?  How has no one ever noticed that in the
> > decade this has been in the kernel?  Does that mean that no one uses
> > this file/driver and we can just remove it? =20
>=20
> I think just no one use sys interface to change name.

Or doesn't notice/care that is didn't work and didn't try often
enough to leak enough memory to break things.

	David

>=20
> Frank
>=20
> >
> > thanks,
> >
> > greg k-h
> > =20
>=20

