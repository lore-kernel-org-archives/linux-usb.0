Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564315;
	b=5aYLxXC1W6ihLFrXBg/0E4iU9Ip+05vhzQPmpjOeHrPkfx6s+JCgkFMJD9PoYxV2aJr2
	 zcTOChoexHJmyadGQeUrjfBqHLl6c/yNrS2ZEnd3OH9jzX61wCszg/iQsUJGUfmuWv+I7
	 FldY2d05p6G0wLgQjXfK6PSEJa+NO4jntKdUBY6Ij5qIgOFGOab0Z5J06fLNUrat7lPJJ
	 eD9rUI1r+jS+p5Iu3TgrFcpvYvFBt0kqtU1vZ+BiaT2ceao1ZlEKcgj+i0DJs3oEN5Y4I
	 I8ZMry1CuuouzdFvXpx3AdhMuGGS4LmM8Dv0Cy46LIiRjZ8WTkQO+wbMtMU6TR1VD6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564315;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LuGF7X4bfvQtEEypFORRTCMyfrlTutXMMNPhagW6Xc8=;
	b=JqHA42McZbU/fX94n0O/urM410goS7K0biO759gcfYpyukJnY/kmD2vpFwbpXg2d/Lpi
	 FsohmJywczsUooxY3ZZMK1mi34yUetTm2E4ilLficJHFd6igIvkrgd1JZDsMO/qdYm5i4
	 SpadaD67Vr2ru7tY6BLYCpnN0kST5DajsoPbIw9pKZozMYe6OJMmTGjlsbljym4avKHdk
	 yAWZHfa4/LfJAFQjE5uk+wsKK5TgjmPNQmsMaIdEkVoj3AUdxmlT5auPZSrVejKoe77rE
	 wm4dFFjlChQfoivAghaHMCdpvMqU+5AAICNn1iG4oOcmfPDeBmW1UGEjibO/zkQ+x0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SO6vEp1h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDA4606A323
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SO6vEp1h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A8B1F000C5;
	Fri, 13 Nov 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564315;
	bh=LuGF7X4bfvQtEEypFORRTCMyfrlTutXMMNPhagW6Xc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SO6vEp1h5TYhWeZ0HA+4iCB/8KmxTSDQsjdC8GMDl1A3mJXtI9fBcRZT0myHqxOvZ
	 3Y8QKSd/7W9lu0Bk037BqvjFhIXscnq5j0/RToTUvnfE1dFUAKIkX7jl7O+/FDZroy
	 sUnAKf+Ku0ogjA0ErpLZ35rri8k7e2bjg01Wx84lsxzrN+Pf89osKdT0XroOWQPWuh
	 Pelt19q3gLa9yhSwvIqPS3fxuAiD/THtzE9w8Pk46OpARXXzqavKZ79zJV9hUz5JDC
	 nRnfGc1k2B+dKkPQs7zJet5WZ4oSX/2T+YuEyP0vFv56qJfLU0JROeGxDp2Z7+gd8F
	 g4RkbgxDO0GVw==
Message-ID: <sashiko-outbox-212600@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: usb: ux500: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113-ux500-musb-bindings-v1-1-553aa97c5c95@kernel.org>
References: <20261113-ux500-musb-bindings-v1-1-553aa97c5c95@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 10:05:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Convert the Ux500 MUSB text binding to DT schema. Describe the APB
> clock and the existing ordered DMA endpoint channels, and reference
> the common dual-role USB properties.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-ux500-musb=
-bindings-v1-1-553aa97c5c95@kernel.org?part=3D1

