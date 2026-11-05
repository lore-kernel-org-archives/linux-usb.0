Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857198;
	b=h610pkain2ophsyrEfwjaEChVjJ5aeolcVi/xShVynJWypHjBfubBz+fk/X60F2Oc0v7
	 quDNuHA7ga9BjWDz5870XOoTZB4jEjPki/42crqxQ7qJnC380zSi6DkFOeGp0kQgnM5iC
	 X6KYGo7k9LxHURHgIiLTxzivvTiDp1QIG83Y9AnrnybIJijKtZcybojaJJJuYO7jpnPJh
	 r3ZNfBgHrGa/QJTikbzGz7YeW2AP2TMCEyGTHREmfz69Q4PJVlsq8AzyTueLibYozYP0r
	 +FjyPZ0SFoF6mm/eVZ1kbtMipXbO8ttJRAXt59OmAQJV3ihP4oB1oICbEAatgIfbSPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857198;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9BPQuS7M0cpSuwOj2TJyRADA9pi2KymAJqNkttu6IuU=;
	b=TyCewRWsJqW47LI0/B8S7bKEwbfPXdlsLqbrtbvMpV07vyD75JpaUAOLVv5kCDczlr3V
	 +YYd9okPymofDJyod2Atnahre42LZe/sSfbMSSGtBQFW8+sxkyJxY4i0tbH/IyahZlAP3
	 XGH6V4P9P2h3r4YkCNLZ9FP8+EEbS+VT29niXws0QqEFsRWz3Dq94iiMVJIPsBMNJleIs
	 8ox07P6w/7jPK3tj9XadkzZX0WI1zG2IP/ZYy40YwJXSwNLE80pPbM/iJKiA4AHDpszow
	 0cPMAFo3VI4p+c/DWMWLU4kpxrC8inhTstEESFEo35035zj+0Oi1sUCZxqTDrL6e3jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHiiyo9W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A375F606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 05:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BHiiyo9W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0151F00919;
	Thu,  5 Nov 2026 05:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793857198;
	bh=9BPQuS7M0cpSuwOj2TJyRADA9pi2KymAJqNkttu6IuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BHiiyo9WRIyastzc/GjTIsUhN2a0HsDzm4kBXeVqwo02stydFWbzu84ABf1OVqhUd
	 Wky+hVmbemTWVvhyc63JRE2hhjafHVCDZE/Jfp5RwN26ZXps55yIbjwk6CP+40gLmP
	 IMj1U5ztZTtIL6sbUsrT9qT2guONL8P0z8C3CTmhy3z+VcThI5S3bXw9XVkZmxohjD
	 CrtmUeg6leuNiruHgij+7p05OX4V0xukiSkz8T3y4xsg5SrC4n7CYDoVno8vj7f84z
	 IXTZzzIKKLyQkVlHpQoCC5wT6ZVoa70kNY2H63z1RLoU1fQGclslNlJPVcb6QpI1+i
	 o95gbMQKvmg+Q==
Message-ID: <sashiko-outbox-198602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbfs: Require claiming a hub interface for hub
 class requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105053050.5245-1-25031212351@stu.xidian.edu.cn>
References: <82a746b7-4e87-4d46-88c3-bb881f11b8de@rowland.harvard.edu>
 <20261105053050.5245-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 05:39:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] usb: usbfs: check_ctrlrecip() misses USB_RECIP_OTHER hub port =
requests
--

commit 61392c5f20556392416da3011a10145f341cdb72
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

usb: usbfs: Require claiming a hub interface for hub class requests

This patch updates check_ctrlrecip() in drivers/usb/core/devio.c to require
userspace to claim interface 0 before issuing non-GET device-recipient
control requests to a USB hub. This aims to prevent port state requests such
as SET_FEATURE(PORT_SUSPEND) from racing with USBDEVFS_DISCONNECT_CLAIM.

> diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
> index 101cb94254809..1264afe13f688 100644
> --- a/drivers/usb/core/devio.c
> +++ b/drivers/usb/core/devio.c
> @@ -891,6 +891,18 @@ static int check_ctrlrecip(struct usb_dev_state *ps,=
 unsigned int requesttype,
>  	if (USB_TYPE_VENDOR =3D=3D (USB_TYPE_MASK & requesttype))
>  		return 0;
> =20
> +	/*
> +	 * A hub driver owns the ports and the devices behind them.  Letting
> +	 * userspace change port state behind its back, for example with a
> +	 * SET_FEATURE(PORT_SUSPEND) request while the hub interface is being
> +	 * released, is not safe: the request is passed down to the HCD, which
> +	 * may walk per-device state that is being torn down at the same time.
> +	 */
> +	if (ps->dev->descriptor.bDeviceClass =3D=3D USB_CLASS_HUB &&
> +	    (requesttype & USB_DIR_IN) =3D=3D 0 &&
> +	    (requesttype & USB_RECIP_MASK) =3D=3D USB_RECIP_DEVICE)
> +		return checkintf(ps, 0);

[Severity: Critical]
Does checking only for USB_RECIP_DEVICE in check_ctrlrecip() miss port-targ=
eted
hub class requests such as SetPortFeature(USB_PORT_FEAT_SUSPEND)?

In include/uapi/linux/usb/ch11.h, hub-wide requests use USB_RT_HUB, whereas
port requests use USB_RT_PORT with recipient USB_RECIP_OTHER:

    #define USB_RT_HUB	(USB_TYPE_CLASS | USB_RECIP_DEVICE)
    #define USB_RT_PORT	(USB_TYPE_CLASS | USB_RECIP_OTHER)

And in include/linux/usb/hcd.h, SetPortFeature is defined using USB_RT_PORT:

    #define SetPortFeature	HUB_CLASS_REQ(USB_DIR_OUT, USB_RT_PORT, USB_REQ_=
SET_FEATURE)

When userspace submits a SetPortFeature(USB_PORT_FEAT_SUSPEND) control
request via USBDEVFS_CONTROL or USBDEVFS_SUBMITURB to reach
xhci_hub_control() -> xhci_stop_device() in drivers/usb/host/xhci-hub.c,
(requesttype & USB_RECIP_MASK) is USB_RECIP_OTHER rather than
USB_RECIP_DEVICE. Because the subsequent switch on (requesttype &
USB_RECIP_MASK) in check_ctrlrecip() only handles USB_RECIP_ENDPOINT and
USB_RECIP_INTERFACE, won't USB_RECIP_OTHER requests still bypass checkintf()
and leave the race with USBDEVFS_DISCONNECT_CLAIM open?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105053050.5245=
-1-25031212351@stu.xidian.edu.cn?part=3D1
