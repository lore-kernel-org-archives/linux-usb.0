Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267269;
	b=tGMx5s2uykT3rb9pdAcR3mYXth82VSz17m0b5mV9/CjAEzoHR9uV5hAN06A5Ekqvl2Ao
	 tw2tjMr4OjfM2OWvP5D1oWE+/cZ3ROYwu8twQMy/apiFtuVEQt2dpsixxzhOD1JyEoogp
	 5949C3+kcLH7pg3hNJ01zWrfDkuu6e4UZb1vgHi1k8vlhuHFYOzONQHDv6U3wrYp+YtR6
	 JDDOmZ4NaDVnqV5tD+LYxhEv+GO/dGyHSrJYWAL+Ja9NR8G2VFHRBFhryXe1BGFg/eVUm
	 zTtId2F5YKwZMiaIaG3HmvSxzstIHTCvHhnZOJqAjHu4zSMf22D+L/akwoU2vu0DNpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267269;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=98SvHf0FaaF79C3YzHp1rCdhrPNIw/6da2I5decLbTk=;
	b=ToyVfOu0q4AgnQbKHiLPfqch5yXGi5X7iLoRezElc6H8HqMM822WgKU1zlL6SDueGfsF
	 nZk9eDtxWmgljlfoVWp9BQ2A50Hyb4VNyhr261K/5VWR136XjVIEw/4Eyt/tdhozK1iOa
	 wql6uHZv9UXCOwvstAd0CfsaFBpod1J5EH7C/OkA9c44FDSuNQWBEgHosNEdKBsJHtAn9
	 zEjruvZDtXVGE85ThY8JiOLOmECb0fgxx2rsjrqQzCNoUubRl6lIubcKNSHKqbzPvUt30
	 5X6YsvmpN6kIvgXDXdjibokezWYVilko6Lm88q6J2xRsNRwGZW0eTFSREVHtsNeieWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FF3B9E13;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC0F606A336
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FF3B9E13
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD171F000C4;
	Sat, 21 Nov 2026 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267268;
	bh=98SvHf0FaaF79C3YzHp1rCdhrPNIw/6da2I5decLbTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FF3B9E135BM5HmB0dl7wVzbEmRV6kQldOczlBBKiIuJhV1mIVrD8DPmjZ6Irc33Xn
	 YRvmfpEtckkRgXy4FGKaQXAtCmDE6yj8Tn5exC/seTG2oss6LZm8OrVBgN8wEMjEAi
	 18uGH54Yz8M9IHBrBXTbGe8cV0EfkB5XvsPeG7/EnZXhZQs5kEmzyZ0jaAhJOVpqBD
	 S46LX6ZKwoW4/kCbNOtaPVwh2MCJ27YRzW5adYdId029QWNGjtDt02x+vR87IFKRW0
	 XmXLYRsE8pJKPeYjWK7fQsPq1JLanseMh3FiNC30wHKPBAv3hcq26vc2Oifn0ZqngN
	 vFDs1/YktJPhg==
Message-ID: <sashiko-outbox-227062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 0/3] usb: typec: tipd: Add sn201202x (ACE3) support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
References: <20261121-tipd-ace3-v9-0-9a2f1327a330@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:21:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 1 and 2: no issues found.
- Patch 3 ("usb: typec: tipd: Add sn201202x support"): 1 potential issue
  (1 Medium)

A detailed review has been sent as a separate reply to patch 3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121-tipd-ace3-=
v9-0-9a2f1327a330@chaosmail.tech
