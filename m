Return-Path: <linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0FDC433ED
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 08:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BE666145A
	for <linux-usb@archiver.kernel.org>; Fri, 30 Apr 2021 08:40:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhD3Iku (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Fri, 30 Apr 2021 04:40:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:44670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhD3Iku (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 04:40:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68AE76141C;
        Fri, 30 Apr 2021 08:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619772002;
        bh=xvM508RyfE95pZbKplnGyvckQhWLa/1HYLxrv0FgBXw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M6eENqOma6xndVMWmzZGV2A8iGMu/eG4GnlZiP481w+9HNT5ZWOkJBjdZmfFmQWiu
         kMlNgXAtU+ABrZn2dXaIeprn3s11p+vTYrzcotZK0SlwIChoQGC0TnLB19a0nz5vf4
         AO3N9N/Ivd0fbH7qOLA4s8srNcrOXEc8iOPR+gGbTJPjFq0M2uhel2eY6NPXuvFBs7
         yHc3jrt2roW77djxfMu/pD9jNnXS67zy3kSqChVRZdKwIYanyWiYcsov0c3jbfDvfj
         lO2ttTP4PXsiArHx+NH9o5Drjw4vux1o3AVFs54Kv/AqRZE/gbH7Rr63X8SpGqBg2A
         8XpZ000TQ2g4g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     linux-usb@vger.kernel.org, Wesley Cheng <wcheng@codeaurora.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Jack Pham <jackp@codeaurora.org>
Subject: Re: [PATCH 1/2] usb: dwc3: gadget: Enable suspend events
In-Reply-To: <20210428090111.3370-1-jackp@codeaurora.org>
References: <20210428090111.3370-1-jackp@codeaurora.org>
Date:   Fri, 30 Apr 2021 11:39:53 +0300
Message-ID: <87tunoi2sm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Jack Pham <jackp@codeaurora.org> writes:

> commit 72704f876f50 ("dwc3: gadget: Implement the suspend entry event
> handler") introduced (nearly 5 years ago!) an interrupt handler for
> U3/L1-L2 suspend events.  The problem is that these events aren't
> currently enabled in the DEVTEN register so the handler is never
> even invoked.  Fix this simply by enabling the corresponding bit
> in dwc3_gadget_enable_irq() using the same revision check as found
> in the handler.
>
> Fixes: 72704f876f50 ("dwc3: gadget: Implement the suspend entry event han=
dler")
> Signed-off-by: Jack Pham <jackp@codeaurora.org>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCLwlkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjytgf/cj4/OLG0/bU8IURgAio0/Dt/w7Ygaizx
0PobXYQPMMcFt0xfC8Q8Zo5vznbxV+1eo7MlKXIC4yYmQtcSn9O8mPJTQeynuhrr
aw/vz5AqsMNGt49UU9QylpFuco97rGpsTOOW0IkjqvmNKeMnMbQDNeAlspk6x8JK
veMzNt5836j7/NnQcDfWHRR4o+uCPdLyrk9HjLE8pJwD885/J1R2jWXAVfzA5wyK
xRRlOuXo7YPvRbFYNPlvxcwlRPMeS2+1CwlLaqfAKjCXqERAMbC9sDPBGfgp8uvG
IY7iv2G0vATubAXyA/GK6ywjwiK97GgNtY7eDA8yUFlVzkoXwcA7Dw==
=lXHC
-----END PGP SIGNATURE-----
--=-=-=--
