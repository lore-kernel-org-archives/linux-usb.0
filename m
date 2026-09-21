Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E26518125
	for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 22:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028403; cv=pass; b=Z3wQHt8JyYAIw6lgajl4Oa8v95fyFmyWDhLtUvVz0o3MFWcDWlJ2s6YCZR+YD3cWgdNLq/1h8E6uIdyHkVbIqmjiuuK63gHWwNdyv/+sD83O1qJPZSz5dXgy6/kkQpx+MFiKGfIpTpImfUgliuSIh1u7qQYzlCCfy1iGKrCCyls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028403; c=relaxed/simple;
	bh=1cCHGZg4oO6GfGJZo6/tDu3G/3YgfC3SD/e3SnMkwDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csbMxah4Z50Jmq/n8o8QTyprmpkE++tSYbRWOk/uIwzvUgLHCrHSEioR0Id2mMTb3stuRnSj2vfzZedrkGBAYckE/Yo3Mks3zppWGgtEjGrXYZb6r6hVlkB/he5qnF5uyEmppwlDCbnkXnFBCpWNHovgzz1A6vJitxBkBfDj3IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9GQUvV; arc=pass smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9GQUvV"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so91403166b.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2026 15:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790028400; cv=none;
        d=google.com; s=arc-20260327;
        b=Wr0yHC3L7xekg+1yJkKBLexbG2aKfeLfIHOPZRhKrfIw05M44PuWKOlgWtgT/Hw/Vo
         CN9a0h3QLnbsRLhB6KCqdAmVsJmHaeuLcoxCla49MbogTxZwcOdEIMrLE57gezvmmhbl
         HahKmGHBhibke86aJ1KR6Le0z231BWD0UF5pvQ4xwfi3JzC1kV6FhPIGh+ueabLi07lE
         Vorz/QMH2K9cOZVdQ2DwYTfO04cP5kqCuh+WLweXgVtu25E/NGlZx/syvQHUgtuITGhL
         tFSgHSiIy2rPyEkH0dSP8HVW4fbcdebvyVlfx9FDlPWkMIqG3wcNm277v/QdEinGnTY4
         WHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        fh=jL91Ar2FdXgGcQdV72Z4Oihaafz7j52lELBZamBpkxA=;
        b=CzNjHb4OTPpC+zFTmbhFxeXiV1aywJA2DsFLzOkJ8wcb7hmqJFKT39Dz/NmHXRu+fC
         t6w3/laP0m9tAh3sCZvEQbWtjyvSt6AKnIXbFxqd6Uo3qMN6v9Kbe5FcvY11OMx6tT9C
         7kGoJW39o8rDXFng9dmj6PurP0g6IYBiMhaXi9KM20xLxEY//zrjiWXuqLX8WDrp4G3/
         e8OjhQ3Kg+jJhYiRcTnZdS5pVU2PNOxQwF1VD0xbyEPjWLpGfmlq2R56WporaTjYAzhT
         MJporxPlyuHNqPVkF5dgRi868giZop/WonAm1EvHjHXj0UdDr+0UkUtcliU7qnDCAYmd
         rumQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790028400; x=1790633200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=kJ9GQUvVZYDV0DiCOWUhPfvXSa8tNDCi0V3H0y9QYvJteNNyZr5tfDZjb9CfNZpUVc
         kuKD0WclDHViMj/HpUswF+rjyKAQIkacbXi3VRsloG5WQ4iCr5rQFQjge+R42Ob3cPDF
         SZL5OiupviioBAjfRwr5H8xS+yGsuvSHThXJsn3VGG8rUL5pG+uiBEB02sbPoGUdEK0Z
         EN3VFNz959tUzg91nJbTe7htjy+HMQRGt1+zeb1XEd0UlLLtLzIcbY9M+4rwQGayWS4v
         bdtpVvN8R886eMRJJ7bQzrcWpttXk+EtsVgSVye1j2sTmXXmuWUVbOTpR7dO2vCoj1nh
         o5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790028400; x=1790633200;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ul89LQtzZYQQyjhHOC4Z4WmP7/rkXyEFD2EocIcLves=;
        b=etQND74KyCsV66Tm1F2WN6LDmBd3qedNK3mdXcexq+21BglVNcDb7j4g5nV5sCQij/
         ebrXq9pgjXIIHHu3XR9nEPiyHkkSIHoXaw9GZR1b1hjzTDyIfqlbQzgnhehsOxcnfiEx
         VCC4+95lDKm5NkeMOgMEpw+i/M3AuiTY2n2t2cnPbwV/SdqPAKGhqHl6iVTg8cWcpJ4s
         cJTGf8Py00J+SZiQZuO2SMQMhFb4H6BG2HcZSBhAk4AgbymdZ36p4c7RpAD/W+OEEq6E
         oUY7Ep2dqU8o3OfBGthWJKmwmA/Hpv1KpDJHIH3q/I9uuRU0r2IRmlY6gM/PPdk2RuMs
         28BA==
X-Forwarded-Encrypted: i=1; AKwUvBxKwqiQoUhRV0eUspTPkkicCggWpECOpKwZCWbOXqHvrFl5XQQKKG30aOIPRFGmopRh8DtLt6LNVwc=@vger.kernel.org
X-Gm-Message-State: AFuF++mspdKF61fgYR8yuFpG1ezJPeNa9ig/vEIGiSSILWXr9MXR5o+p
	gzBAzQ9TxrVkNUYWx/1t9RgocQ1NsHFbEOofGFEZoIBI39o/FRBhZs3c602bYlCj/hpygDf5j5n
	1GiUswtBUuGRuF4IUPTlRxcNjTHyZCQc=
X-Gm-Gg: AYBFou1+K+s/t3xltKrtNXDgzijDIb/jfm7Dq2lN1+07dLA8geD/cacmv8J3+/XOB2b
	6QXE4ZnvnM2JGjQkJcL06QvJb8o/qT1A0/51izl3oytJ6p+yeg+osCCM+CrZwohIycegfAui57W
	EK/K9EOrROu5jyiBkmF78893WP0K8y5WI/ql0ISM5fmF+2Boq02ZINkbnSfep9Q4uijBCEmLnb6
	fJcdgtNwnK01xcWjyHKEDJhTeHK8dSVuSvYH1z/YxVOyQWr4POUwwIKxRO26aNZRyIO8LDsgk5p
	aWoNZvRXep05NxepHSYBCkL6+v9npJ22NQsL85X4ut3iUEucebB7gboFg245ZXZOM6tRqKTxRVG
	Y8OdbixIIkZdqbjZPA+KXma4S/8ahIsOspY78yvf4ZbW8N5zeMe7Nq04AkmA4uOy6PHlm8QUd2T
	PSVWuysdIYWtU87AxRleKQJxYBt6KjZzRR8oD7mCimJA+u/NAieD2wmrBoNnTNSMDGDyOqnoEsT
	mIJ
X-Received: by 2002:a17:907:9813:b0:c29:f5d5:5a90 with SMTP id
 a640c23a62f3a-c2a15810476mr995533666b.26.1790028399498; Mon, 21 Sep 2026
 15:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921214133.16519-1-rosenp@gmail.com> <20260921214133.16519-2-rosenp@gmail.com>
 <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
In-Reply-To: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 21 Sep 2026 15:06:28 -0700
X-Gm-Features: AcwNN1V2KB9rme8n-5tyXAxXcXiv23teUPiYe9CAfdPv50-_aVX1j-Zp6NK4YGs
Message-ID: <CAKxU2N-5E=GJF1PkcKzXJaj=kzf7duHnu8j=KZ1akgu+6Qg11A@mail.gmail.com>
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 2:59=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> > @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core=
)
> >               return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_de=
sc),
> >                                    "error obtaining VCC GPIO");
> >
> > +     usb_dev->regulator =3D devm_regulator_get(dev, "vbus");
> > +     if (IS_ERR(usb_dev->regulator))
> > +             return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "e=
rror obtaining VBUS regulator");
>
> Did you test this for DT without VBUS? You seem to *require* regulator. S=
houldn't you make it optional?
Nope. Confusingly, devm_regulator_get_optional returns -ENODEV if a
regulator is missing, which means probe will fail.

I could remove the return but then I would need to guard all
regulator_en/disable calls with IS_ERR. Much cleaner to have a dummy
regulator.
>
>
> > +     err =3D regulator_enable(usb_dev->regulator);
> > +     if (err)
> > +             return dev_err_probe(dev, err, "error enabling VCC regula=
tor");
> > +
>
> Can't you use one of devm helpers that get and enable regulator for you?
nope. devm_regulator_get_enable_optional returns an int, not a
pointer. This driver requires management of the regulator in suspend
and resume paths.
