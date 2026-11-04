Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759461;
	b=XjW9rJ2K9K8qUcbsgFXPoyzEw2COV5t2pUNTSujugUceZPU+Gn16DBmC24jyEVHJrbDu
	 IoqZj77o4PUXSe4LBmBAMe8Dc9yVucRLjH4ZYiHGr0fcydhEZJeIAuO/MiDf4R+3pCxU5
	 G/WurSz3He9Z56KYkosUnqHQTzG4AliAearjW8SWQUod/oMxBAdGyo3Vw/6TSoIpssT46
	 eYx7wCJLwsCIDPOe2a4mxAEQRaKFbAi4qHPKOYH1ETuThSGABxZqinCGVWwDP+uHo5rfl
	 k3t2TWLszj55puq6/omZBpRT7QBgaPUfoTCoJKbXRSE7y70BnSSY74o11e6yC367nNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759461;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z7/ps3iP+ijUEG91mvPexRZvYIkPwlmtI+2G3z8rjh0=;
	b=p+dYnQlaRC7P4xCjIH7TVR5g31u51LPDWR8bFMUFomnJtfzfFr2iW5zaXoNFS+OVNl7y
	 V2Mr+elFioNw5F6wf8OuQfmHNvoXnh42zpjf2h2VeyTESAoczxVKR3Lwfp6dZlpShBcyh
	 WbgSV5/ysxC1DVQ/1rLTILsfancZ/xxPoZpV2p9sVGfxfvq8QHfyiCANgvW6msdbWF6ks
	 vdMaZIaLwxeGzZm+LH/m6tQG1LwojP+xSIGx9EDQiw6Ulwz1fOD9Yim/owY1KRQFt4Ky7
	 gB7nV/sCgz1Jm9ORyxMtpq9OutclUycdmey+4ifTHLmwiz/HqIZGZYelyK7NzLKywbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0p14U8a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6B3606A329
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e0p14U8a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E641A1F000C1;
	Wed,  4 Nov 2026 02:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759461;
	bh=Z7/ps3iP+ijUEG91mvPexRZvYIkPwlmtI+2G3z8rjh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e0p14U8aILsIVLhl4M87KUihRB5JLfS08Njpg4a8ngi+IEKT1+9muj4ZxtKvbmAhD
	 bTcn5hdnyoAZNeUi94+CJSdvD8rVEc3HDQ+aepfpaMiFP5Kq8CVyVERqIksjEA5diS
	 3fzXyuPX6FcS2qmjmNczTHDcb5XnstObKuZi2szffjagGUUP7bayroY6tUcnWaPr5I
	 aqP1ns66CLfuu/vIy4ghXx4SDZwjVA83uuSRzS6ckr965Z/MBMokEcMiKWpHzKKqF/
	 S4bCweE4eBYeHvdySHFFO4srGFUAMl/T9qojWK7VCiFvliq2jh2uEpeEs6P4ruoAF6
	 8ny/TYvszZ6Rg==
Message-ID: <sashiko-outbox-196477@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: hd3ss3220: put the role switch on the VBUS
 and ID error paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021542.1468818-1-vulab@iscas.ac.cn>
References: <20261104021542.1468818-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:31:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> hd3ss3220_probe() takes a reference to the USB role switch and then gets
> the VBUS regulator, the ID GPIO and the ID interrupt.  The error paths
> of those acquisitions jump to err_put_fwnode, which only drops the
> connector fwnode reference and never calls usb_role_switch_put(), so the
> role switch reference is leaked whenever one of them fails.
>=20
> Jump to err_put_role instead; it drops the role switch and falls through
> to the fwnode cleanup.
>=20
> Fixes: f8d2bf7c0c5d ("usb: typec: hd3ss3220: Enable VBUS based on ID pin =
state")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021542.1468=
818-1-vulab@iscas.ac.cn?part=3D1

