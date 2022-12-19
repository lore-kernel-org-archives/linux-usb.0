Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19D8C10F1E
	for <linux-usb@archiver.kernel.org>; Mon, 19 Dec 2022 01:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiLSB7m (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sun, 18 Dec 2022 20:59:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLSB7k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 20:59:40 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCAC2716;
        Sun, 18 Dec 2022 17:59:39 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id k79so5240852pfd.7;
        Sun, 18 Dec 2022 17:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vQoJQ2FIASoR0MgFMAy5mwOZ5++h1F73M4YuhYl4Z4U=;
        b=cxp3c5Yl9fkAfYXfnwmzNCj4hxyXOh8rNoQgceF6R/Q9qLckZI0+SS4JKGc3aSJXhw
         5+RsjaUnOcutaUonh0rw6NxWtfl6nRmQCzbU3Nn1EOpGU8+otAST69UxjwHjAmgz+b/n
         xWLPT73upvuvbvwU1kmZwe1nOYOFJUeOvHMDe8i+URqCv81vvYX/6HAf/q088P8G53RD
         PKgGYqzKKIZ2co+ou0MqofzoqFY19y3+QIEeCqO3mEv08hmge8m/IdFJliCdDbITgMNx
         h0a9NwBRyd3bMHnVf4gQZOwKNS8OkQd7nEUTy45W1+RHoV77lc2UTe6lpElEj3bgxk/V
         c+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQoJQ2FIASoR0MgFMAy5mwOZ5++h1F73M4YuhYl4Z4U=;
        b=aF37AGeP4nIspTaRsa459vRWqEjVb9aAIqyRqfzZDYWC04MuuExg6ZB7zw7Fw7f1qU
         tqy7rs/GqKqDA98XyfHLG9HXGplOe88aZxL3S5apMch2/82tmtL824LYCQvRoS+09cJS
         AS2UGaFNbRXkpQGxk+ezrfizll7TNDCp2lpZuq9jxY2Og5rOua2iQ5IMlQROnnbP8n4G
         DOqHOUEuzCxI6DKYHkXAL4Ap9SxsC9IBPS/945BIksyIMbKOKKSU4NeX5Ca4AttUYvnM
         EgjL53ReEMuD7eakG6tpZaZrDkMdtCh6KwVpcRi7iUYGN6xIM6FAblD3vCi6OZXrEZfb
         b3mA==
X-Gm-Message-State: ANoB5pn1ygcakeim2EvzLxCHH5vZhMMXTYvldK5MjflfT1hXL8nFhHt/
        bCEThMDoDy62NCHKMyCQRLk=
X-Google-Smtp-Source: AA0mqf4cYCeckP55Kyp0+jGKe34mN0cGby2Fs2RAE/SauZIfB5rjbv3Yo0lMkA+bMV0AkVYKGm+hRA==
X-Received: by 2002:aa7:8554:0:b0:578:5b4:49a6 with SMTP id y20-20020aa78554000000b0057805b449a6mr36651888pfn.12.1671415179095;
        Sun, 18 Dec 2022 17:59:39 -0800 (PST)
Received: from debian.me (subs32-116-206-28-23.three.co.id. [116.206.28.23])
        by smtp.gmail.com with ESMTPSA id a24-20020aa79718000000b005745788f44csm5206161pfg.124.2022.12.18.17.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 17:59:38 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
        id 0B1D510164A; Mon, 19 Dec 2022 08:59:34 +0700 (WIB)
Date:   Mon, 19 Dec 2022 08:59:34 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Gongwei Li <lifangpi@hotmail.com>, mathias.nyman@intel.com,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        ligongwei@kylinos.cn
Subject: Re: [PATCH V1] usb: Fix typo in comment
Message-ID: <Y5/FhoqVb7jM/EfO@debian.me>
References: <SI2PR02MB4603295B418781879CE88751DDE59@SI2PR02MB4603.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ELwEMlozGCYoGWPu"
Content-Disposition: inline
In-Reply-To: <SI2PR02MB4603295B418781879CE88751DDE59@SI2PR02MB4603.apcprd02.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--ELwEMlozGCYoGWPu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 19, 2022 at 09:38:37AM +0800, Gongwei Li wrote:
> From: Gongwei Li <ligongwei@kylinos.cn>
>=20
> Spelling mistake in comment.

xHCI typos in usb_enable_intel_xhci_ports()?

>=20
> Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>

Then why did you send this from @hotmail.com (your personal) address? Please
talk to your company to fix email system so that you can send to and receive
=66rom LKML. Why also not passing your personal address as --reply-to to
git-send-email(1)? (Spammers tend to abuse Reply-to: header, though.)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--ELwEMlozGCYoGWPu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY5/FfgAKCRD2uYlJVVFO
o/34AP9wEDMB59EzSHWJZkI8I4nmRFkC23sc6V/OL4p3nZdgbAEA2vPGPCzdc3XB
UcFqZk2/yWtKaYIOVStwXKfNAJuZ+gI=
=RpuV
-----END PGP SIGNATURE-----

--ELwEMlozGCYoGWPu--
