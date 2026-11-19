Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095873;
	b=FQPhxJcWWb9LCgYToCpTO4WAkyL8fjUvztFlHbn0i9/fAC4OxHgV31NLQHPpuXTl7+mJ
	 YJFqNmoB6s/tI/OZFcfthEbyBn7ABt1IwBE7KqtPotUCJEJYdby/ijndHdv1uw4uAV8r0
	 C0JdComw2PM0nFpyL/18+OtvukylHTNJTldPA1m2SuaYKKECZj3RLs/SjZMZfcqJZal0x
	 pVTB/DSetWKxDkbt2Fi4na9eNDMCUxXxKZV0o/cYSS+tQbshJQtI1vS+VmNOa6lr8F+cM
	 jvfIoC0e2xi49MPQw/GXP9cIKXWLXROBnQ0UypJAI5aT1h2m6rfSxa+bP2DpW688STA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095873;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z4nSLC/PoAP5kIateie1uTFC4o7p5+1eKwchZRgHsBU=;
	b=MsPsDEQNKirWUl7GqZWTLs9pCSL5jcPBzvMH5wnvNU8jJIvVfiXgPqL0iLAV7mH462X8
	 RBkhn03amchmQKOBtwlxBRBcEzey3K4kkL0FQX4FELqy7/mQ0HXSawzYbEWnX03nusduG
	 KVJ3wc8f/hq+XNXXAT+BcBbYSLYMLOG7i3oRf6xk/SCsWqU44uvi9Dxcp0Y59oOFUbPs0
	 BUam74Lu8GSKrp1vgOaw1Ma/jgTtXWRpzNDvsbVuiIRlHpNNN34PRx+lFhgrFvnECyYQy
	 KhKNPIRusWawZI8vVcRemNnYGta2H55A45qeGBJ4JSpvPz0dKvIicfP49/7eW8snA9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxMp9b+B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796D7606A32C
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lxMp9b+B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AAA81F000CB;
	Thu, 19 Nov 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095873;
	bh=z4nSLC/PoAP5kIateie1uTFC4o7p5+1eKwchZRgHsBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lxMp9b+BIK1zly2jIEt7lVpI4gOxLtPpjC8+dR7qTsvRZNweo2VPLOEVEB/3F8zVf
	 eN/9WKzVlnQbg4LWzjqB1UGHeKkhBPEHnByFu/kUwq53zvfEM0kTaIck8Stw3wbhkA
	 k5E/Psa72BMrcfPsTPqc55dgVn8BSolVmRHld+Y0yOnT4gAM6mVZb5QkkM9iMBxE0q
	 aTyxMHpRXziwX1cumzUbgT2SvHyemVt2t0XddUPTde77Yz2f4O5OWIe5yK0Hs+7aA3
	 faA5dr8KNpI1BSe1YorAxWusmIV8ul/YhKtgs0XSp10lV2rnInRlCPdMWUBc6eUI+R
	 4gWPh3MHCPClw==
Message-ID: <sashiko-outbox-223199@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/5] usb: chipidea: usb2: drop the ci_hdrc_usb2_priv
 wrapper struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-3-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-3-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:44:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With the clock no longer stored in ci_hdrc_usb2_priv, the structure only
> wraps the ci_hdrc platform device pointer. Store that pointer directly in
> the driver data and drop the wrapper structure.
>=20
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-spacemi=
t-k1-usb2-v6-0-4a9add848728@linux.spacemit.com?part=3D3

