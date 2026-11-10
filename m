Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353624;
	b=pgcyqJ8K4G/4EH5d7qivgtDGIlzi+FWrYw3pqxMsDCwNPTBbY/JmCrIvqccLO4iKx/Nv
	 c7Luqlfi+ANnETOa0Cl9kAi9sBL7HdKA+RepWTPWOuPmU0QO3qN0JKSqDF34E/9veKHt+
	 kr4l7MkgDKNx0hAT/yJfk4zpiXE+ECTeo1mchn4WGhiVoAcJkrTDj2039snIHP8tGlRio
	 G1pjZnLC7Awde+NrRNlTWERzOtYpBz56aYCUDebULrqmZKhpa1sOfOWigGP4Dl9DdAuqy
	 vu05dlDzVlA/JKbdsG5nJbZoH0l9CxSWuaxi06ZYxMpRnhWRR2ry+M9xK4bYJ0NAZSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353624;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=e3lDk6DM8/9bRFoH07vw22+Fw+RZcPw7cneDCtEhmuo=;
	b=W3Fru/cAHBx1Nnn5+wwf6KsaSwjcwAe4KJPj08WQ7WG8cecgHhnCsg9wVhOWxam8hQcy
	 c4p0Dw3GOwGJGfIKWL/60WGlXWINzzV2M/jUpYU/IHGju73jImnAgt0xXDVzcPpmZkquU
	 XGt5mpg420DLSQmcB9dJESRKEhdpxJSNywd6mgPiAkRVbPolX2tCXbXdUhmMNqC4duCyk
	 2naYGsMzTb8lbrzmBr6KKdeyDuhCk8nEwRBK5hgFJwsqByb92AHo72orR/5IXxAMcd/wd
	 wsqr3VfBm8JXqal/ZrsXBW6JNWm9ZcGTAw2M2UyQ27a/iyV/W/qMErqfCIsy+NLan0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OmlCrVT2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E744606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OmlCrVT2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA291F0093C;
	Tue, 10 Nov 2026 23:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353623;
	bh=e3lDk6DM8/9bRFoH07vw22+Fw+RZcPw7cneDCtEhmuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OmlCrVT2x7EGd/Rx9pdfcyMfsnKwlf/c/RaaP4KQjoYGfu3Q9uOfyrXOxsbgKs8J5
	 FHTzmR4rCVa+jbgDpnznW/FU2CxYxHpWKA+6RRF198nAbP5KHnWXEZZ4bItms28srE
	 bsbEbgCSrrmEoq1IfM2KZFQ3KKAS2CRW9U27nMlc451zEtBAilDru5Mt9sdjq7S+OQ
	 BBu4un2JHJZcpAZgCcVoGMrTBScGaPldjED7yORmyGWxbcLju0GanOC4ls4rePoUTU
	 izdtWcZb+2C4/axWp2xFBYrFvYGhFKRRD3w1tI4i0NQdAYQ071BOcg+7Ta98RIHTof
	 RWQl9E3LILpOw==
Message-ID: <sashiko-outbox-207935@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 19/22] usb: serial: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-20-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-20-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:33:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D19

