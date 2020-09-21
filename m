Return-Path: <SRS0=kiWP=C6=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50B4C43464
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85392145D
	for <linux-usb@archiver.kernel.org>; Mon, 21 Sep 2020 11:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726460AbgIULrd (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Mon, 21 Sep 2020 07:47:33 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40406 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbgIULrc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 07:47:32 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id CED471C0B7A; Mon, 21 Sep 2020 13:47:29 +0200 (CEST)
Date:   Mon, 21 Sep 2020 13:47:29 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Pavel Machek <pavel@denx.de>, stern@rowland.harvard.edu,
        kai.heng.feng@canonical.com, johan@kernel.org,
        tomasz@meresinski.eu, jonathan@jdcox.net, kerneldev@karsmulder.nl,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: quirks: simplify quirk handling.
Message-ID: <20200921114729.GA21368@duo.ucw.cz>
References: <20200921113039.GA19862@duo.ucw.cz>
 <20200921113800.GA26212@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200921113800.GA26212@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2020-09-21 13:38:00, Greg KH wrote:
> On Mon, Sep 21, 2020 at 01:30:39PM +0200, Pavel Machek wrote:
> > Simplify quirk handling.
>=20
> In what way?
>=20
> Please be more descriptive in your changelog and resend.

Have you looked at the patch below? Please apply the patch. You are
free to edit the changelog if you feel the need.

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2iS0QAKCRAw5/Bqldv6
8ujBAJ9B5HOkcqxDoaHZMtSxoV1LRbLZKQCgwZ0qh0oimerhxavrreqLlAfugvM=
=Hw2D
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
