Return-Path: <SRS0=pmyG=EJ=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568F5C388F7
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 21:24:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F01C9206B5
	for <linux-usb@archiver.kernel.org>; Tue,  3 Nov 2020 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604438669;
	bh=HALgchb57rAXLtSMIP3lmNo87q6ksmJHJO3V6ecsLCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=BgvIz0KIh2zp98MkOlaHphIUxnGXqSrlx341es3+XUnIIguLzXw61ZtGPO4NYWRpG
	 IzxlsWmmyrs0/e05QnR9CX0eKVQFplIR5NqCY7SRl4uXRv3791mtStcmDnqIZH98YI
	 SHHj+48eI23aKerJHnZOaTRFW4kyLkQ/Mtgan1Dk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388175AbgKCVYS (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 3 Nov 2020 16:24:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:42156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732214AbgKCVYR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Nov 2020 16:24:17 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5A5520757;
        Tue,  3 Nov 2020 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604438656;
        bh=HALgchb57rAXLtSMIP3lmNo87q6ksmJHJO3V6ecsLCQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=x61avsHdUHN3cJKBc+6xm+qujO63vwwbv23LPrMIP4GqRzUbrAoZqxd2GDOHXMGGv
         Oh0lx7GZPV8VxKGnELUsouzcPv9P+hCCqRPWHt5IdKCTebsSmO7v9rRanbckqGv8q6
         ZblhmXrTFXlmnj97PCBUG6xCC84AFaFpA4cE4PQo=
Date:   Tue, 3 Nov 2020 13:24:12 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Cc:     Daniele Palmas <dnlplm@gmail.com>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] net: usb: qmi_wwan: add Telit LE910Cx 0x1230
 composition
Message-ID: <20201103132412.103c6c91@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <87blgf5x14.fsf@miraculix.mork.no>
References: <20201102110108.17244-1-dnlplm@gmail.com>
        <87blgf5x14.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 02 Nov 2020 21:22:31 +0100 Bj=C3=B8rn Mork wrote:
> Daniele Palmas <dnlplm@gmail.com> writes:
>=20
> > dd support for Telit LE910Cx 0x1230 composition:
> >
> > 0x1230: tty, adb, rmnet, audio, tty, tty, tty, tty
> >
> > Signed-off-by: Daniele Palmas <dnlplm@gmail.com> =20
>=20
> Acked-by: Bj=C3=B8rn Mork <bjorn@mork.no>

Applied, thanks!
