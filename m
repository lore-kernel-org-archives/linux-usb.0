Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580116;
	b=ppA1q6BEPj29ye36kURE8unc41nTAjJncUai/ub0RmY01Mt3JXISfWpMin0H/xx5HIIr
	 atBGgIpIsw5naVSRSFa86TBv0qywOXYBjTTnOLjfrCYeaaGjs5dY6Co9l23B1Qc+Oo7bL
	 pvNMHaxMmZnJqYz8tzKT1wWaBroT+nIUdzAVQR1PQjeVLx9sT9uJiv73ZCcDpfOqATgRU
	 aod1e2ql/+EjSzUBoAPNE4nIlqz+qMFyh0olwE8jxaNL5qSVj9K+FMf+/CV+kqLNpY1TV
	 spicD6U83TaUrNRrC/m1gfDKnUW7Z4Rq0SGNZofgFyVdLL7qJ0J+ZrtwlcjMyJ5JpjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580116;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hF32qtCchtTzYpixu57yX9sCE9i7P5aABs7kAPArZlU=;
	b=oeVng73lZxAr3RmBF1Iu4I+nEVjox80J7kX+JA6Dp4PHmB4rVMfOgcHwLekSiV0tJ3KX
	 LjS9FS16yhnKKLHIKktJ5aIkMwHhMe03DJmNvzSLtwIlrjQaTJxzMwYyeoSMWYUOATSgx
	 Pi0PU4fIqwr9qhECucoz7uetwopjVg5Kv7yG8G2/OvXfRQCbWYNcsEvKUBDKgMWMltiLL
	 xLDu5Qiwwbjpq1GMk3yF4FIDzgvrNpdfLLOrobegKnB124baAwHgVdT5K7bMB97M8ACsZ
	 4E0bH2UPoXNrjL3EhKfUcxHV7ufDcLSiAeOF6V5YBwdqyKmfrhNChQdIfd1V8NChEOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZMori7l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1028D606A324
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 00:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bZMori7l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FA51F000C1;
	Mon,  2 Nov 2026 00:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793580115;
	bh=hF32qtCchtTzYpixu57yX9sCE9i7P5aABs7kAPArZlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZMori7lPoEs0iHFwX6b/E06LG9PzvWdKz03jzhoRPrGpnWHM9Ig6qh9i/FYin9CD
	 ZQIgCIJnd5LeBY/JCHAxrGq/iZebJf+Co1QdSQj1CsY32vJT/U7NVfZkn4k8g8De1a
	 DS1HIGgsaksM48EmIg6Rj09ULmiKNZK41oVEYsSXd5BNVxXUVZaGuQ4+vxkAgp49Ks
	 XUVLGvIF4C5fr45sWZ65Zu9x4aLgXvWE35syQJqz4mHurA+ik3L5i22H7eYyNZyyP5
	 qg8EBo6aj90tKRgeiausuBEeOqbG1ntbWhHZrCWQMmOhwahoqZV/ZBwIgvv2hUfYqL
	 gGnQTWG74ph3Q==
Message-ID: <sashiko-outbox-192794@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: Fix printing of a fwnode with %pOFn
Reply-To: sashiko-reviews@lists.linux.dev
To: "Asdlerto Korry" <korryasdlerto@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261102003508.341309-1-korryasdlerto@gmail.com>
References: <20261102003508.341309-1-korryasdlerto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 00:41:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ucsi_glink and ucsi_huawei_gaokun walk the connector nodes with
> device_for_each_child_node(), which yields a struct fwnode_handle, but
> print it with %pOFn, which expects a struct device_node. vsprintf then
> treats the fwnode_handle as a device_node and calls fwnode_get_name()
> on a pointer into the middle of it, so the "missing reg property" error
> path oopses instead of printing the message (seen with the same code in
> pmic_glink_altmode on a Samsung Galaxy M52 5G).
>=20
> Use %pfwP, the specifier for the name of a fwnode.
>=20
> Fixes: c6165ed2f425 ("usb: ucsi: glink: use the connector orientation GPI=
O to provide switch events")
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi dri=
ver")
> Signed-off-by: Asdlerto Korry <korryasdlerto@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102003508.3413=
09-1-korryasdlerto@gmail.com?part=3D1

