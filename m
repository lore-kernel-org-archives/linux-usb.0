Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144466;
	b=KJ9RhnNF1oqfo1S7qG3OaAcbzLt135lEo9IUzvlCxCNFJ11iHYC1bXmJs/OVR3FpmHp2
	 cf2OR2LZzUwY0+UFVZVz/PFOBzXLVS6A5ITsFAoA6Tj2vpY62wtqnyrNFRhT/e7U0T6OS
	 UBnTEduNzPy9RN8m/3fm6nYJmN9xxjcGtMYdQJkW2M35Ajgu//WeHc2RtoZrSLCC9AyNY
	 0Ayc7TT5Vyb/4K7N3dTN9dPYimjSaKqM5oNDunPEfeMqMZnG3d5yS2a1vb2knSTEhrV+/
	 iBv6CRkt0WawAKRcxGyt6/fjmttwWkflI+Pl4XmTV+8iESdKDb4j/K/XOiW5V0XPeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144466;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C0j/MIZW4pr9NenpAljBH/50rRjqgIY6mMGxc31KEoM=;
	b=B4BJh1yixn4Q6wOh0532At+PAsQrdOXiv11Q8PttrzRJDfdSSlS6XJv6M+8bbbbekqxb
	 G7N3JQRS0LP0CUZgJ3tS5HDxvIbSdpd4jm0shcnxarlXt+TxfdldCz7Vqg2Y8EDBuJQn+
	 VScKmuCpiWRZ+1MhcwFr/CKHK6AFctTMKEjIOrfkv1UR3j7lzl1mdI1gzEQDAk+0EGY9c
	 xgQJ6Bq7+Fia0H6xa08dijOLLMBs2Vd7UwprTdTYg34V3pg9NTvNPBg4CGLJTkVJGQdtI
	 IQVgsCSq25GNMzEajDSdrco8RwxZN0Voz65OuIoHpmhkWR0pzgb2pth8iKMuQPgtrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIVvAb24;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60633606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 23:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KIVvAb24
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54391F01825;
	Tue, 27 Oct 2026 23:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793144466;
	bh=C0j/MIZW4pr9NenpAljBH/50rRjqgIY6mMGxc31KEoM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KIVvAb24BLQVEV+Xjv9EYM7zF38CiZWdU3WK4Ms4REZLg6V67qs6bTFkqlvhPRvWd
	 6HSv2R6IbcnAOiVhblDAP4fKf+KaFg2FyvY0IvGIKdEb5bBQknRHvG67ZR3JYsVJDd
	 /bsSbtTq7SVaumQRPG9I28fo95EImFBX4FsM9SkxPq/uvBlLTpjwj/Dv7AAs0B5Uun
	 xI8MJUq4bcX1sXo6rcqj9QXQNEsXKQZ0ZuCud5eOIiUR9hLSxvEWspHrtqNwNWSWev
	 s+n/ABGlF8O3PX+/x64AKEElcMS+VE1naFvKxSiwTKcUNnKYHnsSGjPTZPvXLFhOZ+
	 ioRQQLXtXmvKA==
Message-ID: <sashiko-outbox-187230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] usb: ehci-pci: Skip SBRN and port-wake reads on
 Intel CE5300
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027-ehci-ce5300-hostpc-v2-1-375e9d362d74@telaak.dev>
References: <20261027-ehci-ce5300-hostpc-v2-0-375e9d362d74@telaak.dev>
 <20261027-ehci-ce5300-hostpc-v2-1-375e9d362d74@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 23:41:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The TDI EHCI core in the Intel CE5300 SoCs (192e:0101, revision >=3D 6)
> has no EHCI-specific PCI config registers at 0x60: those bytes shadow
> BAR3. ehci_pci_setup() reads two of them anyway.
>=20
> SBRN (0x60) reads as 0 and overwrites the HCD_USB2 default, so the
> controller reports "USB 0.0 started" and ehci_shutdown() returns
> early because sbrn is 0, so the controller is never stopped on reboot
> or kexec. The port-wake word (0x62) is whatever BAR3 holds, so on
> some instances bit 0 is set and the driver prints "Enabling legacy
> PCI PM" and marks the controller wakeup-capable.
>=20
> Skip both reads for this core, as is already done for SBRN on the ST
> ConneXT and HiSilicon Kunpeng920 controllers. The new helper is also
> used by the next patch.
>=20
> Tested on a Control4 EA-3 (Intel Atom CE5310) with v7.3-rc6: the
> controllers report "USB 2.0 started" and the legacy PCI PM message is
> gone.
>=20
> Assisted-by: LLM
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-ehci-ce530=
0-hostpc-v2-0-375e9d362d74@telaak.dev?part=3D1

