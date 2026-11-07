Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036117;
	b=Q2QWJzt86MOGnjgHsG89iIw4LZsjyI2TPTI0heXQ/FZSHJo7a7Y4YNZHvnOuxwduS1It
	 6kA9I/QmWhRUCEWC9H3ppBuuyot/7Kao6p4dY1Ry25uGpXnAT17rKys1H+yo8eUmQB9O+
	 Ntj1ihxb+Xz9rJIfqJFhSv5EBpi0Vg1fyTRa4ZRC1+vMfnrBzHn9k7YpHxFYaybhm1spt
	 m96QmbREYqrIWu5ihqev3ImzbQ9Z5bNRcclGh8pGxz4VbNvsPh1PvG2E4PJNQRLmRGS0B
	 atnFpalizWBE4eu0gZesg9X25dHvbLUSVFEzmQK6rT7LUEvSzgdhJWvfG2c2lDt0zmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036117;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QfBXOFlxxeNJCDYmGC977h5pw/K9+Mckg176Fy0NTIg=;
	b=u8nOOY0ZrOg8c0r+/BMjX8lTPtrjOHN/Xrgab1Swn6TfG2oiCAtS7veKytbLQ5Rg48LA
	 IdfaONkTqnjRaLufSHeBqFD86ZXpYVoJxnbs82VDbm08drhbQN6ggCFx2JIZY6rycANZO
	 +y6O5VwbreqCYWWBa+cMM7SI31FgcWr9iYQWG0z4ODVE5qRdENabbAWuwcI6NPT8kAATx
	 UWO4DBQYpqYP2MDPma2KjYUTvlPjdTel7memkQR76mfxAZ79ls06sqDBRRKw0CzFSRj/q
	 dmBDFkLK+YPtmU+UwIPcYuqveX5EKDs9cq+0o5sVx2GYnuIDQPtOObwF8yz9iS888Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cH9bsR3y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48EC606A330
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cH9bsR3y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0C21F008A1;
	Sat,  7 Nov 2026 07:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036116;
	bh=QfBXOFlxxeNJCDYmGC977h5pw/K9+Mckg176Fy0NTIg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cH9bsR3y1T4/t7NswIopFSGhQXInkrNDYgxi/ehB+Ui2NLYE1eL0KaX7uKIK1mWB5
	 LgTz7BZ2Trc+BOr5lLaawIB1VoljYlE6N0Fjjoufv9/ET3P7mtsEvUiN12TWdtQOpN
	 WeOFbX9/2ogvl7ihovgGkN0oMdl9PfFHe2AsL3akvBDISQ3gx0BxK9I26haCOnEdPm
	 +2eC7vYyQno4e0pbOArX9Ogq81V5n0sV6D1UwEcHmrUj5BtPD5iVowDKim9gIBUP4z
	 rJ4Ixmm6lywE/tcY8jTsg54KLmWpUEeX5IeA6dxJO8XZMnE9RWX7h1Iazu85GNrcNU
	 0K31VR45EjIxQ==
Message-ID: <sashiko-outbox-202702@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-12-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-12-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The AX88179A/772D devices have 32 efuses with 20 bytes each,
> which can be randomly programmed. The AX88279 has 16K FLASH.
>=20
> Provide ethtool read capability for these devices. However,
> no write access is provided.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D12

