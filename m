Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736415;
	b=42wv4H2x9en0z4q4OBDTYEXGv0ajI2mgWBjZb6KN/N1T5hdjvTvZN2bC+1tAHHLfWsB9
	 tRG3LEJ0B+ofhKa9A3mX5XNsrBL+rFOsJx/UT333FWfbTnEuZV/QviOIotuI/Hn4OCaFb
	 Wls/o0O8H0BHH/hLsw1Iom5aM+HT9wtm7zIduwCFDZ5R8G0JiTAUb+P+aqYRlcfqWHjyX
	 qDyKqtT6tAsuDgnd9GXdTac7gmEcMaRa05qOCxLDvw0cVnFJpMymuOJXRiVD2gIzyHU8H
	 qZpY7FGpN2oI0OQfRkaTOl+7wpt8caIb+JI53pntT5clFZYWY3Iq7smTiZ12lo5a+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736415;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kQilqv6KkR7RtkOq1e2U9vSUFJgpr94iEHr+R6RPPgQ=;
	b=atT/FZZhRTzF/Fz6XdApE0gxC1Q4vZZm+8jWtSL8eeBvLvk/MaEpvZ6JfS5uATokiFZ5
	 iAYbw1xpruVKS67/i8Won4WXmG/+/2Ka2gzU39LHgmSPF77i+yzUw7171zP8BnAzcttCE
	 zkostovuB0lLE0vyA9F+RoiuvgZnvwzpFed/hubH8sAnFR/fIN67HANQ4UIlrXcryxiv4
	 Pew9P5BVDdsCPxfnR5Igz5gwB+eIMMMyhVWzeEM0BI8wN0OrKM3fkq07+dwQa/gvTUyqm
	 niAibkFK+jrR+JrnsQrTXeXureo14Zur5IWYPKR4sy1eZ+mt8y4DTRtiyuaj0K3+ljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5KfnUOU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0178D606A326
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H5KfnUOU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C751F00919;
	Tue,  3 Nov 2026 20:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793736414;
	bh=kQilqv6KkR7RtkOq1e2U9vSUFJgpr94iEHr+R6RPPgQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5KfnUOUIRn5Wd2Wesk0XpTzsYujgsIkjju7SS6sR5iHJJGbllZd53lBA7zWWD3Eg
	 UYauoA1pws+3TBDB4W8a/WSW/Al1jwkaHVH0IdyKkqHQLhDm8VNpCuUe3gBUoujpGk
	 YBAcBOzHiqCZ1qq9GukM/ktWL3eqr4ltJjSCTmN+mII/zTrh7Zr76LE4NtI0pX8yMq
	 j15hlzT0nfP20LuT+yCT1Wa73TNQX89VMXGmO9fHv6Wx9xYXxsnA40qq0pGmUQXQkX
	 PNwe9AkPqhOXUj2gGvGYpmctGmwH8VQLfdHTtMhtbUSByzH1CUnThrHGNjZE7NneMi
	 erG8TX3rrp2YQ==
Message-ID: <sashiko-outbox-195958@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: misc: usb251xb: configure battery charging
 from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jhon Wilker Rodrigues Aquino" <jhonwilker0112@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103200154.125681-3-jhonwilker0112@gmail.com>
References: <20261103185514.72144-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-1-jhonwilker0112@gmail.com>
 <20261103200154.125681-3-jhonwilker0112@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 20:06:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>
>=20
> Parse the battery-charging-enable port list from the device tree and set =
the corresponding bits in the hub configuration register.
>=20
> Keep charging disabled by default when the property is omitted.
>=20
> Signed-off-by: Jhon Wilker Rodrigues Aquino <jhon.aquino@autotrac.com.br>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103200154.1256=
81-1-jhonwilker0112@gmail.com?part=3D2

