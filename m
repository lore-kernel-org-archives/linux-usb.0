Return-Path: <SRS0=fPcF=YQ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135CFCA9EAE
	for <linux-usb@archiver.kernel.org>; Wed, 23 Oct 2019 06:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D762B2173B
	for <linux-usb@archiver.kernel.org>; Wed, 23 Oct 2019 06:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571811694;
	bh=1D5IDUHE72UD+LsTrISDHgUy/xSvu3inFDbcwMOxjis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=XECqS2dLGNI385PTmolGeFYepS5DSyk3E8t2widYuCDO5Tg/DB61hKKkRWGyiORAi
	 pr+eNeVmFmiP+x8vv0IlN6L+x6m/RZGQdavTBH9mjFlgXc37zAzlgh1iKGAvnCnPAB
	 +3mkCibFkmHW5SudloLOQkzr1G2v4Uu2y6nTFaCo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728697AbfJWGVe (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 23 Oct 2019 02:21:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:65416 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbfJWGVe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 02:21:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 23:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,219,1569308400"; 
   d="asc'?scan'208";a="209852899"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga001.fm.intel.com with ESMTP; 22 Oct 2019 23:21:32 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/4] usb: dwc3: gadget: Don't send unintended link state change
In-Reply-To: <c493e890dc8f02500fa1356353b5ab6c830b9cf1.1571770732.git.thinhn@synopsys.com>
References: <cover.1571770732.git.thinhn@synopsys.com> <c493e890dc8f02500fa1356353b5ab6c830b9cf1.1571770732.git.thinhn@synopsys.com>
Date:   Wed, 23 Oct 2019 09:21:20 +0300
Message-ID: <87blu8j82n.fsf@gmail.com>
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


Hi Thinh,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> DCTL.ULSTCHNGREQ is a write-only field. When doing a read-modify-write
> to DCTL, the driver must make sure that there's no unintended link state
> change request from whatever is read from DCTL.ULSTCHNGREQ. Set link
> state change to no-action when the driver writes to DCTL.
>
> Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>

WHAT A GREAT CATCH!!! However, let's do one small change here:

> ---
>  drivers/usb/dwc3/gadget.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 86dc1db788a9..24178b4b9d46 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -57,6 +57,8 @@ int dwc3_gadget_set_test_mode(struct dwc3 *dwc, int mod=
e)
>  		return -EINVAL;
>  	}
>=20=20
> +	/* Don't send link state change request */
> +	reg &=3D ~DWC3_DCTL_ULSTCHNGREQ_MASK;
>  	dwc3_writel(dwc->regs, DWC3_DCTL, reg);

Let's a small macro or a little function to wrap this. Something
dwc3_dctl_write_safe() or something long those line.

Then that macro/function will make sure to clear those bits.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl2v8WMACgkQzL64meEa
mQZOrxAApJBh0xC8pnmKv5GB/vGPE2Hwji3iWgkySIaHjyYrT3UvfByl7dx/cg6F
4wwJ/B6CaF5pCJ9dGngfFfX7T0cqaksPF3I0+3l/LONhz7YKZEkMfk2gMu6nl3yU
kMHHFsXDfMya3FLmoWX23gzh+KlzA6S6JF33xdSISi7esYAtUeyDCE1E81/FK1CJ
vSih1wqpLpYmJjXx6rxRzsBZ5vrpzb+1s7m0cWTCaPfgE/mxayBHg95OJ/TNXjLc
HjIyvZXhboMJPCZHXMJBBt3E7q4dc70VPHlI0TCR2RZ4gaWoDC12xRj2ffmJFFOS
my7EvTGl8LLhGUznhIsOaYmtc+1uj4iuzVAAkgz0Wv902qWz5ffwVEVHXt23JuAU
Wo1KoJ35NAJffynhcnW02/URMqxOAn++dF2M+u7qxgGT0KtAmZvgNFZoJ5WtCxl+
V4BS/QpRxBT26X9OqHY69jCLSm3LncvDTHq4DErd7rYHtxsQZAAISrK02IubcyLr
sQH0L5ZY4JJwo9Xkb7H3rD9sb9dVLuyugiisP6d5tgf3gEnny1G4r9v973lOVZj2
aXzBC06wiPGEtAySkfAf/2rXtDrAYRaWkOgFngG71Ln7c4nYIb02lfF97+zr6m8T
y1rSRyh3KyRPqOBTkNfM4LNUkmkSl+ckqbRYRthEriqMR75TJhM=
=mnBk
-----END PGP SIGNATURE-----
--=-=-=--
