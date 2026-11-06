Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957796;
	b=1Cgsvip+MafnNnOT6UckSwvO8d0ETUv7Q+Lq/lnlUuYflO3DGzdIJW5yqGUvFSYT0aut
	 lOSJoOTMqlJWHjTz2jYQ3lqzpq03pizTUWmWNbuReNrz/700i6uOCfMalf7pLBtsZb5Xj
	 XAlbqpnsS0Kt7RBXtqKs6z3h5l/uzZ8Su3RaFo9IXhz85g8AeR1KCipdoh0zl8wzmC4z/
	 wm2agzebXjLyq0tyqArpV7pPPyzpAjoWR4RIhZA2CphAsqx8J3+xbcKsHx0qg5fKRlJel
	 bF6ryH3PI1/x8pFziJKmliA1HiN+7ISDB8LVkUrIfa4yrw9C4zUnkrTlSXbMfSuPIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957796;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XL4Pg8nU/eOxfV1xo8wy7ny9/o9VsuHE7LVmGmV3YJE=;
	b=FJkIMAH7SfnHr3jmjrNkvJk63GnxMWbw1MoTFuP49ZHDg17fk8CXtojTArTCWyMxtfXH
	 RDkt9BSARPeKgcUolIjK6ORwk74UMeWGd6MhpDOIaKLq2qut76e2hrSog8aPbHsgPICq2
	 7rCL6fkFy2cwan3nKGU7eHoGdkcMsJzyF0Wz8A05tSlWKbbK3I6SzyVWKf2eSjO8lCxbl
	 ZyKckZ/XIzXeyAw74gsa4QAhV4OzTyjxhJKCA+rFMq+hjqFIbXsdytNOfCuKsa994m4vM
	 sDW2g/08J/GcvKiDChyNxrPUSAhTchq2Dh23T45x0dr78d1+YlNnfHDtoiczvyEFo6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmfhCY8k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6FF606C3E8
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kmfhCY8k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FCD1F0089F;
	Fri,  6 Nov 2026 09:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957796;
	bh=XL4Pg8nU/eOxfV1xo8wy7ny9/o9VsuHE7LVmGmV3YJE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kmfhCY8kTdIXLjIN+QryDXpcRx1aUHrJpbF6t7idJXCySqQZHkux5K5A4fnysIU2x
	 Skbnd7Yy0EHJmr5rm2bv3Y0e5KCrKDcZEpN2PB+jD0MwuyPDYD9EUnvSPOUablp5gv
	 O9L+okcnVSRCWJBd2n6pAafUy6Gr3u59DUmauQdkeRfsWokEWCk5zD2vhuqxlF+mXx
	 EqI8W+kyGxm/xkj+g63Ol7eSz0VU58r4LQ05glEYVC0KXu384NW0oKqLneV1ymlCNO
	 2lk14dxbaQIFnOaBYbtGj+qPI0J94rl/UUv474XA9s54zu7vO9A9XMrzbwBFIKi30C
	 9ocp81Oyssceg==
Message-ID: <sashiko-outbox-201129@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/25] dt-bindings: usb: dwc2: add Metanoia MT2824
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-13-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-13-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:36:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the metanoia,mt2824-usb compatible, which falls back to the
> generic snps,dwc2 binding, so that the DWC2 USB controller on the Metanoia
> MT2824 SoC can be described in device trees.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D13

