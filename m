Return-Path: <SRS0=WMKl=S3=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A346C10F03
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:44:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC3CD205F4
	for <linux-usb@archiver.kernel.org>; Thu, 25 Apr 2019 12:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1556196294;
	bh=oOjF8aMiS8MMadUw6Tk+I5TIAzqcfrYV3oUd0hRSh44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-ID:From;
	b=BSzmhNcIit+nCpIWdB19Arz2tuhBc1Lfgzlcw6pMKtsWiIBrrYZYsMSmodNHw470J
	 CN/kMuaJtOvrFNGl6rPRBST8UiNP+EgL2e9xWAKOD4Gei2kR0QztwhTjdmhR8rtIg9
	 g4PK1P4DjwEbrO2qnFH+dwWJkEzUyV+fUWY4hx2o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387964AbfDYMoy (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Thu, 25 Apr 2019 08:44:54 -0400
Received: from mga06.intel.com ([134.134.136.31]:41526 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387943AbfDYMox (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Apr 2019 08:44:53 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Apr 2019 05:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,393,1549958400"; 
   d="asc'?scan'208";a="340690087"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga005.fm.intel.com with ESMTP; 25 Apr 2019 05:44:51 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Artur Petrosyan <arthur.petrosyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <minas.harutyunyan@synopsys.com>,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     John Youn <john.youn@synopsys.com>,
        Artur Petrosyan <arthur.petrosyan@synopsys.com>
Subject: Re: [PATCH 01/14] usb: dwc2: Fix dwc2_restore_device_registers() function.
In-Reply-To: <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
References: <cover.1555075927.git.arturp@synopsys.com> <b4129291df7b2d061e93c03862c081b6a35b2e7f.1555075927.git.arturp@synopsys.com>
Date:   Thu, 25 Apr 2019 15:44:47 +0300
Message-ID: <87h8ams18g.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
Message-ID: <20190425124447.hR_Yn8kO1VV9MJ0hOvNNlaydSHqefxoMQLzfH1-Qd3E@z>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Artur Petrosyan <arthur.petrosyan@synopsys.com> writes:

> - Added backup of DCFG register.
> - Added Set the Power-On Programming done bit.
>
> Signed-off-by: Artur Petrosyan <arturp@synopsys.com>

won't apply.


=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlzBq78ACgkQzL64meEa
mQahzg/9FWDKsC+xYyql8LB/bJfK1QE1BSjRVJKBOjTldrIgBW6/xSbqfT7isNnj
2jYCncYYb/H8wnQAe0Jn2Y4OSGVDDl1QatDtG6xnpEKeR8BGNxukmQVuO2xN7ZOF
8asfyn0XJsDnjEgjTBeZvNgIgpyJcpp/Ey56t3lxTKp0dxnmqds3lmXvxc6KG8zL
BGWfRQEuF1ZkBR6cDF2jdsr5217hb2rwE03/TfUzfP5OO4QVC+c80nf0hqC7y7JR
DFfolehX6aih702QuPZurXXk3UMPijrDzqT5Xwr4yVnzxEFkfJtKGZtsYECOuMAI
V56zCYwZKIMMCRtRLcz1Y+FnPCAoVseA6y1tnAEefQU5fmDqt8a5v01+R/+ASpea
fGfzrlGKqbUdeOS+7IKJJ36Zej5njm/Ohd2Z5K6kcd3UHSqYE6MK6g6VLSpZxQsa
uZqcewhiZgJR2H7FnvfL7vm+XoMW/9TZUBeGrcr1x5aNUW1yC2KanUZwC+BrwPgw
K/+0iOHg+NIIdJiR8LkJerjNpcGwqSgGrIjmLxkJfYp4V7lMkB0d7lyh/zFp5tNp
PN7pgppEzWyI/4ft0R4vJolNySn3ER9VGiooKui+EKDZiWrjTMIYi3f5kCNcWW5t
sFV6oLng+4rPk0jsXSK/m+E739MGV8fD39P0NzbLPGoxzY4DGvE=
=G469
-----END PGP SIGNATURE-----
--=-=-=--
