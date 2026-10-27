Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113621;
	b=DHbsVts05yXRMsDCUxDQAcFZO7bhSKjWDdBPwdM0iLDw3iJ2Vs478QrpOMM4iMWvTbjb
	 /W9zOSVptjQ/ng2k1JcJ0zeH9F2iyohx31cjKP58i4D9pjpmzVvRyE9Kuxcd1+Y/HnrKX
	 jlAizbpnfdXRjPlMIEK2s1D7vf7KcJiwFAH8bo0XjathbRhalnkGwDwPlm2bgX7SUrTS0
	 frcI5mph5tHTY7Zx54dJpI1tOiuRzbLmkVrW5u2fYQu4mGE+BvczRduLWp90l/24JXf25
	 PHD70NOM8/o4YCgOS9Cirg/S+RhbZ5m/YzEPMqmXN0MAY+OIKweMAyq0VL8LZEdMXHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113621;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d91dhD64znH3QUtzK36ul5n+F7Z8tsR1lIkAmmuAdA8=;
	b=Bb6ogdtiYqW/Io928WvnBtnWle9u48qkaHBYJYTt/8KV/D2gj1Mis8S0tzA6/He/425N
	 BWFKIs5c/AJ/jSgVbXCJVog1TVbQPG0vwXD93FFBPnSoSmLj98q2Nuo9s15p+MNUyRFcj
	 0pD8RQ7/AWkc+UbNRQ6EgZZYfWrDaz3BeJ8DrzfGDN+dFwKAzMWyGIuG9T4fiOT6lnnWB
	 ldkucmlkMU6ept68QlTESOIxJ0ryRj9L1PPLBoO7Cns6bBGEQXDuVhXogG/DsRZQYl4K5
	 7wS2TZ14LO2zFPwKguQMKyTvAjuxsgchTmmdM4y/FaAkdoFT2JdiXNxiRC7Z816ti+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGW8by0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5A6606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BGW8by0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5026D1F01825;
	Tue, 27 Oct 2026 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113620;
	bh=d91dhD64znH3QUtzK36ul5n+F7Z8tsR1lIkAmmuAdA8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=BGW8by0jKR9v+DfxjLSnynSgcrPzxBPl6O54MnLWh7NPN9ZkU+2dBYROa9JP+8onz
	 c5RQwP0/yaAZhC5iWaUnmpxk8mfGW1kSL+Q+zxz7AnRaU82mVZwH0qXqNE4lnh1Zhq
	 IJBC3ef/AHRVP/DpKIl9gTZ2DMm8a0hGkB4HH8yl8Dthjc69BT51+vxYGMzVVWo8jd
	 7drAjbXiKfLtD5RU601xY+5lnOMLcmAb0qz6CDG/JQJ3gtKhqnzvVFCE0cbt2sWwp7
	 rxCYIKCxOZzNSRTzPMs0rs7RHwNjHUv+2L4bo8DmN9CQkp52crMxZvnSOYp2MEt5gX
	 kmUgPmWNWtKvw==
Message-ID: <sashiko-outbox-186801@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/19] usb: host: oxu210hp-hcd: fix oxu_qh_alloc()
 deadlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-4-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-4-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:06:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> oxu_qh_alloc() calls ehci_qtd_alloc() with mem_lock held, and that
> function takes the same spinlock.
>=20
> Allocate the dummy qtd before taking the lock, and give it back, without
> the lock, if there is no free queue head.
>=20
> Fixes: b92a78e582b1 ("usb host: Oxford OXU210HP HCD driver.")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D4

