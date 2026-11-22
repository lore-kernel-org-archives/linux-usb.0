Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323512;
	b=Kt0GT+QdwvyWaKuUa5RWRHPJwRhiA2QICUIVmkz2DmZKvjwbvwJNftIObSgaV+WZXwDC
	 Y5qW+mMvzz9NRNqh12fOBPw1+5tlZSy3nVMQT5YOfQuG6t19te7/9RhpnHgRwlXuSNwMX
	 3dPR0Id1vU4dhz0p5b8ZFNgHvW07FdDqy/G8sOkC+t8yj4+3q62zOg6VlEbGvQtnO6uZo
	 YwPL4F5KDuh0JW4xhniJZR1NtQMLslH/zdeSN5yePGWLeeCy0/wBfZWmKyTAoiKoKlAgU
	 KG4iRJNSgSlJMK6ijmkGObldxfHFkiq+mt6ZEjNk6QOueZRRtW+eQLKkbmUVloyvSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323512;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PGdwaaBTtShhlZj+j3CmR1+85CGRnYm1fT/q9Gmesk4=;
	b=1m1JoKF3isT8U4IcXGz2jh23rZfQstBKzXo2n66iY9AIjmfu+nfAgyBzgmkL7AkA/aH8
	 hZXzCOtIz2CfwN0uu/pXZcjLlm2epqShuOXUMlqG+sTPCobc6OVSNVDc610ZLmwdqcdAU
	 FysOf4Omh4Lo7oQFixwpcy965EjqugjtLsSBAjdzPXKCO8xkjfyQKL4iH7lVK1p3q11em
	 i4hbHtQc4SB3ZqSTWHGC3BzxyEL7XZhb8Imk3ug8hHh/4yDSI7WXxbrdpikLw88YzxCec
	 jBpfmOcjDneqgLFo+Q6LXrqkZyfIZKlpuRCkc4rHud/4+tYRCWMeI82VndPa+FkpWOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaB6NIR1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C96B606A320
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 04:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaB6NIR1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9401F000C0;
	Sun, 22 Nov 2026 04:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795323512;
	bh=PGdwaaBTtShhlZj+j3CmR1+85CGRnYm1fT/q9Gmesk4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TaB6NIR19nkQtDT96tZXCill1X35C+AUnw1ksQP50CTLzW5gtDUIaKLlcUs6lccJM
	 S69KbzLcTRwZtg/zyHOhfohYvUS1T7SStOfX7uLNrk4SjUjaTb6h479JxPCXAzkO7x
	 XViwB8WOGhkfLldlDm8DSPQbOZUMCA3o5EuWuRVgfFfXR2siIujjB6uFz4mUe305hy
	 1vvblMDfP08V2X42UGVkk/Md7cYeXNDcVMEo9AwvHeK5VNa22r++dKMZ84D15SW25r
	 YiKsM1HlOxJH+qmaWs0lNejsIwRrkGwZfa/ywwd/8O53eVm7qVXshT/3kimhAHXVn9
	 alEHX0AUMnuHQ==
Message-ID: <sashiko-outbox-227707@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: typec: hd3ss3220: Propagate regmap_read()
 errors from attached-state check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ian Rogers" <irogers@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261122045313.18372-1-irogers@google.com>
References: <20261122045313.18372-1-irogers@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 04:58:31 +0000
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
> Return an int status from hd3ss3220_get_attached_state() and
> hd3ss3220_set_role(), pass the resolved enum usb_role via an output
> pointer, leave the current role and VBUS state unchanged on I2C read
> errors, and propagate errors to hd3ss3220_probe() and hd3ss3220_irq().
>=20
> Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> -Wimplicit-int-enum-cast enabled; fix and changelog drafted with an AI
> coding assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and
> -Wimplicit-int-enum-cast; not tested on TI HD3SS3220 hardware.
>=20
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP =
port controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Rogers <irogers@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122045313.1837=
2-1-irogers@google.com?part=3D1
