Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562521;
	b=ELBKvdLFhLcCs3ItYyBVTimZUT2LYtIbmI1XH7mqQLdEipZCWQd6/Nmg2zaEtxSrfMF7
	 B4tcHkW0s34sTyIxAbSUlf4CwZRvpZmSJUPZfEzndH/316imk3B6espspToeq9fN3P+af
	 nQvyWCODGrCdOqVuRMbbCHxXeMx4FqsBkNU1WOp8QEJWPwbfT3umwk4E1vU+tBe7K+GyW
	 Zz0uu5UaadRmfjLFfHERyqiDdS99BzlYYBEGGrg4ukjSJecfkI1Q/k1xpUb4sfXEtijrQ
	 DJc7VJc4gpplt5fOBqvpHqSNJYMop9QyJisE/kJe2+4NKQlefNZ2xGJTsA0mQLuIqbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Bf/f2M2r/z5ZFpAnBjCr3CYVVwCFpLdvvK7I+lYzwv4=;
	b=KhLNizNW9bZFo0BlAr1aI1VAS0zFj0S83jTTQhe5Dx9+6Bi4RIpTINWFn7j/r3lb0IyT
	 ExKVCI/CeaKCaZkv1HRNYcna6TnA43OOYjZanUBUzutSaGPyhrSDJB6zOZ19w//4itoh1
	 BUP2ouSGpPz1KnwoGkgdn/dZUhAih2MvqBY8MBh5h9wy+3MZTg85PypUArOi+c7lHtsof
	 Yp/gnhCepreBBh1mkXXT/j8swW6AVgy3Nhpwai3Id5APicUWbc5GtevukbHYEmJp+tLHm
	 ny+uEubFM4BGzswpsowaTjufIGK4zoT6fOrqzo8pWf+X473/bBH17ssbOkMW3EBhcVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPvdOSE2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14189606A31C
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HPvdOSE2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF791F000C4;
	Fri, 13 Nov 2026 09:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794562520;
	bh=Bf/f2M2r/z5ZFpAnBjCr3CYVVwCFpLdvvK7I+lYzwv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HPvdOSE2IQh382A07ZlghKS+JyalB0iVPt7PzZzcOjtDzfP67dFFUKmkZ+GZQJ45P
	 HL+a4NYUwauPdF84im/B5YT6CqYpN46bDZedRAceRW/U+ZGfsMD5l+1kxCz2nkNLRZ
	 gitx0578ZOYmfCc4HUP/onVX/arZCdMwUbkwY4rhzzMF7f4PRczIvIKNL5UfhNhY3W
	 fNGbjWVjj8ipAcWvZO00BNnbGC+V+f1hevw4NPB0Yt+K0JmIHKr2KMPE/OoaTfT45V
	 Hf8wiiJ1E85Moj/Q+i5tRK/xZoav60rJsAcczlC9OlTu7cGjKaVgF6fyPwenb/A3TO
	 5EnfHytMt2TBQ==
Message-ID: <sashiko-outbox-212554@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] usb: gadget: configfs: Leave resetting the
 deactivation to the UDC core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-udc-connect-v2-3-f51b11f07eb8@flipper.net>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-3-f51b11f07eb8@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:35:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit bf95c4d4630c ("usb: gadget: configfs: clear deactivation flag in
> configfs_composite_unbind()") made configfs reset gadget->deactivated on
> unbind, so that a rebound gadget could connect again. The UDC core now
> does that for every gadget driver, under connect_lock, which guards the
> flag everywhere else.
>=20
> Drop the unlocked write from configfs_composite_unbind().
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-udc-connec=
t-v2-0-f51b11f07eb8@flipper.net?part=3D3

