Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184630;
	b=Dubh8UWwTu7ZyM13qE4YvX3f23Kd5L5yA7t1l7RnOew7KfAKIBEp6RBsh7fgY/ZEMGJ7
	 S4F7RruDuZAd6+KhmCeFgSNQSwy/brjKrXe5lRB+4TLYLjCiuUiZ7lFo6w1BcJt6qQlwF
	 LLj0dlhQ2aWy0VZR2y0cSD9dwjxxy6KSitGbqzIsE+q4nGCBEOHIyIq8hN53U5v9Zc6g/
	 vwXC6ch/mYFmnVx1XEMTHhhyQ4MGqEZwNVbkNJXGWiv8D/5E215rtl3K58Tq0AB7EUFL/
	 aqMj1Forun53z9LrCP84/SFmxImXsQbnjF0AXKDlqWck4WNoS0booki+h71HRpGVNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184630;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rk5Ff5+xSPdiNMomM0VETEdFOqZfkGsFVbPPDEUKt20=;
	b=Z+8ApIAbAUkrP7/qrc3tbqoFVH11ht8SxJTaT/Aw1L7ZEh6jIAoVSCC71nFgjOudXmx4
	 RdZCppzHXI8BkpXAGpzmSe7Dios4SLSvjOIfdOEK0GDRBqqwILtHh6jXDaAUzpxf16h5F
	 zOQSrZfhEU5Mf1N3Q0ZPtA2OSalL6d2/uzCCJk8q+/r0PiMuxjDOpokQbEP+FItlalP80
	 79kyvs/bDGVWA/7bVZIUKrS9Ny7A1prEs0yAVS2XrFt5QdL6yNs4GSsT27TlK0V//wB+P
	 4Z4W9JGNEWLGziSnKI3J0mE6b9wbJCEKCb4SvHZXyTD4y1XmEY/Lt42obeyg0B+6cTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVyhmryL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E8F606D807;
	Mon,  9 Nov 2026 00:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QVyhmryL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2531F008A5;
	Mon,  9 Nov 2026 00:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184630;
	bh=rk5Ff5+xSPdiNMomM0VETEdFOqZfkGsFVbPPDEUKt20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QVyhmryLx7cS75XQfyfaHDoaCsMXmBEBzyBJnZ0OpJtYTEIbMOHWdX5yG3MEfm8Zr
	 0IWR7sWP4uDvdJFOJddojw9ntzGmHPj1J/SeiQdx6dakdKCwsWcE7s8eNdfu+6s5Dq
	 A6PpoL2/wBg2I5dacM2/o2KjpNEw6n1AWq4LpBDHhxDioMwRCvnb8vWaZdO4uJPocq
	 Kgk6Wv7lVT5I10GiF/z6921Og/uwvw58QeXN4Mlju2tTszbieDoQLc9iCAF76Rm1h1
	 //q1+dE8HX+sdOE7N9CQvDJyo9GQlCmDegLRsFON2/DJTEBFDe/I2YxZ/WAiNr2m2i
	 bRclN7MxUOF3A==
Message-ID: <sashiko-outbox-204223@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/17] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-3-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:37:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Power Domain Controller on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D3

