Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293022;
	b=FWKqFN6FAOF4CA6hhMDkqSgZHeF6q71X//NzQixOwlc5vZOzPurteZiS1916n6v0DU+R
	 mV2CU6KmorbzEr60y08EWXegXda0JLbqgmgdNrQVpJqDmixwutt0jdX1Lky81js3Wgu80
	 khl6/a4TQR2SITHaAEX8sHlzitQz/lHdg/cdosGmAp7kXWBoyNlgNJTZdN9UUUJe+FS/q
	 4CrpEpnWexKYexZRhdOgMRC4Hu3EBm1xdZ8rxYC/lNG0g2NQ9AHftPrUFuAumcn5BIWC9
	 h0FJlxsOrYiM2yavTiisZI+/4YROwnwASH24UffW+6kS/a9xBQ2kBYPvdA4g9LXv/zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293022;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UMUymn5josYpbQOBFPEhdM9SxINsbPt9SCyJujJVUaM=;
	b=GxAdBHIT5PQokfJx1b8sVsvox/oy3dGkKZ+aY467vvkONXT0ukpQZ5Z0td25niIEcTIJ
	 ao8u9Vpb0aOzwIf7yvw3s2QabHswBTjX9jEH/MEmrgb43b6u1rizewLA+SmyEEQUx3rkB
	 mq7cNlcJX/aRXI3EFG8DDVbJ8JmhSpTQPIlEGzQPCMPPRqqrmWQMhvf+Rhz72mDP546mG
	 DL6ody2+X1EtwFvw7RVNIXjXBbCQzU9TKA/QshrVFrW9vE9A8KQy0RnT8awKQopnosEFQ
	 lhPlbU+RxjMjg3cbMOjz2zeKlXmGIcxAZf5F/W0D6QYE1TH+BGwDkBFCf2vwMh8nvRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahxG+wht;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2128606A675
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ahxG+wht
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525791F008AB;
	Tue, 10 Nov 2026 06:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293022;
	bh=UMUymn5josYpbQOBFPEhdM9SxINsbPt9SCyJujJVUaM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ahxG+whtwOcMHKLdraT5RP3sXm4BmBYom26VR9P/2S8VNVmpOdCQiJQHP3c84/AO3
	 X3E4uKAv/6cy9PGVfGJNHosx7pnK01LIeXRi1GxPm2ZiPorCh6VXvq0qYHRHYaWTuo
	 Ym1sHlGh8Nk7SJAT/X/PAT0ZPDfJ5o8yzSd6Etq+9sffx1GKL8o1DWzoxw0/YJcNdO
	 Mm/qPpX3dK1WAjEc9cFaUmWSD13htuugCSz03Ugh9wxxEPhVuJ6EmvwKoCk7ZlnS1L
	 8Y40zYz1TlRbSjR+1y9BfNWwcJrIEZTUm8BbksKPQQfGRGVdUuSlfTlbQPAiBt84Oc
	 Up7i/RDyzKARg==
Message-ID: <sashiko-outbox-206426@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/22] usb: class: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-5-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-5-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:43:41 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D4

