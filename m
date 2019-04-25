Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB9FC10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B9AA20644
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbfDYMwW (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 08:52:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:51244 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726074AbfDYMwW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 08:52:22 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 05:52:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; 
   d="asc'?scan'208";a="164766024"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga002.fm.intel.com with ESMTP; 25 Apr 2019 05:52:19 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Jules Maselbas <jmaselbas@kalray.eu>,
        Minas Harutyunyan <hminas@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pierre-Yves Kerbrat <pkerbrat@kalray.eu>,
        linux-usb@vger.kernel.org, Jules Maselbas <jmaselbas@kalray.eu>
Subject: Re: [PATCH 1/5] usb: dwc2: Move UTMI_PHY_DATA defines closer
In-Reply-To: <20190402103922.16729-2-jmaselbas@kalray.eu>
References: <20190402103922.16729-1-jmaselbas@kalray.eu> <20190402103922.16729-2-jmaselbas@kalray.eu>
Date:   Thu, 25 Apr 2019 15:52:16 +0300
Message-ID: <87ef5qs0vz.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425125216.pKF0HreNcKu0YN72Ftifn_4JuW7AKQwheb-SFlnKY4w@z>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jules Maselbas <jmaselbas@kalray.eu> writes:

> Makes GHWCFG4_UTMI_PHY_DATA* defines closer to their relative shift and
> mask defines to improve readability.
>
> Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>

Doesn't apply. Please make sure to rebase on testing/next

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzBrYAACgkQzL64meEa
mQaUWw//R+ABcq2yhcRVULKy7eukzP30/eSgovDKTyI52VC6lTcsW6bs2s2V/USC
mGYdqrYoEMR9Qs5AbxcDVBzHqqFHeYaM7edMROMSGa1pfSlRO5yiwmAKnYe9Q1lF
CJPJ3WRjZ71rYcmM5gNd2e91S2d/e3kqm6swtaxkMXPE66uFmGugQuseYDKsJn+/
XgvqzEbrtfruizRmarGmFJ3tz5rIZZY+5kUz3sLqtlfoAQ75zR2p+mIx8WberQR1
67htwPSV+iWEZcKXuCcJmRyJJwXFnarsQHGdUwdmKV9Yd+ZV644LzAv9olIThDTJ
4YvuZND5Ecve4iT7Gw5ewzVfqYZd3t+98zpNiWS0bVQi4IvyzVZXN6QR5Tt8nxDB
HO8AoIZbMvzSUafFIODBgZfb2CS0EpW8wcpk/2iGk0xF/bxKmF0weG2VkG2IpwGj
GZlGmz0OXPlImcrGvM6qQjvxECO5ooPtQKse+bfDGP51ORDGRv3nhtKL5NUCk9Ch
Y9fAFN4Fr+1sURu8ar4ATKVudRXzvmIT43Ox3R0RRINr5E9scWGnwBGMUaYkmA2C
ZMxfewoVnZmKhBj3PTaU65fGiRGZYUNhmiNF8KXx0X5XqFgsYZ5j42f8LaTjJ3yG
SphQlD8TcFEqOLFcL4PbMC6qlTZ4zPGZtaNboNqMW1fHMCGsgOU=
=BCVQ
-----END PGP SIGNATURE-----
--=-=-=--
