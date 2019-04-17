Return-Path: <SRS0=xlna=ST=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CBDC10F12
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 07:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 522EC20821
	for <linux-usb@archiver.kernel.org>; Wed, 17 Apr 2019 07:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731184AbfDQH6d (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 17 Apr 2019 03:58:33 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:50141 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbfDQH6c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Apr 2019 03:58:32 -0400
X-Originating-IP: 90.88.160.238
Received: from localhost (aaubervilliers-681-1-42-238.w90-88.abo.wanadoo.fr [90.88.160.238])
        (Authenticated sender: maxime.ripard@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 3623560018;
        Wed, 17 Apr 2019 07:58:29 +0000 (UTC)
Date:   Wed, 17 Apr 2019 09:58:29 +0200
From:   Maxime Ripard <maxime.ripard@bootlin.com>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: Remove useless phy-names from
 EHCI and OHCI
Message-ID: <20190417075829.u3oww5jtuhy3lxll@flea>
References: <d930537cfe3124de37b8ecf4eaa02b68ec94cb40.1555403233.git-series.maxime.ripard@bootlin.com>
 <587c094b69f88c2b534e1de5b441cf823ecf4d8e.1555403233.git-series.maxime.ripard@bootlin.com>
 <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eba47hpznmvzb4f6"
Content-Disposition: inline
In-Reply-To: <CAGb2v64AP6MurTo7c0y+MvjMKm-TT6Jxxgiz=UMLCk26mr7VFg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190417075829.x5GOEn7paRcFUz0yVI9XNWuJ8MpZ4eSpmeoxzXoyheU@z>


--eba47hpznmvzb4f6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 16, 2019 at 04:43:48PM +0800, Chen-Yu Tsai wrote:
> On Tue, Apr 16, 2019 at 4:28 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Neither the OHCI or EHCI bindings are using the phy-names property, so we
> > can just drop it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>
>
> for all the DT patches in this series.

Applied 4, 5 and 6, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--eba47hpznmvzb4f6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXLbcpQAKCRDj7w1vZxhR
xSknAP46wW+xjJk4ujXBKrw2YeCaBRQPeNeoGmTT313kvTnjJQD+N+HQ+4lZ+rML
KHcEOLC/HfFn1kq0OwG8WtmELDlmzQI=
=E/As
-----END PGP SIGNATURE-----

--eba47hpznmvzb4f6--
