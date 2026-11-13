Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591259;
	b=sHajG0gzd+w1ibpdZ1BUYaVDcaH2t2Z4dh1wlG2teVaY5qWuY4IZZJCJVTyWR4Z/TcPJ
	 nTbUTHe/maHxgTTUWDMNDOj1nQFLDiTeTmumvceVlhobCdBhRaUFV8HEhDsGKgmw/YDlo
	 flknqdPcToEqBOKOtPs33IOpKEa5anASxNiZzEV2wbWiqevle5lUQSwLc7N7Gi8GCU9hK
	 rCYkmRlos7Pd9QUDlmZD0+BlUrsaOHBYcb3DZJx3hnHZ9kAmg1WUjhuAQLY9RiUhCcnOU
	 T5EUWX/beyFajtV4oQYlpm89VC7hjIw3G8XrgGAZFTd3npg4RKAbZsYzOhjRlI2eq5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591259;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5MRTteLJXMTLZ4NaLdlxXx4lKRURcldsO9g7MiYIQpA=;
	b=Or/ZIaG1L9QujulOfPx2YFl9h2/jVokarxL1Y1bv6sm3Pm4/gNld3dUvFoIJ1W2iyZ6M
	 ZNZAESRYF4wglTItc4Gre3z5wCDrdbQJA540hbheFzQJ/ia0LXmiWcjQZs4kBAvOuAMFy
	 01QotKANj1Zn2hiSB5yvkT10298MxDoGVl4dF7oTY4s9z+mJLL/+ov1Wyxu25Xn0/TYlJ
	 ryMpnLZqF/JC0S5cnXCKOMF9SmtrwD41V3xenISnspHZjiE89aszE0EFgzeAGZnkeNIzp
	 aiii7eqBFdJwA/dvHoVJXMqIpieLJm0nTrmrzLX14KqQ4TX9jNhWKhBPEepJVUc6Qdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvuSXtYs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7192E6076F82
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 17:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BvuSXtYs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A851F000C5;
	Fri, 13 Nov 2026 17:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591259;
	bh=5MRTteLJXMTLZ4NaLdlxXx4lKRURcldsO9g7MiYIQpA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BvuSXtYsJuMBz8XikpbW72fKIIdcC9pW+4zbmcnKHm4ew0JYsGZB9FUEhHB4hKdJU
	 4Vjdi6FUBjzAU2Ligruk2NiFzJ7MCm0zZJVBb8E1uYHyyCJRudr8b3/925n85UUU8v
	 +7M465OsCRlAMcAAVp8c9LdJGGcyytt4xuRPHXdj0SgfL503jzioebqzf3LqUB7EV6
	 /X+dXS3Q4LerFxzflmJ2Zl88ySycC6CXvPWI+enLN+b2z6Nyhl1SsDh2jxHBa+PkR2
	 EaOj1t/g/NoR9t0oP+Y9a7Q761Qial/e2WV668VoE0C1OcuPihVS59mdBR+KH1bc0x
	 byS4fYEIWLFKA==
Message-ID: <sashiko-outbox-213323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/8] usb: typec: fusb302: switch to devm_pm_set_wake_irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-fusb302-probe-cleanup-v1-4-e5c65a8c58c8@collabora.com>
References: <20261113-fusb302-probe-cleanup-v1-0-e5c65a8c58c8@collabora.com>
 <20261113-fusb302-probe-cleanup-v1-4-e5c65a8c58c8@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 17:34:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Use the modern device managed wake IRQ helper provided by the PM layer
> instead of directly calling the interrupt wake enable/disable functions.
>=20
> This results in the wake capability only being enabled once system suspend
> is entered as its not supposed to be set while the system is running
> normally. Also it now properly reacts to device_may_wakeup().
>=20
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-fusb302-pr=
obe-cleanup-v1-0-e5c65a8c58c8@collabora.com?part=3D4

