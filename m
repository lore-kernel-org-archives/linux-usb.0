Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962285;
	b=EtAFk3lm4qw0+UyFKoPE6P0Hte2LXst1I8xG2nsnS3ldZteEbnexa4n3Ybg+x8DwXqfP
	 JtppGVqWAWeDmkHgZC9ZqQQhHJTZNnNE/OOZm0wdnRDO+YuaTq9qI15NJsIsaPmga+5nk
	 Nz7RKUDDLIzpQcne0v0oWRNFQvZ83Ychfo8kxb70RtsELOotAGwA8oj/41/FbG4OxYb4u
	 4ptT89l+IuD6weYlKiTZTK5mUDqYp8bV565rIL3VY5w3ndaI+/XO7pt7M7SCa4aC/bZhO
	 x2dMFmG9bdJ3zxs8Ndu8cVmcvT+h5d/0aXNsTtXiriafDvQYdpjJKxGhKpsYft98anw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tNDWEqTUh/atK6sX3f9liOErk8ImcEAgB0wntcGjQSM=;
	b=kBxESYB6Q8DzahROMPlxRjl7LkuxhkKKvmOIE8i2v/jz8s8pdxhzpQCrYGpRx7r0IqJN
	 V/zJ1P/9bVLkMccXVIh1ZcRaCh2NJOo4Lfte/VgL0tZFaP1tSdvbsqI18w4BONnMrbqWw
	 5Sc6Q68b+qKp4svdmA8JXthX9kiMg4yb+JAzhSwNJCY/miKTbALA4EJ2CDl6hOmUluD+l
	 djSS5m2RY8EvOevybAJ0YASNYUv0y9sf0PwLEUVNiA+uKK4PBWZ1IQxZgpnVBzmVVKXkA
	 l4hqzkzdyjHxV6Y0yiDsadwEwOTuB0rh4kOR5yvZKdKTprRlBlARw1TIl3aWivant2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQqygV3j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7127606A32E
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kQqygV3j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D881F0089F;
	Fri,  6 Nov 2026 10:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793962284;
	bh=tNDWEqTUh/atK6sX3f9liOErk8ImcEAgB0wntcGjQSM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kQqygV3jqEmMC4ap2DbrIH4KiSl/5eAaHACv1YNwuhkMLWK+lAMB5zxNVDvdwMeN8
	 d6pBNtsLJvc2i6MsqNh6P+O7yHQ/NYsDN8OdkarrbZHeTvdCytqez0X5EpnNQjPvRa
	 64UVJc25VAbvKoqq4gT+YGXXllR8oMesTyynK6gCV1kaq7pQbXcqjM0cOMUP4YAbio
	 WD+VfjJa/pXUtwCN0lWxY5Pk1zOLN82mEu1EtumXO3y4pTR33LpH8Cz7k2v4f9Y4sQ
	 A6w4n6HauIQDrYEvGWnbibdHbuFxesE+QZ+ebdiftyCWdaotG0qt0zZuNx0tYDzvp7
	 SCphli3gl+wpQ==
Message-ID: <sashiko-outbox-201233@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add S4
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: christian.koever-draxl@student.uibk.ac.at
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104632.54161-1-christian.koever-draxl@student.uibk.ac.at>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 10:51:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>=20
> The S4 USB glue is the G12A one, but it fronts an xHCI host controller
> instead of a DWC3 core, with two USB2 PHYs and no USB3 PHY. Add an S4
> compatible with the G12A one as fallback, and allow a generic xHCI
> child node.
>=20
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106104632.5416=
1-1-christian.koever-draxl@student.uibk.ac.at?part=3D1

