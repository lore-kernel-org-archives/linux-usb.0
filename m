Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958199;
	b=sBEKzJk9B4f3I95ZobkWaGpVOKG4r/VvqMC0J2FheXvOiY3eorOBwK0sbTE0IWszuESO
	 EOuFGotURd1kV7nu9fBt3mYtv/2tYG8ewiNh9Ho8XLErbT5SvofNuVPPqILYjfhtns8cu
	 9iqvGyYR97Oc8CNPO+kO/81tjsqmRfPN09JfCzQEJUTNJ9gO6S2cvrzZ4qTz/ocv7YhXT
	 43KC/VTezUr5077xVq4raxj9fGvNXkqFAXrIdE+TMVP4ZQF5KCtSiQvc+yiMW3ZgqJ6Yt
	 N8V67qdMAdGkuFB3dV7WPk3YBAQESaebegHkIZFwq6R2PodBeiejiv/Q8pYpeI0T58Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958199;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cAHMAz8O3m+qzm79CyQWEjvJcsSP9MoPf8FVUNWZjfo=;
	b=O+wzwwDBDVyotFwgqxFdYQCEbJlAg5YZLXjkqEQ7YSnvuV0lp+I98QlyHB6oQdmhe9y3
	 BnCyyKOpK1IInMPS0e1Ivzkf/gEZi+dk6bBNuKlskpaIe1SXYYPKpADoq/WyxiqsOAOYi
	 39lnVhKSwnSiW1iBuUHWuiONploaaUIstVPigXIFSuOv5jWtK1XOTKC7YQ66MI4VY2/5S
	 Gdg+Hcmpc4H8e1wH3OUj/sZVTMT3HzfJjw0byrtO7qeCYHAPyzAY9hDw7H6qnje6Wox0A
	 pap8X0nzEbeluofogHASSrj9Sc62GtHYGIAH94IRzm6897e9dZHndeBZwol/T8SBk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nd+2TD2M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18603606A32E
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nd+2TD2M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02CC1F008A1;
	Fri,  6 Nov 2026 09:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958199;
	bh=cAHMAz8O3m+qzm79CyQWEjvJcsSP9MoPf8FVUNWZjfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nd+2TD2MUkkq9xdF2NNxYHSJcFOyf1d/lQFujC34SRanJF85/n1I9n8wwG6BoN4O9
	 qeIQwTtXtLwaBbT6vmtdO698qU3u4o5o2/Lsr1Huoe/abTkJMRs703vKjvNeJhNXgd
	 SKzsF5Zk/doA/Z4YXao/fqZeBO01qOIV+k7ROUgAtrtSOubXsaBfcFRDwAy9Pt6uPb
	 BdBYxtytFyM1AW6geh89AaIL3exgOh0WWfhZ58FlP81/vck3WZ4qntZaI7xtg3KQWY
	 nH8TPjh5b0JX39UmGXjRKJm94nkpCh30OQTZEj567LI/SwQwsf957d68A4Ih2i+kRi
	 N2g6KvmyjLKSg==
Message-ID: <sashiko-outbox-201144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/25] watchdog: atcwdt200: allow building for Metanoia
 SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-19-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-19-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:43:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates the Andes ATCWDT200 watchdog. Allow the
> driver to be built for ARCH_METANOIA.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D19

