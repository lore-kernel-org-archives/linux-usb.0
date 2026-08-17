Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E83B443F;
	Mon, 17 Aug 2026 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786950787; cv=none; b=YLicP5JXHqyQqmt5cPHvvINc8TfKxEMRVTbmZzrhg8guW/emCqmPhHgLRsQ/EpOCWBq6NoBGLZPHqzj0lk+cokfRqIcbvXRYNu+7dZM8Dk7eVCsKdio6uGrMOPE7TKQzazPXJd9dC57dT/7XwB3r9OTLRI9OlVTNYUwizjKdk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786950787; c=relaxed/simple;
	bh=xqQD3IqTPg2YBtv6PzUg+Cq8vxmRbU5bMXz86kB0P64=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZkTSrqqsQkviYkdQbhwqaguOAEvpEyr5edIb0IuoSK6xZOHm0i+n02ISIvUox8hzeK8DHTjrdXLtx2h2yCIruvm6sAX0wEOXdZSWDkWVOWoBlpQHN04eiJ3ibR5yKlAiS6oL1BeaFc6AAfYY25yvYChoaT8gf4EmxW8vNfRZsU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Hjdw877S; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Hjdw877S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1786950771;
	bh=eaPbZFaxUtDlYx7QkxWOPc2jYrMbFWf4qznKy07Gp2M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Hjdw877S+AId+PilffKrWdhB45QysK684rGa867zewB9V+FmRDjk6JzNafbrnJd6v
	 kTMVuhqu7ItWvFU3dj/EZdXQAXJf5EDY4A+8fyGXEdliLiRuPTaAcKuXEcHvf9Nn8f
	 w4WcKZOYzBQStlsGOfroqnPnqnGm/GKZJEFPRnK0=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 3319BACA; Mon, 17 Aug 2026 15:12:49 +0800
X-QQ-mid: xmsmtpt1786950769t6983zhog
Message-ID: <tencent_13F0CDB628837B4BC680CB7CFBDE1D5A7106@qq.com>
X-QQ-XMAILINFO: NYJ8poRRqcAYx7OGbbQnG0EuvrI+gYpyA1wIUppinS8+sii4bPtmYVZsEsgCkQ
	 3xs9Mz7h/vGTaDXPwiRcQAABn7ZUenY/oaJECIAZvU3bPxKUJsOBlgl2Bp39F1t/2j+t3djrHPYU
	 1yMa38t3L694q2LKW7HYVot278iO0up2NHO/WI1feUN1RYoQAX1Mjcdic5b1wEjIK6DSDGAigHvs
	 E0bDK+d40m/zPigBwyrIZp7DPR2tOgosjK7r0w8/4PvQBkxDJZgkeqqJF9jDE9jzssKFXoyyktbA
	 3CxdcWCJWqDvdgsYCADBnSyYiffsTSGH6FUoxgtK2gTYs5xRBsF6PLgfXhe1BihM1M1GAYmUMn2V
	 NHPxnhIsB/uvQGt4lS2JtRL5Y9zeZwNFcPXxeFCmmvMm7HrPhe1Ofsj7ighRQtEE+EdFEEAlYK/m
	 WZlgxEszvZEJd4QI1GzVfluUaJ+ZrswPq78pnB9MAik0vmxAUYV7ALGkB23oUDjzmb9n4TelvwPy
	 bGuTKkFggzqei2B1Cj/kcQfpFd6XR2ACD07Tc4QhTShDUgORQGi9dg38bLhOpHTVDbzbShD4oYed
	 HY0pOETQp8o5y/CvOuXva+x/Jp3suOXWA8FqhQrQX8Q3v6s9MoDo2N2rB4HAWs1nksdR9e0NiAmT
	 jH813HDwPloMm96vHSdlWnH3uQ+ndHgJG/7MCbjblZWaHr8gqN7zriQHD5DrqPgsJCO455PBQnoV
	 gE/aWLWUtw5YIHA7X1sNpAOcPE04rVWOL3Sbgh/b7eh7q/sxeed11qNv5JAWbwOl79EfhEqE94MF
	 obol5y8ozBDwoA8Ik4AZIwUN5ayUn8hUjjrUqVLjg/OPBt1qqruz7kfI5zpNuH87bhkMdhFKroqu
	 Za0vSVi0KpJ5u9ul59fRK7tEXomViG3k+b5pleC7tuVYFG4R4h4VeWISKh0ftCUPenAp1h7kWoES
	 FBuoGkmxL+Ga0YtmIaKz6NSvgjkGCOLjtIRIkgDCyz/syK9oKn1nIlEyQ68TZPD0brBSeiUb23wA
	 oNWW8Kfrr2S/pni2yCNyTuYceUSITiGozgH18OTFwRJPSSAM6KuaD6ww9G+rfBcVsdmfVYr/dawC
	 HrSMqaVfuxJStEoXq1NZt/ekkCB0tkZceMyluWRze+54dswAPbMzd8Vvfl5I2tI6FJTqE6xB7G/z
	 klEc5cbybljOqiBW2HsHBD659ZA0o4+viTiXA=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Zhao Dongdong <winter91@foxmail.com>
To: johan@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	winter91@foxmail.com,
	zhaodongdong@kylinos.cn
Subject: Re: [PATCH v2] USB: serial: option: add support for SIMCom SIM8260C
Date: Mon, 17 Aug 2026 15:12:49 +0800
X-OQ-MSGID: <20260817071249.301106-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aoKs8BwgS-rTZPpD@hovoldconsulting.com>
References: <aoKs8BwgS-rTZPpD@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 17 Aug 2026 08:40:48 +0200, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Aug 17, 2026 at 09:40:05AM +0800, Zhao Dongdong wrote:
> > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > 
> > Add support for SIMCom SIM8260C (1e0e:902b).
> > 
> > T:  Bus=08 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=5000 MxCh= 0
> > D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> > P:  Vendor=1e0e ProdID=902b Rev= 5.04
> > S:  Manufacturer=SIMCOM
> > S:  Product=SDXLEMUR-LITE-MTP _SN:120696AB
> > S:  SerialNumber=0123456789ABCDEF
> > C:* #Ifs= 8 Cfg#= 1 Atr=a0 MxPwr=896mA
> > A:  FirstIf#= 5 IfCount= 3 Cls=01(audio) Sub=00 Prot=20
> > I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> > E:  Ad=01(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=81(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> > E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=82(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=02(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> > E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=84(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=03(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> > E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> > E:  Ad=86(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=04(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=50 Driver=qmi_wwan_simcom
> > E:  Ad=88(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> > E:  Ad=8e(I) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > E:  Ad=0f(O) Atr=02(Bulk) MxPS=1024 Ivl=0ms
> > I:* If#= 5 Alt= 0 #EPs= 0 Cls=01(audio) Sub=01 Prot=20 Driver=snd-usb-audio
> > I:* If#= 6 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > I:  If#= 6 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=snd-usb-audio
> > E:  Ad=05(O) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> > I:* If#= 7 Alt= 0 #EPs= 0 Cls=01(audio) Sub=02 Prot=20 Driver=option
> > I:  If#= 7 Alt= 1 #EPs= 1 Cls=01(audio) Sub=02 Prot=20 Driver=option
>
> As you can see here, you should only match on vendor class interfaces to
> avoid probing the audio interfaces.
>
> > E:  Ad=89(I) Atr=0d(Isoc) MxPS=  34 Ivl=1ms
> > 
> > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > ---
> > v2: Modify the order.
> > v1: https://lore.kernel.org/all/tencent_CDB9F0B44FDD051447DCF48862B8E764E80A@qq.com/
> > ---
> > ---
> >  drivers/usb/serial/option.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> > index 580f06f5ce5e..e52f3fe6ccd9 100644
> > --- a/drivers/usb/serial/option.c
> > +++ b/drivers/usb/serial/option.c
> > @@ -2168,6 +2168,8 @@ static const struct usb_device_id option_ids[] = {
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9003, 0xff) },	/* Simcom SIM7500/SIM7600 MBIM mode */
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9011, 0xff),	/* Simcom SIM7500/SIM7600 RNDIS mode */
> >  	  .driver_info = RSVD(7) },
> > +	{ USB_DEVICE(0x1e0e, 0x902b),
> > +	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
>
> That is, use USB_DEVICE_INTERFACE_CLASS() here and only reserve
> interface 4.
>
> >  	{ USB_DEVICE(0x1e0e, 0x9071),				/* Simcom SIM8230 RMNET mode */
> >  	  .driver_info = RSVD(3) | RSVD(4) },
> >  	{ USB_DEVICE_INTERFACE_CLASS(0x1e0e, 0x9078, 0xff),	/* Simcom SIM8230 ECM mode */
>
> Johan

Thanks. I get it.


-- 
Regards,
    Zhao Dongdong

