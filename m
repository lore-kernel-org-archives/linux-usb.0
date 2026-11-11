Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367514;
	b=FE0JIxnmFZ1c2M7XT3939sRpDB5vKiPZBgBNiAtwJ655MntpY37dFHo2F0xC23+6QvXV
	 fhjQhbVtClYd98M+pJSvhWhW7wWCOYcvz9T3X0c4PHNUz5wkLa361ga/utVPRU89rK1Fh
	 hy+Jx0QcHzkD/4C3BSqNtVPKxhXO0oantwAzb7BQX9SnufJBIcV7s1VWORbZ/V9DlKY1U
	 ooHmrKSKGfa1LqrvrGrr5EBcUhf349Nscz/ekN+v1wd3jL2orXP7+kpQnUyjN5NqGc2+2
	 aIQltrtjBWjLhvl1m3pxSBLfSR+BcorXB2mlZdTnhgnOlXo/+zlJqP/dKw11i9XJy4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367514;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OVnX3IsoM4YR/c6hwd9SdJRrAJYOhMLzRM7sH7Q+qRc=;
	b=QE14RT39OGShZRwcVXJGHdb1poNQoy/tjJCghBcgSMw7DmIFV5TTcMKhWgo8PyppOp2P
	 DAw7CQ0o9pxdD3GrCEImPFFwJSLP3jUA6I1Nu4zA3ZZXoathmkHhc91jeikxJoSTwBLpz
	 y1LW96lqeeDFwnH3Y5PI2eY9shP5cxtq58SHthDi8Rj6FzGffRYXInpXksHw0bb0qQj7T
	 dqNxsiqyyCHrEFHvQaoj5ls6rA+MCcucfCu2PJGTYlzV90dsOy9LJKyMgjDRTAbXV47oc
	 bzzVdpNtSLH7a8dhsYT0nFke4oWFyFjWiBdjUYQWVeD6AvcUe+50TxZ3LPP4D7OVNMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqiEljQr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85688606A339
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 03:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hqiEljQr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BAD1F0093C;
	Wed, 11 Nov 2026 03:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794367514;
	bh=OVnX3IsoM4YR/c6hwd9SdJRrAJYOhMLzRM7sH7Q+qRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hqiEljQr1K/TkSVlijs5a9fI5nISzchUflzDJIk2rjLSQI3Z5wzIW8y+1YvZDtsKQ
	 4Bp9uxc83DY87eXMkTka0bpg8bK7azVnfUgHw+MaOLS1tRyL9Vz7y2hq0ri8y3w93t
	 X++t/viFuBqaKsFLmHlftyLfLPPDfrFL+oxj7sdr/e+G5XgUEgm4iy6Hbqo5IaVrJ2
	 FxzllzGArXP7LuZO3W3IbUfExQuxDLAHIDyu5JPNWeTs3I/oD1WJSBf2FQ2kxuTTRe
	 fYdhvB/iWG+GjgsUq2aGnJbSQvBXN3F6ptxNiXegYKipsnNpqUSD+ZwoBrTkugJno+
	 HURVQ1zqDWDsA==
Message-ID: <sashiko-outbox-208185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 04/11] r8152: fix flow control for
 RTL8156/RTL8156B/RTL8157/RTL8159
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chih Kai Hsu" <hsu.chih.kai@realtek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110032416.16968-5-nic_swsd@realtek.com>
References: <20261110032416.16968-1-nic_swsd@realtek.com>
 <20261110032416.16968-5-nic_swsd@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 03:25:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The flow-control setup that limits pause frames was incomplete or
> missing on several chips:
>=20
> - RTL8156A (VER_10/11): r8156_init() skipped them, so the FC timer and
>   FLOW_CTRL_PATCH_OPT setup that the FC_PATCH_TASK toggle in
>   rtl8156_enable() depends on was never done.
> - RTL8157/RTL8159 (VER_16/17): no limit on the number of pause packets
>   was programmed, so they could keep sending pause frames
>   indefinitely.
>=20
> Collect the per-family sequence into rtl_fc_pause_pkt_en() and call it
> for all of them.
>=20
> - VER_10/11: the FC timer + FLOW_CTRL_PATCH_OPT sequence that
>   RTL8153B (VER_09) already runs from its pre_fw/post_fw hooks,
> [ ... ]
>=20
> Fixes: 195aae321c82 ("r8152: support new chips")
> Fixes: fd3c7d080df5 ("r8152: Add support for the RTL8157 hardware")
> Fixes: ad2a55b63b41 ("r8152: Add support for the RTL8159 chip")
> Signed-off-by: Chih Kai Hsu <hsu.chih.kai@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032416.1696=
8-1-nic_swsd@realtek.com?part=3D4

