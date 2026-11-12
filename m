Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477614;
	b=AFIcY+pvQWt/pg8V5RXYgca+mafrRz7rDEd7Z/IOWWM4+Yf40JQ2BfV+4jXMNo2pEuOy
	 Qmiddhjp++fhIZ3yfnomobXQYNAh1oVN3nmyWbVPU4dqyf68w9EQgMfPhV0MahAPzc8ZT
	 xVRnAukdbVjPXAubo420fkY02PI9OHkN+gkOpSS4AMAZZv+A2ZDVaYq5goq/yvPp0AWtF
	 FQ5l+WZjoGSZURAMo/TfMjSJ3atVFL2O1FOzfuRPcGiUAMdE3JZEIgD8CNc0mArWlMrtj
	 iP3H5h+Pr+ZRx4DeC1b4Jkm9HxQmggCbrRYWiFNcUxWm49OaY0vG5cTagBuxvf7jVDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477614;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yd8BN9SA6skdXMu3I/AQ2+7SOophbAHzOQFvtj+4gSU=;
	b=ZNCyec9Lujici5vtvYkY7mHb2OjeBlfH1CPidWQFKT8JdkNWDYHJV4PpEffC0hKnPc5C
	 i/32R8mDZ+AQoqmpJoz58vDKL78YKMBr/vFUFmADWGnd+gqYqkafywH4Nm7aka5gj3Pvy
	 o+wVDo6LmzdlejOw86r5z++amUbYNxCj4Yp2yWkcR6loV8Ox90AQRtmMLl5qokxawiMlW
	 TmVUzS9GrN0vYGQfnmYDE86tMEInTh7+aLngALtOESWaZAb6o+J2Mh+7IVUroJpinRHfQ
	 zNcEZ2w3gLjCJuu2BCL8Jj8UhEGbn7YVXNaHvRZgrCaByPXRW7Nl582LIlhUR3y42yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oz43IZ/Y";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B8606A332
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oz43IZ/Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F181F00A05;
	Thu, 12 Nov 2026 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794477614;
	bh=yd8BN9SA6skdXMu3I/AQ2+7SOophbAHzOQFvtj+4gSU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oz43IZ/YTlEPOB7nr219u6aIXJPUmrqrmJF2YANaaAw0+biy4R3j1AvvlZLxipr3V
	 Cj3qiN2D5RmpNSro2CepcQRWusoS4HutJln/6Onk1xuzpIuEZPSFHTcG0L57Un+Fkq
	 fQ1lS88xlhrQOBDGDbXhEK4U0Lpxrcb2KzhkJM7ix0UXDP9lpCGdd/ba/Yj3rZWTr8
	 KfKwHrcfarqgkN9U1DTvrOA5ayxumY0hUrbrT9TgbOX6yTVfyaBneC6B1HMzdq1Z3v
	 z+8OAPl8qpgHDEfMFk6F3Ujn228D+P+9N6H2dZ6TEeaK558zQx1dk2L1Gz02viubei
	 E6XT0Mh/v1OLA==
Message-ID: <sashiko-outbox-210915@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Keep the USB4 port when component_add()
 fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suyuan Wang" <shyckless@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112-thunderbolt-v1-1-fc30057cb7cd@gmail.com>
References: <20261112-thunderbolt-v1-1-fc30057cb7cd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 10:00:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Suyuan Wang <stevewong@hust.edu.cn>
>=20
> When component_add() fails, usb4_port_device_add() unregisters the
> device but doesn't return:
>=20
>     ret =3D component_add(&usb4->dev, &connector_ops);
>     if (ret) {
>             dev_err(&usb4->dev, "failed to add component\n");
>             device_unregister(&usb4->dev);
>     }
>=20
> The port was registered just before, so device_unregister() normally
> drops the last reference and usb4_port_device_release() frees usb4.
> The function still goes on to set up runtime PM on usb4->dev and
> returns usb4 to usb4_switch_add_ports(), which stores the stale pointer
> [ ... ]
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-thunderbol=
t-v1-1-fc30057cb7cd@gmail.com?part=3D1

