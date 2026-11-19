Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109323;
	b=071m86aHmgNbetnsT22tJF0UKtuh+ZwfIf60XuGM3UwaqPQzo5ZxC7ozdJs0KDpZ8rb5
	 aBY1NJU0M4S5loBPAIFOf2Mwaz1DNoSkn99CnbqTh3HvEmr2EGyvbnyKdqmrAczAeOCpO
	 Ep4sXHxOhr2/sndviwfBLmxxQCxFAUqNywYdyoi9ItHKJdSsDvay/lO6GyZnQxlIVRi/S
	 lMpdo8azzNM/CKzxXUJF/L0FUgqqCE6owmTZJS6optHEwGEq7HcB7ObJWn0rzd++nzW2L
	 rW15437uxtWNrJdPuvpGlnzU9QoICMYHPAkm32Q/AM95e+ujvlgJesOUT3rai1EbMZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109323;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=99ikN+y8Yzl0HX+/9cUnWOEUd/hhhCjK4uh4kr+eJbo=;
	b=ugNUaJt7KiWFx+pBlGn1UxpEGLCeSmUt6eed252mcPDM1hvWnlgMP91v4dlYmlQvi/6x
	 mUYJiAzUXSg2pBaHvXD6gFzYnJ+c+lM2r4aqn1R37CCBMjEfvnpymcV0BdFWl65u7MF/0
	 9bqppD4/cFWrKvL1hdX2UXZmv7NuaRhV8lz5XTPCFjaCL+mtTENj7h7d3sPuEVK06m2ce
	 8q2JrvD9xYvGa82IL1j22h7NvcDmOQsQ8GPPcBbh8xlOXOmbDAct0fQcof2IGj18j5LZO
	 U1aEguBAch8KRtlgzuvdelce2i6AOSi4SZ96gDRoPH0PPmeM0NbouPUiClGJgTzDjzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dizUz8VU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F4606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dizUz8VU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52151F000C4;
	Thu, 19 Nov 2026 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109323;
	bh=99ikN+y8Yzl0HX+/9cUnWOEUd/hhhCjK4uh4kr+eJbo=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=dizUz8VU/eUo/iinyu+WKGkfEDaEkSxRtjExn5Xx3FfnAhxmPeAoWefxYshlA4lEt
	 Ey5IhIXGx6CfODASXtTk3oDUfvPLEJyuN+hWJPob6IKaiVGXtNFDGfinEJvE39+OkM
	 MY5CHXLQJuU1LEjSuZV1j9vj3dr0O+yhSxz7vHSJRMOVBDxozKzefdBYaVDXVASE+t
	 bce+H5t9ACqf6jsMv7HeVzEuHvTyWDmidIJkVXAUfUsE+erbeDECtbGekUOCR4TgQz
	 DdUErsPKqGonRs9fBDGqySuETRgg/seQA7de0GMLPQ3o1wS4QzOX/K48w3NGMv08zE
	 DiSEdFtcXgQRg==
Message-ID: <sashiko-outbox-223698@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/18] thunderbolt: Add KUnit tests for shared buffering
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-19-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-19-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:28:42 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> This adds various test cases to check the shared buffering support.
>=20
> While there, check the per-hop flow control settings in the existing
> credit allocation and tunnel test cases too. Egress flow control
> follows the ingress flow control of the next hop except on the last hop
> where it depends on the protocol, so make sure that is covered as well.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D18

