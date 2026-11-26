Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722487;
	b=MaCEPC1+NvncxQZlVrbBYrAF/zJVP63CfFsQUTfMB2Xk93khR/65Jfw8FAq5dJJWTYVB
	 KurB0NLaQq5E9DVrJUnNdoBOZUsDDb8kFbY8m8ZbFsXZYknrQFtZBV6r5qJ0PIuw1aO9X
	 cF2vwivjFsy5Fi4g9E4Qmc5F/EZ/1gRv/QTo24K0FMSd8yFfS//Fj+IwpHWs8odgxwpmu
	 hC5AsKYXX4XvGweb+zj8DcTlr7ZzQ11mtQU2hFZZ7J4WGI8vadeZSP+/wmBEKgsvM9tL8
	 H9UPURpRB3JkP9N/3O96VjLaexG9YP1s0GDZ5cCy2XpHgmge63wFj+WGY8zV3lNLeUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722487;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lwb78tfyMYV0kCk/5l+gUBSIJIU8Cv8ScD1hvQ1CyS0=;
	b=rftCZhZufTMrWntMKvGphJAoVEXtXVH9Ns3OtmzOTCwubChnNhgxVhow2e4DX2BdffYS
	 XjKb6jG7vDTMwXl4BnMyae2g+qK1pBKgoZDae/f6jj7Fs3xGJs1wcuggAlWMr1psCEeYy
	 TBWwJa6+P5Sdim90u3mcOVlhcHCOQrpNyjVinXGbwqN6Nx/pjC2Pmq1yes/gDeWpirf3K
	 xd7V0orZbsgMn8NhZULCn/n/1/XyrlcR4kmhyikZAjl5MxYen0lB4WFNAoKgwY766Llfe
	 mCE+BwSJxFOdrNJy5wCfhm7AF1X+4WqfgjyO66Ha7vqIFjbCIxvHvD/BuvS5JAb5vTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWfQXCnn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79670606A31C
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eWfQXCnn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F4A1F000C4;
	Thu, 26 Nov 2026 19:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722486;
	bh=lwb78tfyMYV0kCk/5l+gUBSIJIU8Cv8ScD1hvQ1CyS0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eWfQXCnnbLzR3LfhH5CT9WO4hXrBRKPcNXsPwFD1v0rVGTpAoqUNIUlndll+KfiMZ
	 yDgLi8Teu3SSoFS/hAatAWLvRC2B9+0TWDFN5jPLnhywoJEKjqLrwYbB7u6cyiASPc
	 1wC7HUC4QV08jdXejWT/E1l+5J6PDXoOMh/eMe18o6HJofsjXVMf+YFmkQR0DxS+68
	 TXg7BVKYaspagITz5rbgQK8OsuGbpflcsbJNQD3jnPYeSR5ExYHCHs7bHZUHzSehEW
	 sgDjnLrfmz4oP87JyWu62hO0ZikyKmnlFPhn9e4jnObixp7ZlQjF1/sUOelcxerh2m
	 IlQLWThsGgEvA==
Message-ID: <sashiko-outbox-236120@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger
 types on unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Felipe Infante de Castro" <felipe.infante.de.castro@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
References: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 19:48:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
> Date: Thu, 26 Nov 2026 13:54:01 -0500
> Subject: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types=
 on
>  unbind
>=20
> On suspend, dwc3_qcom_enable_wakeup_irq() sets the DP and DM high-speed
> PHY interrupts to a single edge, chosen from the speed of the attached
> device. The IRQ mapping outlives the driver, so after an unbind the
> mapping keeps that single-edge type.
>=20
> On the next probe the interrupt is looked up again from the device tree,
> which describes it as IRQ_TYPE_EDGE_BOTH. The lookup fails with a
> trigger type mismatch against the existing mapping. Because the wake
> interrupts are optional, probe still succeeds, but without the DP/DM
> wake handlers, and USB wakeup is lost until the next boot.
> [ ... ]
>=20
> Fixes: 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during=
 suspend")
> Assisted-by: OpenAI Codex
> Assisted-by: Claude Fable 5.2
> Signed-off-by: Felipe Infante de Castro <felipe.infante.de.castro@gmail.c=
om>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CADy1qsZaucfiZPbMkL=
aXE=3D_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com?part=3D1
