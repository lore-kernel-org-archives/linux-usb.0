Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036115;
	b=jmcbq+Ps9j0aCPy8YCWYX/OJkNM5Vtg8DeBvH/vIV5xYGyUst16ja++00UxhGIsJXGto
	 u9jXLL87igBpjw7kSsQOPNZB1FF59mW4Za8Q3cmgFWBTq0FiklBFmqw4KwXivTOeUc24P
	 BtbEMEcNuUxbTbvCpbTS5E78fbXatvUoUpFj2d2980dQTTRnLvnJohhifql8WqC1/dQxa
	 qrnAI8iBHc2lZG1+XcoUnP/A0qAlMussJLyET0RclwMaUF2XRhbvN7Y9+p8cxq4+aabrQ
	 feZAofy7JpaUxnuz/HQNKy9gC+HRLauFx201fDP7YGooDGn2Jz/L+9tJ1+3nuxeDoEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K/yXWeNd0SZvChHyAYufJxiwD0+q4k2al/pHmNmBP8A=;
	b=k54ZfbMMY0LV6gDsijlxGG/2oG3B4eUBDsEWGwVS7lrxo5jItig+Gtqa1tFYx4aLa7uj
	 Z1fBtIJCJZNoDvVst+ZmNFO3v6ZOv6BdsqDxn55xhOChZFtZHZUSYYzFoHBljvA1uCFrl
	 KQBBNzNoido+wWF/ttXOVYUoqRpjC6ORl7Q8t2GlwNTGNZr8YoRYdTXHJVvcKJ8c6+qbQ
	 4XuiVseEfOinb2fZ2gPfqifbBfJJiMXF/p+hIInp6sn/gW6yp4mAjZ//H4pU6yGEe5Icz
	 lqbpUIe97QUEf/HNAKL/DJ0+CvnZoPOSzwPIiaR1WDUKBhHjKw/ctv8qLKIAlsQ/L4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARYibPBc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853C3606A32F
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 07:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ARYibPBc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B6D1F008A1;
	Sat,  7 Nov 2026 07:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036115;
	bh=K/yXWeNd0SZvChHyAYufJxiwD0+q4k2al/pHmNmBP8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ARYibPBcPEvF+ACX9ajsmjvDKhXms1O/QUWCeviNsRIs7SbVa9uEWlM4OBWDC7TQG
	 JYu44ykMbkJT92418/O1hKHvtE8ldomqDKusPI8J1DlS5cju9qmjhwKKPQQJaHMA+O
	 hFw4fgzO0faeFMx8q5/9z4mOfAa0p+1WsjZIO1LD4g4PbBClke/7bh2712odqHk1l1
	 3FLRDjyx7Q4cdHM97XL+rSUIa9In+uuVQfUMgFgcCHW4BjC0ekYxrnmZfkymSc6EG7
	 hrHTDAXJE9o6HBKH5F6lNuiW+IxT4bqiO0GBwb0a7VCyf3q0ILh4smUGIf4vz/0biB
	 DoymLuAa/hzDw==
Message-ID: <sashiko-outbox-202700@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v20 10/13] ax88179_178a: Add ethtool
 get_drvinfo
Reply-To: sashiko-reviews@lists.linux.dev
To: "Birger Koblitz" <mail@birger-koblitz.de>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-ax88179a-v20-10-37b5a1189983@birger-koblitz.de>
References: <20261106-ax88179a-v20-0-37b5a1189983@birger-koblitz.de>
 <20261106-ax88179a-v20-10-37b5a1189983@birger-koblitz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:21:54 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add ax88179a_get_drvinfo() as implementation of get_drvinfo, in order
> to provide information about the device firmware.
>=20
> Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-ax88179a-v=
20-0-37b5a1189983@birger-koblitz.de?part=3D10

