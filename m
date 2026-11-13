Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794613894;
	b=NayZsFhQar+Yesozkft+R6Uy2WHrku96nZR5JD6Z/C6HEsJCR8rjVXJwWXnQQOnYhxyz
	 U2Ufjks0WMAYTycav9J1WwYC+FZUveR57rglEDiw7ErtYEPEoZtqdi0ZCk30k9Qpn+nzE
	 ERWNyYYdcXLnCuDFDwcD0ZBrSnMhsV056j+XLnCSInXWIwGXnKvhO+g7phIgNuXrbXKDL
	 gaRG6IKHROENDApPAdJB4CR8gXAI0BxvtwVLYtJgyVmIr0nQm43L2byH0SMwMY2CLMK/K
	 DFiFahHuDLiCC2SPW/hcc/V3TuLt4+IRxT/WpHDy+N513rLYIhN82eUv3u4ee+sg17Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794613894;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Lr/eLxKMzMv0Gki09zR1qJ+vgwiTOKTtDXHmq/GiYW4=;
	b=PwW3D04w+lmXPSeTMwzB7nW8Zm/LcRJSFbj2WK2xnfD6fiF3bqG7CVhpSxuM9iN00hWG
	 FP0zhL20FYqwsT5BcnZvmpL0BYrqC7W5COn/2EvCVCXUrmfp2OTkcSq4vWD3JSAAQS75/
	 S3skOk+1snf2Blm6ZJTW13pSJE043+0/W+916jdGhspKOos99H2y8SfDEAujpRrTcU01q
	 cUSVQY+/fMXO63gpM5PfShOIaPgjzAJPaurXU6rrDwxtYhJ9hAAOQVpKBaC9LRmxhQlhu
	 vT/V2UXUoVxngVdteICEzOnyAIeneHf/G+rZXEF6DquHMdIwyTc2y9QCxHMAUe21RJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCDLt3Ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E2606A331
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 23:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCDLt3Ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6CE1F000C4;
	Fri, 13 Nov 2026 23:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794613894;
	bh=Lr/eLxKMzMv0Gki09zR1qJ+vgwiTOKTtDXHmq/GiYW4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PCDLt3YsGzHQgnBddsjZJKctOHgI6V9vTHVmWv5FErbEo4sbetis7Hp6SbBJ/5ThN
	 NoyWv1wUadRAGndgMw9RT5FhvyjGndGjPddOsV3cfKNPpebQ/g9kEU61+VU0rCFe7/
	 fQ19YhaSGBQFY0nuOguwrc/h+GZLZvFPVyvXeVJe0jht2WsMYC0TL/EC2ExcW+fhsT
	 OwFi9LRX8Iw5Po2xWW6aCF9yiA2ro8X1+TkELuiNPnrU50S5hg6w6eAuFaGXpX5HpR
	 aQLL2o5mW4UHAaYHTjz029yEWDWcgyEAvPR1lfQCsurls0hRE3RVZhxI8QDsxC3g+X
	 JOyiCuWoIGVwQ==
Message-ID: <sashiko-outbox-213879@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] greybus: verify the received message size covers the
 message header
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
References: <avV8I97uZJgX8Osk@stanley.mountain>
 <20261113234739.1432-1-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 23:51:33 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In gb_connection_recv(), the size of the received data is checked
> against sizeof(struct gb_operation_msg_hdr) and against the message
> size encoded in the header (msg_size), but msg_size itself is never
> checked against the header size.
>=20
> If a peer sends a message whose header claims a size smaller than
> the header itself (e.g. header.size =3D=3D 3), the two existing checks
> both pass (size >=3D sizeof(header) and size >=3D msg_size), and the
> message is dispatched with the undersized msg_size.
>=20
> In gb_operation_create_incoming(), this leads to an unsigned
> integer underflow in:
>=20
> 	request_size =3D size - sizeof(struct gb_operation_msg_hdr);
>=20
> [ ... ]
> Link: https://lore.kernel.org/all/sashiko-outbox-210716@kernel.org/T/
> Fixes: d90c25b0a279 ("greybus: let operation layer examine incoming data")
> Reported-by: syzbot+0b456664585fa81a47f6@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=3D0b456664585fa81a47f6
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113234739.1432=
-1-shishunbo@cmss.chinamobile.com?part=3D1

