Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68465C43219
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:55:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 444F2206BA
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps6DktzK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfDYNzH (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:55:07 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51335 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727413AbfDYNzH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Apr 2019 09:55:07 -0400
Received: by mail-wm1-f67.google.com with SMTP id 4so9420470wmf.1;
        Thu, 25 Apr 2019 06:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qFtWCchc5fQc3As0fEk8m1hUfRG7QrhHUS9bpH/hArg=;
        b=Ps6DktzKpvToVolPhMWzwufDGn3b5yBABPPKu8EnWnGkv07udbGgWNKxMdcpV3HO76
         KblRx9Bbak8ioDKG92DxtZOPmY/wXASw1epZMacnCAf5RBj0uGkFVDp71fhjzNyALTBH
         /GgygWeHWsTvDbBM+D6TGujxX1Z3/iAhoC4SzMecmGXr+PgLgXzTQ5mtk3E3KenrV2A3
         EHdFUxD/miYCRoSaNOe28JC92jdTBPXYZ9jYrolgeCmg3a8RT6Id2VDTWWV2dxvrjCbt
         lOoY/dBpAuUEHS0rIeyYKglgiCvfOmFEn7KetPR2HgvnURgnWC6lKyjPYaOLFLGqN7KH
         0CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qFtWCchc5fQc3As0fEk8m1hUfRG7QrhHUS9bpH/hArg=;
        b=rFS+OFEZei104ArCsw5k56T+WyJPqY8FeA0FJysvjH2iTgff3oP545rPmdBbgyCH0w
         gY4rdaQtee6JYrE8JNqipLWD2T0wJgreSmpd3vub/uEioJ02zptauOaHRzNo/RRypBf7
         I9LWlpVAN63w57nleZHigq7xGqIJYx6TjO4dWanwZO+7O+xORQYgokJ9gA1gdCT5gtmM
         TkAwvY9o3LeTBbFJStv5P+dS60Ji0Vlluh0WlOLmjHCD+pKKYRPI2OehynmlidcScCfU
         EU09g11OovIakd6g7YVJ3Ko0wyIuk8At0Th4fGCMBMleJTKW+bhfsZwPV2eZevn0LOPM
         KVww==
X-Gm-Message-State: APjAAAVFUViJcQ2jYdCqGiuK5aq3sJIXa5dHptuK6H1rJsoI3JXc0l09
        nGg8x0alFKeZFBbeXZ0W8Iw=
X-Google-Smtp-Source: APXvYqx64VE3a5CJzX5mQyEoLxJHrziFgEY6KsqhX/dcU5jlz5akdWO0Ur61pXTeek9xJZv2n4REgA==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr3794499wmh.136.1556200505240;
        Thu, 25 Apr 2019 06:55:05 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
        by smtp.gmail.com with ESMTPSA id 6sm13498760wra.85.2019.04.25.06.55.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2019 06:55:04 -0700 (PDT)
Date:   Thu, 25 Apr 2019 15:55:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>,
        gregkh@linuxfoundation.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2 7/8] usb: gadget: Add UDC driver for tegra XUSB device
 mode controller
Message-ID: <20190425135501.GA24213@ulmo>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com>
 <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
 <87bm0us0iy.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <87bm0us0iy.fsf@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425135501.CrHpfthIx57IgV4uHvuXBNIwrLw6Nd7Gk6S8Xdo2B8g@z>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 04:00:05PM +0300, Felipe Balbi wrote:
> Nagarjuna Kristam <nkristam@nvidia.com> writes:
>=20
> > This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> > XUSB device mode controller support SS, HS and FS modes
> >
> > Based on work by:
> >   Mark Kuo <mkuo@nvidia.com>
> >   Andrew Bresticker <abrestic@chromium.org>
> >
> > Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> > ---
> >  drivers/usb/gadget/udc/Kconfig      |   10 +
> >  drivers/usb/gadget/udc/Makefile     |    1 +
> >  drivers/usb/gadget/udc/tegra_xudc.c | 3702 +++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 3713 insertions(+)
> >  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
> >
> > diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kc=
onfig
> > index 0a16cbd..f6f469c 100644
> > --- a/drivers/usb/gadget/udc/Kconfig
> > +++ b/drivers/usb/gadget/udc/Kconfig
> > @@ -439,6 +439,16 @@ config USB_GADGET_XILINX
> >  	  dynamically linked module called "udc-xilinx" and force all
> >  	  gadget drivers to also be dynamically linked.
> > =20
> > +config USB_TEGRA_XUDC
> > +	tristate "NVIDIA Superspeed USB 3.0 Device Controller"
> > +	depends on ARCH_TEGRA
>=20
> no compile_test?

That's not possible right now. The driver depends on functions that
don't have dummy implementations to support COMPILE_TEST. I suppose
that's something that we could change, but does it need to be part
of this initial submission?

On that note:

Nagarjuna, I think we have PHY_TEGRA_XUSB as at least one other
dependency. Without that the driver could be enabled but fail to link
because of the missing implementations that that driver would've
provided.

Thierry

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBvCkACgkQ3SOs138+
s6F/kQ//axFqYJg7hxZyVj/fhHAV6hz8ZAUWyFF60kyMH0m4z3cJIYRebR37JiYG
WWOaZ7NxnNzaYy1omzJS3VvEnddRURtafOwqBwK8IrkW4Gqb9oe6cZxncAfIk7bi
DDkTvc1mDURhmKwsJLqEM8lKPwuANIyoIxEJqTz/I8iW6Ri4a1yxr/TdHtIZEAIJ
VFQgsAmhGVHmZBpAPwtmcsEff+itnQC2nlG/dVTX3w/6DqRmJzKkHnRLwLwwnVva
jfba2x6l9sqdGWzRisLdrileYHrLo6E1LKXroA+hnPz5snadFAwvkcWnyDCJVCXi
11khH2KsnZ0HbGw9enU20h640UbXvmmp0TI6A3eAY9m0QP3cD2ILgJ2FJSIUsEkx
5UYZRvbIhq0BEOneYyLkKwyVM7/VLo8EUElp8MRLc4ISPvvX1/8Kgt9Drivib3V1
v6yhaN/H271DomIUIBATDWWlY3SwBSqf1kBb4a0FzSeX27HZ4obNnn8yUwVYFBhn
9saYFfb5/r3ZAAxPL1idX26rApEF86JFgEnm8JoJsRtCUg26K4KP6Rn/1T6NrmP+
YMWmV1oThiQssCMxkjvDHrLWlDceOrIFjpV09wF2ar9EJ1KRcy3wxQKRPF15NyjR
hgTydwgMZJd/pYck9FoONc59oayd6l/oODNCQnTMpdCUUWDTi44=
=Mpit
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
