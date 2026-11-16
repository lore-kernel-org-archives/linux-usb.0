Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843015;
	b=zcFr/F281VqM7kCI5R1VbjHLvm/tWeMSy69TzNBcgBkIhYQWHcdoOsuXhZZ3prdYz2/H
	 MXIVYvrQE/nl9RLWqsDQCMeAlKFtm6T2RmbZ9Sly5rqX8rNyizbkCf/UFoC1JzINnsLU4
	 +01dyifoPoHnTGFinDkDJoQWvY01zuMD8Ra/geN+FNGmx36kC8E1qz0WtSxIW+nFUozvx
	 SZBMehF0KHcgKVvL5E66phkEcbMjGR4Z9HMHkpsOTzz6KHekYN9sDjHTZQOKC49UuyshZ
	 YSPVFDQCfkXm4g6lU5y2wUwcpDqZ/JQ/dLxS9zia1v7X16yVTEt2UaKdT/wFCU06QRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843015;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=//fH4nUXizfCjkYXJllD57Stwww+EgN+092ncjboj3M=;
	b=Hiz6SQR2G95KseP/EVO8oUqE5UVrjkaHpWesIjVtPwzfIXsgqKd235sVPGgOIzGFCT/W
	 Cy8tlBm4N1P13EzLQcfAjHspLUthudOe4KVq6lUwEknQiU5Fg3BMOu5mOP2Lkhq9aJlvQ
	 Ong7HJOHdagbjw7ryhAfPF39JUL3B9r6SZQt5RQuAaBeglXOX+1nB0UxRy2qNpO6lweV7
	 ET/BcHmrLJ/ENnyw+yugqiR86qesVW94hkfcu19gZWzv0G5Dp6fXUajxtqCk1IHEmJXA8
	 JxeQypOMVGnrrHVBbcoJsumJLIE7LJO/R5fctGV0iNvTm1Yhn5DjN9FABwjMne8cQKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvfZ+fig;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93589606A881
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kvfZ+fig
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459B51F000C5;
	Mon, 16 Nov 2026 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843015;
	bh=//fH4nUXizfCjkYXJllD57Stwww+EgN+092ncjboj3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kvfZ+figV/BJ61cR5gYJcV/rnyqsaXUmTwFgkluE12gVghzQ0R3tt8BN+hYOx9Spd
	 5uiv6OAoyJmMkdMMGWyfdTi0ooHrJqahRa86Eo2CmhWc//ye6qmcoNH5O5Id/KAHzP
	 LFnIld1p1SQ2cY6ay9HUMYICQr+HcakpHM0qvqnO4xa6bAMQQ3/R02iZfoGHCnMfi0
	 6Vqogbp6bLZgXJiCRmqIvY6LqlARuHXhkNK/0w+S2tNHqthIZT1AHBf41lPuZdA1kk
	 Kke4ITzPWc7Qgj+e7s0t7n/mnoq0cWmrDIcUttR+wzK+VAp4XQi4S+a9cRAdfT1KWM
	 NTtIB9XXuohyw==
Message-ID: <sashiko-outbox-217278@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] usb: xhci: tegra: Fix missing semi-colon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-5-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-5-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:30:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> updated the Tegra XHCI driver replacing the HC_LENGTH() macro with the
> FIELD_GET() macro, but in doing so dropped the trailing semi-colon. This
> still compiled because the comma operator joined the assignment with the
> following polling expression. Replace the comma with a semicolon to make
> them separate statements.
>=20
> Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D5

