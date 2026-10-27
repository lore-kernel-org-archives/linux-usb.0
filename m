Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113743;
	b=x73SN8dUO386UjaigqyqmT2qeHLkLbMlyud0fMLi5a/YL/Kv2CEVN1/MK0IfIkvZwcaK
	 vkWRY8k9SgDj90lmlomJR3BnuBYppJx7yn5jHHPtwi7xkAedlLGqYhGuAiRg9Yh0qmxpT
	 rctHNpl1upxmkjssk53dwCASsVin2jH+k+wFUXW6UQ6YS0p+51H3L//LqLSC1Pkoek52C
	 yNcVRHY9KcKMSve6rteqBwMMbwJ6ONHDEKc6bq/96lSMSKQH+Yf4otpqEGqfamJ9QtWIy
	 vcn6G1KJeASJXGM3uUvM6WdLJDUnxDsxvYPfxKvzmpKRCpuZF+OaC6IJTP/Yl5pmEpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113743;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=n35MKiE1JyoU7EoL7PXh2eiTqok5/cuj2rW/2aE1kGw=;
	b=wUOXAXEqcrnlgSG/7btbDm8XTuJ1cYW8OVKK1wxiLMc3+J5R4jdnP3ma/u/JpJSfEsw0
	 sGQnPip34cx7Yrpw/ACwWsPmFPBZv0MSQk2lXseqIDf02/dx/OQfgguwyLhOh8fdoIdGY
	 jR2OxzcFCq776Yu21SF5Bh9ZMBUbVehBMc5MJq9uiffHs48Q/sb79xiGddE/TtAluEyva
	 I8jCP2CfrsMpDgpYq+u3w9/kLnm+7v3zBJ7uvk9x3Aq6nAzQP/nmOJV36FjetI68S8Ub+
	 zJfzdgxRDhuMNgCwtyv6tBCOZbfaz/Mg1G3rMPPfNtG3VSu1axezht2ar36ZaRyK5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtQMTxtr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A643B606A31D
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WtQMTxtr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6263C1F01825;
	Tue, 27 Oct 2026 15:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793113742;
	bh=n35MKiE1JyoU7EoL7PXh2eiTqok5/cuj2rW/2aE1kGw=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=WtQMTxtraelxY1Gk/RnsfFsf0/Jf6M1Povas17ksJRa0NMGV77tGZmCfaQhIcaKbZ
	 g2Wvwy0NpLtI4mjd4pBZyJR3JC4qBZKJWDiDlWhPWv8Ju/a+hv96Fl7FDnWa/jh9Zw
	 5cBtl65kt5JOPqyy4QjcWMPQFaysyFaMduYnZ9w1RlhXnLkQ7GbvWIVOWpyY8vCCbl
	 KRtrZLyzbdsGs9Zts0Pig5bbxF67k99eP8JGggdcdsXRtonkEVaqZ1Xp8IYzn2t6pe
	 EOdh1yuqN+H8zDM6FSeXbAcfOq6k0NYQXGqtYriTSNKcaCjhBEt2ZRMV5Olox7vSYn
	 mRKm2ZB9YoPsQ==
Message-ID: <sashiko-outbox-186803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/19] usb: host: ehci-orion: fix the probe without DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-10-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:09:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> The Orion5x, MV78xx0 and Dove board files register the controllers as
> platform devices called "orion-ehci" (arch/arm/plat-orion/common.c),
> which are bound by name. of_device_get_match_data() returns NULL for
> them, and ehci_orion_drv_probe() dereferences it to get the DMA mask.
>=20
> Use the 32 bit mask, as before, if there is no match data.
>=20
> Fixes: c63fe1cc7093 ("usb: host: Add ac5 to EHCI Orion")
> Cc: Elad Nachman <enachman@marvell.com>
> Cc: stable <stable@kernel.org>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D10

