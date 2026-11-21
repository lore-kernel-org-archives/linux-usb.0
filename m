Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795282158;
	b=lYq8ApqjrRUOwXvhVfFqyQWUOljUA6S/UASq42EhRAkkkduk8NwNl1+6qUjlLm66i2zO
	 WW1LBSYLViozpE1ISCc2FnRiK9z+fe23CT5kvtMkUv5PK54rBgbAwCT7V34ztiQm8btw2
	 O6QpqguPuySDnmcmOy9QS9MsP37oExvwcby/9eE1jxu3Sxt/8L71w3EIVfAAsl83ewZHy
	 LfSPOwQ96K45rOwKaQ7onuLqjBxFHd4i47JzCEcd46ygOTUiXFdOITtIKGVar18Yem95N
	 QwdWKzBsfrszvXtEh+Ke0rn4DZWNoFzd7uw9b6Zn+KN6YrkNEL+kDfKtcAF15qvv+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795282158;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z4XGWRVlRof9Hg8Gq8LuWGZ7WnGaPu/v4vjea5X7198=;
	b=ISYNi6GJeS78++S3TLMf7BsG5oUn4E46AQBRpYkQWGNQRFwMpxVpcq/ey0fkbat+PxHB
	 7efl1wcsC4WlDiEbQtS0Oa/xy42kh4WPgS1AIrYJaXF1fvsWD8bkYDS6EKYdF/iMIU6Zh
	 lLN0kBcCvPpQv+kTayGfuwWR5pQIY9VhP431iMrlrMf6l+jv62w/EhKo3ycBmCjwr5V7M
	 PH5LU1EMGrUMGBPKfbnOYCD34LToFno06pXCA9gWKyYr2uIx9yVtWLUO/smAyky6DnHF3
	 oa0r0iuC8jcmXUmr5j3mC/cHx/XQ1Pn4QEbatWoNhMGPYsKZnS4+ImkCfle6bbtgyPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kmufk+zP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83240606A320
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 17:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kmufk+zP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B101F000C0;
	Sat, 21 Nov 2026 17:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795282158;
	bh=Z4XGWRVlRof9Hg8Gq8LuWGZ7WnGaPu/v4vjea5X7198=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kmufk+zPo7JHkZF710i4D1y4pqut/olXY5bs98YcEPT4NZ/Xu6HTlMLYcI2YAtCch
	 RnK5Mso2N5Nk8vZKnC13h5gM1ZJy5hgC5AJNv+6x++iofMTs4/31yx+f/ehwXNOJPb
	 ugpjIXzP9KC+ELLT20Pl7H6N/A0QH5REZWJepKE7K+vUFmMH21JfvUBflpsf36bipK
	 OgYBrjT3UH78wOEc+EtIrBS2J5NCeCi/WFFO5p8UlQ2Zik5u7L4vBiyWYl60t3dJyK
	 T523gVCv1UDj//WZf6iQzK0uloRmsNm4txaW7uAHpwjzaTkK/T7zcdiQY+aW6xaSvD
	 kUAjT0DlLGNIQ==
Message-ID: <sashiko-outbox-227207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb-storage: alauda: track media_initialized per port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arbab Haider" <arbabhaider649@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121171956.1455-1-arbabhaider649@gmail.com>
References: <20261121171956.1455-1-arbabhaider649@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 17:29:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Commit 16637fea001a ("usb-storage: alauda: Check whether the media is
> initialized") added a media_initialized flag to struct alauda_info to
> prevent divide-by-zero errors when alauda_init_media() has not succeeded.
>=20
> However, Alauda devices expose two LUNs (us->max_lun =3D 1) backed by
> info->port[0] (xD) and info->port[1] (SmartMedia). Storing
> media_initialized in struct alauda_info shares it across both ports: once
> port 0 initializes, media_initialized becomes true, allowing port 1 to
> skip alauda_init_media() when its media-change bit is clear and divide by
> port[1].uzonesize =3D=3D 0 in alauda_read_data() or alauda_write_lba():
>=20
>   Oops: divide error: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:alauda_read_data drivers/usb/storage/alauda.c:953 [inline]
>   RIP: 0010:alauda_transport+0xe5a/0x35c0 drivers/usb/storage/alauda.c:11=
87
>=20
> Additionally, alauda_check_media() never cleared media_initialized when
> media was removed or before re-initializing on media change, leaving it
> true if a subsequent re-initialization failed.
>=20
> Move media_initialized into struct alauda_media_info so each port tracks
> its own initialization state, and clear it when media is absent or before
> re-initializing on media change.
>=20
> Reported-by: syzbot+dc208a8cf8d37cf3e5ac@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Ddc208a8cf8d37cf3e5ac
> Fixes: 16637fea001a ("usb-storage: alauda: Check whether the media is ini=
tialized")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121171956.1455=
-1-arbabhaider649@gmail.com?part=3D1
