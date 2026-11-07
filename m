Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070833;
	b=U3riMAIOcdgJK7DIyPrNXfrkeZg9vqnr1nELLxGT/7M1BzCPHn7vhOLXmS4/2xqyz0hT
	 I5U9wj3y6mKVH4OKYlMMpqn8OqoZkCfmIqbsKPQoupCWvwQpGSSWF6ggdnNrrhucfnC37
	 rWlJASVL7ZSyTEccLbc+zzJHnn6he6rntLTX/I2BCMQg652aArXx8rPtsxabdQqjjF7rf
	 pga0kby459uWZLx691V80ql+Hh0ms7DGhdLCbF/w3qSs8a1l9itwX9xMS+wjpcLjQ46zm
	 vzgPDdMags71FdyWYiyui5/UPRbQ/Il2QzBBMGw646y/7oY22K7KYJYSUI57O5fVAFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070833;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hWhwAaMOMC4futQIga1BR/c5UBfy7qXzwwUisrjDfuI=;
	b=0k5GatJfSLdZ4y3Jn6Ty0k/Np+rkeMt/NPEq7b6cHENCQbxFcRpXcoKmhs+cXzPB59E4
	 D3PzbMPiklEk3syD7LDciLIq7A0VbylN9d7lcj/1ugoD8UxEujipDZbJ+DwqTM8QyG6/z
	 Jn/EGEoAEnvmILZ22PKWv9hT0sViVZEV5OcoMC+FsGNz0NAYR8o12G9//Vn59JGrNwLS0
	 YB0oYNrtt4+2dgzSRJU85drITDzAFjSS5TGW8bYFpkLc4DJtPUUNa3Wc/DX3+AAUedrbv
	 AIzBlGJJL5B0SzXhiWceRtSw7Ud0tkY2mRm8pO9Hzdio8CBI7RmQtYNiDDmk3cgOURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T05WvKJQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC80606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T05WvKJQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911DF1F0089F;
	Sat,  7 Nov 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794070832;
	bh=hWhwAaMOMC4futQIga1BR/c5UBfy7qXzwwUisrjDfuI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T05WvKJQbtLgADvvve8izYVBS7J6VIyCOXnbIbhSKd2Lh6YGIto17OjFlEvsCmS4E
	 Dl/Rz07yxT4M8e43YyPCtSDeX3sY2H5vPZrS7qsYgFPpiS/HqPnADYQ/QOZKjMBSeX
	 8nx+71CGE3eAa5Xq9pcWASH+qG5uICLCUclMzWPBq59FU2/8Ind1YZ1m89lPSiBE5u
	 J/6f85ljvnY5wDPwL8j6prWPPgpgGrif0Z0JH78DLSurppX24LwEWaGm+1WIBInnZ6
	 sYz+LSTWpuIzk72ZXfSBAXSy5w/EBOYrhQS9oQf4TfQ5DpEWu7v8Hi88Ma99kjPOuC
	 LJUQZhptbl5Kg==
Message-ID: <sashiko-outbox-203081@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Drop the DP tunnel activation callback
 data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sven Peter" <sven@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-b4-tbt-callback-v1-1-5ade9391461d@kernel.org>
References: <20261107-b4-tbt-callback-v1-1-5ade9391461d@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 17:00:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The callback data is always the domain the tunnel belongs to which the
> callback can just take from the tunnel itself.
>=20
> Signed-off-by: Sven Peter <sven@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-b4-tbt-cal=
lback-v1-1-5ade9391461d@kernel.org?part=3D1

