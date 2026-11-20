Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155991;
	b=IfYP4jf6CfhFkB9u3iK9nqYLht+qrnFrlA/DQD3mYghj4xg7au3cCL263kM2cxU+z7iX
	 UQlmiJn8DXV9t4RfL17StpXXQ7C42owdJC1I7Cwv/T+7Kx5jfuQQ/hIrjMcpzkSJmYDeR
	 pIDFSrEXSS45bfGkjfSX3VmBevAZ2RHgzP92jqZqtoWb/+3qyiSlf4XPB4ErnqaXtsEiq
	 TKknhXuv7c8+64280j65vnwJtRhQpEqI+ml6DWMSx3AmZ4yvENBPxVfX0liw4f8ZAWKmR
	 hAzZPhtC+EcOj6AHmMyHXQKX2i/TIWB2d/PDBnJXfDDGc9C9tcP1VVvpIP0UY8ver4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155991;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MExsVOZpNays3ap7WGjTsxcU4VV+8DK23sSEqIkYhT4=;
	b=Hrrl+mHit69krukNb8I/TDwmmmvZVzdA+xYi8ZfIMYjVXIUYfSXpxL1dPI35MtJED366
	 Mq4MWMEPv7TbBdne0JUnuoIWj+7ulH/lJCSpDIIUWgAxXZy34yh653eOmRy4rzXj28SfY
	 ix01W1VvYyyB59pgRUe/KJDyIfKIqDpj5q3OTI0wlI902ota3P5NjjBTdiCJAlsSdfMAz
	 uYrh76LpoBe0ljRZbO4ByqYeQfKsgejX7rA3Nf/v7QHs+P5E0Lvz10QfMgy93Cw6oZinQ
	 NWiGJTMTbmlwgNEfpPKVNaGRKanX0MCenGMrobynx+VyxZUuKXuF8m9c4A0P6Us4cKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m/uSLQSz";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C02606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m/uSLQSz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BD21F000CF;
	Fri, 20 Nov 2026 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795155990;
	bh=MExsVOZpNays3ap7WGjTsxcU4VV+8DK23sSEqIkYhT4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/uSLQSzfJfBz2tY0vK2gnuVyeRN+us77dHgLscJeDRhkf34GFCM+sVp/lF96YIVO
	 TXpZPUav6iV764UEhXOaqOzF5t+t6p/f46xRiIMGxM7utHYZ0ImKnHzMU4LKyrDWKP
	 M2GJLM5zBpwMeiT2MvjunLoeONiqlr4l5i96/8r6YMxh33VoxWlvWa8BZRzrO7H3QQ
	 x22Y7OfO3Ak8U7BC9tKoPiD3eF4W+AdC6zOJ2B3XTKIPrIn7LO2Smk9LkbSuI/gdO0
	 P/6+54mkl1psomeZ3Q4UjkNjmso6jOsUhWqiFf8cvmtVeDJQceuPwEcx7bl7V+ie0n
	 Y8nKOtfAbd1Pg==
Message-ID: <sashiko-outbox-224568@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usbip: tools: Check allocation of exported devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120062111.98404-1-zhujun2@cmss.chinamobile.com>
References: <20261120062111.98404-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:26:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> usbip_exported_device_new() dereferences edev immediately after calloc()
> without checking whether the allocation succeeded. An allocation failure
> therefore crashes the tool instead of allowing its caller to skip the
> device.
>=20
> Return NULL before accessing edev when calloc() fails.
>=20
> Fixes: 021aed845303 ("staging: usbip: userspace: migrate usbip_host_drive=
r to libudev")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120062111.9840=
4-1-zhujun2@cmss.chinamobile.com?part=3D1

