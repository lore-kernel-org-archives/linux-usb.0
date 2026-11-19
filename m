Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108225;
	b=VI6ZSlgv/5/kgciYxRBy8OoPAlsj2keET0Vcf5eHxar5mV2ZvJBnSj+/UBGprjV/Sh9k
	 bqYVkIjXxOfDBC++hZlNUMJJp346wndgUpSc25J+hAy/lRy6ziJ2hUzKKFrs5OtmXCogR
	 XobF+hCCUurtC0t9SHe67ATOK5tvxF7rSHJ6MhQHyl3/bRerZb4KtbqfrvyQT2grp050N
	 v4ZKATcCVnZnhibRE8o/4YmK0LnVh1AJ8ePrdXPmW1Hq8x2Ga8SrUsCE1FNdAKXb5bjwi
	 Z9HTKxloGZszXXfhvnumJJIsveuOWA4DfzKa56QMVgBxjClpmSR3zE+7mqhhmiqHg6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108225;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iCbmD7M0rCoJoVSN60gzoWL2nVX8EUiOFHW8yr/ZUmw=;
	b=fyygIpKxnVxC1rlAUa7GFcLdeOQqJZOk174LvZe6trFzwddouYBRoBQN6hZsII/TEEIq
	 W2j+3sk5DXA/Z7Fn4uUkOs9Rxf4OKGO04fpsZbWLOVwUoaqBeeSPje/3+2DkWeiRgpLK4
	 GPxFUoD9ASmK84b4+Jr+b9BArNErVZycmeZkXKYUFGAwsMU4HLvLWipmGIo4V3OTvhPMz
	 1nM+XipuIn4RJIe+20Pm3yyHpVzc0M2+0lh3qd+GtUQLMqlNW/98xe/VORND0f2S681OK
	 CpPXrMltzoWLLxeU3FEOK6nnwSSBhNXQEB3h/TcF0/wzYXXaPfg6AmnNKsx2tL5jeRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kKiz/wCo";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DE5606CA89
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kKiz/wCo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B2B1F000CC;
	Thu, 19 Nov 2026 17:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108225;
	bh=iCbmD7M0rCoJoVSN60gzoWL2nVX8EUiOFHW8yr/ZUmw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kKiz/wCoNZFBB2+ZeNXq6dfKjhJolURvg12FMpwM3G0ye8STpepgOJjsb4lzpOI/Q
	 1dWMNqksWplrvI3Vc0XG0tSv/Tv4DWTQH6CiIH2izrNC20pcpIDnCYoxQqTyG55/Ab
	 OQp+VOv4VdvyYY+PnmIXdZ+aZI2of82n7p5KMOKTQWKGRp40zMpL0wr4qWZVjcUHLN
	 FKTp2flW5yPaTk41YW5YHpTR4qTNO2SUDqUgpCjeLEJQTLQVoxeEwc/BzVX3Rnoc69
	 umWPQ76LHpt79W7lPufXG98N5Z9u9fJxDRH9PIVPXuY2KCAfrDL4A2gLyrtkOFkv2R
	 bh5rXl4KBNOsw==
Message-ID: <sashiko-outbox-223635@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: Propagate regmap_read() errors
 from attached-state check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ian Rogers" <irogers@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119170650.1521609-1-irogers@google.com>
References: <20261119170650.1521609-1-irogers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:10:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> hd3ss3220_get_attached_state() has return type 'enum usb_role' (an
> unsigned enum) yet returns negative regmap_read() error codes directly.
> Neither hd3ss3220_set_role() nor output_poll_execute() checks for errors;
> on a transient I2C failure (such as -EIO, cast to 0xfffffffb),
> hd3ss3220_set_role() passes the bogus value to usb_role_switch_set_role()
> and disables VBUS power. On role-switch providers without a .get callback
> (where sw->role caches the value passed to usb_role_switch_set_role()),
> reading /sys/class/usb_role/*/role subsequently indexes usb_roles[role]
> out-of-bounds.
>=20
> Return an int status from hd3ss3220_get_attached_state(), pass the
> resolved enum usb_role via an output pointer, and leave the current role
> and VBUS state unchanged on I2C read errors.
>=20
> Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
>=20
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP =
port controller")
> Signed-off-by: Ian Rogers <irogers@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119170650.1521=
609-1-irogers@google.com?part=3D1

