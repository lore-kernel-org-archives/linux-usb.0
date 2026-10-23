Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758670;
	b=pk6/SfGf7VVW3Vtqi2RutXIkjUKVhxeKsCqXVFIjT6qBpTXzZRxKfvSljvZ0i93PzVF4
	 eKsQd6Im7TQ3lwSoyP7QuofEZgvt1zdTGcLg31ilY5FVexVOhiMtDk0zkzlfoR0nla4DV
	 PjFDppnaCBAWylyC75JApYXTy00+nA3ghpzLYtMnQQOlwxm4oXHsjyuPMW4g+uCz+vK5b
	 XxC0F4bEyg7mE1l9egLh912tAfGG9PbIiJT82SH6Iv/t8Hk2lUv2a2pmtZ3D5MLrVNKOD
	 s9S7dvcSY4ZuUycU4zFC8Ptq1/ZABLDtka4U4C4BIOo7emXk6Gw90HTflU9x9fRmCCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758670;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7K16XAUwC1RK+8cD3dRMdYxwy2NDvo9k+6buL0YDLlI=;
	b=zLJWfmmHRO4ct3SHK7wIdI9FJRxKGvjRqFZ1sSBgxl5TxjAohdOPTlBSUzZhb8/BHwZi
	 iQcjp0fYJ/brenKsxtN+vcfIgWPYcYPGFkDMtdmF4zd+q8JK/jhsQ6DC1IaMEJGZf7v47
	 R5A9Oi96FlBFlEokwkUCJ+e1Nv17wxG20CY1dDA7yKzOpeaZvma15K1iPZgmQt/tWgb71
	 nPSwfoewENd2SpU781OpXOmdpCqoBZsoHP3Byx3nvn5sRd7iijMzYnp2/wxp2415cjByQ
	 fc8JTXkuGPI2Zk14p+03/lcD0Dzjuz/QGPFdlNCYekkf4mmtCVY+BzMj1juDuJ5PE8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFHmFh35;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13C606A33A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OFHmFh35
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC07D1F031E0;
	Fri, 23 Oct 2026 12:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758669;
	bh=7K16XAUwC1RK+8cD3dRMdYxwy2NDvo9k+6buL0YDLlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OFHmFh35Sp+4h7dAT5lV3ckTI8GAv04DAERO3q+uxp2j8/lAwxGnjyoEmpbMu+0n0
	 HNqDo07w7mobOuQvdSY6E9HqDN9oWJizkuEGUalvwUzaUPrKwBHB7Us5Fc9rk4qP89
	 ePg8a8YhB1eHdaaA7hJcG0hoLJTfVz40O3QglL9w8SHTT6pr4rNvGOr1DYabP1AeB0
	 y6hIKfzC9pOqxFGyfd58WJkoXekYKWSbqWh81dkhkOWggkOIIsxqlejdDjALyqelV1
	 kt8bwup5twuKllMTnJ609wyjgoUkm+wKk47SgolQtEDs15UYhCCA96EplpBkyffBk3
	 MbIKm+ttWXKCQ==
Message-ID: <sashiko-outbox-182770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/12] USB: serial: io_edgeport: switch to
 synchronous commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-13-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-13-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:31:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With the line settings no longer being updated from the interrupt
> completion handler command requests can be made synchronous as is
> generally expected (e.g. so that ioctls do not return until the request
> has at least reached the device).
>=20
> Note that the five second timeout matches the timeout used by the
> original (ifdeffed) synchronous handling (see commmit 421ae6e3db69
> ("USB: io_edgeport: remove unused defines")).
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D12

