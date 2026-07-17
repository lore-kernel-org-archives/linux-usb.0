Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273A342C98
	for <linux-usb@vger.kernel.org>; Fri, 17 Jul 2026 13:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784293386; cv=none; b=snDG2o/wik/q6k/EYQqRm4lVvzsTMGH1SAIrOylfqcCT0wNBYlcUpm9TzfkFEdFZyjnLCcXYuMUMhr2QuYOD+3caKlefrLVdg4qioYrFwpl1mxmcxICDNEWG6KJ/rBHc8W2Sa6x2qpbQrpAwPkRabrK/qo4MGdrXiNGeZS5lsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784293386; c=relaxed/simple;
	bh=2Pw6RKLYG/3I90oNFpbibc9E3PLUBT3C5An2/nAl1RA=;
	h=Content-Type:Message-Id:From:To:Cc:Subject:Date:In-Reply-To:
	 References:MIME-Version; b=WUk/LTxsIlRWOTStVV4tXy5jF/sY8fbGDmkhkh5V7ht25s9BKsAnh1Udgq8kucGtjyPO2ZH8ELgpt5FrLj+UFNXI/oc8fbJu5alYhWfOeIXVltojkJpW5/BphmeRe6PruOi8vHvDIae0Tfx2OREq355hmKPEbgmk0r5VIvo4rrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=n1GhEedL; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="n1GhEedL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 047E33ECF6;
	Fri, 17 Jul 2026 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1784293376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b6IaCvuohsKEhcKoQMzHe2ABWTYjX++swnbOVVEnDaU=;
	b=n1GhEedLp6zkhhuHq0ol5twetNN/1cbqWXgADVJZHjr9DRvCX3E84CPzNfoBfzt8Pr64AW
	dFLLjI4aPB3cdnAdr4BRaHkHufCUwgsj2BaJX9r5fqnBT04ibli3eU2a0DMNhHxvmSkkMK
	jYDEa3k8rIovejqMdMYdR3UAGX5pXxcbIy95ulNVdmRaalU/I+fovFFuHvH+QxV6JE0zog
	Akja/mnqXYGSRaWwOikwVsT5rLDS2CdzqGg9MRZpywCHVTrSPHymvjuXV6fvEHklBDrJ8e
	N2b5yYqqaI5HU+3ASOBGop1GKvwMgU/e+sBI2nm4tvPF3u7m0HfL8F0F+1QuCw==
Content-Type: text/plain; charset=utf-8
Message-Id: <1784293306169.2105539356.2216350255@marmottus.net>
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: Re: [PATCH] usb: gadget: f_hid: convert polling interval from ms
 to bInterval units
Date: Fri, 17 Jul 2026 13:02:55 +0000
In-Reply-To: <2026071728-riveter-finale-de15@gregkh>
References: <2026071728-riveter-finale-de15@gregkh>
X-Mailer: Vivaldi Mail
User-Agent: Vivaldi Mail/8.1.4087.53
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-GND-Sasl: arthur@marmottus.net
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFA1UCvc1UVIA9jMVP06DS7L4l0l8CiDLD62SkLfPEp8PzgXgpTpoz+/FxePT410xko4xRI523LekJLrHx6s3b8nArRqRU74Jr7JTtAhaG0AixHONWPklr63H7yuDpPxqpI6SBbGcRoN35fPNNxorQ0qA87lz0VXMZ4j665QtCW/z+DFoxXYKMUV8wBw1XJxGxrVx3vKDpymGHihDHugCbF3TpZaNCRx1/ir07zqZDZ5x6q1rZQ0i960t/OnamMUfruP0P/V++OhoAym9CuYGBvJL8kFBZZNwo/TTx6/1Fdu0i4ACCXFuknx/ZSstuVLbkllnELaREGcpIrdGkXi5C+SQ5Vbi47/t3dyDEKRG97UkMXmOW1xP5zAa8hcgI0Rgd1CXwUbcXINKjBRJnMjSa3Hnsqa9w9IeOJUvHJzFhJ9xYT2Zv6wIbmyOYRTi09QVhzaY787dkJJhdv+5l+z86I/0ajEcjyXhRQs4ml7zm6lJkhcQX7tcYU0EeqFtxTHjPdRF4GjYx7QIPCQOdk4+w2s2alGKKNHoy+1FhxKjgq8QSruoutP9fxsNw/ItXG9T1CZ3C0JKIeR26KrnDBWF1vbyDBBVNnjt9xfFfFYO+VrRmmsu+D/Zm88iQ/DFu16rcSQsT14oHRJAM1/dozvMgx2H7t8p+dvQZaoeb+zJut5w

On Friday 17 July 2026 12:26:19 PM (+02:00), Greg Kroah-Hartman wrote:
> On Thu, Jul 16, 2026 at 04:49:21PM +0200, Arthur Cr=C3=A9pin Leblond =
wrote:
> > The HID polling interval is different depending on the USB speed.
> >=20
> > - Full speed: the units are milliseconds (1-255)
> > - High/Super speed: the units are micro-frames of 0.125ms
> >=20
> > Exposing directly the bInterval means that the user needs to know
> > which speed is currently in use and has to convert it accordingly
> > themselves.
> >=20
> > The solution is to expose the interval in units of milliseconds and
> > do the conversion in the driver.
> >=20
> > Cc: Ben Hoff <hoff.benjamin.k@gmail.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Arthur Cr=C3=A9pin Leblond <arthur@marmottus.net>
> > ---
> >  Documentation/ABI/testing/configfs-usb-gadget-hid | 10 ++++++++++
> >  drivers/usb/gadget/function/f_hid.c               |  8 ++++----
> >  2 files changed, 14 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/ABI/testing/configfs-usb-gadget-hid =
b/Documentation/ABI/testing/configfs-usb-gadget-hid
> > index 748705c4cb58..006d479b7428 100644
> > --- a/Documentation/ABI/testing/configfs-usb-gadget-hid
> > +++ b/Documentation/ABI/testing/configfs-usb-gadget-hid
> > @@ -11,3 +11,13 @@ Description:
> >  		report_length	HID report length
> >  		subclass	HID device subclass to use
> >  		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +What:		/config/usb-gadget/gadget/functions/hid.name/interval
> > +Date:		Jul 2026
> > +KernelVersion:	7.2
> > +Description:
> > +		The polling interval for the HID endpoint(s), expressed in
> > +		milliseconds in the range 1-255.
> > +
> > +		The value is speed-independent: the driver converts it to the
> > +		appropriate bInterval.
> > diff --git a/drivers/usb/gadget/function/f_hid.c =
b/drivers/usb/gadget/function/f_hid.c
> > index 3c6b43d06a6d..49548a96c1e8 100644
> > --- a/drivers/usb/gadget/function/f_hid.c
> > +++ b/drivers/usb/gadget/function/f_hid.c
> > @@ -1211,8 +1211,8 @@ static int hidg_bind(struct usb_configuration *c,=
 struct usb_function *f)
> >  		hidg_ss_in_ep_desc.bInterval =3D 4;
> >  	} else {
> >  		hidg_fs_in_ep_desc.bInterval =3D hidg->interval;
> > -		hidg_hs_in_ep_desc.bInterval =3D hidg->interval;
> > -		hidg_ss_in_ep_desc.bInterval =3D hidg->interval;
> > +		hidg_hs_in_ep_desc.bInterval =3D USB_MS_TO_HS_INTERVAL(hidg->interva=
l);
> > +		hidg_ss_in_ep_desc.bInterval =3D USB_MS_TO_HS_INTERVAL(hidg->interva=
l);
> >  	}
> > =20
> >  	hidg_ss_out_comp_desc.wBytesPerInterval =3D
> > @@ -1245,8 +1245,8 @@ static int hidg_bind(struct usb_configuration *c,=
 struct usb_function *f)
> >  			hidg_ss_out_ep_desc.bInterval =3D 4;
> >  		} else {
> >  			hidg_fs_out_ep_desc.bInterval =3D hidg->interval;
> > -			hidg_hs_out_ep_desc.bInterval =3D hidg->interval;
> > -			hidg_ss_out_ep_desc.bInterval =3D hidg->interval;
> > +			hidg_hs_out_ep_desc.bInterval =3D USB_MS_TO_HS_INTERVAL(hidg->inter=
val);
> > +			hidg_ss_out_ep_desc.bInterval =3D USB_MS_TO_HS_INTERVAL(hidg->inter=
val);
>=20
> So this breaks the current usage, as the value previously used now
> operates differently, right?
>=20
> Yes, it was never documented, but by changing this, what are you now
> causing to be changed when kernels are updated and userspace isn't
> modified?
>=20
> thanks,
>=20
> greg k-h
>=20

Hi Greg,                                                                   =
                                                                   =20
                                                                           =
                                                                   =20
Hmmm, agreed, this would break compatibility as the userland expects       =
                                                                   =20
the value to be the *real* bInterval.                                      =
                                                                   =20
                                                                           =
                                                                   =20
But it is also not convenient as we cannot know which speed will be        =
                                                                   =20
negotiated and therefore set the bInterval accordingly.                    =
                                                                   =20
Having the same bInterval for all speeds does not adapt.                   =
                                                                   =20
                                                                           =
                                                                   =20
One solution could be to expose 3 attributes                               =
                                                                   =20
* interval_fs -> bInterval for full-speed                                  =
                                                                   =20
* interval_hs -> bInterval for high-speed                                  =
                                                                   =20
* interval_ss -> bInterval for super-speed                                 =
                                                                   =20
                                                                           =
                                                                   =20
Taking precedence over the regular interval one if set. Too overkill?

--=20
Arthur Cr=C3=A9pin Leblond
