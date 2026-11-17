Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893263;
	b=U7MBd6dfGfprtrGcGImbO0tAOWWnEh8jhqCBKQ/vKjYir4haWg48p7a56pCWQ2jeMxlU
	 zXzT80RCgfHbeA6MxgBIOLQDkuTgEq04yrO7CfDxdZ1Sy6FgTN646pQNyvhE4n2ak4gOq
	 DVl0G89X/kuCJ2yCWgRMPsS5Pi3xueRak1Ny+ISs5Uc8H1mOocR0e354jufKp7ebUaBrd
	 d4TXpdqmNjzAZkg9jCZp61z0smDkayLHneZzAHcfIjie6QJuT5G2pktK+O3HszlAJkppK
	 aOWSS9i23Sji+L2dlA4INDkwgxHZx6h3Hr/rSUS0mRoIynqaprY5GCpSl04Fk5zFX+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893263;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DhQOR53XMjCADs2dIvVjzt58hm15pA/9PpQrk3fO8m4=;
	b=DxxkU8cT07Teddt6xjJYDdqZjhQ87eEQ2i1lI2Oo/aWdqt8FuHeT9hWgdsRooW0R4zhU
	 4SXKYnHHj3tTOQJXsvknjb5/iGfnhGoxt/pbIUkDiHIP1hOfaAA0Bw3IX872c7j/D6Wrz
	 dMZcO84w9eM+2VVr8CuFzIwbqLlontxKUPKfoeUO6eSkQg2YMyZnnq6QUCVfyrnFYwLpV
	 3e2Add6SrQRc65GuTFwMGt3qaCxnGzTT1fUJo3ONp4wfnerFGFhA6OXawB8TXKCDroc+8
	 /WCoBCfsXrn0l2FJNITlrwgwhlXvWKyoQ/jkx9dFxRE+J9wdP6cEkhWCeWd1NmY2a2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvBhwHu7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1654606A32C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WvBhwHu7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731491F000C4;
	Tue, 17 Nov 2026 05:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794893262;
	bh=DhQOR53XMjCADs2dIvVjzt58hm15pA/9PpQrk3fO8m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WvBhwHu768Rn+xwbeNAAO7Wf/r3x13CVki1Jh7c8pAfXZpl+rJVIMXEy3uLrMoxtb
	 NNLW45+/pAg0zPJNqFi7cSLgo87Dj8qlLpflHQtQp05KtR+rletmSsnMJ2c2PaBp+L
	 jvtKmdo6Dgb7OkmZMAdID5EvBQWdNNWIzaaI5ysGfpdULbmHSt7nfGXM1IXw6BHyFZ
	 /WEuyFqUiscivb13G37UkbMrkKIrbzSicdfCoUeclqnkmXkQAdtTEaXP3ll+uEO1C4
	 2ECylarhIktbWJO/LPwnOZkvDa9tBIQFXgIzQNXkV8fgoWgwRCWvSyQanas88WIRZJ
	 K5JFrAsGkQksQ==
Message-ID: <sashiko-outbox-218205@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/3] usb: roles: look up role switches attached to a
 graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117052137.32833-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052137.32833-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261117052137.32833-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 05:27:41 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117052137.3283=
3-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2

