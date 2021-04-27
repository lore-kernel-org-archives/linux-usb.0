Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF8AC433ED
	for <linux-usb@archiver.kernel.org>; Tue, 27 Apr 2021 09:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED93613C9
	for <linux-usb@archiver.kernel.org>; Tue, 27 Apr 2021 09:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhD0JyB (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Tue, 27 Apr 2021 05:54:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:49312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235427AbhD0JyA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Apr 2021 05:54:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7258F6008E;
        Tue, 27 Apr 2021 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619517197;
        bh=TQtN0zY4ZPS5CoiWLxwNLGJBPM5JnWd/ASJFPyDfVt0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=t56Quju+XrWZycO/g511+OwHrSDHndQoWT701k/yUxdr4/vrFDuHV6TnmMVQHfBsk
         zLMPk3eGt7KfOo2MxDo59k01yUjRDVDxwm/OwOqClWlkzbnVHNI4ge3VJ9ftJiR+tN
         Zy2t/GX575kZnrlkXaEVxC8J+ZDeXMAlkl6erwqtNC06z/ReW1EzGkLx35W+tTIw30
         fJZeXqILW7eiAjJ7LeHrZmgUIIN7ToeIKCwScc3djc94ZlRTRs/BiXAgfnHcEcQ466
         BqKVNkx1lPJ7nMkem4qzkvBlKX8Tgzb/8MCP4zkGPdQiKxHOyWmZecmcDB9HnfuaKt
         CcX4eltjrQuCQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: core: Add missing GHWPARAMS9 doc
In-Reply-To: <f4c491f7614e623755fafe640b7e690e7c5634e2.1619471127.git.Thinh.Nguyen@synopsys.com>
References: <f4c491f7614e623755fafe640b7e690e7c5634e2.1619471127.git.Thinh.Nguyen@synopsys.com>
Date:   Tue, 27 Apr 2021 12:53:10 +0300
Message-ID: <87wnsojbp5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
> Add missing documentation for struct dwc3_hwparams new field hwparams9
> to avoid kernel doc build warning.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 16710380d3aa ("usb: dwc3: Capture new capability register GHWPARAM=
S9")
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Seems like I missed it during review too, sorry

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmCH3wYRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZiJhAAs4HqccI2qp1yrH2kuWjE38x87GvpphRz
IEA2M15YIIkE4uN2x4r7dzKckkrNfjATtd2t0WdMVUAp5yYwswceWyoWu8S212QZ
a3fxc26lCU9sAS2tpKIPEWy8caqv9reDtM3GXxy19oH5Ip8Lc0TeG1CWNlCrpqdR
kLFYdyX8wqJUSc78bL8B476MXLwsU7ctCbnOQ6UED826E9s8d4JC4oL1OvSJ8not
LvKX7t/ZggdP2zACQJOkxFghzCwmE5GZlxDXtIK8rVGNrtz2+RtRlta2KdOmrTko
I38E8pTZkyHxWbRIrbQuyBwlHwUT/i+OB9mdIq/cnEefIr3yCc7oiPPfvDJ3w0+h
b9KHYk8mGK+zUU9vF8VHxXsxcbAOhtCVflWD/Dr8fpFf3TIqhrrgblfXd40kwvYp
UJfzltioWUT6o3hXlAjQZKPvq4mtCIN3EyOA1KV0q1HAl+AnK5kjSW4QzWLDKn6E
xC1wyIBjxnJw2B1OKlbA1cCjk6farKAAw+FO95CUBPWSBkuln5gx3zvqT854q11x
N3vzCXsG+HdC5LUBPwJx422YlsIWZH8wruxU0DUIwZQ0NIt95Wh7GbDFQMzY+/ZJ
mBaYjY6n+3myctiS4P4TzEk40Y9AAVloTy4NZXd/TeS8BPlujY7SudnMfiPqQfWQ
AUr8jL3obe4=
=bWVY
-----END PGP SIGNATURE-----
--=-=-=--
