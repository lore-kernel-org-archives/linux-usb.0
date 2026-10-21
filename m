Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579814;
	b=q2g6XBUYHAaFU+tn72W0NFCwqTlx/i8CWeQKmH80PlZgxvyrTkcfmjFdA8vDwvFv7pUH
	 HxAyk4D47zCoD1E3FSLE1OgVXLJYMLxkBUWC9kmzozvTdD+OA8xoIEDwN9884gx+Kp9xt
	 tlfqHEwkNxtIkydIq2ZMjY97tF4YdbVLfmnynjY3Iztg56xyUOwQA/C1VkeJyMOQvSVBQ
	 Hd/++4pAJgicnyw6YvyDu1ytg7/MDtMF5BCNVXtvkD0uu7Zlzewdk3EV2N4EYEp6fVc1P
	 2yVCFWI6jHEFzy/ncnOKYuf6n12S8pCwO2eRCgAuS9TfgtklRXqqIg/haKo1qvSr4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579814;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9IqJCH0h1Pm0nVBYqdMBOcYRyWoFpTqmlGSkPaH+PHw=;
	b=JgusxKUI0bJxo8QKQ6Z7HNdCIA4GUWrIIi6PCKbbVd9cSrYyoO3pMAT9V4CxhNfSGkiU
	 DRG3E8zjhDGGF9jRl8GRxVU0tiQe6DQ0L0ivKy9mL8YjpU2s7GX0QrTfjMEcogBwi2KAg
	 CM/bpLGvEvlMHCUg/5zfeCaHiXdRqG1NImIzXQUHjnlR1wz5lUY5YQ7pGyLbmo1HVHoit
	 GB1BA6hwTU+tM5WXb4smPcBNVB2BQheleS+jaVN3A7w6VQ4zFlOhbxbsY8zexrKfkvDxp
	 qr/yYby6xFVF8CNHPlZGZOiqtHEMsZC5fdk4JJAkci4aCB7V2kXxpkNrurO5x5W7Ibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmdpZowH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCF5606A331
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 10:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BmdpZowH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7711F000D0;
	Wed, 21 Oct 2026 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792579814;
	bh=9IqJCH0h1Pm0nVBYqdMBOcYRyWoFpTqmlGSkPaH+PHw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=BmdpZowHOy7/52lBge/JPjxWCrGRSjUsdUJcjCQVHGK09VQAPSq7eb5mrnLSuHpoo
	 pJQKHuk+KTYQ3841Lv7uZwPsjNK2Iyz960A1NdDa+DNk5kssFJNR6dTTqrjoBEQUjx
	 3bT/hQvE5qTzHPw/1JF4W0IO/T4mx3FCv5Aq9g+tJwItpC2TkL5pcSB3S2vDQPx0xj
	 gCf/kcx9Dpw7xIuYaiqLjxiHx+woW9E4WOWvsam5iBIY78+wm94TgfX+vyRbPsGYC5
	 rJcIJtkZQpw8zra3d3TC/lz+cQMbxIdHNv0ouqBBiXIHDApc61MmT4MInjP7TOtxXG
	 55m5j1EBmhvew==
Message-ID: <sashiko-outbox-180120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] usb: gadget: renesas_usb3: initialize debugfs
 command buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiale Yao" <yaojiale02@163.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261021104720.4106961-3-yaojiale02@163.com>
References: <20261021104720.4106961-1-yaojiale02@163.com>
 <20261021104720.4106961-3-yaojiale02@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 10:50:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> renesas_usb3_b_device_write() copies user input into an uninitialized
> stack buffer before comparing it as a command. A zero-length write makes
> strncmp() inspect an uninitialized byte.
>=20
> Zero-initialize the buffer so the copied input is always terminated.
>=20
> Fixes: 43ba968b00ea ("usb: gadget: udc: renesas_usb3: add debugfs to set =
the b-device mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021104720.4106=
961-1-yaojiale02@163.com?part=3D2

