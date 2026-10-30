Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352441;
	b=oEvoW3rS2hxj0EurmD8BpPA7ZUDNBYQWeK5GqpysG3UT01viubqyVrm/uYNfD58H54mt
	 DH9Ur8vTkTYL0wyDmOwEfxzQDYtiifx8M8teLf+cVP5aw+Wgbe12X8WMr87wm4C1F+xWk
	 78igprIMkbItSFqGJPvYLvMV0NJ2MF3XDpFi/RRFskUbfSZckeOAN/kDcf3muiE0Ilp3e
	 iJhi5Nlrr5n+Vf2/zEJjdvojlVMIEz27o94fBNTj0xthwNVFv17zonWtkbtLCEOn7nTwm
	 XNRzGwpDOi8mocG9p50HIDJjsIupldxhGL+l56FAcy7mXihSclU1V1SrtIKq4oRTfqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352441;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0WZanTPiPRWwfwIzshvdx7GqDGCnpzNJ/34RWFVaInM=;
	b=Jp4vvusCD5ssAwmYysywULp+sG72P+6ayScPs9Thac6ZBKgqmy5XNeAOjx7DCuWNKVrJ
	 9Ko9KCiQcXrCvbDzHJl4Qt/3T4XjrVReQZg9r83IJHxInIZM2EH0uyhOac2Nn3j6ZBq3p
	 ifN70L3XtllFqN3xjSlKjmBhXUk9BoywoT08Pxf6O0Oi7urA0+kD4oA+vDO+8GMR0rcTK
	 TZHR4dJDgzGJWjLYtjQ2kmC3aacmvWBVPB9WHPdVf5SL78PXyIiVJpCt29ckLYk7gOM64
	 rUux7z4Rf/v5ZyUmYmFX2OVuANdHpTD4pAg4lYERgHKD5ZFTselFI04Fq+lXcuWnglg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAnuP54k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0252C606A31C
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FAnuP54k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E4C1F000C1;
	Fri, 30 Oct 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793352440;
	bh=0WZanTPiPRWwfwIzshvdx7GqDGCnpzNJ/34RWFVaInM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FAnuP54kL3cdmtgzcxmjRSqblQI3zBkg421i0HUmK6oBGGpJ+Q1d4/8kLbZgdlKAB
	 Pdh/2PvPpODpT3nAGwrOQDrsuPkYNvYjaRN8ixUX5AcxO/XrgGx1dfPsxLM5avTnO2
	 IPCqoGMQGzcoQ75u9oV5W9t2DreZYfy5fudehyhp2NJF8wv20ysAfY8rDoAkN63Tyb
	 TbAUG613o6OGH7mDvDn7SrnnIGGZ+EKCGbXQ0rCdOgfwgrt8TTtqdeTKa67b3IHIB7
	 tGM1tseY6l/aCf2ixK7eMeyXzNFMTXT8FSChQa+89F3U0dOrNdDiC+g8EJMYuaVxFi
	 8sm35uP69xv3A==
Message-ID: <sashiko-outbox-190758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: legacy: ether: fix RNDIS for Windows hosts
Reply-To: sashiko-reviews@lists.linux.dev
To: amine-ayaou@hotmail.com
Cc: linux-usb@vger.kernel.org
In-Reply-To: <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
References: <MRVP191MB2786AD66C3EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 09:27:20 +0000
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
- [Medium] usb: gadget: resource leak in composite_bind() when OS desc prep=
 fails
--

commit 9ae1a82cebd8ee193e2a0cd2544effdf04549a00
Author: Amine Ayaou <amine-ayaou@hotmail.com>

usb: gadget: legacy: ether: fix RNDIS for Windows hosts

This commit configures Microsoft OS 1.0 descriptors in g_ether when the RND=
IS
function is enabled so modern Windows hosts can bind the RNDIS driver to the
legacy gadget.

> diff --git a/drivers/usb/gadget/legacy/ether.c b/drivers/usb/gadget/legac=
y/ether.c
> index 99c7fc0d1d597..70de686fa56b7 100644
> --- a/drivers/usb/gadget/legacy/ether.c
> +++ b/drivers/usb/gadget/legacy/ether.c
[ ... ]
> @@ -387,6 +390,18 @@ static int eth_bind(struct usb_composite_dev *cdev)
>  		device_desc.idVendor =3D cpu_to_le16(RNDIS_VENDOR_NUM);
>  		device_desc.idProduct =3D cpu_to_le16(RNDIS_PRODUCT_NUM);
>  		device_desc.bNumConfigurations =3D 2;
> +
> +		/* Configure Microsoft OS 1.0 descriptors for RNDIS. */
> +		cdev->os_desc_config =3D &rndis_config_driver;
> +		cdev->use_os_string =3D true;

[Severity: Medium]
Can setting cdev->use_os_string in eth_bind() leave eth_unbind() skipped if
composite_os_desc_req_prepare() fails in composite_bind()?

In drivers/usb/gadget/composite.c:composite_bind(), composite->bind(cdev)
runs before the cdev->use_os_string check:

	status =3D composite->bind(cdev);
	if (status < 0)
		goto fail;

	if (cdev->use_os_string) {
		status =3D composite_os_desc_req_prepare(cdev, gadget->ep0);
		if (status)
			goto fail;
	}
	...
fail:
	__composite_unbind(gadget, false);
	return status;

When eth_bind() returns 0, it has already registered net via
gether_register_netdev(net) with bound set to true, allocated fi_rndis and
fi_eem/fi_ecm/fi_geth, allocated f_rndis and f_eem/f_ecm/f_geth via
usb_add_config(), and optionally allocated otg_desc[0].

If composite_os_desc_req_prepare() then fails with -ENOMEM, composite_bind()
calls __composite_unbind(gadget, false). In __composite_unbind():

	while (!list_empty(&cdev->configs)) {
		struct usb_configuration	*c;
		c =3D list_first_entry(&cdev->configs,
				struct usb_configuration, list);
		remove_config(cdev, c);
	}
	if (cdev->driver->unbind && unbind_driver)
		cdev->driver->unbind(cdev);

Because unbind_driver is false, eth_unbind() is not called. While
remove_config() unbinds the functions from each configuration, the function
unbind callbacks do not unregister or free net when bound and borrowed_net
are true. Without eth_unbind() running:

static int eth_unbind(struct usb_composite_dev *cdev)
{
	if (has_rndis()) {
		usb_put_function(f_rndis);
		usb_put_function_instance(fi_rndis);
	}
	if (use_eem) {
		usb_put_function(f_eem);
		usb_put_function_instance(fi_eem);
	} else if (can_support_ecm(cdev->gadget)) {
		usb_put_function(f_ecm);
		usb_put_function_instance(fi_ecm);
	} else {
		usb_put_function(f_geth);
		usb_put_function_instance(fi_geth);
	}
	kfree(otg_desc[0]);
	otg_desc[0] =3D NULL;

	return 0;
}

wouldn't this leak f_rndis, fi_rndis, f_eem/f_ecm/f_geth,
fi_eem/fi_ecm/fi_geth, and otg_desc[0], as well as leave net registered
after cdev is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MRVP191MB2786AD66C3=
EAB9F32E5B84F9EF6D2@MRVP191MB2786.EURP191.PROD.OUTLOOK.COM?part=3D1
