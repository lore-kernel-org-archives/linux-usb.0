Return-Path: <SRS0=8+e4=US=vger.kernel.org=linux-usb-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_MUTT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A1D1C31E5E
	for <linux-usb@archiver.kernel.org>; Wed, 19 Jun 2019 12:14:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1270F2084A
	for <linux-usb@archiver.kernel.org>; Wed, 19 Jun 2019 12:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560946462;
	bh=viZCpU3ySO88xcftuhoxzMqd1UsQYhWRDk4AqSx7aJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=QvbXIUt4H4GOdIINrR6E5zu5B8SaMUyq3rfABXUk14W7i4He4DXtiz4rmpq4RZvcO
	 ArolRV44YS7kkCW5LmsgSDZYxZDUEGGYI6g/ixaYsnQgky7dxqh2/mUOiBxSak1Py2
	 qugpvDpEegIn22dQo8FjSYZgHYxHrqOvdTJW6jW0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727244AbfFSMOV (ORCPT <rfc822;linux-usb@archiver.kernel.org>);
        Wed, 19 Jun 2019 08:14:21 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:32825 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbfFSMOV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jun 2019 08:14:21 -0400
Received: by mail-lf1-f67.google.com with SMTP id y17so11963044lfe.0;
        Wed, 19 Jun 2019 05:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=viZCpU3ySO88xcftuhoxzMqd1UsQYhWRDk4AqSx7aJQ=;
        b=Tl4qvhtXlPL1NYFRW627bwSgKns3rhzsO5X2Oki52GwHwfgmbtWtNQEkgISmFEYime
         J1ai+/ZWtUd1gSRaNSenJS76CE7xe2AsbQzB86IZ9w8y+5J4yzG0gr7e5ba8ynWM7C5/
         +nFsujzKVOPYK/mX8BBBWRkWredn8QuvoanQf+hxJSsKAB1cR8GNP+Hyr/3VmrBruLnn
         8/gT4/Udu6ElGdBFFi666520rP8J80R6SI8V1Whi0z1GVjHwYfehxL/KGK/bS+gorEKY
         J/XgEACoZ3pCzM4znNa0YsYeYWyPXoWxsua/LU7PgQwYp7GTyDEo6r1pGkfNOzO+7fAf
         CUsw==
X-Gm-Message-State: APjAAAWV5wqUqS6SZCpPkniG5zo/iZ7ceudReRouI633uHX9LctaP3YU
        7KjGgbcoOEieb6RQ1i2+RYfKbRl1
X-Google-Smtp-Source: APXvYqz6WWr/U2IF0nUtMuppVMrbghBUZxv/Ikjj4TrGtdMHpcmTNPYlGuTRxYIc3CozD/pJzls01Q==
X-Received: by 2002:ac2:528e:: with SMTP id q14mr32695444lfm.17.1560946458790;
        Wed, 19 Jun 2019 05:14:18 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id q4sm3407092lje.99.2019.06.19.05.14.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 05:14:17 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hdZTj-0001OW-6r; Wed, 19 Jun 2019 14:14:15 +0200
Date:   Wed, 19 Jun 2019 14:14:15 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: dbc: get rid of global pointer
Message-ID: <20190619121415.GE25248@localhost>
References: <20190611172416.12473-1-felipe.balbi@linux.intel.com>
 <20190614145236.GB3849@localhost>
 <877e9kiuew.fsf@linux.intel.com>
 <20190618143120.GI31871@localhost>
 <877e9if5iz.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="0OAP2g/MAC+5xKAE"
Content-Disposition: inline
In-Reply-To: <877e9if5iz.fsf@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 09:33:40AM +0300, Felipe Balbi wrote:
> Johan Hovold <johan@kernel.org> writes:

> > Are you sure you actually did register two xhci debug ttys?
>=20
> hmm, let me check:

=2E..

> Hmm, so it only really registers after writing to sysfs file. Man, this
> is an odd driver :-)

I hear you. :)

> @Mathias, can you drop the previous fix? I'll try to come up with a
> better version of this.
>=20
> @Johan, thanks for the review.

You're welcome.

Johan

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCXQonEwAKCRALxc3C7H1l
CLNDAQDnkOId8dM/yhhOzEsy5JQBrdPd7iFBM1eD6McRNfeyMgEA772CFu66cAam
8gwvYuIB1uyXfKNsUYLToq9AApe74A8=
=mlev
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
