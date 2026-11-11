Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794434594;
	b=zTx1lPWpxKgx7yzSJ6lk8ZcReP1bhP60ngQdOmkGLyiHMHE09PM3WpLw0f0g/2uhq8Mf
	 NkdrVilKkCVimHo37eGFqKF29P2Rx0ClvIGj6bASsMegPYx+oDuytvC6hNpHuBZhGewPT
	 Wr1iwcCaKW09xHQzmpJKWIfxVPxz/hSZTrgVEa/cIIwx8V2Lnpzdzk9T2PjX7nDt+YMUf
	 oXoi3x8zKMMaJ2jQjJ6m9uMPBiZryN7T0ZCg9icRPmLZ6v3I15f57FDnhKnon3aZKU88U
	 uyARnucbchgAVmWGR/SzsAlpo79LEODXks4QTUNmgwIRZUU3EPZejz4XNVb0/BlrehA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794434594;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=k01hfFS6KjnOXqLWCMJ5kgGXOUBjCNbBJqaMAcLmYOA=;
	b=pbcGmOm4LFrvmS9sR3OwgcUN+mmrY0yhsQs1WGAi0qmXppJyDT0Y9OQwsjCRdq6AD5gD
	 AckI73RlkiSvj5bPp6xfJ7dz2vnfZxnQEVPQPaP6D1EE2QKQEn5oLS/1kbpQPXVAnM5De
	 P7giEBz3kPABnE1Cmp+tJG9LSRhr8GBvSQipixlEO85R58MU8CRGq/eouQj8luptZwviC
	 9IIchmZsmClA+yBCqXoGHhJjK/yTvXvicXaky9otZdePtuX+XSwGsw+I8T6YOjmn5aPa/
	 9yr3vsk6tpOl6RvzGCJIFlCdLjkAZbJwv4i6WY1kJ2HnyXVMktpU3PFQii3bj2EW2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckKyw+AF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8A0606A88E
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 22:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ckKyw+AF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2381F00A0A;
	Wed, 11 Nov 2026 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434594;
	bh=k01hfFS6KjnOXqLWCMJ5kgGXOUBjCNbBJqaMAcLmYOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ckKyw+AFyLMsZLTOEK++T1yJr5TB2fv8b3+oI7Xx200cKHm2P5hVgWS88njHyjAfM
	 rWZQ3xOIOo9khpGLBMvVB95aj40vZhvyfISY7zTnlHQ1e0KjYPF809G1YUU0eB8gFB
	 5wmJchKREoqao+wWg/6R4yM8lv8h5HPHs37yTDHKOE/zKNqswFD8lHYzg10a4hzwFT
	 T0QPbqSGOwobHR29797W8qgXf+Mavjpdq64XUtUAaJAMy8hODOBXHp17MDdMd0+M6H
	 Rg8aZjZa7Mdyi18BFWTaqs2OdKjxrYB+xybjV3glvQxwt54R0UkaS5tKDBEff8hXkf
	 TnL0/HUGcWHKA==
Message-ID: <sashiko-outbox-209738@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] powerpc/configs: drop CONFIG_INPUT_YEALINK from
 ppc6xx_defconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111215723.3802209-2-dmitry.torokhov@gmail.com>
References: <20261111215723.3802209-1-dmitry.torokhov@gmail.com>
 <20261111215723.3802209-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 22:03:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The yealink driver is obsolete and being removed. Drop its module
> selection from ppc6xx_defconfig.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111215723.3802=
209-1-dmitry.torokhov@gmail.com?part=3D1

