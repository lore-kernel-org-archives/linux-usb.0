Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913027;
	b=hvM/XQlZfZ5q969Q4pSo6iSYluEFyTvTVGTdJoZWvjwfS9gJ+2SyY4rA12yERTwPvRXN
	 DL8qx3D75iEc/L9xQHZiXqIOmgDGawvMqVRGWuK6xIdPAWne9duC8XzHi0ZwSQwGEMgmM
	 99KmcBr7/CCXo7rqAomJKc+PBuVp9UaKLW33SIsZMNxV2Btg2jMNqnvmQhH60YOhY2bZ7
	 xp8hyp+RioVaBQy+uZxV1jb6dYZzEEMZrVOK3B5lGpSwd/e39hwbQnprbozfuO5yG7ZqN
	 1XI7DRS30cCcWsBg1fjgcWiISlYTqMLpxqR8kcGuCMcAOnGjIzaBaotJlfLB1ZaOLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913027;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dQmbzwBmHTIEGepmD5ULwVQgreh+mngoaFE4wZtrZp0=;
	b=0xj1+Iv1pKU0vFPcNPMIF/wAvkjy+m6lUJXwkyF+p4uJovPVf2dGtV3d7BQ87gh93bPf
	 uzTHjXX1/lAZUttojdisWXxRicIW8g05V0GbGwLTjVRT6gIRLg2oGcRjjFiBVsZ/OLvPS
	 d6TCNkK1MUT7FrB9uS+coHWCKx3GwFO0tV3fwGjZ5TnFb3i2s5+vwYw9NTpfrogaACBUV
	 SCkke9FoFtXcyE5AFWgQH12sc2tsKXMut+ZiZOkNq7YnALbm0P89iH5yxNV/jdH7/Xsv9
	 r/kXipC1HVL0TrFVAYSo9NcvyPJyAI3JgC4FYQ3AFKeD9zbQ95QHJkewwR2uR+zaXUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nh1M+pOT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8184606A329
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 10:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nh1M+pOT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B3B1F000C9;
	Tue, 17 Nov 2026 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794913027;
	bh=dQmbzwBmHTIEGepmD5ULwVQgreh+mngoaFE4wZtrZp0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nh1M+pOTNGZnUIPLM/YozprAbpugokv9Bh0FLKFUKX3M9pApKMgmr+gYgDx/poGsD
	 h6zE+tUoBeidotHkBbqvTqFOvPUousQ7zW4b56Hn02vDG/wngWMNgSK7JstbdFtCoQ
	 2b+LmeAr1nuhdgAIVlWVVP1dTzsJeJa+dsh2jG4gUQ2V3sIEKJ9m0r2AW1b39MxuUg
	 OtQqebYxkLcT/ajpqINeCtGqPW7wUi8n0nwGz50krao6BI9adC++i3ziYIKMgzn5T5
	 sYbdgPIogDw8gc9pBWGecPgtIgOsbn8QJ+yBIAlVPdwS878HywQMe9tJ5ClRa7Kxkm
	 8r0dvTnPZoBCA==
Message-ID: <sashiko-outbox-218680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: pxa25x_udc: Support combined PXA and
 IXP4xx builds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>
References: <20261117-usb-pxa25x-udc-v1-1-fdfcec62d336@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 10:57:06 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Allowing little-endian IXP4xx kernels makes it possible to enable both
> ARCH_IXP4XX and ARCH_PXA. The shared UDC driver still assumes that these
> platforms are mutually exclusive: it defines UDCCS_IO_ROF twice and stops
> the build with "Can't configure both IXP and PXA".
>=20
> Select the controller quirks using the running CPU rather than the kernel
> configuration. Match both XScale CPU families and their supported
> revisions, and remember whether the controller belongs to IXP4xx. Use that
> flag to select the existing isochronous receive overflow bit and to keep
> the EP0 status workaround specific to PXA.
>=20
> Remove the IXP4xx clock API overrides so that PXA clock control still
> works in a combined kernel. Leave the clock NULL on IXP4xx, which has no
> software-controlled UDC clock, and rely on the clock API's NULL handling.
>=20
> Fixes: 2262f02ac2aa ("ARM: ixp4xx: Relax endianness")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202611082010.e3nJgvr4-lkp@i=
ntel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-usb-pxa25x=
-udc-v1-1-fdfcec62d336@kernel.org?part=3D1

