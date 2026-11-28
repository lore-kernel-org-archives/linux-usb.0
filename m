Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795846890;
	b=UYDx24y62E5vS07GeY5N2fE9Mr0OFo87yFychKlsOjkjID3VA7gv4HqTLSuZG4vTnbug
	 J2TlTmasiRKyNvludqEIfyjjJY/AoMbT3LjC/F5b3qiCPBGzZrXzKMUJ4l+kLx9LBgKvf
	 Isv0frPYDkhigFF6ZoC5vItMcjoROHQsAuuV/B1QK6j4pqc7WaIErHchahCJu3Bt7GWAa
	 wjiSefwfs4uenhDbVDUCRT3QQ/qybVu69pNFuJuoLkYcMVdpORCjbA0AIYOPKFmRABJI6
	 2ovePPZIZ6y7BatH+vfel3o7NxDXZr/mVJglE1BHBS4tDwkG4Nx/LVQgBpx7EkPBmbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795846890;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4mdnbe210I1omxin0/zH48UfGGImX78N2+Mx9pn82zU=;
	b=tRmJKsSWW741800I5sB6SgEL606II0D4SL0MqQUPT/5I3249MPlOmFqS3lDCP+OC1U9Q
	 b/80ImBLw6RZOrqHb8IQUcdau5cwrRJWRYf/2F/SlqnOaklkNzxAZXFN6xd0a+qCGNc5b
	 hl8+/1Ofr10oyIIcAyc0dieFxm5xcpidHEPdrEVJnc2BRAh72sXpwocEDAXaQ0UTKlei0
	 D9dqcdtom8t7rt6lJ/X3/YpxANlFCe6V4HJ+445de3j4PhBQM/KHvbwcaCZ0z9Mgn/Axv
	 t4z6w8TyysqN+ld6A/mvdtURb9d1+AwUqw6EK4SNFGwC74yvieWazlS9XF0x0IP8uOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HpZae/KR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617CC606A31F
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 06:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HpZae/KR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4DD21F000C1;
	Sat, 28 Nov 2026 06:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795846890;
	bh=4mdnbe210I1omxin0/zH48UfGGImX78N2+Mx9pn82zU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HpZae/KRs5HxF/p96/cL++1XydcfkvJTDEJ6QgNFQd1dLCPzJoZ1sTrOpBRkOcA8V
	 Rk4nmOU6tYdC2ZmK9YECfKs/pvhwP3JVZmCexKYGc2tB35jXzSPM8/Z889MFcQOo/k
	 P3ZnuilBhDSB/K6tWDKdEs2BeXsQpWI/mJuB/biLQfMrx/dJ+ZjTAXftueMy0AYhSa
	 yU2mvk2m1Uj9J7ZaaCiAYzP26j6BJsO4MSJfvBv5pHR/WS+CXsnIdALoMaIJ8i65CI
	 xB35R4A8e3TAzAxqPre2nM59tinVsFJhzsbERRqQudS7fz4sTgsQbuv8cMGIdIADG7
	 HwedB57pgZu0g==
Message-ID: <sashiko-outbox-238490@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: quirks: add WINDOWS_CONFIG_REQ_SIZE for Razer
 BlackShark V3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Ilhan Bayoglu" <memobayoglu2007@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261128061910.742824-1-memobayoglu2007@gmail.com>
References: <2026112051-smirk-omnivore-0d65@gregkh>
 <20261128061910.742824-1-memobayoglu2007@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 06:21:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Razer BlackShark V3 and V3 Pro wireless dongles fingerprint the
> USB host by its configuration-descriptor read pattern during
> enumeration. Unless they see a single full-length (wLength=3D255)
> request like Windows sends, they refuse to bring up the wireless
> telemetry relay and battery, charging and EQ state all read back as
> zero.
>=20
> USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE already implements exactly this
> behaviour, so just register it for the four BlackShark V3 PIDs:
>=20
>   0x0576  V3 Pro (wired USB-C)
>   0x0577  V3 Pro (2.4GHz dongle)
>   0x0579  V3     (wired USB-C)
>   0x057a  V3     (2.4GHz dongle)
>=20
> Both the dongle and the wired transport enumerate the same firmware
> and need the quirk. Verified on 0x057a and 0x0577: with the quirk the
> vendor channel answers and battery/charging/EQ read correctly;
> without it every vendor GET returns zero.
>=20
> Tested-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>
> Signed-off-by: Mehmet Ilhan Bayoglu <memobayoglu2007@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128061910.7428=
24-1-memobayoglu2007@gmail.com?part=3D1
