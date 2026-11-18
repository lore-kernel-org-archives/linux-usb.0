Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979712;
	b=XaOoCLf0WYx/v+Z18zxRVU6rrcMKtdG3DZocIxaqahqPOcnMNLyT9YzzMa3sxPbEwsQB
	 qG++kAZFPPPrbLdRfqb9n3iWz/ChSvPiI3P0oaSU1weRS8F3Efiqcf65c3SbXpkaJfMiE
	 fzVRffm9zqYEDNyf0VSCzmxL0/izi4iInZKNVMm/pyT+alVvDYPP9YzNyWMDVrlaFY451
	 eS4H/GbOvVHhDcFWcgyGLhwuvU9iWm0pLBqz8/IZryQ/Qy7uLptcx93R991PFXiCj7Ohz
	 db5fp9AmDqayC54orBhYKbXoGIpn7VMVXupj7Zg593r2f/utmuOLri21wIbv+I1CZEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979712;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SUyXq3ETG9bjVytObuog2wvTklG9ULlE8ORHcT4Aefw=;
	b=1pD8XP6M2pUtgWLNyH+ChdGHX4g+sNPaOVa0u5ppEFoP1imkOngyAcbR3BFbDFKZhTXC
	 widz8b0spvbn151yhOrdVU6pFlLtBqGeB09pYldhqejHuYqFvqPtcFaRVenYCBXejPoUi
	 FZu42cSm2f3l4a1ie1lg6buqn/CPwSLfKY2D7t59yoFcjBwZHwYBjMiLl9o5VRZpGO91d
	 lZch/J43gmAPSF1xXCc55ewYLHmzVZ0eFu8BB0jYEyB1IGEPNUk1FyL7Ck+kZ8CbzZl6E
	 tzjQYiFjWN+olMp0LT3aKnx+ZKBKdIw7I/5em1E58cjJtq3BhoxPmvoxj7rFhGgbSAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci8RSPAk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAA606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 05:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ci8RSPAk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847B81F000C4;
	Wed, 18 Nov 2026 05:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794979711;
	bh=SUyXq3ETG9bjVytObuog2wvTklG9ULlE8ORHcT4Aefw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ci8RSPAkQ0AofOlfod57nXDmlRtoN9TGZqChlIl462YnbaqdVKu+vCJNAvNwqYYzv
	 waUVaMnWE52lm05Szl5SPdEcGqEntUxLqW1oC6D8giGo8sp9RX4mWl3LRk93Qf+uQb
	 Jl00+QG8IzbDM6c5DddzpsvURArdT5PHZpoE0ChbpcDjRhhcoIrq1q/pZrcCr5JlDx
	 WXc5fNnY0zvI/Kl3tLPEHrDk+3mUvaVBYGp32f1G2TvdTfDqCVzVGDtG11Om5TxA3c
	 Oxmtr3qzciR+UR5IjMGsBGeIPjTXKLvjmHD1i/2GBfI2MKdJxvALAFQx3hB4BvKA5p
	 0m+UNlfx78vZA==
Message-ID: <sashiko-outbox-220161@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] usb: typec: add CIX Type-C PD controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261118051313.3634833-3-gary.yang@cixtech.com>
References: <20261118051313.3634833-1-gary.yang@cixtech.com>
 <20261118051313.3634833-3-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 05:28:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a Type-C PD controller driver for CIX platforms. The Realtek
> RTS5453H is the first supported device.
>=20
> The controller runs the Type-C and PD state machines in its firmware.
> The register addresses are agreed between CIX and the controller vendor
> and are configured into that firmware, so the host interface is not
> specific to the RTS5453H: further register-compatible controllers can be
> supported by the same driver, each with its own compatible string. The
> host reads the decoded port status from the data status register (0x5F)
> and acknowledges port and HPD events through the data control register
> (0x50). The driver translates that into Type-C class notifications and
> drives the platform PHY's orientation switch and mode mux for the
> DisplayPort alternate mode, and the platform USB role switch for the
> negotiated data role.
>=20
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118051313.3634=
833-1-gary.yang@cixtech.com?part=3D2

