Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591305;
	b=MU1fAlS8vJmuGmyfPbxieXPG0WQ2r8q/vxOfZdJ/aKBN7FiY5lVCUx7GLIIFouFcBINN
	 TgcGaYg0VeWR+hrMNc01S4TqC8Wwc3lIuXMv5fsm15aXLQLeOVaCakM/ujKFrsCJrMeXf
	 iGhI7VTFu/IL3A/qDcpEZtHPeUVoJCsP3/OALhoXesgGnaUBHg7r23oQsF0S/KYHGZHEk
	 symBnYc58rt26BjTAY5/tPZFnt93yR+pdOl92aXy7XJaB8ZA4+CTlFEly/abEBA4DuRqN
	 1YKcLrEDRv+eJzc/zL6Jbbi5sjS7VDsmP82X90uegStV9p+rYvxeebKj4sVy2LRwj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591305;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hUZgFLGbaxjBRsnPSxORJShHc6AkYwfyzX33Khh4mqU=;
	b=DRutpLr2aZ7XxLK1J93dkBeffrwP9jcDrqYxz3i+jJiZ1nhvO5IBiqZZQrfiKoE5MRlP
	 hymkHQTkWsIIqwQflQCSkrkxOrIgpN38H97T+V7oAZyMUAqclbB1yqubjtblR6lo3zS/e
	 3/xe2DBEEPrJG+pZ6Kq0QvWZFK2L1uoJyZQtxuSs8Cz2p1pcrEdZ31Kc5kBaqgO5YY8C6
	 6D/ls1o+rz23txPmHuibJlbPafzHTF+Ac99ddXqs3HCAKdUCYM9a1du8xoGo7WUm2kv93
	 HbaqA8mZeAewnvkllnepgShgNfbhp3NpXywxREwttNvDlpPUiAf5a/AdWW5CVfe34Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKUDy38o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BD3606A33F
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 07:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KKUDy38o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FEA1F00ADF;
	Wed, 25 Nov 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591305;
	bh=hUZgFLGbaxjBRsnPSxORJShHc6AkYwfyzX33Khh4mqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KKUDy38oychgUxPSu3H3DSLIRNzHnqw+vmTb7I26M3F8x2ohDM1sYLnWSENP5fFo+
	 eUPppUcumqeT3WwwSaWJAb7Oj/C7jss43UiPEYdGYhGd5OvJvow22k+5xy+p/4x/Qh
	 GZISwRrqMSWZ++x+jhFhJcvW1Rv3RLICr7NOIZLZuE0UIZ+BSGOEM7qmO6bL/N9MF0
	 temfqz7N/vt9NxqwBW73XwIIbQCwjNPsXwzRdhBAEfKY8NIFwB6zEXd2J4eSnkvvFq
	 OqsCC3EDLLB7Am6j+h/sFoxyi1q7wGIV3nqNmh1dc+N5FAa7OAJ7JPQMj3XleQDji6
	 VeCjGUsMcQADg==
Message-ID: <sashiko-outbox-232773@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] net: usb: mcs7830: skip zero-length register dump reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125071649.7052-1-25031212351@stu.xidian.edu.cn>
References: <20261125071649.7052-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 07:21:44 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mcs7830_get_regs() passes the user-supplied regs->len straight to
> mcs7830_get_reg(), which submits a vendor control-IN request for that
> many bytes.  ETHTOOL_GREGS accepts a zero length, and ethtool_get_regs()
> still invokes the driver's get_regs() callback in that case, so a
> zero-byte dump request reaches the driver.
>=20
> A zero-length USB transfer has no data stage and the USB core treats it
> as an OUT transfer, so submitting it on usb_rcvctrlpipe() triggers
>=20
>   usb 1-1: BOGUS control dir, pipe 80000380 doesn't match bRequestType c0
>   WARNING: drivers/usb/core/urb.c:411 at usb_submit_urb
>=20
> and taints the kernel, which becomes a denial of service when
> panic_on_warn is set.
>=20
> There is nothing to read when regs->len is zero, so return early before
> issuing the transfer.
>=20
> Fixes: 2a36d7083438 ("USB: driver for mcs7830 (aka DeLOCK) USB ethernet a=
dapter")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125071649.7052=
-1-25031212351@stu.xidian.edu.cn?part=3D1
