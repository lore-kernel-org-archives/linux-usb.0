Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901363;
	b=AcCdMqIT/ryFqUVBpZZMopyxjYLYCsMVmiNwjUD2nWippHFrkbaFKQkj01BRWZTZeLLq
	 15HjSs5C4PGvodHCZLRxsWxeNHDGgI4BZRdor35Jy+2EBwcEjkJYeEkLG0MXk+h88uOOP
	 Kg18SHKmG/CLRDhVvqmFNAnW3z2C2eZjB2j+HCGT9EyjvJ+u3LyU33oZLrKVuyNLWCbfu
	 GQLBHph/1E3Fi0xENsk/0kyrX3aeAs4j4kq+XeN+UbPFOt87DQ3Kt5/KTp9rZUg/fqh0I
	 CqbD6bm1w7dr5o0coBRmKJDqes4cB7v0onNQx4tV7K6OKm1odgD455s1aZ/MoTT+63Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901363;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uim4kIDr3s9fjzLXjufAOHY6h848zScnDKegiikHBRY=;
	b=UuIbv/6suIVFzsTvbXaUxvabTTUI+a5+4ixPWvNiaYCROITJbh2xvZhiKPLzoVdZ6aa9
	 kGP/BBkVN9D8ExfFMim/Hr6eQ7NAz29foOQ/HdV4un8r8pH3x8mSX0kEZER3wbd/OBqq5
	 TXpFJXOu86xoaIbQqqieO38pIIDTsHG4E4rO7R9hnm9gdmxtmbl2nSFoe1H/XauysvVbS
	 kbCeYv5Kk09HnCH0e95Q04xmA1LyTJ4rhDokEojgajhVxig1XyBi8cwIDxwE+KIsVDkva
	 FYNx6fkCPvtN+lUXOOhY9O/vsRzzk83F28fmWw+0GLOW9vazuOumFyBB85mXQkrfd7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5m7UsAC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44D6606A33C
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U5m7UsAC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551D11F000C1;
	Thu,  5 Nov 2026 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901363;
	bh=Uim4kIDr3s9fjzLXjufAOHY6h848zScnDKegiikHBRY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U5m7UsACLVkPQzRd2Xdx9J53XOOQu9LHb4Rvjyiyi+JkAXGcFD7YV3fc1qYi8HMRT
	 Dwkvc97va+gTmlf8qGtxQZ5V36jGM33JavSyZbWu0akjw24WJq6mVzxR/oJRGI7FaU
	 cjsrY0hPggSgChlx8b+TNH36+2iVg2nbRlt5d1LwEby/uCY1EJLlsYmE5113duL4xZ
	 rX1OMHu/ouaM2lkbafYWRjBsNwt4qq5t38ojRVjprbzYfXwqupj3pLTEKrmngN3tmR
	 9eTlwZPCyYGL3N0RDc23gHU0MiJVUpOoGQPV3D3C1QYk6wSUoyIzTfOPuCbyaJZygI
	 fys3a/EJJgOwQ==
Message-ID: <sashiko-outbox-199671@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/5] xhci: keep port link_inactive and connected flags
 in sync when polled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mathias Nyman" <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105175106.241182-2-mathias.nyman@linux.intel.com>
References: <20261105175106.241182-1-mathias.nyman@linux.intel.com>
 <20261105175106.241182-2-mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:56:02 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Update port 'link_inactive' and 'connected' flags even if xHC isn't
> generating port change events.
>=20
> xHC only generates port change events on port changes after old port
> change bits are cleared. Hub driver is often kept up to date
> by polling the port status.
>=20
> Sashiko reported a possible case where all port changes after a port
> reset take place before hub driver clears the reset change bit.
> This way the port can end up connected and fully running with link
> in u0 without a port event clearing the 'link_inactive' or setting
> the 'connected' flags.
>=20
> A protocol STALL in this state would set EP_DROP_PENDING, and
> prevent all future URBs for the endpoint.
>=20
> Fix this by also updating the flags during get_port_status(), when
> hub driver is polling the port state.
>=20
> Fixes: 6895dbdc19d9 ("xhci: give back TDs and clean up ep0 after disconne=
ct")
> Link: https://lore.kernel.org/linux-usb/sashiko-outbox-190046@kernel.org/
> Cc: stable <stable@kernel.org>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105175106.2411=
82-1-mathias.nyman@linux.intel.com?part=3D1

