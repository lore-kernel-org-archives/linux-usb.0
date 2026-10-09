Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7410E478869;
	Fri,  9 Oct 2026 07:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531411; cv=none; b=lgMAFvwbxVdssi5mK1ccuExPa35yE6EGptZth+ej2sYCr9h65R86QlrB8wabYBqad/ZhKs0WeCaGKmbrj0eG0sLlvwl7oUChE3DJtZaXH+BH+L9W0NL9f0eR8rX40QLeqp+JevKG5cQgPsB88F+v+feJY4Hbg9oBZEeAqP2g4UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531411; c=relaxed/simple;
	bh=YduTwkbkssj7W4zslR80HZx/PL1cDV3/FiXvCEKZM4g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sijL0TNHxkXtlXf1rDMyZk8xZL60gcENqb/xPTCM8JUIlU7RgW0xWs5pKGCSpT6aY69IdE37fIZsLf1shNksHCsM/6goMJ72CrutUI/8/8Mw9TgpBh1qobin3VAN4La0oC/bv6rb8CwBBXaJ24ngHMq+idY4OuWDBdLQ6GYdLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrtK5PvK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrtK5PvK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162791F000FF;
	Fri,  9 Oct 2026 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531410;
	bh=YduTwkbkssj7W4zslR80HZx/PL1cDV3/FiXvCEKZM4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MrtK5PvKs6rth0lS6tOkb7v08a+cwuQtXuj+FcdcFTs//X5GtWcnjBa2G0ug1mV3K
	 bP9SvXMVtq11nemO4gH1kKx/fkq8iRD2Eto9opd/2XdYJOS1f7+fUA8Cao2X+sO6/C
	 3kNR2xrV3oGWPvGLMZafRv2q+KwcJOA5joORKHgRxQNNWU2XiBwsa+vBJLMQw1n+iq
	 gZzFbTMeKT7lG5vsST0ScSkEvSb1bPf2vODlNQXifn2hIGP+C8bcpDP1hwRY/PQKEK
	 qjpkzEkTioVEEsBqEaDz7m3nHUhdB+QL57H4LX+K6kNMwonyNg2A8GwPB7RX0wx2xk
	 uD4vRK2UGj+Ow==
Message-ID: <sashiko-outbox-165017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/8] riscv: dts: spacemit: enable USB2.0 controllers
 on BananaPi F3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-6-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-6-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:36:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> On BananaPi F3, usb2_0 is connected to a Type-C connector at device
> mode by default. This port have no VBUS supply capability, thus host
> mode only works with self-powered device or hub. User could switch the
> role in sysfs.
>=20
> And the usb2_1 is connected to the USB2.0 pins of the Mini PCIe slot to
> support cellular modules.
>=20
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D6

