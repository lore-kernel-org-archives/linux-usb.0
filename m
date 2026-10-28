Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194254;
	b=va3JLbqBSuUlUvy1UTvkFQbcYZLo+/K4nJEEXNdZwhKc/wd2HNVNh5lqU5RJN6zaA8vE
	 hCw76XWRrGX0jUO6CbxDaHsoENtcT1QUrT80qjHXAdDnHyVTJAsyLZWoFtJ/AbWZMzRwj
	 Uw1LsJHUPTV8gsUQTN0LbsOxYcEjO18rJlaa2dVj6TJGQmwj7+wtUvBjTB5lTbmg+VNYw
	 Djgkdk1saiWPP6DAYobutszaJSz5rzu8bFW+u0t1rEU1LKr1XyjdK7Vy2boRPbYpZqHC0
	 AHWhhIsoxEY4fYQV01+u60BFuMo8wqoNcn60Kxrfifb2yoiuy5etBlO/qupLbeNKmvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194254;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZVpkOz/kzw8EH2VxQkMW+p3QlcmfyMtQnfiR6Nh28rU=;
	b=fr3AImLXFTdvL/0J/bFldYsAy5pFjAjrEowNW/GtzLOJ3MN3q372B5+lWJa2hKylDMlz
	 fhpKfc6yLR23Kk/+LJnZg+B5nJtpHjf7VzB9W5AYN9Jr30ACGW5lYAN4kgpaJiXtOXkan
	 VRjfUqNyyGp+zJnSDbRbt6DruKuED5ZeZPaL6b8w8WaSDdHOTItK2mQp5p6Az8pogZ0+m
	 8hxlWygEWL6WoJchd66CB/PtM75ndwdo+6ONQ43MGNMz5XdhOhLotuGdAuGc5dlVgE7wi
	 z5LRwq3REd+Olrc++7NEMYFT7BGFDK/UmGW4bwal8er3lF2fMlspMWv+uHmAr/JVbDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw+3nm7L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F5606A320
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 13:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qw+3nm7L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B28B21F01828;
	Wed, 28 Oct 2026 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194253;
	bh=ZVpkOz/kzw8EH2VxQkMW+p3QlcmfyMtQnfiR6Nh28rU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qw+3nm7LonQRaNlcJ/AbgI0w1Ux+RsLS89N8m2XDdf+CUF8oiETFqayFMB9D7+GfU
	 BdSl7f/bRVzrmKz33wavqq5oylC/CjGt3k1fJnUIn/JqOrR4F6BweFo2MPZQdjF9vK
	 2jVz3aWB2upSnivkqrXoVER5oqjCTdT00haYCPZWJ7ierhHccnMSnetz265+OY4fHq
	 lTuBctFdEv4TVuN9nCKD2lr+EKflb/3qhdVPM2e2u/GjUJMdNGUn783+S7EcxAve93
	 S1uqR6qPC0iTQwmGdC1sQXzhCo+9Xd2KTx7E+SaWZsv9rjWokISuxJB9owqWineiiS
	 iFikD9zXyoVBg==
Message-ID: <sashiko-outbox-187919@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: musb: musb_dsps: Wait for controller reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028-patch-ektor5-dm8168-usb-v2-1-c2af306eb228@linaro.org>
References: <20261028-patch-ektor5-dm8168-usb-v2-1-c2af306eb228@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 13:30:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>=20
> After soft resetting the USB controller wait for it to complete and then
> set the mode of the controller. This ensures that the controller is in a
> sane state. The timeout value used is just large as the board is likely
> broken if it is ever reached so no need to optimise. It was tested with
> a timeout of 500us which worked so gave it a 10x safety margin and used
> 5000us as the timeout value. If the reset times out let it cleanup on
> error path exit to prevent leaks.
>=20
> Fixes: 9ecb887522a0 ("usb: musb: Add support for ti81xx platform")
> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-patch-ekto=
r5-dm8168-usb-v2-1-c2af306eb228@linaro.org?part=3D1

