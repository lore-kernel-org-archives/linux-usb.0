Return-Path: <SRS0=nq6N=B5=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1648C433DF
	for <linux-usb@archiver.kernel.org>; Wed, 19 Aug 2020 12:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6D6C205CB
	for <linux-usb@archiver.kernel.org>; Wed, 19 Aug 2020 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1597838522;
	bh=XPF4pUZ9XLJGLm2ke+y+xWCrX98qc3PG+j5IETCQ9Ow=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=hriZfgQObcTsxsAVNs0IfF+5D+qV99/FlYikLhhqLUV6bGOpMKHoZ0lQOt149TEzq
	 RCKIehFzKj6cypuWizMtM+G2WsEzGqlTh72fx+3bGSdBeDsnD6RDWnwl+tAhKMNsEM
	 RX1rJlvepnZocS+5etoYMotBPmMNEkNTViVFhCgo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgHSMB7 (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Aug 2020 08:01:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:55304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728143AbgHSMBR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 Aug 2020 08:01:17 -0400
Received: from saruman (unknown [85.206.163.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C6D78205CB;
        Wed, 19 Aug 2020 12:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597838476;
        bh=XPF4pUZ9XLJGLm2ke+y+xWCrX98qc3PG+j5IETCQ9Ow=;
        h=From:To:Cc:Subject:Date:From;
        b=UNK33lHaHxwT7+a2XY32U1EWo0vGDHUJZutlBk+Jxk6OKw9bbLNDBCtUB8q47j2Q6
         GvqkI//cnFYgBjSPjNQoVlmR5FKsen70TlvgtV4EVWtZoznppLJjh9Ayo0ANo2djaN
         iZLHsrz4pvVmiE7MpEg+l3DkpG9glsuZhbc4mtdY=
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB: fixes for v5.9-rc2
Date:   Wed, 19 Aug 2020 15:01:09 +0300
Message-ID: <87wo1uyhdm.fsf@kernel.org>
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


Hi Greg,

Here's my first pull request for the current -rc cycle. It contains only
4 commits. Hopefully this means the USB gadget framework is almost ready
;-)

Let me know if you want anything to be changed

cheers

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/fixes-fo=
r-v5.9-rc2

for you to fetch changes up to bc9a2e226ea95e1699f7590845554de095308b75:

  usb: dwc3: gadget: Handle ZLP for sg requests (2020-08-17 15:22:08 +0300)

=2D---------------------------------------------------------------
USB: fixes for v5.9-rc

Three ZLP fixes on dwc3 and a resource leak fix on the TCM gadget

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Christophe JAILLET (1):
      usb: gadget: f_tcm: Fix some resource leaks in some error paths

Thinh Nguyen (3):
      usb: dwc3: gadget: Don't setup more than requested
      usb: dwc3: gadget: Fix handling ZLP
      usb: dwc3: gadget: Handle ZLP for sg requests

 drivers/usb/dwc3/gadget.c           | 107 ++++++++++++++++++++++++++++++--=
----
 drivers/usb/gadget/function/f_tcm.c |   7 ++-
 2 files changed, 93 insertions(+), 21 deletions(-)

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl89FIURHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQagpA/8CQdtlYspsTXYgTuzfGMAPD66UtITYmQM
UpaT71nsFGwHeE8Mxk//jI4T5SujaAxNirqlCEniGVq3mj33hS8FZitaG1fE2nzK
DMdClIeNZWiY2gBnA+sDAh5nw80Qe518ZYy6IlM1lSdEHjFlYSgErLYBzDOB2r13
gZZNZNS3tDInbYJOg8calwfsibhDS7aSw+MM/W2evcYUXyffq4QKJ836QNte6HHR
4Qeav40epAzfTd8hYEXik7U/n58SU+mv3JKGSLqgKqCnkA9xtq+A+wbInR+yK5ln
u0y98k9VDxnJJ82jibD/WgjwwBjOByqW51xOadG9k8DorHDZxLAoIdXZ3w8lH2Ev
nh6+sX51epJDMI58YXZay9QdRxUJGgHtZErEjzYlIFqH0If6U+1lYL7NKn3tvUp9
z1EzDToL2zb1UShExYtdn9C8wLH+NgPFH7nrnCQ2uyfAPQ6SxUh8A3rL/VcdMwEx
RcEySTR73gXYmM6Vtril4YZb6AvlNy0QxQFv9rH6M/IvQOr900FHVxbYRrBjds30
qZP4N1Wt7xr8GSx0UGg8qtmr+NqU5PkB7pjvL8FMEJPaTJ7fZ8cd7yk7Z9qevA/y
pVjXwy1Dgdjg9rr48ybd2PdA1j1k1HNhw4zAWSuQbjmYsrPt5Dp/YrmunE5c44pw
YC+N4AzfQ1A=
=vrMZ
-----END PGP SIGNATURE-----
--=-=-=--
