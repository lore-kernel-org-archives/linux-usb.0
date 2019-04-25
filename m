Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D38C282E1
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64E4620678
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 13:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556197212;
	bh=L9LW8mvhLxUuxIzw603RvliiQrmV2ZohbAqvO6Mc2Xg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=pjnxYW8Kc/TuCYpSpUK0jdIoKCZ/1HkRYwm85HtzOn7QPqbEkSLCo436L4Y/LTvRp
	 OXzOlC9/l6Hmy2xeFpL4wpul+zmEtKeMyTK3lTMROeJwl/YJnhPD0xqmcE3mWWKz9x
	 aQCQEkvrZW7w5fMyATDQXGAK/SuOGmNdf27Z5seY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbfDYNAM (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 09:00:12 -0400
Received: from mga06.intel.com ([134.134.136.31]:42144 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727168AbfDYNAM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 09:00:12 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 06:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; 
   d="asc'?scan'208";a="152279524"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2019 06:00:09 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Nagarjuna Kristam <nkristam@nvidia.com>,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH V2 7/8] usb: gadget: Add UDC driver for tegra XUSB device mode controller
In-Reply-To: <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
References: <1552302716-18554-1-git-send-email-nkristam@nvidia.com> <1552302716-18554-8-git-send-email-nkristam@nvidia.com>
Date:   Thu, 25 Apr 2019 16:00:05 +0300
Message-ID: <87bm0us0iy.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425130005.PBHrhSNdo46oG_wJMFvq80r_WEyRxRcUXD6_EPEN9ro@z>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Nagarjuna Kristam <nkristam@nvidia.com> writes:

> This patch adds UDC driver for tegra XUSB 3.0 device mode controller.
> XUSB device mode controller support SS, HS and FS modes
>
> Based on work by:
>   Mark Kuo <mkuo@nvidia.com>
>   Andrew Bresticker <abrestic@chromium.org>
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>  drivers/usb/gadget/udc/Kconfig      |   10 +
>  drivers/usb/gadget/udc/Makefile     |    1 +
>  drivers/usb/gadget/udc/tegra_xudc.c | 3702 +++++++++++++++++++++++++++++=
++++++
>  3 files changed, 3713 insertions(+)
>  create mode 100644 drivers/usb/gadget/udc/tegra_xudc.c
>
> diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kcon=
fig
> index 0a16cbd..f6f469c 100644
> --- a/drivers/usb/gadget/udc/Kconfig
> +++ b/drivers/usb/gadget/udc/Kconfig
> @@ -439,6 +439,16 @@ config USB_GADGET_XILINX
>  	  dynamically linked module called "udc-xilinx" and force all
>  	  gadget drivers to also be dynamically linked.
>=20=20
> +config USB_TEGRA_XUDC
> +	tristate "NVIDIA Superspeed USB 3.0 Device Controller"
> +	depends on ARCH_TEGRA

no compile_test?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzBr1UACgkQzL64meEa
mQYO5w//R94kVt9nglF6qfm9RCKYgu/kv+8XVWFRMHft61MDBH1fkm7MJX0FGQNa
kmufn2o93fdRqI6ib7xVnc5NElWDarzdiMLwpt9ibhON1OtrSoL7sB/YmWhCdv1X
pKhbGkUidOMbi6FLgiW3KL8aDSOT76vbZP3YB9gFNYaLkVCPngn0jroTSJbWL3jf
//vqmRqLIpohHo7C6zEZev1R0LM1UmPUkeLfzqpFwbEPZ2R0vl2qZCrId7uH+dY7
VNV+nWk7clQXfZNulYf6fVOLeU17fSVdaPLIiNZsdrjib0/9+mnodVbc+qCUqGeC
OpDuvCLYIlLe+6darVoat9eO3YtkZxP8low3+1Cbmzjuznv0wogaFpMfJTdrmCkG
9gyWpkMldjGxTFUQn/sFHRzOFOO25iqzPLhZxKvl/tgNj5BRXEmOr6qR13GkQ7v9
3u5ktTHvM6oiq/0EZHdLp3AOu0kj15Z4ubQIXJXLrr4QdAz+bY+jNhk2bTEwPo4t
0KJ6WGSHjbnDeRVtIJGqkhNf/f+KFT23nXuD4a30cepk1EBIS+54af11IY5Vuwwc
/hMWfj3s7ONgQxPYNdu9I5+V8oCOwGeXgwXAueVpO07TvT6za32lggMourDPvJsm
+rtR6y0qzbzhOugniInWgiuBfDuYe+IGSs2WW8vVOmGff0IXNlM=
=/D0O
-----END PGP SIGNATURE-----
--=-=-=--
