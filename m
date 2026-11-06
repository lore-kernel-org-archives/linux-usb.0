Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958235;
	b=k1cFufSGw2Wjm98gWlUdc2I+8Kv8p00TPjtSOYXldt8Td7U8Hicv7DxCUCO2q/l7Lotc
	 beBWHsccAhbrH/X7SlGRi1nwxqzCttGQMDlnAr69YO3+BYRGaHjjpnpq0Ox78K2oxhOrF
	 1DiovVEyPbRQNGDtHNDGOIC/6l83SE8S8D/cyz9lgouRS/WOk+IHM4TAXqOvw+PMrtiMl
	 S31awS3mLxM/4xVa7fPTPJ7yMD3EqDhaa3ipaKwOwiqZ0ZtdKTmaBfwJ8ciM47jYCKtFX
	 /WVe2pwWCKRhLIdajz4RBAYXc3/zrvvQ0B1avAdEswBYB0AdpwWXhc5WdX5xYoAuBGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958235;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SMsv8e4hns3lExA1B3pg+donZbCZIspJc/SsawFgkU8=;
	b=fCFTlWkKQWwKjFDHuMAbb8AcWNUniurPzu0b/EQuk3Hb927ld8ZoMbPNxpWbUuTYg3JC
	 L1CCxoIe2FbFQgKOkY1ZD+rjXS6WwsxbgLYyl9H/1KkLMb/7bchZlCqNallUesj6jzah6
	 k8jS9bg2MfZ4ZicNMDaWwn+sD2ajn1vxNbF3k6gXwelAexORKsgyRsQhZDNUhYHfT+KVO
	 dSKwb5Oh+vmJXCI8zmcx9RmljD07QK3rmRECTJpDl8+AXO3wdTnhpHAz30d3OeZua/9P9
	 VIHSD/sUPgMeqlYf1d2+ts4cX+hBFL2hkwLx752IMyK+d11KVUug146v4IE5Pr7AuAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcK8RtkH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F8D606A332
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YcK8RtkH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757CA1F0089F;
	Fri,  6 Nov 2026 09:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958234;
	bh=SMsv8e4hns3lExA1B3pg+donZbCZIspJc/SsawFgkU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YcK8RtkHyWVM5vSeAV9mwAJET7iKUPLk0oPz4jb3xj3ghxccUGjJbRGLjRukaiX3K
	 NXHuwVsqoJxPe41W++IO2CzBG7GYRIe2AealOK9Jg4SXhvmOEPvG6nen3osNUXWo4x
	 Vyq+DbhYOkm36kdRxslfjLH6hkQNWYN5rIq4o7WVjQ/RKz+PtZyqSiDi9rilLOwmts
	 YHoEdiaWfAK7zOXLrvnjXszaHysOmqM52UAcRatdTsQ/1WyY9YMJhTAmoCwDUu5Yw9
	 sJY04bbfdUHnWqkxWpoQDd3UMTt0TAvGZpBwfxmo99Y1hjjSr+YpaRzrVvQA/e6u3B
	 9PK4MOPebfofQ==
Message-ID: <sashiko-outbox-201145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 23/25] usb: dwc2: add support for Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-23-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-23-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:43:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add core parameters for the Metanoia MT2824 DWC2 controller: high-speed
> UTMI PHY, no host DMA, and no OTG HNP/SRP support.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D23

