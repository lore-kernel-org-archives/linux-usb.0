Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995600;
	b=RjrVZWk1bWbxcBgRfSsqiIZ9FmSkW9IOGY07pHrec0qKuAsNnbG/i1ILkUj1S6qTmEyJ
	 4DD3jefh7rv/LvWBT+dZEL2FaTqAKsyJNN6s3zZe3gW2cBCXo/rEPBx5JVFls2QX/OUwS
	 o8DeLXh4Fs4Pz0fnsON+pQl/76h6H1urLsQ/Y3tOSMtOTu3j/XmpeL9vnZsf/AVK7qkll
	 oeO/6h+yOQc4gxAly4Q5P5Y13uBcQdfuRhcegjWzNsk6sQnEzMk2rUnb+whLh1tY3feEG
	 /XBWITJiHY5ZWXiYN9XY/EJQH2qkxMwPA5E5jy067/+nctGZWu1Yrm3l9+7plUUijMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995600;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kcVyvcxol3Lv4BupCkKOT3EEAhyCZucXqrgsB2+2jts=;
	b=CcuQSPsdCJCejpN7Ezz2lZ28q7mAdMwGhmt4SvRJ8N8yv6zObDEEo7l6exbGrz9V2Fgq
	 AocdGXxrPcffCspNYhesOjS37JA1p1YneI1BV/xGLVw2+05oCa8J7ci537oQCqfzh7r+d
	 N737LHWQBmNleHpm9xT6KFZWZC/+HZh6rZXnawd+Lx8Wl+yg3u6cac8GlZoz6peM0sLN8
	 4IRd+DF1mhz/WfKM4uzhvuC9zG38kzXEKIjAVcPNSvfNOjWCUUeFNjq1dwLY2f35yidYv
	 zgePBqQHPYOOBlf1vpNVrAdIht8cvT71Pj/2THyDC9oMFt/aUt1XdRV+STLT6pwE76w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIWOfKpY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B107606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 09:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIWOfKpY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA25D1F000C4;
	Wed, 18 Nov 2026 09:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794995599;
	bh=kcVyvcxol3Lv4BupCkKOT3EEAhyCZucXqrgsB2+2jts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TIWOfKpYg0Pk4j6rq/Az4uZrbrEI0BGihBKKWQxvyNM4H1auESlMlH5wpuZ+qWNnd
	 Fwx1RLHsRByB19uEmC6o9vqhI9kiR2NTYcgjY5Du5PbDJAR6mp0i7wUvfjI7exz6cH
	 HOD6qCfIUmZcbt65rfukOrF8B/V8nq50qPTTYTfqIOuDweeF14ZvyKFm0zkjRvK//k
	 Tq2x/pIP2XdliQY3PR4c5I1YW9/QOjmxWYg94T8Giao8ga3hIjCbDSpd2RYfXRfuFR
	 u0amkaDqfMKhjuIYLd8RZ22XYZjGiclvnzS9jTltUbbxgS2pkYtuJC4P0OluK+7H6C
	 sc/CqXw9/p7cg==
Message-ID: <sashiko-outbox-220634@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: serial: reject port counts exceeding the
 array size
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ju Nan" <junan76@163.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261118093838.87616-3-junan76@163.com>
References: <20261118093838.87616-3-junan76@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 09:53:19 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The n_ports module parameter has no upper bound check, while fi_serial
> and f_serial each contain only MAX_U_SERIAL_PORTS entries.
>=20
> Reject n_ports values greater than MAX_U_SERIAL_PORTS in gserial_init(),
> before registering the composite driver.
>=20
> Signed-off-by: Ju Nan <junan76@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118093838.8761=
6-3-junan76@163.com?part=3D1

