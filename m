Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DC3BBA08
	for <linux-usb@vger.kernel.org>; Fri,  9 Oct 2026 04:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521510; cv=none; b=CELseZlsuCq9l6G39HpVAC6NEOKqIj2lftguAx73eZ8CcYfPwR6b/Yq6/4xPCKFAbEqFdRpncyFfMtAzkiNLFfkuC4P76SuxGlg0xMXOhBOKUjvgAtXG36zvvp/G9w3hkisZ7+HjAD4ufmWHs0lpxmVCu3V8sqhcfl9M09i/su8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521510; c=relaxed/simple;
	bh=PUYlZxWsrhhGUEalgbQV2cxmTU747uFmB8zO+blQNek=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jFKZR2yvjGesFpURyHgPcdxo1EOt4mM2H391dKKGLTpXdruqc45BatBDFFuOs9sC3ojnyqQPc3lvABQD3BzY9/Qj3jDncc/WfaXVfOAsSzBbC69zoDDnjzTlTrzkKeroL0V+61rMF+Ql5kHzsWOM6ZdN2u0kyXChWPemkz3YmEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3+jdjCE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3+jdjCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA97E1F000FF;
	Fri,  9 Oct 2026 04:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791521509;
	bh=PUYlZxWsrhhGUEalgbQV2cxmTU747uFmB8zO+blQNek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V3+jdjCE4CyAPmWuItZU751/jxcXvddEKT3UvmWQGYtqZ3GDjptxknDMsDSiNArAP
	 drfMnYcSipWoVVnGzh7Czwcs127sUkHRwJwNP0QRunwEaGH0t40sZU5Qkm6g5chEaR
	 Z4X6m0TcFwTOh8qDLk/chxu6Ezx5ZIwoKViVeXclz8xIDRA/7GIbnQBAHnGBkpjNN3
	 wLSlu33cSStgKZ6GEhciPrmjoOVDu7i0nPU9wJYny8RqKsNJaU27V7F2RWe/KsdeFz
	 C88LHyQfoCJYFsaG6sCku/92zoocUyyclcDrdOsmFuSVJwSQp7Wc6avFImlUuPMO38
	 Xhv7Xt7+HKAuQ==
Message-ID: <sashiko-outbox-164852@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: host: max3421-hcd: stop SPI thread before freeing
 its DMA buffers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haotian Zhang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261009044431.3115704-1-vulab@iscas.ac.cn>
References: <20261009044431.3115704-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 04:51:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> In max3421_probe(), the error path frees the kmalloc'd tx and rx buffers
> with kfree() before calling kthread_stop() on max3421_hcd->spi_thread.
> The SPI thread entry point max3421_spi_thread() immediately starts using
> those buffers through spi_rd8()/spi_wr8(), so when usb_add_hcd() or
> request_irq() fails and the thread is still running, it can access the
> freed buffers, giving a use-after-free.
>=20
> Stop the SPI thread first and only free the tx/rx buffers afterwards.
>=20
> Fixes: 05dfa5c9bc37 ("usb: host: max3421-hcd: fix "spi_rd8" uses dynamic =
stack allocation warning")
> Assisted-by: DeepSeek-V4.1-Flash
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009044431.3115=
704-1-vulab@iscas.ac.cn?part=3D1

