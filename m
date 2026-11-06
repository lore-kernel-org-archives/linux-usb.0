Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957892;
	b=zVQ51uFWfMGht9TfMVKlgmVdu2c/2LDShb+38iSLdnFk1dmnRaeC6M9jWOiHaMjrUs6l
	 fnw2L/wJUC/ja/1IrpHJIFiEeZAILbf7DSOTVVWcJLrY3i5oai/TG4Pz6xU49VFnCXQo9
	 MYHhl7FrNhgr3pndNNJcPXh1fLNbisAugOVKbDfPniu4PQy+bCOIKjpwxql2Bl8IRX4P5
	 hkEZPJMYSv/BQvlqgkP04sCHTBPgsaK0Hg2Njuf3t45NhZw+qdIeZv7YDDYRal9P0kLD7
	 wC47QuX/hJqnSIZFvp68LQ4mGLs1cHzoV1Hc7x9nYJ4HGGw+U6bf75OfzFIKxwc5PTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957892;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HWUd8ebJpH0Z9nPlBcLcNti++ADiDTKHxG9M9RvuPFs=;
	b=gUQaCgq9Jvuj70Ok5w7Gh1ANefyrm4da273pCXlQqYik9z77HyDoQHRtrgj2zi+FZLSz
	 SX3/gEhKH/Rr+S5OkUVTl8wb9a0u/mbYx4YUuJFsYiCHNojym7+Op4zMdamiZ5eAZOGtQ
	 VBgev1/eEw3H7zRdo2WHkVo4o3WX0Yxc991cvcf9yQ+5bCnVsCaInXZb0Yo7/9uLEWrXj
	 zacOCDgmZ0wCE2ft7XGbWevMeZlwOYoh1d0c45FtCI/5RJJE4zawAXPHKahv1i+rvlMg2
	 EiooFXW9mHCPIK/lw9e0AKWsTXXQYwi7rwY3PDVN3zX9kLHIQEJZDd4nu1mgWWMhulA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UG/T2obx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE32606D829
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UG/T2obx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBCB51F0089F;
	Fri,  6 Nov 2026 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957892;
	bh=HWUd8ebJpH0Z9nPlBcLcNti++ADiDTKHxG9M9RvuPFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UG/T2obxbt2lEB/wtCgA+CWaeMGcjiCWoE/90726M/56euiRH34jXOlTGd5fPqCej
	 3/bOg8yzDIq/8/zspNis6HG8QRn3ndAuPB2+CJuQ3vY9KeXtZBTLknWfP5HYqYPHsc
	 ng74EAbwQVpkwgy5Za/15q3rk8wiKxZb2qVAO+s0WDhb5sMiAY3KbTTVqT2nb5JGoD
	 VctL9MP1oGfgd3tCnr5hKmJDHzSXrF4TJFccYRvTEyZdg/wiyzVHjffXxgnBDwzJOF
	 NryGhxfrYZoQEiQqsZ3P8PC4skZMdFaQptz79MI/5t90sAr82x2N7KUiWqv4RNvH6x
	 Wzc49lUsoJn/Q==
Message-ID: <sashiko-outbox-201137@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/25] reset: simple: add Metanoia MT2824 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-mt2824-v1-16-86087eaf5af4@bootlin.com>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <20261106-mt2824-v1-16-86087eaf5af4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:38:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The Metanoia MT2824 integrates a simple reset controller with the same
> register layout as the other reset-simple controllers. Add its compatible
> string and build reset-simple for ARCH_METANOIA by default.
>=20
> Originally-by: Jun Chang <jun.chang@metanoia-comm.com>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-mt2824-v1-=
0-86087eaf5af4@bootlin.com?part=3D16

