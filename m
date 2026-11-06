Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957764;
	b=Mz/CFkXkdn0uxZg91RvBGfBf+ulwD3ao+UdBgNqPEnEOZDZE6b9JLyvYTAjHxvreWd3d
	 D+jREC5p8ZVlYaaVQpw+r+JmstsoUgiV8kqcp4aQml8yj8OV3fkTUtNn9QATSB5mejpTP
	 6nMU0lH4rGYLDi6FS8VJtcFIkgTk9xNS8iVkT1bIzGLA0tl13//4rTND8uuh3WCFK2QUG
	 kZu+XSdXxcNZAL/VwsRAVSDJFAl1yeg/exj210WvxCo02lhevKZcx4Tj0iC5CfO/sWfc6
	 YvvHZ9UDXOG1dLPMe2Kd1dVAMpzcsAgqRXiGfgp9htBGkt4IMUV7aSsodcD4grnHdvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tLrqwVQMjHEfjJ/VfyW+hRme52aCJ5LjYduMLphV3z4=;
	b=kLvq1ii5dRpWLN8zCc/5Q+fGtZyhLCqO9aASFBImoY5FZTodpNBx32jKNP4U6OMFtd1M
	 wSDq594B75fQ5g6W86uQRoc7NxAHMM0mGOaslzjhsv+7hIczmstmWdRgg9sYptjUc4SkS
	 2N2I101j/OVgvfRkByeDV5Cs/BQ8p3dwJ5jje0OqeSXdkgPkQRRe01NLi570DKprz8QDf
	 YXqyu4oYUN87/y4g9SS3TmvhScXew7Z8OqfR7Vws0P2AB+250k7hRxZ8ZUgRgdoKZPF5Q
	 qpNIQ3X+uhoVg7slk6OFsm9a989wsZW/1FgpQjpGkE3E/BeyHRdeTG7UYsr7cLet7Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIErcPAO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000146082BE0
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JIErcPAO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688291F0089F;
	Fri,  6 Nov 2026 09:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957763;
	bh=tLrqwVQMjHEfjJ/VfyW+hRme52aCJ5LjYduMLphV3z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JIErcPAO3GQPdE/IpwUnb0llgoUWUAXlPbB8Sz5pGfbXmFYKViG+UCgQ9dxuPGzcy
	 wqCGcAFt5Swpv4dnHVzqCQsYzo9IAtHCzw1NksJM4Y+QH/523d3UsBOenbNmklO9bV
	 TWASdEM0l7I9X6ZbJdwbiV8fZnb7P9ozI3hf8mBvDCGdZA7wO7rcVgKSqXGr1ELT+l
	 03/7FC2FK3G/cHCbKFgKOVXJD/HKfREoUFa5JtosOP2E8KoS4BaSr8GqHWW+nRjT9/
	 dAQqp5euGbAa4DEqF3N96FZsmt720fWai1/uLONtzsFGL48g2srz/YRrAr/kUZQb5d
	 uZ00sJ3mizAwA==
Message-ID: <sashiko-outbox-201124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/25] dt-bindings: timer: andestech,plmt0: add Metanoia
 MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-9-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-9-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:36:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes PLMT0 timer. Add its compatible
> string, with andestech,plmt0 as a fallback.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D9

