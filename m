Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185178;
	b=Kej7aGDcUG+OFdQT/Nwc5BOAMZfIBR1O8FfRD1Y7skjxbgtAbpbiNtFFBtMvQR658Qj0
	 OD1K92di8+Xxkk8+bz2ODnBPCwky+3CWODdYc4WIOyYJtxhp39rCIgcNH4X9SSsFrRkgh
	 l8YMuNnr+DyDxhm/WiqmbC61RbkRrRUqoXN0/6xBcEnHC5B9gky2FGFPRvdSTNW2PLBpP
	 O4Ve3V3ETgneULAvXssAqbIfaHg80jH3rfIGcBwxmx/jvycIsU6Z9uo7jaPM5GIynwzPd
	 sGo8Uiu4GQJ6wrgi+9qjgZOXl4M1xSuD5A7XEv64PCTbfwk4/uWQ+UOsFZAop1Uf7AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1UVbXu3bBJrBs3RfsgPZoWIK38hDwSuOuwrJ3dPIGvg=;
	b=xBEbE47Gc6P/riVv069UKNaMLCQjYfDpEC+Kws6KFeEDuudq2N1N7BYC+l83dt41c5WI
	 0L5sQbpft33mh7hcpSZ5nZtg/2/Ml5T2wVs/70cjXlFyK8HoEw7kQPFBqkVjRnL/vonsR
	 cdwwZO+IGcc70JPeRtOuKQbdh4Hz/UpGwQgDfSZmiBJdabINhMKzHduFXyl3Rimk7br4p
	 QAknjyV0B+Ai3KAaLk4w0Un8WShqRnWakTUqxRerJTxgbC/6hOfaw8aEXuVaCUFG+mGps
	 WjhhnsyZ2mAM3KRigTdwat9xb9MNuhLXC19ShC7rjJCT+X7x1WbcVhK5pOlPeYfd16w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtbMK0QX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB0606A31D
	for <linux-usb@vger.kernel.org>; Wed, 28 Oct 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZtbMK0QX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF031F01825;
	Wed, 28 Oct 2026 10:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793185177;
	bh=1UVbXu3bBJrBs3RfsgPZoWIK38hDwSuOuwrJ3dPIGvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZtbMK0QXVwEoiWNOHNOPFCVTXIhM+yjlRrT6w+vfq52M/Elbfqoa2UMHn78mQ8sEi
	 9rs0gbub/mdT5fLOew3sUsh1kCk057YfpgotqnB9dxXXPQL5R2QxjwtGwumkYZSd2E
	 F9TaukIyc1xRlR41zAud4cD0CEh884wrYWGeNtQEkOch4G64bX05lNAz6afWu9RL5q
	 8gPH1l0iFPEWnhIF6W7U8NsJBs+xWRL5bLjmNDN0CKp+NY8X0ZRgVQOekJdF2n/YmS
	 wPzE1pwLyu/hSnPISFzMWHs911kkkVRfjKjiCwmdpm2Kd53oBLD95RtuZW5tZDYtLh
	 1GaIwhuTB2gyw==
Message-ID: <sashiko-outbox-187782@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] HID: pidff: fix undefined shift for infinite duration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
References: <20261028-b4-pidff-duration-shift-v1-1-65028c6b4a37@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 10:59:35 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> pidff_set_duration() computes the infinite duration as
> (1U << report_size) - 1, but report_size comes from the device's
> report descriptor and can be 32 or greater. This causes an undefined
> shift. A UHID test on x86-64 triggers UBSAN and programs a 32-bit
> duration field as zero instead of 0xffffffff.
>=20
> For report sizes of 32 or more, store -1 in the s32 field value to
> set all 32 bits without shifting. Keep the existing calculation for
> smaller fields.
>=20
> Fixes: 1a575044d516 ("HID: pidff: Compute INFINITE value instead of using=
 hardcoded 0xffff")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengzhuo Wei <me@cherr.cc>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-b4-pidff-d=
uration-shift-v1-1-65028c6b4a37@cherr.cc?part=3D1

