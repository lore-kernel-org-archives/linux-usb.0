Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385786;
	b=buxrsD7roehZ6Atk1kZYkHSRht5BUtoiPzqTvr7fV63HtylbKECAatBj15EUAm6gpqV6
	 raKsDMlSBzt06BZtJtUm9qb3JQJIe/MeJvbEGdbwNVFy9ySWf0kGacYcBIlmCEsLN46Lh
	 E862+WkxthkCoPcTceRz/umt6N+7Sr/JolFGqCVl6SB53PRRBlK2cK6Jvesis6YMn2haB
	 LIo8SPNuwwz4sOzNlJna5nkibkYldboGgcHft2tEIrsKO9lA+2o0/1R5Peu6r8PCmiyy9
	 0kwJ1RCkimmNpFlPbbRjvEvI2ua/wFTiCBkR6BsQhVyinwHhbpNyOyINQAdRFw/c7aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385786;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+QljOG8sa5oRUR6fHwqBTQNEL7Yfaos1wjhyVRTQFAk=;
	b=u2RaorbcqYVXfJ5dEZGmwL9nwlZHtVrPEdJvcxT2MKF1cLIVdZARrjufgDBbdO4iB347
	 Y8gZ7JxsskqybHATa3oq1SPRvyQrV4jvt3QG7RwJKHqhGSjrgvhaM0hfc/gpe2d0N9fy6
	 vsp3JxtvM9m9QszfWPkKnmfnshtMjy2gnktjwjhx38sc+3OvjmBEvp1eUgGSJ5TaYGvhK
	 XBagqJj8LhWn2c5CrjgoxzWGxVsCW8zrJ4ytoSS6d7iYySw6lW1JAmFPH1qE0WcRA/s0R
	 XUWaBA0BDDAfXaSiBHvbTL697INH4FsVogWrbDZuVC6waIiPGHPJ5LLHC3VQWhRqtGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2jW2mg1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D710C606A326
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 08:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U2jW2mg1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426BE1F00A05;
	Wed, 11 Nov 2026 08:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794385786;
	bh=+QljOG8sa5oRUR6fHwqBTQNEL7Yfaos1wjhyVRTQFAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U2jW2mg1s+yozvuK0h29flhKY+qVlxK89QZup5ElZGhHVc0kHfRI0S7z9s4f7AvHb
	 Pr2KO2ZfhWb7qD8W3SpXMCQunlFXTOS/PDXo1/ctPkYqnxuvnFYPoBOgAKoA2zUv0Q
	 P+hKPnqGeETbYEN4wopzOdCB4m1ZbBvQJ9tmnB2pfGuQdbChzlYZdqU0t4EIpQEfJb
	 JTkDO2l+pUyAGgtdXqYYpWMCXrPnO/es2MRJGE6wI5MkVG5nqYUCeBs/Zh8VKWjK22
	 IFITOLhHVAj620QgQKrQ+pmCSw5VhebrWfTzCgHK2fh11AM9uYMRV2bow/PPZzNA3U
	 1txvzgL/Yfdpw==
Message-ID: <sashiko-outbox-208604@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: dwc2: Add Siflower SF19A2890
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111-sf19a2890-dwc2-v2-1-cba9dd4a4256@telaak.dev>
References: <20261111-sf19a2890-dwc2-v2-0-cba9dd4a4256@telaak.dev>
 <20261111-sf19a2890-dwc2-v2-1-cba9dd4a4256@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 08:29:45 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Joseph Telaak <joseph@telaak.dev>
>=20
> The Siflower SF19A2890 has a DWC OTG 3.30a controller, with its own
> bus burst limit and an OTG interrupt quirk.
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-sf19a2890-=
dwc2-v2-0-cba9dd4a4256@telaak.dev?part=3D1

