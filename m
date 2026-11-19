Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117976;
	b=yC1z1nkQHUm1N0+4X12eqa2Pvx0P4R6hCCSLJRa+0/5vyNW0ISpCEw7OS+Xj5lxrMTnV
	 bw2z3Xl9aAhD72GQZdU173iPXS2A42gtb8wtQNWTfdcQf+KLSMkEIpxKiSfYE0i4tmXX+
	 HgArX1p5+vWA/FeNRSTCNmmba/X9lNsw/YJ+WeuiQbxaER562KsL3rE4DLKcrHZ9OK4PX
	 9PYWRw6kmr4CE/VrfOseoptNBhmliKxXwxnT8qnzXMxuMC3qCN/nId/D5dV/islVuTVmV
	 YYi3WLQWjpdZubS2u019bcSrN4uDnzHFV4P/MAn2iejFdWIDdxiT59wgIb6IG4JVxkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117976;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i1j6H1EAccq/9FdzSEdTl+QGI5no+JOn1Rs3PIgo05Q=;
	b=QzLVvWvt0NS/zmtWf2sQhtoLOzdF+e5Tv1YUaoGbYbuALHWsLPYMJT06hEXEN2tzlDtX
	 /0g4ynZkMeforZ7NJHuiP5aCZpblXYdfBNAzChd9242pkgyz7NHXhRBdOhBqSvw/4LBc5
	 5p4mC+26hGVOuEWID7M7BOeNN+ltIRySRudojVO9eFeALwH3Mj33HKdwMwzbfeylNuCXI
	 seyhnZnIqqP9YeC1iiOSZDcooaCU3eys9VBqcHdOSF5F7Aqfz1ss8AbG//eoiygYKlAJJ
	 /G4mAJzMpdnLr99p8UBLndJ9AJ0UdU4wF9zB19P32xdtmx6tJNVGKdvzwU/kkgxW7SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITW89tNZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A99606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ITW89tNZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404821F000C6;
	Thu, 19 Nov 2026 19:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117976;
	bh=i1j6H1EAccq/9FdzSEdTl+QGI5no+JOn1Rs3PIgo05Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ITW89tNZxz/mfL2WIVPID0S5bXIOMKSpE7NcS7NADWKo/QzKo6exF6SEPC5jmHVlb
	 1Ldl9/u+KdzAtbJxiemTCBVVs2YXgWgrOVRc0ks39vwnzroRh+MIWbwq3pVQsSPECn
	 UOe/rvr6Ijfk9xWMlGWyCc6dingQwJgn11NPg5oZFp8Koonga6zGF/+wCUgKYRY7ZW
	 cNfMKnOt5mpjyRUQRpK3mDvkT+/AzefOqREtUMLPjaj2HfjXnZzVrDQQLVs+07ktUh
	 ZxEj5bAqpGNzUjHIgfIQ4IAKn9Q8WK7d6DuV4Ah+zAHCUhKlUjwp8wtD8qAevFKHuT
	 N4ISydH9ymmxg==
Message-ID: <sashiko-outbox-223978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: phy: samsung,usb3-drd-phy: Add
 Exynos7885 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Umer Uddin" <umer.uddin@mentallysanemainliners.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-gta3xllte-usb-battery-v1-1-0cf5f763522e@mentallysanemainliners.org>
References: <20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org>
 <20261119-gta3xllte-usb-battery-v1-1-0cf5f763522e@mentallysanemainliners.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:52:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: David Virag <virag.david003@gmail.com>
>=20
> Document Exynos7885 compatible.
> Exynos7885 USB PHY has two clocks (ref and phy) like Exynos850, which
> are already described in bindings.
>=20
> Signed-off-by: David Virag <virag.david003@gmail.com>
> Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-gta3xllte-=
usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org?part=3D1

