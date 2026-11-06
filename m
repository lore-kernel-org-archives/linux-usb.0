Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981381;
	b=bbtMDaUDGHoVWExqnoKlZ3sVrm1c/Ep+uR7tAdw0Ao4HYXtO9Wlzz71Or2SCZDcutA97
	 GK3BSoNWmyR6Nz324V/0ujyNrwfFcKYW7mGbhA7oHsF+gVpwXvz07PJcQ/gaOr5lEXtnL
	 AD5geYTn9l5MIYJzoySo3IqBC7Eg5qLluYMrqG8I30pT1WHomzZcaZpXBftqswateMQT4
	 7nInWUBMBuMgxOhu8PRGcZohl2GHA186eUyFgZZzhwusx0o8CzfDbXlAEWvFBwgMWhCQy
	 qstGy51At+ipyQNoLAEh8OvaIsQdcDdbWUoD+zZHMiWhpMQD3+GKO4gWWYsi5dTDwzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cc20GCY1//PUtrFd5cPf6HXKJRlN7gGCJMKU/hIlPAo=;
	b=m+zFm9ejlU5ViVjP9DbXqALMflj+ZpYvMX64/fSinE6sVwmPfuAibSPaRA0s5/x3h5xc
	 VQSgAHZkmt2lmokrub9fanz5IoFWP4ouR7SbiHaHeVlGEGKWaKL2WpG9kUU/m10VZinYd
	 k/sG8GByr9MXjT+/15KHXhV9xnrMTCFXaiwIpDJ4rSPt6MSvPmSKSQuXlCweSJPXez8YO
	 +oEODCwD46ocRV21Qj26W3Jy/7dAZNhwwd3MkfGlvNSJDnCvqcCEnRZxwCuPtoIpH7sGA
	 Yw4OpBwl8DvvM38INDKNMPkraLH2xHRVwH1yL/NiFoYiQEr+nMd+0BiYeGkiO/XlSZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVZ7R8Ow;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7413606A334
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVZ7R8Ow
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB971F008A3;
	Fri,  6 Nov 2026 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793981380;
	bh=cc20GCY1//PUtrFd5cPf6HXKJRlN7gGCJMKU/hIlPAo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=XVZ7R8OwrRY+x+qJUabi0zuhx4jAe8mCo/arf/WrcI9PKxEI884C6AMkYMxZtUmlp
	 VaO7dGUOTizhvS7BCupeUKvrBhqsZ2lVqti8tp9aUiGkVgI6P0HbGRoEbUEnRuIa8k
	 mHSm+a9RvQ4dc29SZ4XkN5aOzjoGxNJTp8522GqCnAVP/mmTVVA/LrVQvcnHx5U7xK
	 TM3kLu5x1mXBh4EtoObHw/LHXJxuQtcCBaIAtS94q/+RCemkn/gJhn5VpFcP0asV/W
	 jNZuNVfAErLjy2w4WGVcrGQkuqKyIMuW2Fg6EJVr5bkfKAdce/cjtUfEo5oxOuwucv
	 /Pm3/FCsyMt+A==
Message-ID: <sashiko-outbox-201772@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: midi2: copy configfs strings for live
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yingjie Wang" <x-professor@outlook.com>, =?utf-8?b?bGludXgtdXNiQHZn?=
 =?utf-8?b?ZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <e638dc9ab93c4b90c263d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com>
References: <e638dc9ab93c4b90c263d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:09:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> f_midi2_alloc() shallow-copies the card, endpoint, and block string
> pointers from configfs.  Dynamic ep.* and block.* groups may be removed
> after the function has been allocated.  Their release callbacks then free
> strings still used by live USB string descriptors and UMP discovery
> replies.
>=20
> Copy the optional strings while opts->lock is held, so configfs release
> cannot free the source strings during the copy.  Free the private copies
> with the live function and build the USB string table from those copies.
>=20
> Fixes: 29ee7a4dddd5 ("usb: gadget: midi2: Add configfs support")
>=20
> Tested:
>   x86_64 KASAN dummy_hcd: the base kernel reports two slab-use-after-free
>   errors after removing a dynamic block and endpoint; the fixed kernel
>   completes the same descriptor requests without a KASAN report.
>   x86_64 and arm64 MIDI2 function object builds with W=3D1.
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/e638dc9ab93c4b90c26=
3d7ec836735eb17335cda.1793980732.git.x-professor@outlook.com?part=3D1

