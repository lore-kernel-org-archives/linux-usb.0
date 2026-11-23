Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417237;
	b=13n0dK3SC2N93ZGPfca3RAM8X+pCy87V11OGsX+VLH+c25zU1YzWY5xP6IYAYS2ZEDHm
	 2TluIQyzksXlnwnd8XAhrqmwGQbYCJ+mM8BZEMRvuk7fICJ883utYk8Oqu5IrAc8ZCm3f
	 DLmPysBvXHln/JIJZP0jIZTNmGmRqmnZu/PGFMqV1sLWW8EEG7asPo0eu8E69H559tIMz
	 mRUUoLWFm6Y95WxKBHj2z4jxaoKRCHdhx40yWG5OCZkELcJnMes2VdjCRPgJK333vY/Ii
	 +deaoeEfiPCpHPdDjKJoO1Z9CvLj7+eq7etJXNefSkpDq/3LE2nLEwLE7nqCZL3+i3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417237;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2Xfacf8N1soNHWfZFuFtXqaDfTfpszAiJhgMipE9g3k=;
	b=FrCzl3mrD3C+f6dKh3Qz+X2bvASjaX7R3p+QGcBZYuV2ukkqlgKckMXuFI/RVAU94LeC
	 t3kUYrnPlkdj5KA3DWI9+Mt/n8uxOK9ot+qGcoSMRc+y4GnLHl211vI8PSHtNae/p8lLw
	 TZONOxsZ9ejnkwHozKscz2avySt5VRNY3X5w7UkG8oNJoox7KyFEeNCmRtxTkiFVuR8ih
	 DfsOr3+eVmbzOQAkx3Og7mhsUnN0sTl7SsKn47HGkighS5OypwQ5tRQ47g55KRLxYE6SF
	 UDh9HlWQeQciJ/dmeVqDe3WQb3FtOyWurEJDXPmTIdVbVS8sZ15xnQ5XMgVvSVmmhEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzIWYnEC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C74606A31A;
	Mon, 23 Nov 2026 07:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GzIWYnEC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57151F000C0;
	Mon, 23 Nov 2026 07:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795417237;
	bh=2Xfacf8N1soNHWfZFuFtXqaDfTfpszAiJhgMipE9g3k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GzIWYnECvJczcIiseT0lVEVt2xELTQTw5nCA7ZrC9hru+kA8loDCQ5InqJ898RXS1
	 yiJIqI7fd4bQHaXwIpqF9Qqt5tosyzUcyP05XIFP2S9mUIJ8IL50QEL7gicCwMeTeF
	 GFfsxNwgSyTfGKc9rNi24PmGXcY49WJ2DSVr6QKJwjqSXX2+GziNPvRpIn/X77suZB
	 pyepZbXGz2iBzJFvTr3MsUXFixjibjT2+AVq2t9aBHIN4/hTuZHb9ryJh9+f2hYQ4U
	 fX8XmvQEsnDuXrlwN9UNoIV/UyZ78UBoJfZ3G93D7KpIRrEAsCvQf6yMOZBt4xL/CR
	 lBXgw8Qot762A==
Message-ID: <sashiko-outbox-228788@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] usb: musb: sunxi: Assert reset before
 deasserting on init
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bobek Brzeczyszczykiewicz" <admin@roadbobek.com>
Cc: linux-usb@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20261123-usb-sunxi-reset-fix-v2-1-4e51d3a64964@roadbobek.com>
References: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
 <20261123-usb-sunxi-reset-fix-v2-1-4e51d3a64964@roadbobek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 07:00:36 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] usb: musb: sunxi: unchecked reset_control_assert() in
  sunxi_musb_init()
--

commit 979d5486eac0aa36960d582b6b645fa08e41d62e
Author: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>

usb: musb: sunxi: Assert reset before deasserting on init

This commit requests an exclusive reset control in sunxi_musb_probe() and
briefly asserts glue->rst before deasserting it in sunxi_musb_init() so
that MUSB starts from a clean state when a bootloader left the reset line
deasserted.

> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index a17b1c150626b..5f63d519237b4 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
[ ... ]
> @@ -239,6 +240,8 @@ static int sunxi_musb_init(struct musb *musb)
>  		goto error_sram_release;
> =20
>  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
> +		reset_control_assert(glue->rst);
> +		usleep_range(10, 20);
>  		ret =3D reset_control_deassert(glue->rst);
>  		if (ret)
>  			goto error_clk_disable;

[Severity: Low]
As reported by Philipp Zabel on v1 [1], should the return value of
reset_control_assert(glue->rst) be checked and jump to error_clk_disable
on failure, matching reset_control_deassert() right below?

[1] https://lore.kernel.org/r/974d629b23d38d46a033513db9b4e783b9c11cda.came=
l@pengutronix.de

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-usb-sunxi-=
reset-fix-v2-0-4e51d3a64964@roadbobek.com?part=3D1
