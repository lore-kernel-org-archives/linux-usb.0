Return-Path: <SRS0=zRYX=EC=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E912C4363A
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 09:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46B2E2225C
	for <linux-usb@archiver.kernel.org>; Tue, 27 Oct 2020 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603789692;
	bh=g9+Mrr16nseYncNYHO3GxWTdvw7OMBwlKykbZitW48I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=I+/KtMopQwoow/eA6efP6nhx6mONc+xetLr52nGaRr3cnyZYAwIuR/OUizCZ8HmMP
	 gz4GK7I+Hkl/kz1Oo3FETD62SvZYm7WIbBHQY1iaJmGmP9//Z9+o8K11uD423NZuRa
	 vRLB+1JInlw7yCgJJ93+ffggV4jYQDLU2+xVbPBg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895365AbgJ0JIL (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:08:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408763AbgJ0JIL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Oct 2020 05:08:11 -0400
Received: from saruman (88-113-213-94.elisa-laajakaista.fi [88.113.213.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3001E20747;
        Tue, 27 Oct 2020 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603789690;
        bh=g9+Mrr16nseYncNYHO3GxWTdvw7OMBwlKykbZitW48I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LIdAjbf1aaIuMynNH1/XkGlbMSJiBi1r9esIiIUXVZH3YTMCwL/QpZbxBDGNKj3EC
         KGG0Rg90OETY1z5/9Z3pziYtptBWL+k47MdfbeQ+lDCTAtKlc4qnw3optAI1kEYbeW
         +7uCyAUFdIxCm5iFSdqT5Oe8RY86pSHp0d752ops=
From:   Felipe Balbi <balbi@kernel.org>
To:     Peter Chen <peter.chen@nxp.com>, pawell@cadence.com, rogerq@ti.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        gregkh@linuxfoundation.org, jun.li@nxp.com,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 2/3] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
In-Reply-To: <20201016101659.29482-3-peter.chen@nxp.com>
References: <20201016101659.29482-1-peter.chen@nxp.com>
 <20201016101659.29482-3-peter.chen@nxp.com>
Date:   Tue, 27 Oct 2020 11:08:02 +0200
Message-ID: <87wnzcc9zh.fsf@kernel.org>
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

Peter Chen <peter.chen@nxp.com> writes:
> @@ -1783,7 +1780,9 @@ static void cdns3_check_usb_interrupt_proceed(struc=
t cdns3_device *priv_dev,
>=20=20
>  	/* Disconnection detected */
>  	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
> +		spin_unlock(&priv_dev->lock);
>  		cdns3_disconnect_gadget(priv_dev);
> +		spin_lock(&priv_dev->lock);

don't you need to add sparse __releases() an __acquires() markers?

>  		priv_dev->gadget.speed =3D USB_SPEED_UNKNOWN;
>  		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
>  		cdns3_hw_reset_eps_config(priv_dev);
> @@ -3266,7 +3265,9 @@ static int cdns3_gadget_suspend(struct cdns3 *cdns,=
 bool do_wakeup)
>  {
>  	struct cdns3_device *priv_dev =3D cdns->gadget_dev;
>=20=20
> +	spin_unlock(&cdns->lock);
>  	cdns3_disconnect_gadget(priv_dev);
> +	spin_lock(&cdns->lock);

ditto

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl+X43IRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQY+nA/+KoF+/NvK21Typ0RDTs4BFz//fhQuB74K
x/UyZ/i/PBaRHkUCGNtWhQ90/BekHLPVlBTkpVECgMhFiLqG+iZilrAT51LkgVTP
n/2eq9/0uZl+mWUQ6tPURV4ZsJBqSSg480cdiVWKPqg+Ieqjvexm/tZn4HCirjJI
4zq9Cdkp0HhJivNihAt7RrjV3/Yi0GoJe6QqWzVSP4nNEWMzdG7XX52J7ix2791R
jjrBs0FLPZJ6ZGLqAXAsGB790me0coo+KhfFVLpSniRC1/C3IsKpd+Pc9eROLlwo
3GonLX2fPNkiBW2nZre+peJveTGHbLwxAVKD4wCMO39eGp30W5Ggmz50sR37kOK7
lUOx9Z/X9FdFlkqvxTbRjAie/hRHd8EPzeFijCbFMC79QWYuOUpCQ+efpAfEEgEA
Cr1T18qU9qZSoeAR4Ti6hXhHg9LS0V755E2a3N5nEDK0uT4vwDD7UaaF2Ncxgwsn
qVgksRjluqeUtkqoNsTWJcMk1fIoS2rRB5qXBxEz7yYRY0ejxLqqmEa1GlT1PYy/
z7CgXE5jENYqlt3MK1eghP4eoDpM2K3aPG66nbj9iRDKNHGTM2zU7xvwdIMxRSN+
8FAKzoQt86dnqKT/gYyxxOjIBBXuZ3nmlVaiylsjOSPvNB6+pOj725Yuf1IrTPcs
r7gFpDwDECc=
=HmcJ
-----END PGP SIGNATURE-----
--=-=-=--
