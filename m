Return-Path: <SRS0=/5h6=D5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1168BC4363A
	for <linux-usb@archiver.kernel.org>; Thu, 22 Oct 2020 07:58:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A0FA223C7
	for <linux-usb@archiver.kernel.org>; Thu, 22 Oct 2020 07:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603353515;
	bh=R3GjlbgsAx9M4Z5V/xVVQ17WGhcRX8d0qQvUOfWTD9k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=h6ZvS0J7wkeCMfiWsE9QWi6hyDKv8gN5sX5aIKzwyLYYvqNcbIovIpM7L9ybOV/7D
	 o1gjyAh21c6ivOb3rua1qm2ZiV5k8TgW81JCuJB+9gh5s06eUuv9UCjnrvIIaUFWPh
	 chT6Fgr81agC7OE7gJhCKgsPZ0Ulc8nqV1k1En4o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509090AbgJVH6b (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 22 Oct 2020 03:58:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:41540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2509085AbgJVH6b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 22 Oct 2020 03:58:31 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2FA8222E9;
        Thu, 22 Oct 2020 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603353510;
        bh=R3GjlbgsAx9M4Z5V/xVVQ17WGhcRX8d0qQvUOfWTD9k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=iEi6a+RS0cISCZe+Xnl4ygnW2xdMiVzjk8atFZZKQSVEatUz1QcDdo5ioJPNnClSE
         ZJyjipNN8U/7OFMmjpHhpfjfd/hStq/C25IJ4YajF3dc9mrv882rcrtMJ8OUyqIa+z
         8CKxK3a2P/lW/9HqDD/QF6DtwiISHT4MSx4f2UAo=
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        John Stultz <john.stultz@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
Cc:     Yu Chen <chenyu56@huawei.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Yang Fei <fei.yang@intel.com>,
        YongQin Liu <yongqin.liu@linaro.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: Trigger a GCTL soft reset when switching
 modes in DRD
In-Reply-To: <d9c241a5-f31b-b044-bc15-1c5e4d445a69@synopsys.com>
References: <20201021224619.20796-1-john.stultz@linaro.org>
 <d9c241a5-f31b-b044-bc15-1c5e4d445a69@synopsys.com>
Date:   Thu, 22 Oct 2020 10:58:20 +0300
Message-ID: <87tuumelpf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> John Stultz wrote:
>>  static void __dwc3_set_mode(struct work_struct *work)
>>  {
>>  	struct dwc3 *dwc =3D work_to_dwc(work);
>>  	unsigned long flags;
>> +	int hw_mode;
>>  	int ret;
>>  	u32 reg;
>>=20=20
>> @@ -154,6 +168,11 @@ static void __dwc3_set_mode(struct work_struct *wor=
k)
>>  		break;
>>  	}
>>=20=20
>> +	/* Execute a GCTL Core Soft Reset when switch mode in DRD*/
>> +	hw_mode =3D DWC3_GHWPARAMS0_MODE(dwc->hwparams.hwparams0);
>> +	if (hw_mode =3D=3D DWC3_GHWPARAMS0_MODE_DRD)
>> +		dwc3_gctl_core_soft_reset(dwc);
>> +
>
> I think this should be done inside the spin_lock.
>
>>  	spin_lock_irqsave(&dwc->lock, flags);
>>=20=20
>>  	dwc3_set_prtcap(dwc, dwc->desired_dr_role);
>
> The DRD mode change sequence should be like this if we want to switch
> from host -> device according to the programming guide (for all DRD IPs):
> 1. Reset controller with GCTL.CoreSoftReset
> 2. Set GCTL.PrtCapDir(device)
> 3. Soft reset with DCTL.CSftRst
> 4. Then follow up with the initializing registers sequence
>
> However, from code review, with this patch, it follows this sequence:
> a. Soft reset with DCTL.CSftRst on driver probe
> b. Reset controller with GCTL.CoreSoftReset
> c. Set GCTL.PrtCapDir(device)
> d. < missing DCTL.CSftRst >
> e. Then follow up with initializing registers sequence
>
> It may work, but it doesn't follow the programming guide.
>
> For device -> host, it should be fine because the xHCI driver will do
> USBCMD.HCRST during initialization.

The only reason why this is needed is because SNPS saves some die area
by mapping some host and peripheral register to the same physical area
in the die. I still think a full soft reset is unnecessary as we have
been running this driver without that soft reset for several years now.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+RO50RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQYWERAArJPvRoN0gRVmDv0KjAcTbj3ERGO751DQ
wSCHutD9ZLsxLDywoWOy5dZksoYkGp6rtnvTlO78h2Ve1ks/b3Etwo2QbpuDbgrU
EnuzhecNaGREVdpK5lQ2UBwQAs/l+4jWeNGTs/JWnTstNJJH1r3iRHJCXzGr0o/N
tL+HTBg49qHNdqdmIxpxjDIzIdz7vhQ8GDZTI8rW5xwimdHnIUBWrgLMaouM7M8/
iRIw8f+cC2GmuJ0bpiTTYgAaY+qltzTJms6IJ/f4QQil8WkkSgIHfC2U7zyyYzsp
9KsK2W5yNtii9JVfbZLY0x+Ut/QrjbgPffqR1I0B9PVMm9HO7sKyqhfYSIheAipa
xXifm69+74EEnLdhGQV2LPrjcBe59gLmpGVnsTOH274JzrnLLREeXo87nNfhluio
aWW7BYYenm0xAcU3gSmwdzHEAgFDCYLaHc8yWcsGJKvDt2Y6lO2JB4E7TEgtx6jK
zh8zWU4F9LP7xQJHLKTC3aduwz1k8CVCtca5aLmfczNhNyd7rxFlsqu8bBOdy1ro
5+BSQIu9ok7Etdb/Ynh+eDM+Vqzp46fWSHfI93MeHqo2qFFzQPRsp3uLpyq7Du3T
s1B0egzEdDYUpTsS7iLbGdLNhGLWNSpqnRHUG6Dti+VBWDotUL57KZD4LADkhAax
oU3nbqiLCxA=
=1ekg
-----END PGP SIGNATURE-----
--=-=-=--
