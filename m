Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487400;
	b=VTREik2xCil+YAPNIIqhIEqBv8OA+kBAV5sieuChM0rQJ6aLaAIXVPQH1oTexe1X1cHU
	 X5IYyp0aGjpcCvVNQxE5DwFIw48G2+jz/R1ccNQJ7wI1qlYL+iwjfbxzGO68VbKMY8DGY
	 gazHZGWC0UoyVk+KoZ/yG6qRDgR9+Sgs0sFdgihUnKKXVIv9LzljV8HNPgn4RCOznP6zi
	 j119JAHdZ4BzAQF7gVsjWZGDZhvxZ3MHlOMrLroa28qG7L1kzAND1DG4xj0T4XaMmCLzy
	 OtWDB4ublbg+BpIpaIgYJALkYscEbxv4sdzriVqOcgDq5xgWB+6T4dEKGww/OOvIrJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487400;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=adq/s6jYwkLalDeNZVE/SJE2gwa7ofYImH4TJ6ywznI=;
	b=A04FMc+L/OeT48+nqS7Zht5fNShvD+3UEDVVFMGKeQhC2ReXRKefpAHqnMxYCZdqZNXR
	 l2Zvg/4+qUcc7O40V6u9dFDOylvf0XU7mXuc/IKf7Ata7L/eEvQYQviF+lYWnFWdPiHNq
	 ufzl6jy92PdIrXKMFFhxtOvCdL/jH75Gh4EsYrWkVO0vMdOYrOt9bVmQpauDhwBthbqU7
	 loWw62RGH0tzefihgZQZFk26OZt5cTPkxw3/LyvnNWV/X5/sDFXoxywBa4jDmtuV6xSGK
	 6J7xzQ7R2LKsodsAoublM/Ky4eK28QLKXwzGzIxE+lypwJRFZNPy/+aes/l+lRQmELQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOmxRSBV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA61606A327
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOmxRSBV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799CC1F00A05;
	Thu, 12 Nov 2026 12:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487400;
	bh=adq/s6jYwkLalDeNZVE/SJE2gwa7ofYImH4TJ6ywznI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eOmxRSBV0Uk1RTE4uoIL8IIJVI+ZBUdNu4BM3IPwhfdOdd6ZjoKhbochYuGOtQ9YW
	 +WZ63Z+QJVqoaFsiDBt+TVkuP65BhTiQlCVs2lk/tSrylZn9obpATgKt6B+RZMFkYT
	 lBV4LQr/EpHu7lgnBnwm2a+WpmfBCgKQHzPznUzc3bbI8mvvfp22Y41/Mzvr7rBKmr
	 eG/Tli1jw/P+oxBhxe7qAwPikNKToWsjQqcZ9k/NkIyZR481HeNZGyMkt2oWtwx5Xu
	 XCBnJeQtZCjLEkR4VPdH4vwFMstcqqDVTRqRWRRGgVv3j7KpgD9IfJqrwyK3wCbh9R
	 DJk+sbjBQDM5w==
Message-ID: <sashiko-outbox-211104@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: tipd: cd321x: replay the plug on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jacob Procee" <sn125164@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112122825.7730-1-sn125164@gmail.com>
References: <20261112122825.7730-1-sn125164@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:43:20 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
> port lose their state during s2idle while the plug stays connected, and
> the CD321x does not raise an interrupt on resume. xhci notices the lost
> state and re-initializes the host controller:
>=20
>   xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
>   usb 1-1: USB disconnect, device number 2
>=20
> but the PHY is only ever programmed from typec_mux_set(), so a device
> left plugged in (here a FIDO2 security key) never comes back until it is
> unplugged and plugged in again.
>=20
> Re-initializing only dwc3 after resume does not work: tearing dwc3 down
> also powers off the PHY, and nothing turns it back on, so xhci then
> [ ... ]
> version was build-tested only (W=3D1, checkpatch --strict clean).
>=20
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321=
x")
> Assisted-by: LLM
> Signed-off-by: Jacob Procee <sn125164@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112122825.7730=
-1-sn125164@gmail.com?part=3D1

