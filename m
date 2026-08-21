Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198C6376A13
	for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 17:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332684; cv=pass; b=NiaW2ZIiOxyuXeelp8tK5HUIn6qIQFqFHdPsCvmZsK7UUI2lxGdZap+qJVRpTGEtu2wWqqW6MWf8ykN5XAXVA8pdL0vHB3tQLRTcMg20Eai5UVc89diUiAdvyIPHOHWg41gUD2+lCXeQ6dLu38X9918MFfCgIwGL9hDyzUQkWw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332684; c=relaxed/simple;
	bh=5BJ6vl3jYvm8+eoq/n1Zi6s8dTJJsKX1H6HW/szWkrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vDQwTo513hTDlqc2SOKOHwQuIzWwt1M+cSWENZzPwjU6HrAAKN3wcNg28saqrxYqGOpreDYyXvo5FOVIR2rDSOR0PcZ93YoQY4iLALxV6uqdTfglvw9W2GbZU9RoMOl3UMJfTQtCN+cm19hxONAwK80YhWQSgXNAeG4vCQV7IfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=maLjoGnX; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="maLjoGnX"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso204020666b.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Aug 2026 10:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787332680; cv=none;
        d=google.com; s=arc-20260327;
        b=YqoSOoPnnjEMSVwANWq2p71WDLx2dAECWY+V8cUPzVsiqCPDZDyo0ZL5RvP1sGWlWS
         mrlf+rc1O6pt/R2pkaC3L9VMQbJkcTHMJ51rfiQfEtaNDHNCnjwoEPO0/Jtdv644gLAE
         jMc78tS1/2LKf9o7BRoS0VzDwEutAch76ko7zyGbIrKiNrVSUoa4JkJgnPehIroHjJdQ
         dLPRwmNKWdUNVCluN9BuhWDeREpsIqlcjotB+5RT2f8iQdu/UTZx7Uspcc9o/E6zqyU2
         D4f2eAAN9CvXuJ70Sf7uQef8bQvutSbxLiFWfLtlYC6xf5jIwxPRZkYhB/tYZrSakiYe
         lV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        fh=etNYzN1bdJKtHezMlmlf1WGloJIA0V5RcvphbrtNE+o=;
        b=NDiYDvNoNsB4dHvLdNX0mAc+WPv2ROjsFpKH3mQF/ryrYdVXMnIBJgnAc73yLoEEak
         c1InlWVesZNJuv45M7/s+80yvwVi5vm62qJAkiHSeJT/WhUtirDI/rJASPHixA5oyyU6
         t283rhlar/cq6sEQeFY+3nvVhvPc6xuDs3Tw9IWFTTWosb28Cd8cD9c9ApBBSjaifwxU
         uFO9eSp4y6VpA9tn3kT3Fn1s4S9WKq5ARMGRBG8wiYw8rPuKXhbFENJJVcrnz4SqZmCI
         hmF5Ri1/ZB1X/xPyqxAzgZhkPJLl5fxOTXvky/x/cWYNOFnkj9oW5gyqX8VU5/SEm/jZ
         XC+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1787332680; x=1787937480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        b=maLjoGnX8NeDXb0U9RStFtcmOVOh+6O+5/nmhqaSGhOeV77KjEmpHapTDiF5ZapirU
         YueSAi2mGWQ/VmBWoriU4JH+k/1t5TB1zeBdsnJgPuHtmfi5r5XJ+y38mmKpVg3abePO
         8bnhalSaBxo34OUpJ+BTS1sPD2ErkTV10vLs8j60nXcIaOooLG+9bMg99As6t9g66AV6
         VySYhWNNMQjysFVenGOPlSXl1sT+mjNl8NAg8JFsS6d4FSQxQ4O34BUHz8m8cyzVSPgm
         qHYSyMp5a5qTXcIE8bLIL52862yI6d0Lm/SeCJJYv1iXRBCPOaYcRbo95fmFnK88bvrF
         oFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787332680; x=1787937480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7EiPLlzbwPc3czPLxdKiQ9NmGH3ckuar+CTSrRgEhc=;
        b=qtQca1Iqr5yE0oKebHvNzc7TfoN3AHIs9EjT8qy5ieZJ+E/hSkPfAYGCHFbEIdgwkS
         FM6kFsgK12vOARYCrSpTYPtipFCpPVxV0zqGMus/hSlBq4zBQr41Ge53Fq8VDiGDiYJk
         v5latqfWuvPaldRQ1XEGWWS+m2OFawCqfpIk2cFEWuxZf8p9bDNCMcuCxs2ufLZTCjQK
         0T46QF3KOnnMXOK51xFYr5VF+gyDKmyuOF4AR4eCR8szl6/apctvdsEL3C0nKqrtcgw6
         j7ja/xyxbv4wxLdv1UxuZrXBPISTdKbTS0RQ5Yl/EtgUmEyHUFDLrYAyzHaeiixSzGyA
         719A==
X-Forwarded-Encrypted: i=1; AHgh+Ro1k1ogqPyaVdDP0L+GXWGytIHZ7CfGZwqPMFMlcdthCufsV/LkH9oukd/EMNSXhanj1yD9yYochy8=@vger.kernel.org
X-Gm-Message-State: AFuF++nxckRIM0yDZIqE6cqPL/E1d3ZPs6zb5pHJkv/1CwVcH0V5Am2H
	1+zZd4xoOR1O8JyfOv/DZOSubRpVESof5WYiqpVL6HD+uNNGmNfNn2OeP6g2BWCzPiAobJ7wLrC
	acXW/jADx96RD1TRTIOUNRyeWaVtToC+sgxTuBd5Oww==
X-Gm-Gg: AR+sD13g8cUrihzSeK45RqfGojlkMCeOE547MY1MH0OFoSrHn6dj9l82NncN86RNC5T
	sq11y0QgMvAghzkwz/1HGDFH6H0mRYe8ld0MUfn6OoJgzaWzDASHAi6SNptKSBsT7IXMp0qXUtB
	sPY32E+Hm3f0NcKMsBUc0laM4AhSnJlVieZ2vKfQAUeO2AnrDYtmEWzk38d5DeBuNrohtgsHr/+
	j2uNwTf7H93MPRdeS1NbdXhhLGQIJR11RlDs87R7AmxyO9AmpLJzrwTskpYb3Dwf+CZmFurjSOV
	U+5rxDcDvOBfdHPoJifDQ9KObh1CN7LUEDlE5ffNHsrLRgZI5xI1cTfqLOEO5ZJn+03+R8QMwjB
	OTQ==
X-Received: by 2002:a17:907:d501:b0:c21:9cf4:e1b0 with SMTP id
 a640c23a62f3a-c246a30a9f5mr868392666b.3.1787332680302; Fri, 21 Aug 2026
 10:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-hd3ss3220-regulators-v1-0-405e5c4fb306@flipper.net>
 <20260821-hd3ss3220-regulators-v1-2-405e5c4fb306@flipper.net> <TY3PR01MB11346E91C25009FE7C45387F986A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E91C25009FE7C45387F986A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 21 Aug 2026 21:17:43 +0400
X-Gm-Features: AcwNN1XgtySPeQ9oX-D97l_niNrZbC8_BAFYmBud5FSa8Z0I7DfTLaVwNVSieB4
Message-ID: <CAKTNdwFnvV_uvz640+Dw+HfJd7LfQ7ym9+JogyASi5t-ch8DOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply regulators
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Fri, Aug 21, 2026 at 9:03=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
>
> Hi Alexey Charkov,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Alexey Charkov <alchark@flipper.net>
> > Sent: 21 August 2026 17:17
> > Subject: [PATCH 2/2] usb: typec: hd3ss3220: Add support for supply regu=
lators
> >
> > HD3SS3220 requires VDD5 input to be present 2ms before VCC33 is applied=
, or else it gets backpowered via
> > the 3.3V rail in a non-functional state and wedges the I2C bus, bringin=
g down all devices on it.
> >
> > Enable both regulators in the datasheet prescribed sequence if provided=
.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/usb/typec/hd3ss3220.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss322=
0.c index
> > d0de5a2488f9..b53455abc048 100644
> > --- a/drivers/usb/typec/hd3ss3220.c
> > +++ b/drivers/usb/typec/hd3ss3220.c
> > @@ -49,6 +49,9 @@
> >  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_UFP               BIT(4)
> >  #define HD3SS3220_REG_GEN_CTRL_MODE_SELECT_DRP               (BIT(5) |=
 BIT(4))
> >
> > +/* Minimum time VDD5 has to be stable before VCC33 starts ramping up *=
/
> > +#define HD3SS3220_TVDD5V_PG_US                               2000
> > +
> >  struct hd3ss3220 {
> >       struct device *dev;
> >       struct regmap *regmap;
> > @@ -358,6 +361,31 @@ static irqreturn_t hd3ss3220_id_isr(int irq, void =
*dev_id)
> >       return IRQ_HANDLED;
> >  }
> >
> > +/*
> > + * Bring both supplies up in the order the datasheet asks for. Powerin=
g
> > +VCC33
> > + * first can back-power the device in a non-functioning state, which
> > +grounds
> > + * the I2C bus and takes both this device and any others on the same
> > +bus down  */ static int hd3ss3220_power_up(struct device *dev) {
> > +     int ret;
> > +
> > +     ret =3D devm_regulator_get_enable(dev, "vdd5");
>
> Maybe use optional API as existing dt users don't have this property defi=
ned in DT.

The optional API is explicitly for devices that can function without
the respective supply entirely, which is not the case here (both lines
have to be wired for the chip to work). If a board doesn't define this
supply in its DT the "normal" API will auto-assign a dummy regulator
and proceed.

I got called out by Mark once [1] trying to shoehorn the _optional
functions where they don't belong :)

[1] https://lore.kernel.org/all/agUoq2N_nE_Sz0Z_@sirena.co.uk/

> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to enable VDD5\n")=
;
> > +
> > +     /* Nothing to stagger against unless the board describes both rai=
ls */
> > +     if (device_property_present(dev, "vdd5-supply") &&
> > +         device_property_present(dev, "vcc33-supply"))
> > +             fsleep(HD3SS3220_TVDD5V_PG_US);
>
> No need for fsleep for the consumers that does not have vdd5 and vcc33.

Correct, hence the conditional.

> > +     ret =3D devm_regulator_get_enable(dev, "vcc33");
>
> Same here.

Best regards,
Alexey
