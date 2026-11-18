Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978986;
	b=QnmYIdcByl29E762A7BsnfwfM1zjpPbWrBiRbhs0yg/SNSU3YjSqNOk5766mMKXGiPPf
	 VPNXadrctY3mCi9Cf74Qm/kHwzRECZW5+N9gcssWW/5f8J/nXBMPkjRzzjVnX+/V2Ff7Y
	 ZVQfuaPBLsFStkCCWCPaYXUDeJFOcPv9KuYyY9YgnoWpERrhPTqTS9oe9NTwroQn/aRQC
	 C8qgDY7hFoDcGWWReqKhLVWEuqZFP5z+IWjr7R5tn2FkYcAELeXYCSB32iwerbiJwWQJd
	 Yz/jMyezg5u5rn2P7+YSpJlrY0XKZdAIBCRfS5jfcq/js+Yh9Ps+KQHDJi4E7yrjSXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978986;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0liSstMy/9A1OEI7CRlUJgLdHtrfMcV0uysvNm0wgig=;
	b=Qp9pyl/EX+0o4gteIGHsxl0VURqvy847mFO4f7g2n3qaY+zHy72jbTbFQ9AkEqfFssqN
	 N41rLGcMqonbM+Lt1Lya/y9+JoqxMBUXXeSy1S1OwnZgvfvQTIYZzA12lGni3jq4IiBwL
	 o92+hssl6hvAf0AfgIzvfNlNUtafrFdsydewYuNKI7z2v7EIfwfMe3QzvbKMSi5HivCP0
	 A1324DhDKcxpW5xco5/wxWVQdcKRBB8r89EJYqhCWjN3s8HWfi4kxT1WhXM7GJBOliHfE
	 gHf9XSTz3njsAnceRInBfCbGXyKGHRbl34UfRZuvv3wu+M10UlKRF9BzOYXxK/KsXog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxNIGMaO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEC1606A31C
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 05:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxNIGMaO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E6B1F000C4;
	Wed, 18 Nov 2026 05:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794978986;
	bh=0liSstMy/9A1OEI7CRlUJgLdHtrfMcV0uysvNm0wgig=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=VxNIGMaOlBCOdZyi9Edjbb19N2Jl37dR4+lF6dLomOKBrhtd69jQ7CZEd+5f0NVji
	 kSt/3sMRATpE2LpFaPegBW11SNZMNOJx4LbgGJP+ot3H8jLl1h8M445nRFESIPKTKm
	 CqMacYJRYzOo+JaRAzejfV2pRq2wrpGD6GKWsCcREYL7jUqtpM3XMnV0d3CLzDIdKx
	 JwjCYAeKh9leAWCzkF58ukJqnhVC37+Qmg7JaFdPJDMUDismw3aitcIgL7iYFQ7+aZ
	 inlXwikQ1U0ttDnz9vMDQW08AGSvEcXNXdCJrH4hvFZRqMyTbI+xnlEp0MYTn7Cy2v
	 uh/Thf7j7ktxA==
Message-ID: <sashiko-outbox-220150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: add Realtek RTS5453H Type-C
 port controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gary Yang" <gary.yang@cixtech.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261118051313.3634833-2-gary.yang@cixtech.com>
References: <20261118051313.3634833-1-gary.yang@cixtech.com>
 <20261118051313.3634833-2-gary.yang@cixtech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 05:16:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Realtek RTS5453H stand-alone USB Type-C port controller.
> The controller is connected over I2C and manages a single USB Type-C
> connector, described with the generic USB connector binding.
>=20
> The connector's OF graph links to the Type-C orientation switch and
> mode mux provided by the platform PHY.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118051313.3634=
833-1-gary.yang@cixtech.com?part=3D1

