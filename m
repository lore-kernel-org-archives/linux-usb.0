Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0213D23D2B1
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 01:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507727; cv=none; b=FnDssxvtK3/wLZ1EmL+Ftmi338/SpGbwya87lMU4GRaaNWD/YYc2zXGtv1ozaiLFXd9z8vWgCSDnxcj876g1zvKqtC5r2uxhp6zDceHpMtenDz4jxbP/7A2Q3uEqm7s4naOeJmLymcuUbrnOsL6WDdbKJUeFcQEZ9YOSQPzxwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507727; c=relaxed/simple;
	bh=x2xh1AITG6YGC5ci76z8mgZRKlmW9vU8bpHVV3sr7qc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VkpcvcLiuhzqtP+ZVKZGngW2ANks1h5epkcjwjcGsy0RfoScJ4DzZtPz5PS3Dp4As7KYUP1bR03NSRV1ruazhNHgNMIHQ7BjLlvQUh6YXKujgnVAeSyJacP7jErZieCKzmtpaGXABC/gq20nNwneBzUo9OZeusnHt6k6+2dVRF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRyVS97V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRyVS97V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4A41F000FF;
	Fri,  9 Oct 2026 01:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791507726;
	bh=x2xh1AITG6YGC5ci76z8mgZRKlmW9vU8bpHVV3sr7qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VRyVS97VmpSe6GlRZhjWXBg+erphMd1sBMw77WJPIEOS379TJ7yDfCSMmauyhEbSN
	 HVmWJKlu1TUFI0sjaxEFKZFnnjQMa8MBNJJ00BW4sJcg1VWBTkUncoQWz/Ln0RZ840
	 ntWINBf3mtl9Cm+E25GbACIEBPGXRmHTaLG6qpRJ9xByCyBiRNDs/OHPb/s/EfOLde
	 mGPFO4GOU27cqvRxuglFtR54V9UNYGpLUjVVXcexQqxJJhoFyhcRfKfz1srt2WUtIX
	 sxover+TdphzoNBZw7EYT0JsBJMJ+tFlhj5pHZw7zuOIqLA76Sz6QGmolD8cWu8ZMo
	 qsX4EufDfakQQ==
Message-ID: <sashiko-outbox-164692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: usb: lan78xx: reject invalid EEPROM write
 requests
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Munari" <stefanomunari.sm@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009005702.164936-1-stefanomunari.sm@gmail.com>
References: <20261009005702.164936-1-stefanomunari.sm@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 01:02:05 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The runtime PM handling removed the -EINVAL return for invalid
> EEPROM/OTP write requests. These requests now return zero from a
> successful usb_autopm_get_interface() call, even though no data is
> written.
>=20
> Set ret to -EINVAL for invalid requests while preserving the runtime
> PM reference release.
>=20
> Fixes: 8a7ffeb795f8 ("lan78xx: Fix for eeprom read/write when device auto=
 suspend")
> Signed-off-by: Stefano Munari <stefanomunari.sm@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009005702.1649=
36-1-stefanomunari.sm@gmail.com?part=3D1

