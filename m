Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370706;
	b=UaRYb1ak4arX/ThP00XGv4BxGs1+VgdH65co1Y9yWrMRO0jGVnaR1mff/6vzE3Z3KZjK
	 ETSEJP3QP4Gttvwg32TcxVrKB5uFc/d1H0BjArL9a0TsGiV/266pP96H9t9LwA0eo0FHj
	 5CsEehqGe//50o7uu46TC/TmRNh4K78VHrvhwpLNAy/uU1VtzOjX0JMyG0zrDFbd3osTR
	 jZeUHojfIeZACxmb2q6CqAgw+sSmm0muZZjrI21d64tjb5uv+pz6hji8CPydUn2mBC8CA
	 fau+wyOyTgBF6ZsXydNS4FpiHkoQbKV4n/pUy94JrluHnQjzAzw6Mvwr2U7v4/739IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370706;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rICEmqN4/At5JEtwW50scxWuHErYRc6PoQZHwwzgHww=;
	b=1dscW71au/o1AIfolSiUt3Y/RoGPegDinm53szHhXvy//oB8qU6U8MFZSvAgHnXcAsvr
	 kgHxomUvn/lasB0ad4+Jjduo+PSdlJB6g3eHtmBue/fNRGbjSfH9pzxPpJGPMZWyPPE17
	 /3bTeFwXhMrN8ifyc3k7GmnBW5qEDq7zJ+yO4dvGXLYoD/C+3wdN6yzq7VWL5ABb4jO6x
	 8/KRV8zKrV0sPVTU+pY6lUrV/g1Y/BAMuvv3OwypVVRdUtxN38ib7Gf8mQfJzLJt12k3e
	 NksBNtOie2dLl0pyyhTxC/hqYpMMTAM4cCYVsDrrPa9sMv0xh/gO4QezFrDE5sIspYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSSPu7n6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EC0606A324
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 04:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nSSPu7n6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6181F0089F;
	Wed, 11 Nov 2026 04:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794370706;
	bh=rICEmqN4/At5JEtwW50scxWuHErYRc6PoQZHwwzgHww=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSSPu7n6xQDtcxKIg4jXmBtXYN5TrWzN8MGhJPausmk5bJVfV1ncpOGvU9z2RnAXQ
	 XmoS6NYAVeLRIZbSAQYErrhAON8G+JLJOP8aHzDs5upNmYjtAcH6Wessye/ZB2Yv+g
	 WYKb98pgzEqIAPYaYljkGcF6+HOsZ1hvhi+dB5Pu6/cCgrGhgsPQVUahF+eSdDn6NK
	 AAAGWN2AOilQNRAPm9aHnzVs2CoD43ZyY+EBNjskbxAmXvqcCFjBi6TWy5VxnsOAmD
	 AOCj/H9Xskqy43DeQ9/gRAohaO23DPkb3shS2UIduV1CJBLqyKaKUQu6IxUS86KLK+
	 GTpz7R9zqCsxw==
Message-ID: <sashiko-outbox-208268@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: Check the alternate mode ID allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changyul Lee" <lcy8047@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111041446.3072716-1-lcy8047@gmail.com>
References: <20261111041446.3072716-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 04:18:25 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> typec_register_altmode() stores the return value of altmode_id_get()
> in an unsigned int without checking it. When ida_alloc() fails, the
> error code becomes the ID, and the alternate mode is registered under
> a name such as "port0-partner.4294967284". A second failure on the same
> partner then fails with a duplicate name:
>=20
>   [    0.423055] sysfs: cannot create duplicate filename '/devices/platfo=
rm/altfail/typec/port0/port0-partner/port0-partner.4294967284'
>=20
> Return the error when the ID allocation fails.
>=20
> Fixes: 8a37d87d72f0 ("usb: typec: Bus type for alternate modes")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111041446.3072=
716-1-lcy8047@gmail.com?part=3D1

