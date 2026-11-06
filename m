Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957886;
	b=BsSHeg9fXrNCI2njNIvnCa+gZ4M9ALCbl5R85UWTFCvxfuoxaEjSSHWca9cEqZ1ke3/k
	 yjmPlKPx1nfTDpZU4XLn9E33qlHT4ECMJrK02eslpjZBCSwc4nJiGxINg9JLtmovutAx1
	 ZVTrl9wk0akSnawvoaHqlp+r9XGdC5Jy/trLzA6Zv1yzyOuZ71/t1RblWum7rM7Xk6Hll
	 ZCZ3bu7JQn4S5vi6Yy79/GPycHiqKxiEquQzj9TCyV4SPbiWyQXiOca77jVlE1arI26ll
	 UUaFmKJjEdU/CA615/oIU3T98IxXF2UMuECfiRm725Ahr/rspMNN5GooyHIW8DIsdNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957886;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rohf4pdaEaKJaqL5/3mgfjzFGewqqjLhU910tpU0eKg=;
	b=BeM6GE8M+hlXTyMAnNGb2bl+Gk5qQorqJCSBabHDoFqSd5SeCf5uqanZY60E42mkCGAx
	 0yvLQkIHWp42seEXU2wvL383YHPK+QKks6VCLywN3N0NETSmjHvBtVBqgnjP1cZ+eFqib
	 LYL8RsuYiFG7ht4ahEbBhUcOL5CZ9DkGVHKjpUEQBhr6wdrVf0mRNgy9sFCl047JA2aKJ
	 f7bqah0pFVbmp6wqWH86HMXuAmpXijeGvOjvo7hD2zhIpi1rxjmzO7Z5qMnmmnofp4+fF
	 l8ATFxuG2yIquleKhASsUQ6zD/hS1iYJcaG/z4Q4m8NjrHXUe6QvXbME6fLQw2Eb7oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lfz2Q5jb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76269606EEB0
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lfz2Q5jb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F111F0089F;
	Fri,  6 Nov 2026 09:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957886;
	bh=Rohf4pdaEaKJaqL5/3mgfjzFGewqqjLhU910tpU0eKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Lfz2Q5jba1cjQFJ8pVLLOtEgy/a3sgbqIBPwR0TOZQXsjPeeILNuOuk9wTgbPdPCD
	 M6VWI+5ixFIsonVbEg0lnUjA71OaEJ017ScsNh0BXR68kue9EpSHccy2YfIwOn7qfZ
	 3LVSxy8IM1Bm1F8f0rUCWycQRoLe9dii4HvJ7SeBxQ+R6JwyAtlPWJTvJpfJE3lHgh
	 oGjTYeL0mInXifoH9QWyNC+6QKml3IhoW+j1LYCetMYvgnLHt1ARIaLBsYPNyXNXiG
	 0SQJ0ihGewYekCGafMNR2YBRprFVuS3YHi+ps/YbhfOuD89uiFZJua01hwWZFG3T90
	 xgWCgpMdDK1fA==
Message-ID: <sashiko-outbox-201136@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/25] spi: atcspi200: allow building for Metanoia SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-18-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-18-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:38:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes ATCSPI200 SPI controller. Allow
> the driver to be built for ARCH_METANOIA.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D18

