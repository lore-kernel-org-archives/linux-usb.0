Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8200FC10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25285205F4
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556196197;
	bh=NElZRgnZxOAnJ0pWBoCcarazajWDHBhv5zWWoTGbsBE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=DRlvUx/T3OHxlB/3M8c6Wro45YUwIecnqQ5gGQzYzDI50evlXqA57PIVumL47MJPY
	 aYKiCCdTNz0HwfQScOfD942walSnWCy/vAERjbHDXcPXB0Wb2bT8dBkxoQpm9eK2ZE
	 +IP12WIYOg1WjUW4Gy1kHj6I6jbFHcRynHCe9EZ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbfDYMnR (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 08:43:17 -0400
Received: from mga17.intel.com ([192.55.52.151]:44052 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725965AbfDYMnR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 08:43:17 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 05:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; 
   d="asc'?scan'208";a="145632006"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga003.jf.intel.com with ESMTP; 25 Apr 2019 05:43:14 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Subject: Re: [PATCH v1 00/14] usb: dwc2: Fix and improve power saving modes.
In-Reply-To: <cover.1555672441.git.arturp@synopsys.com>
References: <cover.1555672441.git.arturp@synopsys.com>
Date:   Thu, 25 Apr 2019 15:43:10 +0300
Message-ID: <87k1fis1b5.fsf@linux.intel.com>
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

Artur Petrosyan <Arthur.Petrosyan@synopsys.com> writes:
> This patch set, fixes and improves partial power down and hibernation pow=
er
> saving modes. Also, adds support for entering/exiting hibernation by
> system issued suspend/resume.
>
> This series contains patches which were submitted to LKML. However, a part
> of those patches didn't reach to LKML because of local issue related to
> smtp server.
>
> The patches which reached to LKML are:
>
> - usb: dwc2: Add part. power down exit from dwc2_conn_id_status_change().
> - usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume() function.
> - usb: dwc2: Fix suspend state in host mode for partial power down.
> - usb: dwc2: Fix wakeup detected and session request interrupt handlers.
> - usb: dwc2: Add descriptive debug messages for Partial Power Down mode.
> - usb: dwc2: Fix dwc2_restore_device_registers() function.
>
> The patches which didn't reach to LKML are:
>
> - usb: dwc2: Add enter/exit hibernation from system issued suspend/resume
> - usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.
> - usb: dwc2: Clear fifo_map when resetting core.
> - usb: dwc2: Allow exiting hibernation from gpwrdn rst detect
> - usb: dwc2: Fix hibernation between host and device modes.
> - usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
> - usb: dwc2: Add default param to control power optimization.
> - usb: dwc2: Reset DEVADDR after exiting gadget hibernation.
>
> Submitting all of the patches together in this version.
>
> Changes from V0:
>  - Replaced 1 with DWC2_POWER_DOWN_PARAM_PARTIAL in commit
>    "9eed02b9fe96 usb: dwc2: Fix wakeup detected and session request
>    interrupt handlers.
>
>
> Artur Petrosyan (14):
>   usb: dwc2: Fix dwc2_restore_device_registers() function.
>   usb: dwc2: Add descriptive debug messages for Partial Power Down mode.
>   usb: dwc2: Fix wakeup detected and session request interrupt handlers.
>   usb: dwc2: Fix suspend state in host mode for partial power down.
>   usb: dwc2: Add port conn. sts. checking in _dwc2_hcd_resume()
>     function.
>   usb: dwc2: Add part. power down exit from
>     dwc2_conn_id_status_change().
>   usb: dwc2: Reset DEVADDR after exiting gadget hibernation.
>   usb: dwc2: Add default param to control power optimization.
>   usb: dwc2: Update dwc2_handle_usb_suspend_intr function.
>   usb: dwc2: Fix hibernation between host and device modes.
>   usb: dwc2: Allow exiting hibernation from gpwrdn rst detect
>   usb: dwc2: Clear fifo_map when resetting core.
>   usb: dwc2: Clear GINTSTS_RESTOREDONE bit after restore is generated.
>   usb: dwc2: Add enter/exit hibernation from system issued
>     suspend/resume

patches don't apply.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzBq14ACgkQzL64meEa
mQZvwxAAz9EjLxWGlPEndJpV4E/x6tDHbcuZ4jxRy0eDM2inXnM1RSS5KLGk5lPQ
gunI6aumBS7InKqYqG4N3L1/u9THLYT9piJFJPpbFTm1BYYV1eu6kX856iUd2K25
V5Xb0k3NPMGXnisTYFz03qSFMEj8MBHP1AzB3uAo4dG/i6sMQJv3hDvWMFzNxHnJ
KeQZ/Hwog6TcPg/DQTF7id7AseKGuMISS/ow+g0APcwbv/993UznHeR1GFtbP4tv
2o5Ytt8LUkR5eW+hlluHC7hu3jnnRA6LL4CWopulKTIz5qd1CWOFl3UTEIfZKIQY
RentXn5FQPvDC/oN7JyTmJpP9ZbqGJjmA/kfbO+f422z/hJ287w4USEklZtXHxdd
D3OcNkJHoK/QQF2SKX3YXhAB6sLqJuMljnpme7AvQHllixe0O/8lWYNaDzjVAD+N
u5ebRYffwE25HtVzLafWdbRM8tl1f6u5e5zIkhAa4LP7C0/lAjthw/mYkOWcMJTn
ZqjiBwE3DdtTI98Y17N8PcL3vhlcAADa4EhRfHjgzKe+igQI3+iat7yd0Ua6uqbe
XzyPOEsWUkO7l10Yo+XHV2wiTkN/+y6drgKl/0E/3t44imD7NOnqVaiEMeizAvae
CeXFwSJvg1AFkGvjHRhyqOYBCVNviUF413qA6/e/bGHoImhQyB0=
=QRfk
-----END PGP SIGNATURE-----
--=-=-=--
