Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965678;
	b=Que4Axsj1YxQF/NgjfyDGDL1h9GvBgR2oqblE44n8/JgQbgaY0xH0+lqi7GgXxnoCcw+
	 7tCznUdT4YMU5czI7QL0UT+7OWBhi8QEf6UP4e4VKTwEVAD2l76oCY8Sc6zptnpIrnHf/
	 WoUYaAVQAxox2jT7u3ECpA19koZF8lhFhbd79xl2g7HrObVn7ZQ1m6f+0iG8IP7J20zDI
	 4e+Riu5hnxdWQnjffMHMyf6kMcQDg4SAW8OFYwWe+Shq5AXL3BpnuIrsGkSweRXB9/+1y
	 Fcowz/aXv58hAzDY/FETIEwnD8FDhJ1FR4hhqMo0GN1sVHZmUmI1zitc+hIXAn7q6mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965678;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WtmTmaPf+k8Tq7TJAM8UPOtbwVtt9Mc+F4Epf05rY+0=;
	b=4FjJD/8icsSjbB9wfOMhH605Rsj26a7iUcoZE3aW04SoCibxGjSN7k3ecz6xwHUANhQu
	 y1IGz1oyyvQAjvaTts1IfgoluWjT6GtrTOzjKPQ6baFwf+PrCJVWJsy2IH8xkO6eYw1T/
	 XiTHe2hqW93MK/SnSgx2LFCRbNIBkSNXnG+vng956yFNKZ/JbfWy0V5YJUMhG9oLAoGWA
	 awS5w4NjneLPSc37QEm5OLcI6VCVTOAHvgE9ncNl5IpBsfe648QHNGJiJ2gpFBx5378Wp
	 6OLfp7CXNZfHlM3hH+PERbdMS2o9G6V1cyqEhUvV3Fi6QaLhpfodje4yqdeAOi0XdUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOrH1h+o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0583606A337
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOrH1h+o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6242B1F008A1;
	Fri,  6 Nov 2026 11:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793965677;
	bh=WtmTmaPf+k8Tq7TJAM8UPOtbwVtt9Mc+F4Epf05rY+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XOrH1h+o3TFk6o/vzrXgQG3kPjnkGJeCn3Wb7lr0bL7RrMEGmNX6QpmTfUCmlApzm
	 0Zm/1mQhxoLnHnYt97HyDwvnKpDpRe9trUvqFJHxkygPf07XrI/WMKBO4UuPpxqWyk
	 RuXsSkW29+du2M3S/nwOBhcZDZaDhitpMqH7whJzecZa/f8yaJzkt32Hzk+taViOTz
	 HpfnV7naoMlox5ZE4muOCwROXWMwYFRA/J5a6WYFZ63jsm/06HCGxxAbAsLa8Ste4b
	 SV0X4qxu2lv2lDMR5cLXQem6p8157X171q0+yKWoCotJ7LCk7Kz1g2JdX7CL1/da3M
	 cbbhHDukmnPwA==
Message-ID: <sashiko-outbox-201358@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] usb: roles: look up role switches attached to a
 graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106114208.987284-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261106114208.987284-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261106114208.987284-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 11:47:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
> on the caller's parent device node or through device_connection.  That do=
es
> not work when one controller exposes a role switch per connector endpoint:
> the switch is registered against the remote graph endpoint and the
> consumer, the connector, has no phandle to it.
>=20
> Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
> endpoints and matches a switch registered on the remote endpoint, and try
> it after the existing parent lookup.  A switch that is described by the
> graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
> the role-switch API does, so the caller retries instead of concluding that
> the connector has no role switch at all.  There is no behaviour change for
> existing users: if nothing is registered against an endpoint the lookup
> falls through to the previous paths.
>=20
> This is needed by DWC3 designs where two Type-C receptacles share one High
> Speed data bus.
>=20
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106114208.9872=
84-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2

