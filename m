Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108940;
	b=BlDu1+AKekQ2MJQDjKme321HNgw39ZvHr8VqVQ3jRIRVkieN/14UG+ZJMLIuUeyztWmV
	 lEDPawzODkase821YyjoseLMKo31ihZTNyu8FqUGK4BtWoSImXtqxf3l2Xq5wDrPRLGQL
	 FrGVqOBvHJrGCHB59latPlxPkpkvB2dWpOyFmUQ2F4BViQcf3XLQPr/1KdokbvaDa6PvT
	 +HTEsYoKP/LyvHe/3unvzDX9MKvWV+Is01ieV7vtqlxSy1+abj+uILfi9+Mg7f3yeRX2z
	 JxXjJKgyhlsSVs1FP3bS+Pp4CAgAZdFfAonHGFbb3SfaiWVRkNqrUdE0URfW0flls0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108940;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GEkF7ARBud4BPCTf0srGkI7HV8RzROccGNiUctZY+KE=;
	b=ez0zkGMzJs3YvJLjab8GZ5dJGRHk8YCg0Cb3wMx85oMLHdrX2gpTpS3+I/PcoEBgge4l
	 jJDmJZkSkucLMY4qIQpOhAxRI0SI074GZnB2ASBR7dr/kVdCkLk640gEpgWbwFrs/M3eN
	 XVhIgxRX3JLPY47JfdrnkvO3sSelE3NfypioKCHADGAIh3Jd7t9GAgqZIBfkrrZL40LDk
	 mjsCyLzfz1b2ZGlnybz2SoHx6BdoFMnH/Ch/f2sYq4peGjwr0tYoosEO/v8BXUWdpSyOi
	 Ps3mbDH8SQ5Pk87yihNrXqext1TW+CU8lsV/hjq5m2XfiTBrhgcjA2IAsti8mQnNDFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayFQ+L0l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D9C606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayFQ+L0l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C931A1F000C4;
	Thu, 19 Nov 2026 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795108940;
	bh=GEkF7ARBud4BPCTf0srGkI7HV8RzROccGNiUctZY+KE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ayFQ+L0lxjSJJP7KWjr2Wm5bulLSGfwMB0R9Fm11VyT73K18o0CtT6P38sJ6iDyDz
	 A2h5O4IsIEX9g0Ql2QEjMTNNLknQV9wTu09hGw12uFS0AiK9FvrQLyHY9oFD+CSuni
	 0deI/wOYarp9K0N7HYo8LDTK+7+pSfsSq5PaqXLZvOAinORpacXXr/l9Lco+0+Yi2C
	 5Ske6rkftbJbJ0Ih4xvgfsFun/96x9e4rm/dAgufIRVpQ1Unwnq9kvdVpjIm7jxBuQ
	 YqU5bdUXhs5e3eA3KuBDxqInw5pirnsF+/PadSnzbBjkzvK/X/8sp4QOef6+wSjLyQ
	 CCeBDw+OgGZzg==
Message-ID: <sashiko-outbox-223686@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/18] thunderbolt: Split host router port reset into a
 separate function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-11-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-11-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:22:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> Move the part of tb_switch_reset_host() that resets the host router
> lane adapters and cleans up the protocol adapter path config spaces into
> a separate function tb_switch_reset_host_ports(). This makes it easier
> to extend tb_switch_reset_host() in subsequent patches. No functional
> changes.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D10

