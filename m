Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093158;
	b=etSNlE8ZRvBS/R/tlS3tlK+ADgSfPM5aSvPB+kHDq/WN0evfmhe6b3MjSEIhRWxZ6cPu
	 vHVt8HiF1BE8l41xTXrPitfJM22yh6tdPvdocEzM6/WSvMKv+mxOjDuUbhU2TKGuLoyjJ
	 j+MC70ttslH9lct2kvUmCv0VEs78rBIcIY7WVfC4PpxSoaY5WetYsfOU1psEpX9ipDvK0
	 4aYd+J4y+k80IMFhyjdqBW0rua3us0+/SvT2lccm8RFbtph7kpyGI6run3eFv5eT3qwli
	 /FEeECMt7YQG7feSN0M2Sp6W1JrMVnVvGVKBYaI43gRC6/00yeOeIMvXS4DSZhDh95A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=flKdD6AS2NS+3ZvE5aY6U9jNnV3xfqfpICJsLJ7QBgk=;
	b=TtQyxBYjiVZcbxiYnS0zpLZf/D1QO00eg1HsSmDe61w0Jyz4f6xSgasRTWD+xvUNx6am
	 nHlQ56yTtRE2NpTfFYKXQzfvVBKX+iRgpPNfpCpJjk5DMVOfNLiriSGpnootHLjIgKV3S
	 S6ApEQ7p53uKdoXZIRxadIDLx8U7MV1ZQQXl3D1hWO3AumVTAcjVS8rB5dQXZa7WOVjig
	 5potKrRuyQdbs2QIWMC8YU9zy/+gLR8janHaRk5OFYRUDtDnZ5zUQEAIS/7SAublZbD6A
	 ARkB+SeGPjheX0bUMoUxHoBbghV7zF/DqICplmLR8l455/Bt/wtcuXk8wZNpa49Lvvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQPfhC0I;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23378606A322
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PQPfhC0I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89AD81F01825;
	Tue, 27 Oct 2026 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093157;
	bh=flKdD6AS2NS+3ZvE5aY6U9jNnV3xfqfpICJsLJ7QBgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PQPfhC0IfkqRroOyoTZ+7whjor/z5/EOV1UlcxafKRhFsA8Ogfm8swaZNGA5F84fK
	 0jkzK5wQ+C1vNbSbg1tNj7tlXfnIHwCJY/gayBi9s+6ZJwM1hB/CaoWaII9WcvJ8ns
	 TfdRCi0/mtQ7wJWVKROQclcSYNSeZgpgKDHqo6wvDoEmmy/xZvA5ULUxxvles5P2Tp
	 BlhHN8Tqz1gY1njOHNLw1M4xSwWfNrH5vVCkqM/lw8NPwKLhEz4pbzxl/FR4e45Ni1
	 ezEA1A16JQ5BVfzvlfgIYXUUzzyFd7bvD1ENii49fo+g+7JNFVQRyRKzHtSZRPU+Q/
	 xhW5Ck1/9SXUw==
Message-ID: <sashiko-outbox-186323@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] USB: ohci-spear: check clk_prepare_enable in probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tang Bin" <tangbin@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261027092354.1761-1-tangbin@cmss.chinamobile.com>
References: <2026102645-dinginess-vowed-0d5c@gregkh>
 <20261027092354.1761-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 09:25:57 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> spear_ohci_hcd_drv_probe() ignored the return of
> clk_prepare_enable(sohci_p->clk). On failure usb_add_hcd() runs unclocked
> and the error path clk_disable_unprepare() would unbalance the count. Che=
ck
> the return and bail to err_put_hcd on failure.
>=20
> Fixes: 1cc6ac59ffaa ("USB: OHCI: make ohci-spear a separate driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027092354.1761=
-1-tangbin@cmss.chinamobile.com?part=3D1

