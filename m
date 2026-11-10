Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794353406;
	b=HMRJZy+9preE/KRQFEpYZq8RTBOu/WLusiCNWGrB4EOHP2ntTvYB+qB1tXQPb1kRbZM6
	 2n7HVQTHb3dvUmAKLyIbtwaJWrX61ZgljkXfr8swXIimgsQyqrI5uGIXE6Yx8g8EzdEg4
	 MxhRLVuBYdRmklpRByTKgjTq0D5Ixayjp+n+JVl8FIm9msLWN0Kx5h803Vd6IHw+Qrosg
	 DYf6qK8glhtNmsRbTAVx6lAbdvuM/vycuwPQzsf1qN89a3qipzDpjZOevScUwjDzvcxMU
	 ZsTw+L++F5pvj3l8xI5tupIoNYUPrDkmxxNvfvJ8r8qunR+Ov8rxs53zbgsTulSjMyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353406;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=s8xtLW2bb2upgUr4D+J46HuPdMl/kPv6A5zE0DUymTU=;
	b=QNNThMbnXdsy1DKUvtr68v+o1NXKlAI4P4WY8KfnF+BLZDtQOkwp83eyImABzV875iCo
	 c43ItJTlPqxN4QWlO4fb8FWHUEhXvfr0HRApnKQ0q3GucdnfQTNkgbh/iwR0ubiZOMVl4
	 mGeb1MQdnLV6AVpcpvLkF1g+oLbUudBK3ZQxnSrknaXvghLb5l4tvvj0TP/sxVaJ+CKUC
	 ylZafosWsr+zYAKGKni7MRSs2gN8iT2VJzQ4d0KnMLtyjuzG8U5gDtb7nPX/w4MktUgf1
	 1YdEPqS7BE1RiKYdePJfFn0k8HhTyBZm/OwQiwvjIRjSImSBeRtXYb23fT0De0OuSEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WdPnEBpQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E28606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 23:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WdPnEBpQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40FCF1F0093C;
	Tue, 10 Nov 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794353406;
	bh=s8xtLW2bb2upgUr4D+J46HuPdMl/kPv6A5zE0DUymTU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WdPnEBpQwVX3PqxDMbuf3lpfQDYvouKrENYo4IlYKMIvMlUcCoSJQVyf4GvB/AiEq
	 Z5EB5Uw4t0kF/i3VOkdVsmK2odUmu21BKx0Oyk03r9MCKszbWYTcdu5W/QQIig82HK
	 CO8bWwF+SjM6N+XHTzQUUCa9zzrfEoc32Sd9eE2Hrc4jKahEyyDgXGiUcsliFu3XSV
	 Zd4o28Z3SlwmF5MI63LTuaCpl8llebY1LNQP1eY0EINuQkldfT7dAvT3dKZtkNYo3t
	 S1gos5xwW91V7vYxtQFiSQNUQvfylwGHgSVLr8KQ7d2gzshbOJWSiRt8vaUOv9+5rV
	 4Z7MjEfWy2Nig==
Message-ID: <sashiko-outbox-207916@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/22] usb: class: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110075825.24946-5-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-5-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 23:30:05 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110075825.2494=
6-1-shishunbo@cmss.chinamobile.com?part=3D4

