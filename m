Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484332;
	b=EW43ULHJTY5k38BiCfzwHHmQYrdBM1hNh2lk85SBbb2rgcpT27R8kSl9EJrkO2wKGiNq
	 8ylFC0HsLWjGTxS4RIkIWr6LVThqiLLRw/06mYLkO3tgLEfHQ0ZKSWOsI3AGHQqUVTHho
	 HVCBWDwYGNlHETTgMUpMtsI7d4s05IOjS44st/L0xwEuBlZkVlJfm4cVI9XwXAtY8hu+6
	 wV/9aETPiYv5caVcAEE42fZ5mTTHerg5lnJ5uRaH8vkOm5AHqorC3eNRhrdDCuVqn2EB2
	 S/AorkfOKAx5mXu/42Sv8b3H+zDuJZ20AylOrCXB5SBIIy8V1Nea4gGKCYlFincqU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484332;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oUBN8g36muwnqWENe4Ejpcmy3ZPXr4znk17dHwiClxg=;
	b=0KvR1B37iQFgEVzwQb76P7hHAkORQrAU8VTJE/uZ2TI8KW9TrHWIYtb0N6bucQmpDorc
	 50iESg+xRa6CmFqOa4MzHpuneV1OlFjd+hZeRxGYF9pnnDvRc+ecyqXE4iidFQaj4nNVT
	 KgRfIqxntAuH6YqO/ExnLH0Qm8aLvORvHCq8zWWFcWSZ/F469f7fyBn6JEivcknrKR/jL
	 wiIJANVcNHncnQ12wn2woQ2+Fvdsw18DEeIH3OU1T8nhqkXhehOjAevPzo1OG0SLrkyMI
	 pgRUUAD75mmsHcxONG5G4gM5so6po21HcRZPJ1kuhWzit9WyQ+vCJd6cLNu/AVt0ExQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCC7lX5b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316A6606A31C
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 11:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cCC7lX5b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6601F00A06;
	Thu, 12 Nov 2026 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484331;
	bh=oUBN8g36muwnqWENe4Ejpcmy3ZPXr4znk17dHwiClxg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cCC7lX5bb9Yc+bY0mQ7QxU8xvtOVoNmw5uNf3FMsggw8WPAsdy0nUA9MiibyJONQU
	 k7cV8b5TcNqIAHHUhRI5zFfm9TLoGyER3mPhduiGIMxYzLyVo8O3VqKhd5KKg1w5LQ
	 itYIevcwQHK4494l95YebTW1DFk669wvvaSXPDVUa0spMqGuqH1/AyUdLelVAbBbYb
	 144uwjI6GCgAYr4wqLuPC5VOiaTiVJE1tmGsez6v48uGAu594gCICOe1wXzq0XH7xl
	 fj0Pcqh1c+JNA6bU7qdT/UlCDi6uz3SKX38zHiuIyPRW297pFiq0AKdDqdjBDoyNiw
	 0+E7hG49c6wDQ==
Message-ID: <sashiko-outbox-211048@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: qcom,snps-dwc3: Add
 mode-switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joonhoe Kim" <26rote@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112113838.506-2-26rote@gmail.com>
References: <20261112113838.506-1-26rote@gmail.com>
 <20261112113838.506-2-26rote@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:52:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The QMP USB3-DP combo PHY stops the USB3 PIPE clock when a Type-C
> DisplayPort pin assignment gives it all four lanes for DisplayPort,
> while the controller can keep running its USB 2.0 port. The controller
> has to move to the UTMI clock before that happens, so it needs to know
> the Type-C mode. It does not route any signals itself.
>=20
> The Type-C class passes the mode only to graph nodes that have the
> "mode-switch" property, so allow it on the controller node through
> usb-switch.yaml. Orientation and retimer switching do not apply to the
> controller.
>=20
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112113838.506-=
1-26rote@gmail.com?part=3D1

