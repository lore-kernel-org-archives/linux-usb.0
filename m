Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739917;
	b=jIL9JKeeto6hFXMtZM/JJe4Os/txGIhgtlo+SVkSxKf/OF4Ik5ljgJiH7RJcZO+KCOPo
	 mQpANGLfBouVNInzqL/fsuOKeZH9l4IyIsWOM2dsru/Dkx6vYZ9PMmy64mspNth8qVm1i
	 0xj5t81XKkhVMHdvMLuIQPds37C6DwP4/xkNArcvdroWN+h1FN/5NvNfH634yuW8k00wL
	 kJm3Sz0S6+GQnOj6su//jxVFipfUy4PI8puxkOPPgsVZhg7As2f4q9MT7HbToefqHT6HG
	 mn7kWp3KbiAyr+CvT+OAtyx3IasTnlpEuZL6dDk/OOTa/6/lNGuoHJfx9dEm5rhAJsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739917;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tK7XioNWeNfEqEnzFzTwTrF1x6+3BNejlJnJ+Nbnjpo=;
	b=3h0Xlg3c+Q4h1HI67blm/RfleK6NL5sbm+LBAmTRw7qmhx2Qpzm7aYqIEH3ylxQB58Ow
	 jK9tYo5SBPq9ghR4Xpv0RnvkjDMxwI5LZu8i3gk4bquxWmhu6e/a8RXc7hRpCT9ake1Ti
	 6DudzbzbK6zP9kDaF/MBTEuccJlPRgz0Y4micrf6s4Nts/nmHTnP0ebq5fUID643IxQvd
	 qaLm4SDhgKr8mpZPQRHoCWZOVH8mMUgPOtnzBk9KnRCVbjRJ9mx7N1HF6OcoxBceG4qTs
	 6q9JJ16Z6FONG55J6LLLKah1gf9uQH16oYiqnV0azE/g16eXQLuKBfQEegktkZzDILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHKkkKOK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAA606A894
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHKkkKOK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFB71F000C4;
	Sun, 15 Nov 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739917;
	bh=tK7XioNWeNfEqEnzFzTwTrF1x6+3BNejlJnJ+Nbnjpo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHKkkKOKuwPlFUlq7PQ2aSUC+g99Y/HoqK96iAasBRM7El23vLplgFoCbKfw2kRpN
	 LlebBuIupaKayA2r9Q1UMVmm17JZlcI97YEUoJFMPXOBG5Tx8+bMFti0qFtLPOJT0Y
	 glPYSrwBohEeLOs0lm2gWNnE7fNDRPllOB9Keizp3CPTObdfNOBiOpU6CXdHnL8pzl
	 nLTX4voIOsk/LQbr9tiGlmvBO6jDSy4kYjsjHbzhoh2kLxHWz4GH3nz21RBmp88T5i
	 LngOQjbgp6YOrDgaWXoxfSHAxDvb+TkficoFwHg1UpGQmQXNKFrMi/eB7ILWkwr4VR
	 k6wnQgHMIySuQ==
Message-ID: <sashiko-outbox-215423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 10/13] ax88179_178a: Add ethtool
 get_drvinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-10-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
> to provide information about the device firmware.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D10

