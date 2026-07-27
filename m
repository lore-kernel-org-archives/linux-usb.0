Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF30B3CF670;
	Mon, 27 Jul 2026 22:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785190435; cv=none; b=Hyv7peBfEiiCRaHXfuey4qQAoTBoQW+7s1FBNkP6nn0OltfyGyPgPlpgMdSMRZNQcI8/zQhgr1VmSDaTTn440uuHR4HusJSZQLVIx76qLu2FYrGklpYMvEwjIC21Rbqvq0nPy7mjGHSBXH6+0JPbgxsFulsNrmAP9x1N0n6XSJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785190435; c=relaxed/simple;
	bh=7HRdo5lWL0NKXPhbJw2Cxby7bQ0TPgn/2i9ZGXXDXgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ti0xi6n+FQDfLBqfQ1N4x/MwToSm5913k6cb3eLmqknivbj8Kwc3w49jYKyweNaoS0W8CBvKlo58x9ITZOV8XzyMEbd4dRShqpSVlu03QK5j9mBPiL7IUwvW6mXn/UfJVWOhIrs7qbIT48YPMSAdSDChgThOrWzVWlARztm4LXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com; spf=pass smtp.mailfrom=invisiblethingslab.com; dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b=A1rfGZeE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nF/RrYpi; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invisiblethingslab.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="A1rfGZeE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nF/RrYpi"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id F24731D00071;
	Mon, 27 Jul 2026 18:13:52 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 27 Jul 2026 18:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785190432;
	 x=1785276832; bh=vYS0xXEeYA9rj9xO7sCrN+QFnzSeIAByUzf6qfAMg6I=; b=
	A1rfGZeEltNc03STRNcBuz/33BU75Y2RENf7jVQ0iM0/Pk8kpyYZnQGFHP9ntULD
	BoERh8tuipXcyxhGkijsM66NDjnGALf26B7oVZnMbLVQzBXftBYL6gWSpP02i/2k
	dcz+nqGpW8yUhNYXLjlC8qA4m8oHmXLiEx3tb67eO+P7PCr2FISSh5uzzQtT0cwJ
	W04Vr8Ln5dzC+9uS/rfrMy9Wkn2qFRgAYOpBJH/BSo6QNqN6RBaon9HOne3dtnV+
	gyCRoTrmAn8zXQr2nPpy6/zle26TUt9wzwpbSL0SQMH4JTGKzDYL7kBDaNGN4epY
	DkG+Uaf6tEJO8ZStc/3F/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785190432; x=1785276832; bh=vYS0xXEeYA9rj9xO7sCrN+QFnzSeIAByUzf
	6qfAMg6I=; b=nF/RrYpiQ8CVrpTSrNH+ZdrKX/mGrFS9s3yKGawwlhmhDwb8L0p
	uTPET8pRJloxDSXsatzSWb5UT84UPqA0eHdnVW7325ZPB430Rj5DgwdZynF1bhkf
	1Ytthqe0OD42DraLvX4Z93Q3iBGjrfsWqE9EdugA9c0J6fZxTwWSd5+Fs6kIGNjb
	0hRFyM/FPekXoeAXeMLBtX1jboBFPQdNRBJXxQt2n9iez5efwri+WZRCfai74IOU
	SoPvp46EEjDyxpeBVOxnnqVa2d3OdtFZ39VQmD5HBisQ/WNDmbdKCQyPAQd6BxIY
	leKNwNUoHmXe462LZLBrwjwwEklm/8a2bVg==
X-ME-Sender: <xms:INhnap8Upt4dm_TaoCzRXEZz4fVLEDxeoyRjWNVlmcwb7Wgi9qf6ZA>
    <xme:INhnanwBHzp9pSg7F0nAytfpejPsTNfvgYdbLPcILNTrgUocR8-MfI27g_Dfblypc
    hfkpPEl7uJcyHnSavPxTaxGe5mSdavHv-y_bpiFhK69L1jx9w>
X-ME-Received: <xmr:INhnam5ls_RcJoOBKx4n-z6AXgdGtyAtEdtmzfA1N0qUKTNu0uEqUadwW8oF4DR_I32kuI1KzEiyM0cpADkelvtoAfBQRHzTiao>
X-ME-Proxy-Cause: dmFkZTEGT8bAaOJwhfw7ktivcpct8ChjMjKmELRqOnkMGr/piDpGCD6t/TYFdRxt4X8vgy
    +z/myw6nfhXiw2JGLk1NbmcT02gy1c9uDz1cf2qWO+w2o6bdbBCxxARIuwfFaOZ27wP7yo
    ejUUKEOXZOYffwTPFyCO3W0KTeNHecltIVK7ElZrPqmJpXMeKhUccuZZLvf8WMmY0A3TZl
    4OtBK2yFW16jy1frBnhWoQlrFi2V/RYigph6flfjDJh1qVxqJj1TQBA6JW2Z4lfFdAVs+F
    t2cLDBjNznQUCZddyC96Ec32Odbyjm5GkHyc++0+S5ZK++QZe02mplGw8CeD1gFeVMNIVJ
    3iwUAF8uBiskOU/B7TN9QeKxUqBYGY9PjceoaM5rdVIJPOgRRV4vkqCNjA3XCRbOpj+aCF
    xc3+GgSz69c/7w3s10PClx4B0jhrtnGUrGLF8WCWr5ohZriQ7P9TPhodRJYHD+acoKnjtG
    tf5Q1Hi5hUtoS+S2aA8uTBv7gshDefnfLEojGcB+Yh5KiC2iL7lKj1a6rDxD45+hHzBXMm
    HpgOBksFGcFNE4dRU0epWlG/YjYU+RBPNrRR4vYdlNDUdxPuUCu425MWA63lWNrdE/XJjn
    cug5dEWFh9kC6HMASHjsvQSi90IhUqkoyOnrfwAJISiELuD9xgOD9FxfKNhA
X-ME-Proxy: <xmx:INhnau_-U9HLjtqbBG-z1wkfehvpvAWjn6jH1eyWTwwtVw6QHCoR8g>
    <xmx:INhnaroDr3FojgbbcPYDKykB1c331bi8BlCX2Yuxw_oW7vDnGQIv4A>
    <xmx:INhnavrPPtWIOUcNeaqcA4suv_gxaaCH69k4BEPql8aJ4pdEZu2eqA>
    <xmx:INhnau23T-lVH_kRcOb1iSebk2v3oS70cNEhMSdDLF3vYGEMW1TXrA>
    <xmx:INhnalzJWBvtwOjINDtcK4ubWWW-SMX69ujZdZatIvUh36-qsZtUM2vX>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Jul 2026 18:13:51 -0400 (EDT)
Date: Tue, 28 Jul 2026 00:13:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Woody Suwalski <terraluna977@gmail.com>
Subject: Re: Kernel panic in nhi_probe()->icm_probe() - Linux 7.2-rc
Message-ID: <amfYHcjnKTQ180r3@mail-itl>
References: <amdezCBiW4fd_DuB@mail-itl>
 <20260727140527.GM2365036@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dbZkQ/gFEv4Z+Ps8"
Content-Disposition: inline
In-Reply-To: <20260727140527.GM2365036@black.igk.intel.com>

--dbZkQ/gFEv4Z+Ps8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 00:13:49 +0200
From: Marek =?utf-8?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/PQ==?= <marmarek@invisiblethingslab.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Woody Suwalski <terraluna977@gmail.com>
Subject: Re: Kernel panic in nhi_probe()->icm_probe() - Linux 7.2-rc

On Mon, Jul 27, 2026 at 04:05:27PM +0200, Mika Westerberg wrote:
> Agree. I think the problem is that the icm_probe() fails and then we
> release the domain structure and the complete the ->domain_released but it
> is not yet initialized (as also reported by Woody, CC'd).
>=20
> Can you try this?

Yes, this fixes the issue, thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dbZkQ/gFEv4Z+Ps8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpn2B0ACgkQ24/THMrX
1ywA+Af+Oh6mYNqOFFAqJL4TWWxuBTdgURfFgmeQhH2IOeF78gAGJAwoL92WU8PW
OlW/2zwGVLSp/4zVb1qUnARP147TKY245JAI8d5ehdy9g7kRK7WTX7v5XP8zoNCn
LeMtACbW3v7Co+n6/obZMPqtvJoA9tvE6uIQUmg2yXcgMRI9qnuWLbqT3xMhgJrS
Q8kEP4sGw+QvvBMUGl0IRChwjenehif9fMTFd00NhOrGWKI7JWFFK1227+Kdjb0c
Eo+3Mmyn6HZRw0qQaa9oAcs94RLmFvy/8ws0xOVeet8TzAlOkygvEyeBArmJ+Ob9
Edun+1vHSPnLf1Xi6mEHijgfDotH4A==
=fCew
-----END PGP SIGNATURE-----

--dbZkQ/gFEv4Z+Ps8--
