Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739919;
	b=fbUaqmtzmv1ihDAcEW0zIBUEfqubLSGhfTptsLY0IMHqfRDIB6Yi3LzmbOG7HWknmo+C
	 9G/iVoLSfK9NMtsK2lomGIxfvdntGkmTcOy8TXD3TLrDDPuOon1b8x/fsPFn7Fs3cgzFL
	 BDVWjwwyxm5RQkLICw17HIEkm4QP297PiiMEnLKceheP+5BHc49EtYr0EjERuUxAVpBUd
	 Ui16hQcjH96RRb3tzHo/a2KCM0etvEH8my1V08dAn/ZG3HiKLgZVUFhjq+5H8rJ6qFe7L
	 QiEsqMVEEF5Jup7+0xC6ycMbmhcDJBiCCCEQud4zL6lNNGP8yMUsc700SgfR55AS+CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739919;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LZ3i4RcS0wCJtltRgvJ1V+6bAGMFlt3V5BFfDv4q9d4=;
	b=irSw0UViFZ5QUDRNQQfjyOL0l3MOUgkRUc+a6gPjenOAy7VR8CyJCGXkITuktvJQhBS1
	 sBmA62aw6YFVcqjlXzh+PlId2RPXc9AO3tYymj6FmGG+5O8gMSz8NST0/e1cJfFqqj57v
	 qeOQgNVNR1I7FwAPAO0/ljsXZBd3XatoLXjpWFK2mGToctrKUCvvaoYNoFyzZuXNPA2hg
	 0Z59g78KmZuehrcun+6i9KWiOYt3C9tt6RDPE1956ENnypyuMTJ4MDpWKnHohaQOuQ0Uf
	 eHYuSGjHBeTRFwn9Oo7KhSIi43exWXrDhVHIKnjZrGM7xBT2a7zltEqHOV1+BW0/kOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGC5HIAx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF302606A89A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cGC5HIAx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCC91F000C4;
	Sun, 15 Nov 2026 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739918;
	bh=LZ3i4RcS0wCJtltRgvJ1V+6bAGMFlt3V5BFfDv4q9d4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cGC5HIAxjBptMyTuGqUfCtLGcRultz+zi+BY1SwIdFeaLN/yH1G9UMPNwm3oTU42i
	 tQeEL9wXhb/+oGNQ0Izn5IODSZv/ck4RUEtOkvmRKC/hFYI9S3B71s3iUkWs9Top2c
	 OTEboT8QWs6xF4YfMlKwwZcw+r105DBK6kAMxT3wXVrB+39/dj4dgOAnLuNETz8rIJ
	 metwiUIHUptDHna9CHi27B5c0tQoVoVfIK1wUUjeYxdOxMXRl4HjgIzQinwdJn7ZDu
	 sf21rAgtgkbB6ke0SnCR2Gw3ik2tknJJGu3nTld2LCezYNxme4+A4Is9LMeKm1l4Kk
	 h9wlevk9EwvcA==
Message-ID: <sashiko-outbox-215425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 12/13] ax88179_178a: Add support for
 AX88179A/772D/279 EEPROM access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-ax88179a-v21-12-c2d34410bcbe@birger-koblitz.de>
References: <20261114-ax88179a-v21-0-c2d34410bcbe@birger-koblitz.de>
 <20261114-ax88179a-v21-12-c2d34410bcbe@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 10:51:58 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-ax88179a-v=
21-0-c2d34410bcbe@birger-koblitz.de?part=3D12

