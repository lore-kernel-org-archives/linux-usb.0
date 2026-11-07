Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011906;
	b=f/we8Ceu9XEgVcu2Rv9cFTXp7Z9gL77+YVB89gZhLGC1552Bv6MgX0yWFzEmsOhh+pvJ
	 N8XAEojKJbnzzGdOtbqCHf7KCjzYfeFmp7LzHln7H0RmUKlh8SvG7x8YJ+121urRzVDiG
	 guS4YxGOBg6FhQon4U0JIuWvKiB4OBWaJqZ5P2QsID+vNyCDxWHvd3LVSAN+OhMZC7fp3
	 P5fxd8V33rnKwCJD/urQboS6Ov0pKOownwplUHVwWtCpRL/KqqBQKr0bkBs9L2HeUsq9p
	 iv+ZoxSXyKaO7yybcI/aoJkBWslCg2bsxslLeQ5ZEP+SY0E2FJHvZLMyp0dZp1MOfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011906;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mnOJCz5F9dV1hmtF4uomCFDHxAC3idjqGEe5wkWxC9o=;
	b=qzTqd1CTBxTlRNiZX9tCRf1AxkjqRflamuS0ns+q8soF45GJq2KFPZufZnLbBxkctTAN
	 KgJq4Xtyhvn3awgpswzOA95wpq3Lce/+dtD51C3BqQQoe5eJA2zbqbFxhP1Pbuwa85jCv
	 BBofktIDtiF988ACGPsalOxp6rhDkMptvnTq3KodGhOD8FwtGv1bHtBbB+RnrCVhFu1Ll
	 WNZHx4vn42H8ygCU/L84DQZJThrC6EzxCWZgbOtBAtkuTbbFo5Te4aebk3c30HFagasIM
	 mHeLk9WfBH64xwn+ZHfj60Ax0+cV5NLGchE9Gm1PnDp7+6YJZkCokcDFocQrc154rAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itc19IAY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B8C608785C
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 00:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=itc19IAY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC321F0089F;
	Sat,  7 Nov 2026 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794011905;
	bh=mnOJCz5F9dV1hmtF4uomCFDHxAC3idjqGEe5wkWxC9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=itc19IAYvxvtWv+MD7KP2C+mEuJ8b+bON+1VertZh3mHAerj6W1X9VZDrZNxjqW53
	 xWEnijqVw7SrDZ8FTCpRj8OEAiaXwEBizSfUn66aRUl6c19tZkHH6kykokiSGclOpR
	 dV39vqiO2MZauAWlqpZ8hyajWZ+0rE0G0fKFrYjmvJIMT7MpgxXJt/J4P9iqvOl7Bg
	 fcCGl0/DA01PsEiIdSsvKbVbEOQyQVeLZnj3i2QaW5yFLe3T+yLtz80xuMbs+3SM5d
	 txK5aEi6BIUs4o2SXQSWxsdn4bvdOWvRbLt2Ggv0XPKaUS1cPD1igrrOo/J/T88PNq
	 29m+BS4BOWmFw==
Message-ID: <sashiko-outbox-202436@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] usb: phy: generic: convert to
 subsys_platform_driver()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Brian Masney" <bmasney@redhat.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-usb-subsys-v1-1-3a86369c3f86@redhat.com>
References: <20261106-usb-subsys-v1-0-3a86369c3f86@redhat.com>
 <20261106-usb-subsys-v1-1-3a86369c3f86@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 00:38:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Reduce boilerplate code in this driver and convert it over to use
> the macro subsys_platform_driver().
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-usb-subsys=
-v1-0-3a86369c3f86@redhat.com?part=3D1

