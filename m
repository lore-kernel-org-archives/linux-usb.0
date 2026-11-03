Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722445;
	b=kVFvfE3RLarCEgXwbamAfso9sUrfznPYvoSZ+/WkNHi1VCb1WJkMHPuf5idzx2Px3a3z
	 dZAUOrBUFO1j3b0VJh7yiHsqWePk++yQ7HM/XV/BE88R5CCniBXhsdk+cr/NGVDu2/8+b
	 aDyEhGID2Dc/fdwWGbLEY/Avpp/y+extnp2ny61tC3aWDD/Gw605KL9zpxZddN0UI2tas
	 8vp8JiHIWI6yc0D3WEyrmTz5UG1JoQlbCpxlRLKNnijQO1edg5Bn08h90tQHjPQjdVuhT
	 NdCuwUqDccLguEPbPA5OC3ho8RCiQnF1/H5jHYTFf+L7/atULSaU/2w7KezfxlIhk9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722445;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uD8yWHFKRF16+C3CEaoYMDEFfnKLqEMLxe1BXVsXbmw=;
	b=m8LP/Ybl7iR9dHEo5SuZQ4nbHEfCD90oFiupX/JHmh3+iUud32uXc7jQorJWdmOq4PLE
	 bAvj8W7QqVmWAQ3sBe68vDWM5atKV0U+KJV6ceQaGEHDO6ijhJoMMMmzLVLWCSYfZdh/s
	 B8KgYUThtXYAorMDyyiVmWnRu2Npyhx0KD45EK+/QV8222vfBaJjCaJcYY0ExshkXnwH7
	 70hTCM8wKIgGMG9pCgtVIzAsswxqDGZWcj3dZW3e080sEzyBajRh2VAkECziK+1djDdYm
	 EpT8mQrh70LTY8C+Z35d6MHy4iLmFS6ZM4Qt2T2DzoA2PsYYRyzfM93H7EO+FH3zwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e+D/jbLA";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6656082BE3
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e+D/jbLA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C062D1F00919;
	Tue,  3 Nov 2026 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793722444;
	bh=uD8yWHFKRF16+C3CEaoYMDEFfnKLqEMLxe1BXVsXbmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e+D/jbLAUT6jF1WiO8iDNhq0maxsBmJQ2eBBKG3v96Dipl1cdCEK5cRjiso9aZEkM
	 gib2zTHLdziagDH202vgA5sF2WiTkrtn/I+//KNJg861liCcXE9gkYcx6iMFMSr9Tm
	 qV2VyrmiuMP2QbNs4TJF3cYJil67NoCrUWmhSj6bZKix/T4j7+nYT29p/Dv1knlPS9
	 uZL1VsWJ+nbm683XMOXCebf5wfDkceW4scvFWjoFT60/CxG1KPSfVBpWH/Pu5b3OGi
	 AbOHZixtwnXTRKrA5n6np0zeuWYbtgZ8frgC0HQLwIll9shFtwmLSOOHoPhWqyaIx7
	 hUAI3lSJbtVFg==
Message-ID: <sashiko-outbox-195708@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi: acpi: Assume UCSI 1.2 on
 Lenovo ThinkPad T14 Gen 2a
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RhbmlzxYJhdyBUaXRlbmtv?= <kernel@resetko.pl>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-ucsi-lenovo-t14g2a-v2-2-e85c659b56a2@resetko.pl>
References: <20261103-ucsi-lenovo-t14g2a-v2-0-e85c659b56a2@resetko.pl>
 <20261103-ucsi-lenovo-t14g2a-v2-2-e85c659b56a2@resetko.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:14:04 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Stanis=C5=82aw Titenko <kernel@resetko.pl>
>=20
> The Lenovo ThinkPad T14 Gen 2a exposes a functional UCSI ACPI PPM but
> the firmware leaves the VERSION field of the UCSI mailbox at zero.
>=20
> ucsi_register() rejects a zero version with -ENODEV, leaving the
> system without registered USB Type-C connectors. Without an OPM, the
> embedded controller does not complete DisplayPort Alternate Mode setup
> when a USB-C dock or monitor that supplies power is connected after
> boot, so the display stays dark while USB and charging work.
>=20
> Use the zero version quirk for the ThinkPad T14 Gen 2a, matching the
> two board names of this model (20XK and 20XL).
>=20
> Tested on a ThinkPad T14 Gen 2a (20XK) with BIOS 1.33 (R1MET63W):
> both Type-C connectors register, and plugging and replugging a USB-C
> monitor with an integrated hub and power delivery brings up
> DisplayPort Alternate Mode each time.
>=20
> Reported-by: Daniel Dev <daniel.dev@noex.uk>
> Closes: https://lore.kernel.org/linux-usb/b1Wn_eFvTFShGbd970WWl4CWhge_6P2=
x7Wb6rab3QHNlE4OJ4p__O-QN3B6I-308ftr5oV5Zr7vywA0vdvmtNw6E0YJnVM2ek_5DcFnkXB=
0=3D@noex.uk/
> Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
> Cc: stable@vger.kernel.org
> Assisted-by: pi:claude-opus-5-5
> Signed-off-by: Stanis=C5=82aw Titenko <kernel@resetko.pl>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-ucsi-lenov=
o-t14g2a-v2-0-e85c659b56a2@resetko.pl?part=3D2

