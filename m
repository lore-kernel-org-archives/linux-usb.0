Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023318;
	b=HJ+wvJIba2e+FuUR7gWqBTG0bMw0G09b6SVqp0DGxJFRqUg75CQDkNwVBpBGy0WwrFzD
	 d0wq8MWCuoO6/TFqJdJbOjq0LmiHKZCjdES/h6nvo+IxMLDgQWqJfbnZU+6vued5tx3JW
	 yQaVf1Mb/WLbOxVkLaSID5ZClJiPLpuysAjbd3pI2rJlqYEa963DvTEnGrh5kKtEwRKUw
	 AleZD2he0WwtrpgBQaeIK2YKxu0/gN6o9QCJkETWLiqG2wpagFk/FAYa7js6wjq4eA3AX
	 W0nw0clNDh5BjJiOsZWBliFAiFljYbuO/QTJ58UfdSSiQAnOcoQQHZsN9RP7Y+s/9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023318;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Jr5YFsby04VTm7iX3bmVZfZDUnsnItOTRrrQVzgSYcg=;
	b=t8H+ix7HtYIDcPSkUReW0iqxc43NTIImk/f9jUJURuIRtsUHyOnUH39F2wVSMF2KWFFw
	 RftD8DlkaYB87k8n02V6R6Z4U9wwKZvQZq1kH8jybhYm3jbhZanRY1Mek+XCdm/76RNyb
	 cpC1g9K7tg6qg/Xe5HXJHAqQCz/T2MA3vQHPntlMEZTKzEl5Je7hqWNGywXZWHpPYXBa+
	 /eJqoWMZ67xHi0ksa0/nTIN9d0HlwzHbV8nuLaIh5WA30tZ6GxPTdwnFgbH6jUIW2cMCi
	 QqrOZSWf+AV2FK+HCbot0ZGwhYUG1stNeKRBDly6TwX4hJ/Pe2KxeFyU1Zv9PoAHb9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwUOgqUc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62BA606A32A
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HwUOgqUc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCEC1F031E3;
	Mon, 26 Oct 2026 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023318;
	bh=Jr5YFsby04VTm7iX3bmVZfZDUnsnItOTRrrQVzgSYcg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=HwUOgqUccZdGIBgEtWNUzAO1mGpYeckpcL8UsWN6U7aDbAel22yrHu5UabErtacWG
	 CXNEXuhKxk5GUKrbDIRp5g21UOeBEDujWGkIqqamqn2EbI8QgIfLUaafdZX5O4q+R/
	 3WzRA/HtqcgXr7B6SHeolLjbyVDEklA/XTd80R7tkwbdpe4ReUpQp1isH5fcfqBNBi
	 HeVUPhW91klG88Qnb0XL28Y+3Z1D+Wdvb+qJPaL+sH5BnazHPnnPFWkx9bGCoPRSn3
	 j6t3XxQ72iJk2F4LD01jucmS7WY5a7lyXsxWCXm/wIyowWYEvuAgzQz3uNd3UnSK1e
	 Cm0q+blmq9bIA==
Message-ID: <sashiko-outbox-185365@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261026135715.33071-2-selvarasu.g@samsung.com>
References: <20261026135715.33071-1-selvarasu.g@samsung.com>
 <CGME20261026135751epcas5p42c28c8315cd25554a11032714b85bbed@epcas5p4.samsung.com>
 <20261026135715.33071-2-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 14:01:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
>=20
> This is the first Samsung Exynos binding using the flattened
> representation.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026135715.3307=
1-1-selvarasu.g@samsung.com?part=3D1

