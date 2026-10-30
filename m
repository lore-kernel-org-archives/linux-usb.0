Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793344852;
	b=zv2ZE3SlZVYKhd4GKZ7VbbGI5XhGhKb93tpVamOlyXCD+KWkF7Ydyvgh6hmOooMGwgu+
	 +ZtR1t9vwuer2qNrl9MEaHEponLVZ8Goi4bJLj0vAevKOXxjsGEZy5zYpH33qo/WxIst1
	 Grg0SGlZwdIbytQ5NWOwXKBtRMKPzj7NhtXminJXMYYhxdvJm8yKlm1+qVxgjGRd+tr7Q
	 VlsACaneCbD6emKfl1AG72bSspmt8lmE21n6+VTKvv4nv9EXktixUjGzzjvIz6dnl2cDB
	 rQdqg0eVUc8T5dqJ0/Cw6lL/6oce6AFKMEFBblP8ow8jRSw3OqbwaF1Sp9m//az2lWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793344852;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CxydtI5klJ86AtMY5hGK8z+nYuMwz7WqwKiYErEFmnY=;
	b=PxicRqpuHZSfc7zHDrj033b5bKBHXrTyQa8c69w+53QHkqZvQK15jNV9of/1x45aUM3k
	 xxazBWWz29vWnE+sHmPrv2z6LPvb4NfrZ+Kyx+8z8BvlYxdsk2XBZVizoV8tM/kEvzqxw
	 lmSuPXNDvDH3wxcPc5nTjSFAFeZ8IPy4c9qYqPSAgARO/izrKb+p2r5SJySxrRqZnzmCs
	 zl5Quf8k0cfFBHXYDz02OyRViYL44GtEJRnO46gGUHQL+bqM3nIGZ+QpDx5vX18cwJJm4
	 ggY1LBEKeyCP1V/2Ire+mDvhXHXb0vH40z49wQwN1lmnF9XwW8v/gxIH409YmQdA74w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HFzjsc0i;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52CE606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HFzjsc0i
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB061F000C1;
	Fri, 30 Oct 2026 07:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793344851;
	bh=CxydtI5klJ86AtMY5hGK8z+nYuMwz7WqwKiYErEFmnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HFzjsc0iFDVHjrQONOwwDSbLpcZX1kNVvupvnvNaYY78IVnYX0ULP+nSqs4QYEWFh
	 SV7QrMJdj8jlnYky87SroGlK230y2/JmFS+I+/LMceo7tSzOcg7Ny+qStiyIR12uD6
	 dv5PPH1ZLh11KykGgu2TK4Zp4x1XamwJne4zuByUn94GDYn1XobdVEa9RuAhlKjEVO
	 rRgv4eY1+FibpCFZ1i9S6IRfcrEniCDnN7vzsOU1g9NcdRKi8zR0sibQa/pL4iCJ9M
	 iXZKC7TgX0fGgyv83PW0CSEy2uQ1Cg3QtHofQoqA+6bNxbEDKLbLq4WXIS1Ju6/yle
	 7lOQkNeMV5yww==
Message-ID: <sashiko-outbox-190636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: chipidea: otg: avoid workqueue resource leak if
 otg fsm init fail
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030072130.276679-1-xu.yang_2@oss.nxp.com>
References: <20261030072130.276679-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 07:20:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Xu Yang <xu.yang_2@nxp.com>
>=20
> If ci_hdrc_otg_fsm_init() fail, error propagates to ci_hdrc_probe(), which
> jumps to the deinit_gadget label, bypassing the deinit_otg label where the
> ci_otg_wq workqueue would normally be destroyed. Finally it cause resource
> leak on previous created workqueue.
>=20
> Fixes: 57677be5ef83 ("usb: chipidea: usb OTG fsm initialization.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030072130.2766=
79-1-xu.yang_2@oss.nxp.com?part=3D1

