Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732FF2931DE;
	Wed, 12 Aug 2026 16:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550439; cv=none; b=QseSngIb3HpMMqEvDGdiYk0t38EpxIPoqqpbE68VVn0O2FiKcsiGlJIhELp3fpSurVcsgFD0Ywr+XkCwH8vU1+W69U3SuQaUBTpXO6WCAL75oJfHUzjSM5pY4kaAvUHb3xccFxFIkAGr5FP9LQaeo4V/yFXHW4k5sMBHLgbjqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550439; c=relaxed/simple;
	bh=mi/6rxdPx4Qp5CB2+flp3+6ZqboMB8sQ72KgtWG0b0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKev12FML+LhhxoRrYrIIhfFvhSGyT9SqENiSlBVKgS6xGjGnkKtdhSqqKvi574BMuwPPfw2PjJQK8++icEglxngSHUMjaIwVwirQSyM1m+c0/39KymrVwnE3BycGSxR4yU06I19EfCKoUcLvW0T7+QEmNVL03PW4yW2f55Iyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo7mOvs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo7mOvs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2241F000E9;
	Wed, 12 Aug 2026 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786550438;
	bh=mi/6rxdPx4Qp5CB2+flp3+6ZqboMB8sQ72KgtWG0b0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mo7mOvs5fg2GiAPXhY+sIT/vFO2vfgPCWAl/XqxBWYvp3ZHHDfWzBKRZeRmR1o64a
	 rXItrECmfZ9PG8KcFJuQBAYhtJMoKZoOTVB/PipS35O/JuSQNMHlp/hyhbzCRmrU+o
	 8CuJ/6FEpz4OZGRpFEEiHjlIo2Z+gg8A4du0qC0fUW0kjxVVPZAhSnlZf4UH9M9kVc
	 u20GA2ta+kukL3slGbeD+PImtS34T8iQ3mjsJNOFFfECBIBRWzubaUxaEU8wwUN4ds
	 wSyQNFRNkVwgknvS4K9VWT31ev9Nmvs3Kcp5x0eqlnK7aXXFoDvF5XPUPLwnuwIimk
	 N1Qe7HQkWU0oA==
Date: Wed, 12 Aug 2026 17:00:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/6] dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2
 compatible
Message-ID: <20260812-tinsel-tweet-8b3f49fcb4d0@spud>
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Il514M+RL+ZQLgRP"
Content-Disposition: inline
In-Reply-To: <20260812-b4-spacemit-k1-usb2-v1-1-f28cf29e522b@linux.spacemit.com>

--Il514M+RL+ZQLgRP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Il514M+RL+ZQLgRP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanyYoAAKCRB4tDGHoIJi
0n3SAP9N4J4ZscMyDPBiwvCde+IGjl3ABzT2jDBEksf/YTZuZQD+K0xRBOk8Dwvs
vxKBxjnLYKdOTBA9Bw/YzopCdzNxTQk=
=sSFj
-----END PGP SIGNATURE-----

--Il514M+RL+ZQLgRP--
