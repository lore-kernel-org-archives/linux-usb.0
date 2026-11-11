Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367515;
	b=JeBvSsJCgdB/59l2MZjmcHf1GW6GqpOyqSI/yzUioIq4U9PD3qLr/AVeMM/qPNwokYY/
	 J6zrSHtWaQ90ehyCPtWck070V8fAnotJNgV8x52RqHsWHv0eNQaIp9+sQ5QkbYf2LDXGZ
	 BOwJdEUUvvDBkpM7YAr5efoeJXncxlG362UOj+RIWGx+6PBCWAqzpL62SR+3Q9+v4JFZu
	 MKoD7GmsYBSfaHwgqdJTPPhLq5NT9UxdzgaMnflOYLSl8VgyWwo2uTJc6BTI+TPVPUrPr
	 lArSMj1v0P/OJ/qPjKH7/Ynb4EsHSFEMkiM6qsLtvumrbCN/1MlnHFp+l/mRv4xaU4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367515;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jBqNg8YaqUI9WZo9AE3NoAPkuC9HFAC5U4xcc/pHndE=;
	b=KFW/5nmB0yNTYVGN2jfTvPL4UHhVhPybetTfVMGikPa1nXYUylFSPiHrVV+1vbbJ5sID
	 6Lz10ciAN9XmNhmqHJYwqQmp/FmOmxPXcYZ37q63VqRuzqXKGNbjjnQdjrnLSrhDgmFAt
	 LtPo4LMva4/V+zhO3itCahGkKJ+foVn2Vw4ofPFQxGPaXWQ4qQyCA6DqqVm7Dws670nvF
	 Ww0bH9i4/+Kb+QnELKU24avEo2SIIfi3vznZGF0pMZni1sWUA46kwvYavX1PPQS61QTS1
	 fgTk4UtuXn6l6z0tP94LGqK31rgpToLvIyY2zWSKwPuzwiWwf/V8Z5RwbgcMmS/VyqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h4Qwmw/x";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D160A2608
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h4Qwmw/x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823691F0089F;
	Wed, 11 Nov 2026 03:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367515;
	bh=jBqNg8YaqUI9WZo9AE3NoAPkuC9HFAC5U4xcc/pHndE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h4Qwmw/xi0LhsoWBcXC1f+TJDg0j79wX529P7nX2cW4or3bjPwijZ35LguZW6TdsE
	 drYIzyJhuKgd1MQ95sOzmQY7t1rTApdHqjEB2nVjsV0KYOCpWHZ5iNgr2EJL4ds4/G
	 WZv+Yxr90MD/uIRiFYXwtOUS9vFhMtV0GHce3HZxEfW1il+a8AdpQJvpSWqOwahMsz
	 n/ifU8GBbFe/VBQ63RTVcxCOPvSiWOaRx/xOisjD2bRlwZ2GQnN9ZPFwd8/lq8nfk0
	 WpjmcEvsf7Yq1N3dOnXYEz0YvVRQY+uOwpe54ACxYHiyCeK/RPvmRwgfJlUeoM6fsc
	 b9p2vj8XTNrAQ==
Message-ID: <sashiko-outbox-208187@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 06/11] r8152: add new init writes for
 RTL8156/8156B/8157/8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-7-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-7-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Bring the per-generation init functions in line with the vendor init
> sequence by adding writes the shared r8156_init() never performed.
>=20
> - Clear PREBOOT_OPTION and RMT_WAKE_EN in r8156_init() and
>   r8157_init().
>=20
> - Add r8156b_u2phy_backup() for RTL8156B (VER_13/15).
>=20
> - Clear AUTO_SPEEDUP in r8157_init().
>=20
> - Disable interrupt mitigation (0xcf04) in r8157_init().
>=20
> - Clear the Warm RST / Bus RST event flag (0xcd06 BIT(11)) in
>   r8157_init().
>=20
> - Clear the FW u1u2 patch option (0xb9a6 BIT(0)) and enable the u3phy
>   patch backup (0xb9a2) for RTL8159 (VER_17) only.
>=20
> - Clear RX_END_TRANSFER_EN (0xd406 BIT(11)) for RTL8157 (VER_16), too.
>   While it is set, incoming packets are buffered in the RX FIFO and
>   Bulk-in transfers are suspended. The bit is zero by default and
>   isn't used now. Clear it unconditionally for safety.
>=20
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D6

