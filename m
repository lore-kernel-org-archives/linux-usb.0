Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618450;
	b=qVAEyFZSH1Kwl4TOe+hcCBHA36RMAjYjgGgH26YfGC+AAbxwwVY9yImxHvqxlZi3nC9H
	 yUUVWeOkJtf934KHJrVHvZ3sJm54i6tOUknFCZxFVWd+Q13RW+5pw10KHBppas/zpKT6F
	 knjwmJWJ8hHDEt9pVLuSUh3sHdTlsuRNU8VgH8XDK1gFYFlZUTqS59sh5Pqtu+WTjo6tq
	 zdF5GIn1sn4+l/NLR5LWaFfHNPn9kQzdUnlCM9pl/wLGu+183zWyzP0IyoEiz3muQqUr5
	 XBPDEn8ASi+gSIFlO9dl0llrABcnUlLZ++UivbV55IgUmW8es4T/msqbKf5ktSvpqvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618450;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MBfAGxb0g1xI2ggvW4dBhxTwTmH6giyh8I8OyyosB+c=;
	b=Vfe9Gb25FVDE7HVa2ghNibQ9BcZH+rbQU6IiGkOWhc7k8khoNL+/c3J+dAzxlKbCDDmx
	 7eyUJaAWIeIvcf4mHXL3YGWeQEWs/dmHb1Wu/Bme17rMmhGq5EF0KJQuAsE0QL5x5p3M6
	 eujU/TUzM6pZTk0YdlQ0tMxY6xyoATkNG69OztXF0g9kkhN5byNZG7QJO52c7G9vYz+qt
	 /JWoUkWD07wqC6L/m/9OwotBJrQL/gGIuOdePUwc8ClQzrLxheiFmR+zQNy51/anzE1EM
	 wQ6V8do3Zz2a8RdLTz2T9Gv9bJimCFnu409tG7fLNIsB6XC9CAgE9bKr/IsyWfMxG+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqXXVyzo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814D4606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqXXVyzo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081761F00A17;
	Mon,  2 Nov 2026 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793618450;
	bh=MBfAGxb0g1xI2ggvW4dBhxTwTmH6giyh8I8OyyosB+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oqXXVyzo+nh0LMxJQqSmHKlK+ahS7GTScRMdO9CX6OH/0XHG1Of6Tai0Po2b2nyQP
	 ikbQjaifisAPRn9v89uvNov10pKqmnER1Hnrzxx3ZTSOluQAo7oKehuaYzEH0cBEIB
	 sxY1zgIu5x6jiufEeS6cCbvRqJ+6n43T6Gdwr6g0yQ1MiubPFEZBKbiIF1oyia4PZU
	 6OlfaTcz3gVc5xMmKn9N6JX11ZYQ6PyKu6YA8TX6V3ACcbDOFYA4frspC2CPr3Y4mz
	 hb8pROCTG1b4dZ4eDuuz8lEYKDyiAilG/QbAgXp6B2+8/Ssow6IppugTDrH1kHfDOd
	 j2Lw/EVcrq85Q==
Message-ID: <sashiko-outbox-193328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C
 and PD controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102111732.1678646-2-shengchao.guo@oss.qualcomm.com>
References: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
 <20261102111732.1678646-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 11:20:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
> controller. It runs the Type-C state machine and the Power Delivery
> policy engine on an integrated microcontroller, and exposes only a
> status and command interface over I2C, so it is not a TCPC.
>=20
> Describe the two ports as addressed connector child nodes, so that a
> board which wires up only one of them can describe just that one.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102111732.1678=
646-1-shengchao.guo@oss.qualcomm.com?part=3D1

