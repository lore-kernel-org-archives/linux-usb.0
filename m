Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958536;
	b=iFbZ+m/dOq9z4DmejpjyOetQpIYyemycGnkt8UkLjmBXQCfxmztftetLjBTP8Z3ZG+ID
	 w5ogCHR4lnBbR2++pUTR6dwTSmVWuRZnPitmWSLuS7a+NO2FBvCLKgDvtyhh4HUtl3Kji
	 rjqtNWbUdQ4OM2v7gwk1Mc47Q/VG5vZK+Rz4Tap5jUdsWcohPm/Ppnlfi7/mfu40E065A
	 Jl5bmLCLCRG5yDSeWQ7GhgPKQJcM6r9eXbiqnVrb544Ufh6eWK/cvGH5y6jAJEFir3Nyw
	 xlMNu7ADnfUn/FmY+nLce4MzbthEBzDt9h7tE4Qu9/g4frlDAOSBrkg1//kDr510ZRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RtCoEEEbxBQd3b1GvxxWkPWLst70SGw7Mx1qpLzyORs=;
	b=JMD0d+YXgfR8iFZCYTPC9HiuVK7aptmh10rY8mu952koHJlumU59Zal66ZiZ6qHBdUgC
	 czsFowv3X4eNLoqhvnxTeeuOUZB3yVuMrKRzmi9t8bB181XiE6hgnNvJxzyxupRQZVcTK
	 eNANL/VeQVF3p6omiElKmuwRaYmcz+e+5x+DUGjatJF/2mrTtcUVqOqGTZrnUGLxKR2Wa
	 9FN0IEa6qI6i+t9kWYJsTAnDTaLUYj77wUz5cNy6rLzLB38y0W6VrXq8nei5TF4z0jNho
	 k8/ZJIEcE9I1xo2xEsOQpZgRc9YmYfi8NL2lwN/rzhom6AtFpafz8B8YEftZaBmgBRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LID8jGos;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B34606A328
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 09:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LID8jGos
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F3A1F0089F;
	Fri,  6 Nov 2026 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958535;
	bh=RtCoEEEbxBQd3b1GvxxWkPWLst70SGw7Mx1qpLzyORs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LID8jGossJ2EBN539+V/GBKuzdnRdP729C2SkxavUSy40x5uBZUufoSIJSfVCMvdQ
	 LTQ75u7Za/CJX80ux/bC9emMp5NwKl719mofjMWPSgNOn8T5H9sUes68ypUbzFKH2Z
	 8jjh2O5H8Mg/2YtE6q6DZY28N7FVAwWF8Uo6tLa5du+pCbM7dpBuoeK2CCNHKBRek1
	 dbbGdfNEFCF3EeT8ImL+e1MYQ8wFgr76UP7mzinP8+wNZPFD5FwWxlflqdPaD4uC7U
	 r0hMVk4HebRj2ggYs5jBUdfqH8a7/cGKVO5v3YYyBurhvAH+gfI2Vt8z7VF8BFjnjq
	 a3YksFDYsnGUw==
Message-ID: <sashiko-outbox-201150@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: core: hcd: Skip PHY rollback on failed autoresume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cunhao Lu" <1579567540@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-fix-usb-hcd-autoresume-phy-rollback-v1-1-1ed900ddcd2d@qq.com>
References: <20261106-fix-usb-hcd-autoresume-phy-rollback-v1-1-1ed900ddcd2d@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:48:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Cunhao Lu <1579567540@qq.com>
>=20
> hcd_bus_resume() resumes the root-hub PHYs only for non-automatic PM
> events, but its failure path suspends them unconditionally.
>=20
> A failed autoresume therefore drops PHY power references without a
> matching acquisition. If wakeup is disabled for the controller, it can
> also drop PHY initialization references. Subsequent cleanup can then
> report unbalanced regulator disables.
>=20
> Guard the failure-path PHY suspend with !PMSG_IS_AUTO(msg), matching
> the condition used for PHY resume.
>=20
> Fixes: 178a0bce05cb ("usb: core: hcd: integrate the PHY wrapper into the =
HCD core")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-fix-usb-hc=
d-autoresume-phy-rollback-v1-1-1ed900ddcd2d@qq.com?part=3D1

