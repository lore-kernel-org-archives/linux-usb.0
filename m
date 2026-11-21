Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267944;
	b=tjzsrh/XWe/lXiTUfgiLFpx9CGPnapTbXwsKHeSIPhab/W9AtxGNxQGqjB9xLRrvmv4W
	 EcREygxk8nxLCTQ4koA6k9w4P8u4jyFcLmFEirMKJzgKjVreEAIKtf29IIObjPxE3FkxX
	 QkQbPo3xQxH90Bjet9mFRVCH/JWbl6K9OyqwRuRJkr0jS52TkvZTnsEswOb9W5yNvPB9L
	 sL0v+RSqPeI4tAn8f23lcFvgZQ/W3IkJthGzrWU5bE5SRKgixweVg8nGDlg1n4Gm6PPKW
	 loFj9Iwf2BiE0sQ42EIg8mG82F7mhqImmJY2PAFCsUmi61fza45jLQ6r6iAl+DwTKSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267944;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SeAu9dwzhLpqJgbwRmovTZsFU45JT/bsobMLQdxMLrg=;
	b=WRZ4PXt4rDdjcZwLDs6Jhq0bAzYqBPM4kl1YSGiyYbLx1TSVPnRxQfkk+N1uCAu10XEz
	 tl+ktrZMXr+dBo5J5L0hasA0wahTJmIfVqvvXB4AeH/aIslaEJ/T4hFkQel14DvxUC77g
	 8041M3podOzYidfMU2/9gCtA/SXKWRSKVqpatuKWC0fq/RNSnZpAnnnZaHRraUPaRilkj
	 bu/JHDWpQy7VOe1MNflhnmm3+imBWsUt1wVOqmRdHKEcHOHN+AFYpsgc28E/kw3smkKOX
	 r/2ok3esrqrb+mhQWl589nXNdHXESW49QeoBioiUEIV5IyjqgWXLEfH/IGZteVDDeLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtPDV2M5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEBF606A32A
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JtPDV2M5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618081F000C4;
	Sat, 21 Nov 2026 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795267944;
	bh=SeAu9dwzhLpqJgbwRmovTZsFU45JT/bsobMLQdxMLrg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JtPDV2M59PHX/F6hPXNVkzHp6oQv43BnUAR9zHy8icjXE9rEp7fwK2fZB0UqeEvoR
	 CpQiPWw6vLE7ElrvxjT0ijQKzlQU5gNbgbXLFI+9D/WOl8pMyQ7lsyaa7QiFr7GVAm
	 1hl8y3xnTPkQZdlV2dIwMEckkhoguCUGB4Vi5DAiOHUtsvCaQornGvKQs1BBiwG91/
	 fiuhAMiO2erAH5/DJILtxb/iG8xSkbNQXxvDnv703GydLKSOeR2b+6fhJCxj3sX1/z
	 +UXREOpinuszigeUS3kLo48A8IB9ZoZ5s3Fee0PBjwKQjhk08j3ISWrRW0gALZqB6t
	 Lq+1JO/nLvpDg==
Message-ID: <sashiko-outbox-227076@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 0/3] usb: dwc3: support two connectors sharing one
 HS data bus
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>, linux-usb@vger.kernel.org
In-Reply-To: <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261121022104.1507987-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261121132029.2379449-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 13:32:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 3-patch series:

- Patches 2 and 3: no issues found.
- Patch 1 ("dt-bindings: usb: snps,dwc3: describe two connectors..."): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121132029.2379=
449-1-xiaqinghuan@mail.ustc.edu.cn
