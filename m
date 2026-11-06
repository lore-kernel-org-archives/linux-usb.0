Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952379;
	b=Wh6K3KElSPGXKmH9l/VzQRdUHYwYLYvehA9QBEkXw7jryE0srksmN059f1Ld5I8dy40P
	 p/LWelthWPaJ4cPRwvcoQmy8sy0KhN4SLCjIcMLhVAS3YjQfiQwPo9RyzgNocgleAN0AP
	 9Dfc2Ae8QmAnj904TnuwHylrWEeEdYNG58QUVQKEe9kUcHZKdbl/UjtoWa3arMhMc4mEi
	 QVDDgjvYZEM2KKOLOTa6b2vyowblS02GAVNEGBjcN+fukoyfPPZ3IDrcjkzBOrJZm9f6e
	 NxKEgLCbbu5BCfTChp0ODl2G2NPJuazixVi6EnoC1Rgt51fa/IMbTnIoRIEG/Ipj3FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952379;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RDp0mxwcQOrWgk2BRdymC3OSzQpyooEhlIe+Jc0dVEw=;
	b=UHrTLbjMhSj9wnIaVC5eFv5B83j0qPQ1cVjbvdHmndqWOH5WVqf7dmD+Gr1MATwOWf89
	 m6y1rngpH6/YoCx5av2Udb1WEcOh4i5MtuHHv35cBAYtcbTL8YFfuoGiWky/gUNClzg9u
	 VzKZjueS2lT3omrXm/X4Vm/pWRNS6esfhkFR7EBkE3eP1Hd47Uui20KGOgCOpAYcfjmzu
	 7r7g3OG6AxybgOX2sOM2jbAF7dzrpl5+eNlYBCPdrLi+614jxis5YoJnpQchcoh94AdE6
	 hHGJffeUiEHp0UDwDv/wxqjD44qBBWtk1FAZHwI0zdNwcNMlAP1fKEtEgcp7gfGHnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KwRHQ/w/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE1606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwRHQ/w/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6071F0089F;
	Fri,  6 Nov 2026 08:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793952378;
	bh=RDp0mxwcQOrWgk2BRdymC3OSzQpyooEhlIe+Jc0dVEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KwRHQ/w/RailqWdUdxbf1DlufAVv/qr2Iq8Ilo1mlMQ7jFKEx2zCTFrwg9cehlPuP
	 h2c0RtUNahQlK3kBeTw3wTRBHn6xGsN98YW8BEcEfCC9yS1G9Ysx9CbmSmAQ5/ORm+
	 GRzrRmDHz/ilIaCjiuoJsvIjEAkG8urzyJeLUVODqYXkk8T44JA+yDlZJcz8916Oyv
	 S39WAkqzh/J553L32wSuqe7uVGMw0FRuC6VKnMfcOVAveYFJiOn2wLbQPBwZCO3OWb
	 n8dVnbpz2Pjm3M60LJ3SxXK1pfYjb0XtaUQnRYJleK/o/FuR1rfLySO7te8v7edA1F
	 6IrgsBcqbWaEw==
Message-ID: <sashiko-outbox-201021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: mct_u232: fix NULL-deref on open() failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106080155.1967097-1-johan@kernel.org>
References: <20261106080155.1967097-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 08:06:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The driver uses a second interrupt endpoint for reading but still
> dereferences the port bulk-in URB pointer, which is no longer overridden
> by the driver, in an error path.
>=20
> Fix the dev_err() on failure to submit the read interrupt URB to avoid
> dereferencing a NULL-pointer.
>=20
> Fixes: 35807187e4b3 ("USB: mct_u232: clean up read implementation")
> Reported-by: syzbot+58b2d8b19cd6761a395b@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/6aed834c.dadc8e63.45095.0003.GAE@google.c=
om
> Cc: stable@vger.kernel.org	# 3.10
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106080155.1967=
097-1-johan@kernel.org?part=3D1

