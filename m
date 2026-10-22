Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653164;
	b=XIyZ3WN25cuhogcl7Q/Q1VlaiB37T8dQ52/3RCXLM/t+8dMonjVtYZEDMP8mbEbZ38b1
	 51c+iVoDTnZGEGlPR6zlJG9yqihnCChYZ2+Z5w/ZWG+htiN5d6b1SK7PFMalNViVMpXhI
	 r5FRtPWdpaVkc2e+RNPa2uBPfmY2DcrQa9wqyltiHWVLRYH9RPT9D/BMiN7tCqMVuNvhY
	 hJe2XBhbyyLA+zQ2O7eSLE4mCk+hqw+W83VfKjnfuDJLbsjceyHxODAK0niR4omxn+Qib
	 lf5epsftUtykswJRflRYJzPMdfrt4yLAgb2/8N7uNwSy5gwkxpLTan6RGq+3iJWlw+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653164;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1cVb3bGSyqTOQgwYDbw2oxljI5ZCKaFBTgac0eOM7E0=;
	b=Cux+dfYGTWbH7uwNpC6AJdSEhk4HUvc1sDNhZKOFIMv+sUCv2i6GFPVedP42Axnyrz9s
	 FBA1Pl4VrmHMNsl3pjCz+VPbZrHzYbHYMronV0TldO4gwLF1GbPnjBhTRxY6o8TCdCRYn
	 hEqlpY9Db9kDx5P40PCX8RR6bIO1pghP7srbEMW7ZWj3/pdwrchYH5HwaOxVcQVHRcR9s
	 dRacYTYkP2ma9FHJbry+gtG6wWt5yp75KlJHgqv8t4nucn1mAlJNjiHT5rmUA+9DOZNMI
	 68Hgwa0DyY6CVKZsGa06p6YvP+WiRm7P9bNdlf5kIERG6/BaeA2dYA5Wx77ZLC34Ltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cprRyG0V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B5C606A31E
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cprRyG0V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05B4E1F000C2;
	Thu, 22 Oct 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792653164;
	bh=1cVb3bGSyqTOQgwYDbw2oxljI5ZCKaFBTgac0eOM7E0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=cprRyG0V8V4duLVd8MQogb4W9sy+wSGpI/0JeVOHZAc9A/egEeCuxagCVwO1o3cu1
	 NZlergJbfPt5YT71o/wqvDZHsR2C9MReX3vJLFXCmbRiGjV6Vx/kN5OXem1N0Ft5tG
	 GW/ya6W6oQ1LOBmnZ8M9eAogjJqcI1cw3wY76uQkNNcNKozsX/9+EAi8oTrIPIKiND
	 yj/HWhqN3FZtIIkCesIVthl3rhUizOnr/iBF3FcJhXV/qzVxM4tNQO8KrN3wN6XiA4
	 WSfDz+Lfw8TCrNE0LFPQkYJhKQYQTVfmJrQdScL5P6Gtt6UtFoATellPSGVNt71E3t
	 9ntRuN8SlrVmw==
Message-ID: <sashiko-outbox-181115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 RESEND 6/6] Input: touchscreen - use
 usb_make_subpath()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shihuang Liu" <shlomojune6@gmail.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261022070929.20820-7-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261022070929.20820-1-shlomojune6@gmail.com>
 <20261022070929.20820-7-shlomojune6@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 07:12:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The sur40 and usbtouchscreen drivers build their input device physical
> paths by appending "/input0" with strlcat() after usb_make_path().
>=20
> In preparation for removing the deprecated strlcat() API [1], replace
> each pair of calls with usb_make_subpath(). The helper formats the
> USB path and the "input0" subpath in one call, avoiding a separate
> buffer scan and append operation.
>=20
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022070929.2082=
0-1-shlomojune6@gmail.com?part=3D6

