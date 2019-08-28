Return-Path: <SRS0=FNJE=WY=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149D0C3A5A1
	for <linux-usb@archiver.kernel.org>; Wed, 28 Aug 2019 11:02:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3FB722CF8
	for <linux-usb@archiver.kernel.org>; Wed, 28 Aug 2019 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566990169;
	bh=oGCbzc7V5dSg8ocUvJhQiTB+h6jZY/HO65z4AK0j3Qk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=FFSMzFpaKZb84vd9UNySsAQOssS6BJb/GbMz030+eLJT2McuxyosaFUsrMyoT8+Z+
	 nzr6G9znKSrhAOjarG1BYxlN6onEpXxWKvG9oEI+xhGw5XOsH8ugwSW2IOOE10GIeY
	 2z/LSl4T5HMq/SGT5ImICK7uI0RyTqt6by1Mb4Dg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbfH1LCt (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 28 Aug 2019 07:02:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:51613 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726253AbfH1LCt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 28 Aug 2019 07:02:49 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Aug 2019 04:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; 
   d="asc'?scan'208";a="192556818"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2019 04:02:46 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        linux-usb@vger.kernel.org
Cc:     Guido Kiener <guido@kiener-muenchen.de>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH 1/2] usb: gadget: net2280: Move all "ll" registers in one structure
In-Reply-To: <d2f02109e718a6578d91467e6a4d522819be7a23.camel@kernel.crashing.org>
References: <bc390967a9ac59e658ae79ba74a23a6ca898351b.camel@kernel.crashing.org> <87ftllwqi7.fsf@gmail.com> <d2f02109e718a6578d91467e6a4d522819be7a23.camel@kernel.crashing.org>
Date:   Wed, 28 Aug 2019 14:02:42 +0300
Message-ID: <87d0gpwo19.fsf@gmail.com>
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


Hi,

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> On Wed, 2019-08-28 at 13:09 +0300, Felipe Balbi wrote:
>> Hi,
>>=20
>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>>=20
>> > The split into multiple structures of the "ll" register bank is
>> > impractical. It makes it hard to add ll_lfps_timers_2 which is
>> > at offset 0x794, which is outside of the existing "lfps" structure
>> > and would require us to add yet another one.
>> >=20
>> > Instead, move all the "ll" registers into a single usb338x_ll_regs
>> > structure, and add ll_lfps_timers_2 while at it. It will be used
>> > in a subsequent patch.
>> >=20
>> > Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>=20
>> I tried applying your patches but it resulted in build break. Can you
>> collect all the dependencies and send a single series? I'm applying on
>> top of my testing/next branch.
>
> You mean the 2 net2280 patches ? Or something else ?
>
> What break did you get ? It's just one series of 2 patches.... I'll try
> rebasing them against your branch tomorrow.

allmodconfig broke with missing fields in whatever structure. I didn't
dig too much, sorry.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl1mX1IACgkQzL64meEa
mQYQqg//ZZr1rlkIhLlJZbxe32a6mFtyKtyaZaXWZrFCoAsuCJ++ii4gG+gI+fof
TfRHInA3zH1rGwPn9Y+VUOqRPtU2pfVg76YfRgr2Wxgqk363eGBHhZ7xeWNjkbfP
r2PrIC5W/prvmHJzx8upPl0pz6WPtCAHkVt5IjBthB6SBrO6WxPvAAO4tNYxLkSZ
dBDC5LDnx/SJteCIZX7vYCNNbqsBAFaKgl13wsE3JuXal/ChETcx0XirKhn8GiWx
IiDQgPsjF/Hw4XRTZl45ClRtALvzIlaH5rUiylrUaNd47bp/aPo3FAbgfGfd+yMk
nDO0l9BBqhcSyWjtV5zSS1DTgCTFpQ3/cisk67YUiZ3ubff3XoASdnBiq9qeksKG
IwmdS6mWSnAAHE1jlKoFq3ysE9dydNPNT1vhGqMqMT/U5apo+tRIo2rhfXJp0asW
9QWpqfnsBZPGkopoU4IMU0suqU/n3K+9CY/zNitLhl0aMc3plb0xznZ+yyUFBBv7
q0W5NzvfMcC2m9F3H2O2Lyag/ZArDzmNI301zh5Mjz6PD8zk86w6PYHEunAu2BhN
eYzqShiJeMBaO9weCbY6+6DH6XKKIghNzZqcJsb8kj9oSTv4iTZJlQ+ZHKAEy1zK
YGhzb3XIh9cG+mA1pfY+DjfnG51KzS4pTkvdOvtaYR/tWjlhI20=
=f0SX
-----END PGP SIGNATURE-----
--=-=-=--
