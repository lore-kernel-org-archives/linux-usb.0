Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592643;
	b=AfP0qWW9WbybfKyr7KvAqy1nvp6N/k535tWS74YrnNDeCKMgQvjqyq1l1EcM4Zxej54U
	 qdRqp810ezzAXMlOseCAQ1Bs8wbWdE+CzDgV2B/F2Gd9Ff+bC2CzWVLnwOH72IAPmtKui
	 q/ppGgKT/nw+MRwKaIVBsW9Oob3Mc8gW3LsWK/uB9B43akwL0o43qA4uneHBtL/EoV4iH
	 fddRZZbF1SttSvZBvTdz8eO4kj+CXnXUvlP8UADXnU93Szksgtqc8woGONyNQgDYPwjx3
	 ydOppansZR9z/3VMNVRBEXcSRmULusL7Ab6kllUzW14QsrHIz7diee6PnQ0DpneR9jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592643;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=riaOi8wnnRo3dxvWb1TvrJCQK6fFA3rh+UbX+HgWSAw=;
	b=HXuBulL1wdFJNSrexoaB4qHPlcN8OSm03qFPIJc1frCxeSeFnbQHHRvT7csoW1fHktqR
	 Vsg6K9eDgbWbAmhu0ksaWqD4EdoCwSbwInVJcSwWoK5+nT/FxACq6k8pSXOp0dCJenoP0
	 D00JnyZQjnDAJe8QIxqje4YbPGJhxxmoo0NxNpGxIb4l3gL7QE+yPKKyc464YbrT55jgZ
	 6nbiWcABghJ1LEnUJPnwTOdS2nKzDl0MNwidR+js/2H5eeGIfRLwzbM4iiVF80SUU6PlP
	 rIEAuemh3iwCD1MXOQcPfZM8AEiu1kTXXAhhJJ+EUQQzRMag9+RsrQvp0/DyW0XIQLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2SMshTe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB317606A322
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e2SMshTe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC971F000C5;
	Wed, 21 Oct 2026 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592642;
	bh=riaOi8wnnRo3dxvWb1TvrJCQK6fFA3rh+UbX+HgWSAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e2SMshTei+fR5yxQ/vDgkFqQjtJGJt8ejb+20sPjIL9B2B+r6LzjOV6fZeBOoijvK
	 5ASvkjtIDDWgH66or27lA4ncrNvO7acEHlaCPZY1UfZRnt1COplVAuGHUUUdQEjwra
	 4Hpg55D8Aw4Cgk08a6avnY1MTB9Ja2/QyHxaNU5lBUZWD4QSgNrkdr5G4QMUqYxjVy
	 wuNZr4SFe1tyCBQjR4P/rkRYuDbOPdpsieLHzzJ1YtR+rtYbBxeJ/kx/mpx0/r8tWn
	 V+dpF/P6tEKM1pt/x+aczyRFtQoJNCzpwzoHDt1LHGqYVQWSsVBZ85bHmNnlSZy1u0
	 X7+JZIpyQYSRQ==
Message-ID: <sashiko-outbox-180363@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/11] USB: serial: io_edgeport: drop redundant sanity
 checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-7-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-7-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:24:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The serial and port driver data is allocated at probe() before
> registering the ports and will never be NULL when open(), close(),
> write(), throttle() and unthrottle() are called.
>=20
> Drop the redundant driver data sanity checks.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D6

