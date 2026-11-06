Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964938;
	b=M1WbTI8TEktBoOVH9Et+v4uAQsdnVMXbvTfr+7fSO8FDz3enRrQZ09ZLrUXtxONLRtDl
	 8uNWqEjJbqZ9/hJUGpOnyEQyO4M/FfpxrB+N4ROBNPOb8oARpVP9Py9su3bJZ72K/VWfp
	 z9rY/kxcFzcSjc9mxWyC7Y0UW6icKM6R5b5OQtMnDI/PAhBOAsyUix8GRm1Hvvi/oRzON
	 PdIWDWUJ0lN1Ll4l+5w9oRlzlPqAePU8XYFOZnFB/M0ptp6b6Pt6FPioocV/CW2AsGGlw
	 7mBbxS4vfoRAhXvvsivWg5WLTMUa1wUk2qgZNXOVue+Xpru0O/UURAPC58MKXoch+QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=w8qx+8zlrmohUtTeq7W2cMi6hvRkZsS65tgWB1GS7W4=;
	b=ANtVl0emq72LeMRaXn7ropjQDn0zmv0eJxK++x9vr6FRbQYj9UED/fS/DkqhNNkWtGeK
	 blfkJW7+c2Gxo7QiyvTnzu4zr9XrcieuTOdmRiKMaGXCMDcIr9ek9DuFYFs0urVRzzujZ
	 QqI/DftzbJ5KYpm67mGisHrwS8SlmS10ShsePSP70T3c0shlfnIibrDfW1+rHIM8Tf4Fb
	 oaiRDpCWUMdEmGo5gyFPsy3Yzx5h+68/iK1ci1WCY7cXPBLCcKktZuVMQu6PUBqZs4Nd2
	 UVafPVSUA4gu7shTQwDifI9EnmY9LplyQMDN0rK5NbdL3WY3jVUJDcY6vNGMtoQh/Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHrz+YsQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B45606A902
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHrz+YsQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D88D1F0089F;
	Fri,  6 Nov 2026 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793964937;
	bh=w8qx+8zlrmohUtTeq7W2cMi6hvRkZsS65tgWB1GS7W4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZHrz+YsQQZqd9L8ut5Wsyd7BVTNa4I/GV36BU628/J8jmsD8g1xJaosUt/d6fIhUG
	 CuqNhjb7eKc2OyB1pRnzEjT6OQJ9+f1UVjeKxb6IaDThbbyZKIxoH8sEeKhnXHiWHT
	 ub+AEbWm6YOIzAuz8erjPg8R3Kv01Pl9U7W5v1DhdXpQ8ex2P83Qi+EoAbV7LflEqA
	 wuoGU+diftsOuiqrV69hSvL8wXF8gmM9nJjghjRdODqms23yRPdJ+DonfRYUzb5LWe
	 mLvMo4OneD0Z2JylySJ8SCZj0DjYf/jonPU4bg5w3WXfrRXOdbl6V9mPvoj9kN+hRW
	 JCbLhbi8BtESQ==
Message-ID: <sashiko-outbox-201319@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: roles: look up role switches attached to a
 graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106112811.963923-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106112811.963923-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106112811.963923-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:35:37 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
> on the caller's parent device node or through device_connection.  That do=
es
> not work when one controller exposes a role switch per connector endpoint:
> the switch is registered against the remote graph endpoint and the
> consumer, the connector, has no phandle to it.
>=20
> Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
> endpoints and matches a switch registered on the remote endpoint, and try
> it after the existing parent lookup.  A switch that is described by the
> graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
> the role-switch API does, so the caller retries instead of concluding that
> the connector has no role switch at all.  There is no behaviour change for
> existing users: if nothing is registered against an endpoint the lookup
> falls through to the previous paths.
>=20
> This is needed by DWC3 designs where two Type-C receptacles share one High
> Speed data bus.
>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106112811.9639=
23-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2

