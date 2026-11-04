Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759938;
	b=Hh9YvrZQWrYyVPUvF7xA7wiaDcr5YCkJ4CJkgppOUGHQuX7mpVo39m2xB9zDGNY3cyOA
	 ixblF1QTAWetsTSIf9ivbOK02ZHc3hZ/EHQ+5sNTKEeAX07ZQiAnW49jMlLLxMSRhelWF
	 Tl9rVARhCN2hRRsaXKKwE0zJppPXAP0oSv7HqGcTBk0sLhLga1TtrKx7JflpRaL97ZN3i
	 nxWM2lMHJ92bY4FGQTKsSlob7aOoSIE7GYu5uvZ5OZlnGfclAhEoZjbeRcunEo5cujjGH
	 W8tFJB6IiiTSMIGbfSJGivUXLUUlSLIGMiuTgCNm0aaP1jjbgEk6DGCbvX9r5D+9Ssw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759938;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/fG6MD5OyC4wlFx8mx13CLz8G0gzxAKLnxWZf3YSK/Q=;
	b=ByPFpApQVUNvrl9QE/xNEWSts+hir2uLBy0nEF7WIikynFALMytI4mBiy172dDz0U7iF
	 XqXsBdeJaIgq65+yfcJ/n/Gd5OUq8ypxf9L/xnEAQ8IckLxW2y73dArCEeAs/5v/oMSg/
	 M/K2fmFoAVOPPv2bBiBnioxWM+4xg3/lLvDkc7MG+rVYvZqAJSMMdAYsQ7Hb57USdj+Rh
	 hbW1CrpzLY9KqX4m9Ygt2qj7EZNNzQXwVXjOuHUxKfzI59WyOFuqCh0cj0IuB0ihHxemO
	 WUxdE7mh9kxScoKJ+HlWGUs38nlNVyj45iIu2YuGC013DQ8DzlAE1cbYPATzI/riNpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlS2LKS0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00809606A31B
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mlS2LKS0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 655FE1F000C1;
	Wed,  4 Nov 2026 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759937;
	bh=/fG6MD5OyC4wlFx8mx13CLz8G0gzxAKLnxWZf3YSK/Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlS2LKS0mEJs5wKZjV1zY8YlXLeFGH+7GfTBEKguCd5M2blqnW7I1lyAMfsSLn9Wp
	 7+W9IiJgzO0hQoEo02hj17RVpldmvF/mCsn+EQpwqYZtFP6B2szm7mx2yvg4eE9gFz
	 OSisoXQcfXoLDPV1fWLmNbgllJ3G9hl7j6QJcCpk8/8Tz6VeQq06GOOEfPUJiE+S7V
	 JpJklgQZznx7HQA+0vKUNlWmx6NGDlJesEy3WFyofvDt1qeMH+/22aiGO20+QqVLZN
	 nR/vYLf9XMeG0x+DtQDXb8cO11evCuBq3BpGUiMjv/YxZMoxXlEgnxKWWyQnEs4nfz
	 4dMON14QujGog==
Message-ID: <sashiko-outbox-196508@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: drop streaming header reference on
 the EBUSY path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021506.1468539-1-vulab@iscas.ac.cn>
References: <20261104021506.1468539-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:38:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> config_group_find_item() returns the "h" item with a reference held.  On
> success the reference is transferred to uvc->header and released by
> uvc_free().  When the streaming header is not linked, uvc_alloc() frees
> the function without releasing that reference.
>=20
> Drop it before freeing the function.
>=20
> Fixes: f1fd91a0924b ("usb: gadget: webcam: Make g_webcam loadable again")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021506.1468=
539-1-vulab@iscas.ac.cn?part=3D1

