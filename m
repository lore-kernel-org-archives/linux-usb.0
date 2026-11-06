Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946808;
	b=bNYe3P0gMvB3PrBzTQt5MX96td0rHFR4VyLZr782aYbIK5gsQ1zR5Ak9N9QaI74Hd5I1
	 +DlZi7q+rvKfXECmfPqpv0SWJnlsoMfZ5cjJwjJ12gKF4b8StCRD+7+7bfN6A7Gz/eMoA
	 gdMC16jbsOjkunDAuV8NBoAh2GdrBMX/3xngqXGPuGS+Ew5AZZK6bdlDMWEJrpz2bBWWR
	 TfEWKJhlFKE0QMkzv+K7w0U1wZ8TdeuBXFzhKgNOJMtR6zZ1WmjPt7OkOLtrmftDx+uxe
	 8fIUpa/pi+wPNbNjJz3e6tWr0rQ6QTjd24vj65wRjSOUu9m02xbNxyyGe+cjwylz9Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946808;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eRt5UvxEpoD7vvLyf0VwshqPovoOgHl7VRnyKiojwNc=;
	b=Y+Vdj/I2kwzrD7hD++jNgQR+wwN2ObAbZgz2JuHDnjg8jeQlk2Zqnf6l/Q4cof+RY119
	 4cEHq49bJOJz6z7ze2NWtmVMP6SGSRCDMg09PmehQ41brx2pvo7qAj/1i2P7yA/7SNCxi
	 qXc1XzbRHwI3z91LS5vMMby6SsL2VQ+yfekDz7zoXhfF7Fc1m14decxd714LlBm8yaVQg
	 jQ6IVv+YO4WlccGgMB26Ja7De1bMP5Da6ts4NocfAonA9srtCjumCLvaTPX57p2Qp0edr
	 u1vGzP8phpaLEyilqeXiYGWaCgOu6gsewyyfa3Hd8cAEkSyeXjTA9QqoTT6JtbvIZ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjypaxC7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145E606A329
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cjypaxC7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B5C1F0089F;
	Fri,  6 Nov 2026 06:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793946807;
	bh=eRt5UvxEpoD7vvLyf0VwshqPovoOgHl7VRnyKiojwNc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cjypaxC7LPUHjX2esrEWNhn5zVYnOJSQUSLKelfSWlbpE6fkIdItbI4VtESD2MNwI
	 d9GhxJY4Mk4oEm4mofuuvzFDq0dEjz3ze657DI3UkImLGJ8LGEt/0cpASBi1uavLfz
	 xTuqvtn9Air0ai/NWj3BTHtcg82IFJlxleUlxE2paam2Wr04KXj1hnXoyKzTOu1ZE9
	 3IecZLI+B1j+l4mTDkzNJt1PvZMzEAKJWYTexK6/JqCI8UF9661wiOxrtP3RAe/qfP
	 mm/4qloCN7tVr04EttHc37EOYnmlm+A0CJQCvJO/j18lvhHe2Gd9dJPPaqc0f7n/OO
	 nCcHkvUQd47WQ==
Message-ID: <sashiko-outbox-200903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] thunderbolt: Enable hidden DP OUT adapter on Dell
 TB16 dock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Grant Morphett" <grant@gmorph.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106062614.27709-1-grant@gmorph.com>
References: <20261101212311.10946-1-grant@gmorph.com>
 <20261106062614.27709-1-grant@gmorph.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 06:33:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Dell TB16 Thunderbolt 3 dock consists of two Alpine Ridge 4C routers
> in a chain: one in the captive cable module (DROM 00d4:b051 "Dell
> Thunderbolt Cable") and one in the dock itself (DROM 00d4:b054 "Dell
> Thunderbolt Dock"). The dock has four video connectors: mini DisplayPort,
> HDMI, full size DisplayPort and VGA.
>=20
> Mini DisplayPort and HDMI sit behind an MST hub on DP OUT adapter 8 of
> the dock router and work fine. Full size DisplayPort and VGA are wired
> to DP OUT adapter 8 of the cable router, but the cable router's DROM
> marks that adapter as disabled. The software connection manager
> therefore never initializes it, never tunnels DisplayPort to it, and a
> monitor on the full size DisplayPort or VGA connector stays dark. Only
> two external displays can be used with the dock, while all of them work
> with the firmware connection manager (and under Windows).
>=20
> [ ... ]
>   initialized, instead of making tb_init_port() non-static and calling
>   it from the quirk (Mika Westerberg).
>=20
> Assisted-by: LLM
> Signed-off-by: Grant Morphett <grant@gmorph.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106062614.2770=
9-1-grant@gmorph.com?part=3D1

