Return-Path: <SRS0=QzF2=3V=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21DE0C33C9E
	for <linux-usb@archiver.kernel.org>; Sat,  1 Feb 2020 10:36:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E33BA2067C
	for <linux-usb@archiver.kernel.org>; Sat,  1 Feb 2020 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1580553381;
	bh=qaP1Hv45YWUmmbRN6rGXef2D65ZwxNd7PqOjbNh9QUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=RtgGKvn+U7vslYgy6JfNmqRvPkT6eZnBgjWraJIVJnCfId5afma2Ys648mReaKlCC
	 rI4Gv9ZwYDrxr2mVbbeKgnAvs9PrPf7GyLWfeQcbmLMXbgU2RARaPbzxfwXFPeZ97P
	 kQ4DqEzjCEE+zwFfHso08bYJDSmjw+5K3WQcaHRg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgBAKgU (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Sat, 1 Feb 2020 05:36:20 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40100 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgBAKgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Feb 2020 05:36:20 -0500
Received: by mail-lf1-f65.google.com with SMTP id c23so6578486lfi.7
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2020 02:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=qaP1Hv45YWUmmbRN6rGXef2D65ZwxNd7PqOjbNh9QUQ=;
        b=l0Ty91zyRFdvoAihhZMaA4gLQMxuc/ja/Wt63AVgGJsCfahsR73rqySM0ITT2DpOTG
         DMJt9rNntpDPXnBsAQ5vhBM9tJhLFL0KqjK9v7SyjCxw7nt0TUFXNUB+wEFHOAQm3xbC
         Fb4QiNSW13b8ez24jrLllwlVUwsFChVusR6FM9YfvuwrQ036q6tYD76sBL9ATYBFeeXX
         qFiqMikS0S7/Nm827rfgZDvpg0scquGLgdEbYTUJ8fDpryVkh6npqwYkhFtI25XU161I
         ysBW7ZkgVcagk01NbghFfaFVnwdZNlxHBfpePdMtQNN+BTrITMVOXLeMaKIf+VQoe3VS
         qSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=qaP1Hv45YWUmmbRN6rGXef2D65ZwxNd7PqOjbNh9QUQ=;
        b=p0mz2DW/uZUJ4Asn79KkTw52qzBX4an8Q8TIpEP/AvIzkpDvJhMlurKLIN6/sGwRJu
         y1pnpY4Ft1VMr0cXZNlbe0izc4EWiYQyi5kuD6htOsXaOsMhHPN8L1e9QxyadaYocEht
         DzsWCoL47EtH5vGURUtWmqPgu0oBbEQOau+vawdSEOKoxXUMgnJc/3w+FA5MGYco5hgE
         H782Gbtx1UsjlrAriMpzQDUpEUwRWm/krHEMTkZFCl+qDL3kwe1mosDtielV2OmKrJHc
         NoWaP6lnSSJ5gjId+wvJd/JbgWLnyze7azY7zsopcpnVKUZDluFAikFE5Vu4IcUFTAhA
         OJFA==
X-Gm-Message-State: APjAAAVfMSAIz2/jT5yeiny6VcjfzYGAckmzBrvAQiSsQ8TYXvX3zXmn
        ZorT6PDx/lV15fGR3ws7mPTO1vImHSU=
X-Google-Smtp-Source: APXvYqx1m44aON1Ys/F6C7uc+7WSAE3mYAXFTbwURipIN+5UNzJuWiSbcUMV8wcVGl1rWH+8FqcG4A==
X-Received: by 2002:ac2:44d5:: with SMTP id d21mr7464476lfm.188.1580553377440;
        Sat, 01 Feb 2020 02:36:17 -0800 (PST)
Received: from saruman (88-113-215-33.elisa-laajakaista.fi. [88.113.215.33])
        by smtp.gmail.com with ESMTPSA id w9sm6228264ljh.106.2020.02.01.02.36.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2020 02:36:16 -0800 (PST)
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: composite: Inform controller driver of self-powered
In-Reply-To: <87bd6e525dbc59cd636c3cf5a4fa1758e9da6727.1580525268.git.thinhn@synopsys.com>
References: <87bd6e525dbc59cd636c3cf5a4fa1758e9da6727.1580525268.git.thinhn@synopsys.com>
Date:   Sat, 01 Feb 2020 12:36:05 +0200
Message-ID: <877e167fxm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:

> Different configuration may draw different power. Inform the controller
> driver of the change so it can respond properly (e.g. GET_STATUS
> request). This fixes an issue with setting MaxPower from configfs. The
> composite driver doesn't check this value when setting self-powered.
>
> Fixes: 88af8bbe4ef7 ("usb: gadget: the start of the configfs interface")
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

we need a Cc stable here

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl41VJcACgkQzL64meEa
mQZAWA//d2AG+Qrq8raumO2jWJmlPCzEz0IOb8sqt2VoMS9vZRz1LiLdOdcx9gcG
ZwrdFrGJAuYOdKroYVOARWuLgquPP39q757jpKy2OoTI0Nz49VgnkCWvayi1TIAN
z5xAUK8MtNs+TiUVOdkihOcJaMPXJx5VVs353djlfhhqY6u+ffLxODFCevME007D
lwEukPsfuIpTKP1zMWlAMzq36wrpJjVlyJVijch9ueUM/EOoNSOrzzFDnnC6/g7J
nHshKma/Y3E7CYUTcHxh5YC/4eiZWs+UtJwjpvfrB3Sg9WXHFMO2u0i8DzC7GHfZ
I41cZmyBTfUiXG+I6b+ez1qaL+Wv76uQtC31JuxDKNQ5xImEEG4GqaU4DsHkj0hr
cWTdD4Ad2qa1zsth3Lm2tD8OUP2HgbUvMmOdx2ixUPY2hp6e/6u/lBI3xg0jT+nt
9zi+8PGhxy4Nmpka196vUKnj13FyhpNmnkFeBLMLnF3XpHLRXlR05952zkRzttY5
E8x6+/JwO6Xx7FvMyeElBaO2ZKwW6X4XBWkygFzZbW4ssoo8Mn9P6TmNR3P+Cl8H
0wOoGNnLyyiAEb2Nqk1uDcQUj0bVxwqMJBr2Fe2gDXQ0Nz2v3gvlSteI2SKjXBzR
o/NA0RofEozr8Xi1wXUEPWR9qUSy9zMMcpfO1Xd2JqaMYx7/0CU=
=adzA
-----END PGP SIGNATURE-----
--=-=-=--
