Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843377;
	b=L9ISgjN8E7ftgfbOJwDASCIc1T0TtN4ilz/ueGLGNuoHNW+d8S9XLIF1iooO/1Jhr7hQ
	 g5a4qKoYLUL4X1fmaHvI9EsuYXrkqXbFkQ3vybbgXP8/GtxXA7AjMaI6N0wJgrzMLQ9pd
	 R1Uojn3xHnDGjfH+eXOufQ43RHv6Pt6AIHSw8mBdspPdS30G65rWdv9AH0Wa7OcqMVIOy
	 VytQy1PX7mGFn4SG4jYJwrqyeuDW6uZw51bqU+z9tcsoWPZYZ+uSsh5NhyJ8gj1GrBrsV
	 RDCu5e/xVl0ivMGvrjviNnTip2nnYOG/2qtUm4LtlYA4xzP73742nEYcW1JuIq/Xt4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843377;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a8xZJGdGeYzR1RVVngb26oD9dMxyX4n64NwnP3aKXUE=;
	b=hvj7URjR9e08dX/rN/jDrQeCtW24VksblFXlXVuikCJDeYSPZ1bIUymtRcwfqmeqIRuI
	 fyO/PGMJk14c/DX2RfiyiQbfkRBC9qDf1wDqudqsdLLG4490rpdEzLnYSBv5pFUkPodRh
	 UxRlV/gfq1eTXDCUJC0/Rjr55NpLNRBpYJGrULEEkXnzvIO0f/HYgZRyS+X/E+Fc3JUJe
	 SDwg3HhLSuIrKsp4t9hjP/wgoJ9ye5FgyyBF4CwnOQNLnzKP1fQT7ahTqe4u/HeG8o0/L
	 bwxM6pX7a4P9XNkiymz90MnwP6Y+FaHZ0bShru+tUtudcCjck43htSJ/HESF+7ahs1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvPOFv3Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187B606A331
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FvPOFv3Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE811F000C4;
	Mon, 16 Nov 2026 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794843377;
	bh=a8xZJGdGeYzR1RVVngb26oD9dMxyX4n64NwnP3aKXUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FvPOFv3ZQQTqQ9gXn1/vH0zEJVjKjb61GFe8KEKLBdCBZtZiWCxIC49k4NISyI0P8
	 fRGbW56vTAlfzM4AAShwn1OVcHibLTguD+enJZiAqi90fbYvfeM6pfZdjRKoHnmMur
	 e9Ii5EmmFOLZbHWqsj5zFolNsy1QBz7yMD59/NnzMOkJo8iJaNtTB6yfu7qg4/tQ4P
	 0+3bArWRQLnF3gEWqNFLn3XnKCJjPEp5leB33grLzqIQiSDakgxmgvD2+XkXR0s05T
	 mju39d2XaXDp0PgSe7IwxyeQ+RwDsYjECwY0zN9R59wvutd+oUEqGjX5OH8XWzLbOm
	 JyrQChFEupJuQ==
Message-ID: <sashiko-outbox-217301@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/12] usb: gadget: tegra-xudc: Preserve runtime PM
 across system suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261116-tegra-usb-v2-8-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
 <20261116-tegra-usb-v2-8-42efc03a9700@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 15:36:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The system suspend callback leaves an already runtime-suspended
> controller alone, but the system resume callback unconditionally
> activates it. This enables clocks and regulators while runtime PM still
> considers the device suspended. A subsequent runtime resume activates
> the controller again, unbalancing the clock and regulator enable counts.
>=20
> Only activate the controller during system resume if it is not runtime
> suspended. Enable runtime PM before scheduling USB role work so that the
> worker can resume the controller when entering device mode.
>=20
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device m=
ode controller")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-tegra-usb-=
v2-0-42efc03a9700@nvidia.com?part=3D8

