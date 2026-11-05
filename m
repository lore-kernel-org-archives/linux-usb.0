Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867381;
	b=mvM5P0tmJ70hoiMcXdp0NreFI74RuDGcwQdJ5aIGyUYt4JEiNLtWud5wvvylIv9z5L2Z
	 irXP/umYmexeljcJsNC7doG2g2t8xpB62Qi+Fa/WLWOjCPCfJJtUsZQefIvLakp3UNYGY
	 RKaiBGWxESrncN26ZRLEPC03/gL+6ISbRIBw7MDp9Rej2zkouW5Q+umTEWAb/F7Ww/MWe
	 OhToZzZ5q9jokJy1/Fk52ttm0AtlJpte9iSsCHBTm0ivrfC5WcX6glw4ERwyMlzHxLvdy
	 WUHbaTOJ7gQ2iTE1FJDLKkJP2o/HYFiDG3ph5KGUsOwS3+GSphqAcmH9f1Rdix/X60Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867381;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FnJJtrOmOzTHmmJLPQtQajeI1PgNaLjftZibKVfScLQ=;
	b=ySSEaKlDtXnE3zuzz/aOGpi0Bcu+hQYaCLoKhsFpwdqGN+S5Ek1C1CAU2ntNBPvgX6Is
	 jFhB5bwlQd1OQnfhKz4eIW+EhHra7IFA9haBUlg5cnTl/WbiweViEdNXhsd7UUYeYsKkm
	 Q6jio4mvsz+wONw7hTMMiZjQ8o1rxutGeJgFLwS8fo1BQwMfmbRsahW5q1ZXioa5mCHkq
	 0M8kr/XBfa1DxxVsyDX+AQjYT4kBZnbBXYTrgKnPa0qdkxkWTqOKeAQlh6AXLESx0EEYK
	 JVz6dpXoDVLun3LBRh3C/W6fjwieDgLT2McwxAtRAjRcF/BhDJnaeXmrmMiujcsG4Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1TCEV63;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C7C606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 08:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o1TCEV63
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8F61F000C1;
	Thu,  5 Nov 2026 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867381;
	bh=FnJJtrOmOzTHmmJLPQtQajeI1PgNaLjftZibKVfScLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1TCEV63XbE3tc+U3RCQbsrSam5GhN+RlrXmdwoNg0NkVhzeX2tEi7B13TWExE3Cl
	 aDl2L3krwPHEhMLJa8B3yhB5SV1feD4pHKJbQvHGLuXOts5EjrvrWzlDYGlXDpGBY7
	 q1rH09Ia+kYGvYaVcKyG2Uk4aKHhFec1QN3JWoQDKjupljgXX9Jzf6KNLXE7kW4hsF
	 rVgUGaEgeo+VcSwUf1kA00UKaVscKwmTyWDL3RxDgEXAWYmD7qrFNvvmg5Zp+8YgXG
	 55EBU4XtWcKNomF/ecN1vneMOSFeeK4AXIxJ5QhQCacRyHg1CC7Zm1us7eZ0Ksc9mO
	 5PCZqSjtM86cQ==
Message-ID: <sashiko-outbox-198723@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usbip: vhci: do not give back URBs with an unchecked
 actual_length
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vlatko Kosturjak" <kost@linux.hr>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <auw5_lMRbGU97IKx@griffin.linux.hr>
References: <auw5_lMRbGU97IKx@griffin.linux.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 08:29:40 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> vhci_recv_ret_submit() copies actual_length from the RET_SUBMIT header
> into the URB, and only usbip_recv_xbuff() looks at it. That check is not
> enough:
>=20
>  - an IN reply longer than transfer_buffer_length is rejected and the
>    connection shut down, but the URB is still given back with the
>    oversized actual_length (and status -EPROTO);
>  - a negative actual_length (urb->actual_length is a u32) is not
>    "> 0", so usbip_recv_xbuff() returns 0 without checking it and the
>    URB is given back with status 0;
>  - for OUT URBs usbip_recv_xbuff() returns 0 straight away, so any
>    actual_length is given back.
>=20
> Completion handlers trust actual_length. usbfs copies that many bytes
> from the transfer buffer to user space in copy_urb_data_to_user(),
> [ ... ]
> (a short read), as the buffer was not filled.
>=20
> Fixes: b348d7dddb6c ("USB: usbip: fix potential out-of-bounds write")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vlatko Kosturjak <kost@linux.hr>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/auw5_lMRbGU97IKx@gr=
iffin.linux.hr?part=3D1

