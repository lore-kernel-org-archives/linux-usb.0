Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758253;
	b=afzWDiTOxUz9ZsT4waw+qJt6S+Jc3u1Ki7BA3ag9XQwBzlojMr3BpIjwVAlBMNI/fZF4
	 UxVeJujrlb5JVM7n4eDY/vq84sIxpZCAKwWUZE9JnbwQ2W9s9JzZSF1N9T/uCDFJs2vEI
	 E4Vjn0DJs5oekSpvPuARhawIARjbf5JeToUKCmT+czSJ4ac5xUSOaulAAiRDjuLNwEd2x
	 q3xtynpcqP1Zp50ckZulF/UoPG+dDIx8iF0L5+oMXoVleKpr7M9X8Xc0KRWABw0kG39wH
	 nijWiMcXfi9FJn/zMfgVkCbfO7Aw/6eRbXCkrfhiQeGK9zkW354pcTCo8gJLd9C4VHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758253;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rmKazytOLAVaEvc+mYF9per5Q3jp1aLGRQeQAsz6qd8=;
	b=UppsAw/byGOJ72FSmchn5n253iE1JojWMpsgXihXsxSTAJZri0h5qylWoTDSdu8i4V71
	 BLtsiIPSxaTaVEBc0S9Dq6yGxKeZSaayf+nsba0mK7MXOL36wJFuw0ucAIMAZxtnJjxnU
	 HLFPPx0weLUbn5HUxVQbFciNoqBOzElMofY/WBcZ2L4kg7RZPfMvzpFHGwozmCFl3Bt3X
	 47PHOzS38IQ4X/wdMarkYKlQFEhdrI8VU/HUKmzMcgKXwzYs5XU4VTBH0vS2EaF2VvOlA
	 2kfArvkiwCHogQi2INR7JMtiNa502/s1pYCWBuJmAAlJRYh2CxBJAh8yvE0Xc3YDg0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbX36s4B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D75606A31A
	for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2026 12:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZbX36s4B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF01F01828;
	Fri, 23 Oct 2026 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792758253;
	bh=rmKazytOLAVaEvc+mYF9per5Q3jp1aLGRQeQAsz6qd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZbX36s4B2p+8cgz/gUHTv9/fSiAuVwoWFLYgXzw8XBCjXkg2u5XzzjQ4zr5hX3ykl
	 /BzFy8xddjFL238tCsUQU1l9KBfIRmK9tLHRrBvzddu7f3YWk979wTk5Xi+xC9eOae
	 2efwbR2laZQ9ZNc3mAiUs7NemY034555dkUBOu+r14W/Z+9IeL65/crvzdghIp8aO2
	 YMMAwqQsMTWb+QMLcGU2t3nsCaoESJ2eM1fsd5t0yS5I1Ta1EFvOgFVzFiknChLvwC
	 6syqS06YCqQiqJJ7V5Ya0CSk1SRV6uAT25OYbZcV9rpyEup+A7Q3GM9UZbrcqa6RBP
	 cQkhoFDDkNVLA==
Message-ID: <sashiko-outbox-182758@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/12] USB: serial: io_edgeport: replace atomic
 command allocations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261023121530.186541-12-johan@kernel.org>
References: <20261023121530.186541-1-johan@kernel.org>
 <20261023121530.186541-12-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 12:24:12 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With the line settings no longer being updated from the interrupt
> completion handler there is no need for command URBs and buffers to be
> allocated atomically.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023121530.1865=
41-1-johan@kernel.org?part=3D11

