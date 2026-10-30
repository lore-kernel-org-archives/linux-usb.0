Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793350876;
	b=qbn8uHhT9MX8F4U7qHqr81XSb35MT5cfh3BnZY9n+N9CU3MubHroKcaKlSlPqktEtFtm
	 kUJqW/2Y+IaoAMIfuHxxrwQpaUXz1xeXe9fJDNvD7yGKIEUScBVJFjwc1JHBCeRwqVQn0
	 hQ9eZpFpNdwkUpF+X8haX432hGefa18jeNm9YSc6n5ebBNLMynOoOozm5gIV4HcWMMXUp
	 MwQ/AH+a23cNJv+RbUv9Dw4eCRig/IHlBDkfYtJDrSFkVlGGnyH+27l3t3LIYVfsu75tA
	 en0bQiMlCtsubkgEI/SvwubBeRlMrIRv++hBMbR1NZ/mFgyUt/b0fuMNIQDzfrWP3tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793350876;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SdOgdHQ7HxDO0G/4H0+8zwvy96ZUNZVJSmkZxK1jaO8=;
	b=q57e+JJA7CEJysGbvBIF4HyzKnSN/yocC1IdHbI8ogASuTHh/wlCzDrs4RnirDjpL+rB
	 perfbX9LxAl9zWBTYBgGOQTQDFONZPCsNHIQX6GygpsxyPOuuhQkfjY7Sv2IgMq4FmViV
	 rBHpT+f17rQZ+gQRw+MvQLghv1pCJ2Lj7BKiS5hVHvZU+BHewgxH4kR01N07SvGX1+85+
	 Lr8a4NUnmW1qbTwq+C45tiGsLHDYkzs9dyZK7e89/v77dTaa5HboVXDQoxwFAShqc9Vvg
	 TBzjN1UhKktdJFPobkVawYiFOEqzc5aU//5ch0G5vZsShrZ6AbI+Io4QoAuQQKSytyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJEFQzsv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0647B606A31E
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 09:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CJEFQzsv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBB51F000C1;
	Fri, 30 Oct 2026 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793350875;
	bh=SdOgdHQ7HxDO0G/4H0+8zwvy96ZUNZVJSmkZxK1jaO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CJEFQzsvJvq9ABGRe6JSzn6AGz/pIk6uYina65JmQILYNEkqFBpi9EOiPTWHnPpjE
	 D+Qs8o9PnwHXrgWBXPl6TS6XFNM5aMLR/jwk09SqOjubi5Im61ILG3b4qfYLQ1IjAF
	 xTIxs8VUTa29YCPz5ph8j3TvmFgbvOSjr3SQSM3iG4mg2hzhqxBESUE4XVmX7Gc748
	 4a7bu2agclz/k5qzK0mXu2YSKheEKVGomxw28M5+jCWi1R7dCYtpIuPjxG46JQqcRM
	 DPi2l/w4/3PNs+C74k8wo+i8m4hg2P18fjA9/7djLMdch2tzkhrgeP2wwxkVOVTW3b
	 P0o3P4AZ1AhGg==
Message-ID: <sashiko-outbox-190728@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel
 activation/teardown warnings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 09:01:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> will wakeup usb4 driver, but fail to create pcie tunnel, cause
> the warning due to a race condition between switch disconnect
> during resume and user authorization
>=20
> When usb4 enter sleep mode, echo 0 to authorized of sysfile,
> will wakeup usb4 driver, but fail to disconnect pcie due to
> the PCIe tunnel had already been torn down and freed if the port
> is fail to resume:
>=20
> The check prevents a redundant lookup and eliminates the warning
>=20
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030082539.1208=
733-1-chunfeng.yun@mediatek.com?part=3D4

