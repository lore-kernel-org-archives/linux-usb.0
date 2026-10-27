Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114005;
	b=XvjBMZ2zwo9R5VY1INaMJHvwiwokDVw24fUVS1H6vdCMpNjC+oDx5a7eL8hdAm7N+BHJ
	 IxpzZ2deAkp3f+ih+1S/vu2PcVxVEj60DJlM2HK566XvX5tcepuKO3Yk/UJOUqcJ7b+Rb
	 Yt1gb38UIMIcVTuBa1z+Xcoe5mdOsxjYEHNfkwqv9lHb5sFQAlrXlDc7APx96hZlpwf7x
	 J+vWbUYslAvVlOmUcmcigXWQCBnxrjX6hJEoX/6mPnXnKV2PtQ7wZAtvhxN0hBINCpGO6
	 tvKW9tQn4xXommFRboU6/xJRYBI0Fx8jRBPSvVA7Kb2CKhlFxP0CACUDPCx2iBFbpaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9My+qkxWU689grJN9WqYr/F0kAqK8rpLtunkHxQsbc4=;
	b=IhCjYKyWNWYmkTmIUI2EY5B7KPtK4P8f1kKJv012GALxRipL23BOzxdWshPJPJmGaoNA
	 yruXLFeKK8AAtkRZEnpfhyVGWuDrhRuzKNjOt9HqtB7jkuUe4LqkF5TH7GsVbR7Ngzk/l
	 OVXkzIm6Mdz7pV6Huic0uWpVchvo15+DVpDJ2h231HcxMfHhERNgGK9SvR0eeuQ0KClWi
	 ulWA1261ZwIcH8qCwVlPNzEg0beMYoSa8iaBwX1cyKxUpe/XUMUN//rT3wJM1/7AkSXEX
	 OAQ3MlwBsqErN6mOlJzYHDwKlk5w6K/4alLLH5RlBkR1bmG8iNlx6sd+FeVvIevzB7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="STdlv/Qm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9993606A31B
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=STdlv/Qm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462671F01825;
	Tue, 27 Oct 2026 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114004;
	bh=9My+qkxWU689grJN9WqYr/F0kAqK8rpLtunkHxQsbc4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=STdlv/QmpKCVXZv+XBzigcBKd7muuqwE31oqUaodeuGLBhKlloQttRktLbOAHG4w6
	 JY4h9Z44yyQEFqSOfSQxKqNobtKDqZ6z+m6C8HCiyr4DJwy35s8vKUrqFEeFxDtpqf
	 IwRQjY7kDjjKstJfpkkQCbmZibfV5T9yg3Kax18n1sriEdYlqQKOQGsf1ITD/HFt3D
	 KKTM1tC/FuaPqBf9oAmuszidHAHS/OnTOTTiVbouZOE+/pdTaCklTSvZcPsmhY4nl2
	 XO1WCAPltsPL5sg4pF+OLK5HhR9zL4VUWnS1S6dXnsNGUc7ymWSY8Ef9sEVH65F1jg
	 BVG17V6/wk3UQ==
Message-ID: <sashiko-outbox-186813@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/19] usb: typec: mux: tusb1046: fix oops on accessory
 modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-15-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-15-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:13:22 +0000
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
> typec_set_mode() passes a state without an alternate mode, and the USB
> and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
> TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
> set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
> attached. tusb1046_mux_set() then reads state->alt->svid: plugging in an
> analog audio adapter is a NULL pointer dereference.
>=20
> The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
> value of TYPEC_DP_STATE_D. Without an alternate mode connect the
> SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.
>=20
> Fixes: 7c561b8c3e83 ("usb: typec: mux: Add support for the TUSB1046 cross=
point switch")
> Cc: stable <stable@kernel.org>
> Cc: Romain Gantois <romain.gantois@bootlin.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D15

