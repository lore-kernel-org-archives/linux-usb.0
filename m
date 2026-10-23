Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758651;
	b=lcBlfWK8GJ87t74yX+rguKobNKSVUEeXWoIDo4TeF+HOsUX4IoqvFLivQr8/yozVjmo1
	 m0EfGXSktbyV6HN7wF5nVjDDIi7+Sx0wnyRo4FneDNDagCr2wssTPmII4hymY1lfn7H15
	 mzSJY/fyn6z3j9+CyzkvU+g/78MzRWzQfEjxuL+3Yl9DSfxqP3DqCpJoY1BAO0lxF3ZfD
	 OoOwte2up3ZgVu0aj6FriDIzZiLFsvWL8SCWCg1VVPa1Zk7jChEz/JtDXX4c1vCKD0TP6
	 tvi8vEIM1il8G17bDxl83AahadgKsSn+RajAwQ3HPHrKWVCwKSflYUDeJ0PFs87lQqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758651;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ynmD0Sq/9OGnJty/JueuOwIowfhxTc73fFP+8POYGs4=;
	b=RFH6bVuRRttz27exqdUky2AKFUcRj6/b7jN8EDk2vZsJ14sAoa170nuNg0B5HMno3qi2
	 htIuLVbLCdKKZ6GbpAx6CGjkkFDy9rxn5QwxFKCZ0sqE+c0hH8JhqM/tTolHNTrGPSPra
	 RnXwgN3MepU0UQabwtV7jy16Weleprr9Z1h8DvfFV8oqZJtPbAAlH78CTgDgKNdH8cU+y
	 RbokR1Boe4iuIpNiEfn7rk6dWbxh7dyMRQDnqDgbaAI5uGkX8joLuFEgO1GkFdwtu1wIE
	 Wt9FCZnCSDPnjLooKIpY0nngEx0bs3WIqmsSoI5Ldevlb6ybnAlJ1+HYwuBcBOU3VUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=la0HZNiW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD89160A2606
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=la0HZNiW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59A971F031EC;
	Fri, 23 Oct 2026 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758650;
	bh=ynmD0Sq/9OGnJty/JueuOwIowfhxTc73fFP+8POYGs4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=la0HZNiWAU7yjA9HjRYrQJgoM+8vmN9wD6JR4mOJkF1riUtAvzJy3wExAs3s/8Wdo
	 q475CB4jK/SuRBO/KhAbKmyOmiCgmyhM2jFt1WuMmi/dRKwvGnCtg5SohFnKkZxSGj
	 Nq2dme2mH4/g07rqevn2zJ1SLB1tA9nuaislZBqwMl0I065JE1bjPXabihP2q0Zfrb
	 eJK/KrePK2GnIfyYgWUheTHRhNpdNiJ5gd8z+nW6GytboBahAZP2SB5HZUV1M4TlgL
	 buu5LCWELZ9IjP/sYVHpjrcThTAA+v+ia/yHoX+0n4csjYn4YGmALtPNbHpp5gRMfD
	 z67qFcVYMps4g==
Message-ID: <sashiko-outbox-182769@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/12] USB: serial: io_edgeport: fix potential
 close() use-after-free
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-3-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-3-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:30:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the missing open check on write() and locking when updating the port
> status during close() to prevent a racing interrupt completion handler
> from trying to submit more data for the port while its write URB and
> FIFO are being deallocated.
>=20
> This issue was flagged by Sashiko when reviewing a related fix.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Link: https://sashiko.dev/#/patchset/20260714101316.823942-1-shpark061104=
%40gmail.com?part=3D1
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D2

