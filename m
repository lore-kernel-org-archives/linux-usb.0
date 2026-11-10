Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353479;
	b=LIeGstmZe8wgSOurbQMy3ZpDthV/rvvT5iOQp/qlZHH/lVH68M4puh/AdK00nH8SS+kV
	 noNohLG54pgrMa4O5Z7GBI3asrSr7MBqyUVCDsEJxOQcr3bBYDZ0b91a3gxcIePqHTDMh
	 hG9iNex+x47UYTOq1qqgd5xApqghZnRhgU/Yzjlj0chHqg+K+4LFBR+xezo9DERHr9f8G
	 dwoOHYx0lSxSNnGV9hRviT78YDJIJRpk6+G+UP5F3VoMlG3Lzmc1pZnONxr8NTeDC8Ib1
	 EFiCeNan4GMLQPSCUJsxXzPlCQbGwAxt7ma1f24DEpC12tiFKvgdLki/btZ6OO+BytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353479;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YQjp+EVHdkYkFbdO7srnYfi7+qCYDaQ6PAfh2rU2NDE=;
	b=5t0Lt7lZsj7q1f22o8U2R1Sqn4bXlgyRK52gaKM5Mt9pJA1JK5gznDHHl+/dm9IzlA61
	 6cCxgDNzc3nbK8c8MALCb51QGq7bwppBugD9OIL1qvMkpVNnW6OLMApudX7fIVB72iERo
	 vTXJ4zMy4NwgbRg3olh3v7+v7v9W/wbZ5MujbxdJVdUfi2uuUA1IepFLZq6T+0UuNJUNX
	 StcIHD346zX1rSMnOH8x2oq4+3WF7eRRg+Gn9D1RpgiU8gR9CHMY4P0xkGAW9nrnKCzAJ
	 UMzwgMQT5ZJC0menzvqZ+JraCt2fMmhWDmAgn+fQZw4cHC+95mgRIfrEIP0exuI+q2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggoqV1kM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF9606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ggoqV1kM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8836C1F0093C;
	Tue, 10 Nov 2026 23:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353478;
	bh=YQjp+EVHdkYkFbdO7srnYfi7+qCYDaQ6PAfh2rU2NDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ggoqV1kMVatFEOh/6EC4dHXvRNwhp/iw8CZtc5fVFC/Y+AumuDnywCx5nTyVffbpT
	 nofFmnp8pxTcyI2XGiQxIVCirFo2Lly3yDem8fPUhPdxyWo55a/enOmTIxTCM0f4X9
	 SlYZNew2VkN1uUNJ5AwP8XQvHpqhMlKu/jFuDReQ2jt2s7JJpZXsrK18/aiUkpLprW
	 kXy3W3SyKnYPWS2kVMlom6/+kc+e6s0Llc+p1aZ7lK0z3laBq7J7oouVD7Rw84J3zx
	 O2QQhs410TyrifWkhqp2uBwwEyg1fQOBP0pJAquHXcWhLJiPN+MDt9WFm7rRTIZBeI
	 nrn7VquGUc9ig==
Message-ID: <sashiko-outbox-207920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/22] usb: dwc3: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-9-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-9-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:31:18 +0000
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
6-1-shishunbo@cmss.chinamobile.com?part=3D8

