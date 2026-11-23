Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434871;
	b=OTOk4Ewo/jIychlDdJtWpLpakV5GJo88+Vv4wQSLpNusJIRcG4YxnuFNYVzyrlW+MHE2
	 iAoyUKaugQf3y8BygW4PzzsYJIzWbd8Ifp7Ea9pqxJsYghOZgipLyJq77OWaDGO2uq5QT
	 YtPS6MGOhgz+BG9BgtUtVUhmHEf4Yf2qIqicwTxpN5hB9POkMuO/OGZ7Ms94Pw4UjhI6p
	 rfneJzoSLWte/2st3fPHK9eqbMAr2aSiHfR54fF25tAOsT2suh8WmCRldkccxKG/4t3AW
	 15UvnwZ/UlXLo8wdC865fULiS2Zlv5ABDmQ9CF5y5fq63aEBJGp82/ovuXyao5p8VeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434871;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NBdPGSHTtfQFTLkU1wMN9q73epqiisRnzOw7Z3Glhlo=;
	b=AsbZzfiAUjQuNQ0mfLG98M4TQPNZH22rXXF8peWPwk3fkKOu8FMdJtYU83CBA9VogIRD
	 LNy7ekRRaW8Iv8b0S7hfurbzRAsbK+A/OjNXxiIR2pwd1iqrYyyHH88G0AryoR5ZSZVyg
	 NoU7frl96+uwm+0zI5UkBMTjgJomcan7gDt+oQLFYwAYbxKhm+y2ynaLen83L1F8eJgSz
	 qYrr8DLlawBJDl6lWzXjzE6NLwMrhDWmF7Qf3/I5bMRCFvFFyd1Emv3ToGgWhB0btSpOv
	 M2pBM31LGI7GFmNxfjMMFSS89joZdNxWBRkTGJdMo5yXUjb1wtBnQk8WQLdIuAwJxmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBla6bpx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6C606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iBla6bpx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2231F000C6;
	Mon, 23 Nov 2026 11:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434870;
	bh=NBdPGSHTtfQFTLkU1wMN9q73epqiisRnzOw7Z3Glhlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iBla6bpxC0IA42H4Qnk4A758XGK3hGJTxvkN+lsjbI9QkkCXQ5IB2S9tmUGtEUu5b
	 7+oxqTu1WGVatqaHzuqachbrYOSRXfVM5ioo0WO69RyJ68VpxoiePYFnmK/G5+oUor
	 6dKF+VevS0QoEbVKPxQnK3eLd6fJWhn1eRmVGJm3Ht/BdHmO6j0E3Ti5deIEABtfs0
	 2fRUcEKh6R/oufLt7vYTYcl6eIS2hC27gghdI76JImdezivTCvdGXk5d47krNnug7h
	 uSTjw0sU0Ho108buTpZxElwtSU76ZJIrYUZcAXM+jzE6rtwN1o6qY37apvpbJtnr5v
	 OP0D8x9lAbWgA==
Message-ID: <sashiko-outbox-229175@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] thunderbolt: Add platform NHI driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chunfeng Yun" <chunfeng.yun@mediatek.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
 <20261123113705.2297329-6-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:54:30 +0000
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
- [Low] thunderbolt: invalid SPDX license identifier GPL in platform.c
--

commit 69e07d737f3ccaa08c0332e46cb3614ab51f29be
Author: Chunfeng Yun <chunfeng.yun@mediatek.com>

thunderbolt: Add platform NHI driver

This commit adds a platform driver for Thunderbolt/USB4 Native Host
Interface controllers enumerated via ACPI (ACPI0015), along with support
for an optional dedicated wakeup interrupt.

> diff --git a/drivers/thunderbolt/platform.c b/drivers/thunderbolt/platfor=
m.c
> new file mode 100644
> index 0000000000000..05dd858ac8342
> --- /dev/null
> +++ b/drivers/thunderbolt/platform.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL

[Severity: Low]
Should this SPDX-License-Identifier be GPL-2.0-only (or GPL-2.0) instead
of GPL?  Bare "GPL" is a MODULE_LICENSE() string rather than a valid SPDX
license identifier in LICENSES/preferred/GPL-2.0, so scripts/spdxcheck.py
and scripts/checkpatch.pl will reject it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123113705.2297=
329-2-chunfeng.yun@mediatek.com?part=3D5
