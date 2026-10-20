Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485409;
	b=w+3hHJYYeBIUFOJqfxz5PyltYWVDdcHp2oXtokw48CVHN9BjQ0WBLMtBkdYnJHdBNQBH
	 btlFOw/qnciapJX52hDHA0Zcq3ma+wyGsZYu84QqF+5qG+Jcy70PHM53svwUn3yIJtMV0
	 56YMiQ5uaQYCk3UUS572/+Va29E/+IYJmIsNEXZqOWTm120oCgp7xWTrm8yFcjVWJwcrx
	 x5+2Yfe3VL/t1biuYkaB75u+xktvzRza9+Vpo+p6r2ytsjGSwqG+p1Y7NcOhmoKMGT/A6
	 /KcI7zc2m8QdoErtoRiFarjaetMp17UP+u6u/8paLzWMrIHDU0j87gA+XGWjZHKZpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485409;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fj+fGCDx81dk69N5Z+qiC3JXdHj53Vme+Xw6+QRumUk=;
	b=hsVo4qVCGtnTZfhDDXi8RPhbSLLb/0Cz+hf1T7kenuJvsMAgBcWPCmqwpEdhdYiu5Sw/
	 Y5l4ZxOhZuU1K4gsaLCn8ZZrGODCIAi9pGH0DOxbi/Ii45Zo7U/3uQ0uvFntTtVngrR54
	 LbkvPgT9G1FAogFlpr8VtY46kK/wM5+b7VZAvP9XO+WKo5QIK+5cLy2W0V6PD/84PEXQ1
	 pGz8BZbV0Tl0/YqkHrB+pN2mI/1vVRZcK5klO3JKRkiKi8UAEp/iXGNvQlhD5+wINrCm/
	 12n62WMHJLHj4jBfG9x3vUdWUcpejNrvpqcdAZ/u/UlrjQKce2uQo8oW3BJy7dA9Dmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMez3u0q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5212606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMez3u0q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630C61F000C4;
	Tue, 20 Oct 2026 08:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485408;
	bh=fj+fGCDx81dk69N5Z+qiC3JXdHj53Vme+Xw6+QRumUk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oMez3u0qcycghWOPbB3tuXpT+3VoumHhhayWN2PyIA/fXLcL4krfKnBy6HNU8Pu/e
	 TMfECeH0XHKzOvQyO8uz2w1u/co7zxuU2Ps//ONJ3e0PJYBNxKYK9FdL4lFOa9VIvo
	 avuw9BmvJKmhfl1UUYzi2ChK3fnWgkZs/xnmdHy0F01xbw3YQorFxKVGVY26hVVJ2o
	 U3o+xAb2ok0kKNUcfkKLq8teBzuFRvj8ICFsoDm71zm9B+lZGvRpFcl4oouEwGEs9N
	 JQE9wIzABVwet7Er8YCK2fE+FLPkVCfI/q3+dGNKvpqtJGeFFQlkzhtqPY1Dbeoigu
	 9t0X7/gPr9b0g==
Message-ID: <sashiko-outbox-178580@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: usb: gadget: udc: add Axiado AX3000
 and AX3005 UDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020-axiado-ax3000-usb-device-controller-v3-1-3012ecfc0a93@axiado.com>
References: <20261020-axiado-ax3000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com>
 <20261020-axiado-ax3000-usb-device-controller-v3-1-3012ecfc0a93@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:36:47 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a Devicetree binding for the USB device controller integrated into
> the Axiado AX3000 and AX3005 SoCs.
>=20
> The controller is based on a Corigine USB 3.1 IP core that is
> dual-role capable (device and host), used here in device role. It
> provides SuperSpeed (5 Gb/s) or High-Speed (480 Mb/s) operation, and
> supports control, bulk, interrupt, and isochronous transfer types
> across multiple configurable endpoints.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-axiado-ax3=
000-usb-device-controller-v3-0-3012ecfc0a93@axiado.com?part=3D1

