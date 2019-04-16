Return-Path: <SRS0=lM5t=SS=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8E8C10F13
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2FF3206BA
	for <linux-usb@archiver.kernel.org>; Tue, 16 Apr 2019 08:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbfDPIKO (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:10:14 -0400
Received: from mga05.intel.com ([192.55.52.43]:12054 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727326AbfDPIKN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Apr 2019 04:10:13 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Apr 2019 01:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,357,1549958400"; 
   d="asc'?scan'208";a="143327474"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga007.fm.intel.com with ESMTP; 16 Apr 2019 01:10:08 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Paul Elder <paul.elder@ideasonboard.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: Explicit status-stage requests for USB gadgets
In-Reply-To: <Pine.LNX.4.44L0.1904151439210.1575-100000@iolanthe.rowland.org>
References: <Pine.LNX.4.44L0.1904151439210.1575-100000@iolanthe.rowland.org>
Date:   Tue, 16 Apr 2019 11:10:04 +0300
Message-ID: <87y34a8j6r.fsf@linux.intel.com>
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


Hi Alan,

Alan Stern <stern@rowland.harvard.edu> writes:
> I finally took the time to put more work into the explicit-status-stage
> project.  Now I've got patches adding support to both dummy-hcd and
> net2280.  (The two patches for net2280 I sent earlier today address
> unrelated issues that turned up while this work was under way.)  Along
> with Paul's work on musb, it seems like a good start and worth merging.

Thanks for doing all the work.

> Getting someone to do the same for dwc2 and dwc3 shouldn't be very=20
> hard, but they are out of my ballpark.

I can do dwc3, no problem.

> Paul, there is one change I think we should make to your original core
> patch.  usb_gadget_control_complete() should not check request->length,
> because it has to be possible for a gadget driver to send a zero-length
> reply as the data stage for a control-IN request and still get an=20
> implicit status-stage request.
>
> Aside from that, everything seems to be ready to move forward.
>
> Felipe, any comments?

I haven't had time to look at the patches yet due to some internal
projects happening at this moment. I'll try to get to them still this
week.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAly1jdwACgkQzL64meEa
mQYnNw/8DO2XZD/yCouG90AAW4hp7dVpvmiak81p/295EzVTLZVXxo2OfUScQCCR
8FpC/M4zeyrzKPBa5updqJsCpO5wCyoivuAHPe85P0YzFqYPQpAB05LhVQT78Rp+
ah4wLzcQYSl4OICuVLiGLDiCuhHjqBCF05F2L+up5Nr9smVSOWv6/3QZnYytCE8r
O564gZwhdkl1NI6kZWZA9dpBWUXVGkVTFyV9Cqx9Tmi9dE/YE8G+nuIh7la5Ah8o
+2JnjuTEycKfaSclzex/d/iIv6ADRdqmPhkfdCnwXDZ87WZkeJTIJXJp2oTxk9eb
oUEPSqPF8FYL3vofuilI1XWK6aIFGR/TQvvYme7X20RqnES5M4lS4BcpD4sO4YHM
4FYqQHFok6khJzGVbVwNSng2H5jg1HmRh//JNU8MTm7R3NOkDkyFY/KVZv4UTwLq
52vH4rPyzMkqBhEKe2gfFqmYziiHfpQ5AU515ET1w3DLobMBzaNEMrad92gH9VmN
swh0aW5fSB9+j0QPICN/8HpBtPX6MVGQVz2CEo8+4ZtYFTdlmIwgtBWjV/2JpONa
HdZ85i5leNHoPCgPkxaZMIV3jhn9hRzR2JCVd9JbByiHhJR/Pk5gPg+D0rW+QwSC
HxcPfoWV9abL6rlbEtoYvX3FdyVhVCzHhkmWz9qcabxquLeQ734=
=kLt2
-----END PGP SIGNATURE-----
--=-=-=--
