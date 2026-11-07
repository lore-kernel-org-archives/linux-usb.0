Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046395;
	b=uDtd+pRtLyViYz+W4oGfNJ3gH1gplp1fLVkzUKJ/yHODcToWTEMrSDWqxwHppp4M7nhH
	 D0BmVB1WC0hKyTxxFCzi3Nr5/cE62IvSpARW1/3rJAH7CJFsMcfhyDBLMLz6pO99Y4VSu
	 uab4xg+samGaYeeXS7h06LyJwgRdLOkFNa37Xfkz3HfZSKuYA3vmJbbl3CiuV/3P7FKEs
	 gIf6DL8pNUsjGeUM2nhitcEJI/JPBN5laI9Ay6ppBVf0MxchLuwHa7zt1boxH78wm7iHE
	 lUI3m9eb2NsLbNdjmnN75LYy95IK1TF6inwUbvfALEz+10zMH2QfNFguj8V+6wrQXwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046395;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dQkwdYzCFfL5kPztMJyPZlZF6FsfwJ4i3aNlD3Jx8WI=;
	b=Q2JLu5Z1AYYYZ47mUIgxxerQFoRNpYWvmzoOdEqOBNGCsQ0BLBEPKwUZqKfxc8MFiEyB
	 PKFPnoUNhHmdmzsSwhBGXm/7kY/ZeFO3Mcy00RVqWKJKqp38mot/exWCzRIKydJzu4cAt
	 E1ezN9IU0NO3i824KJrNh8vERYbJjKiVDDF+HIQIybHF0HA1qLSM5Tu3zH/8gTN9GN9bX
	 IbcJE9CKpAqD+lL9fMVv2ogzB/cnjToyGwJZ6mafnfhZrIwbMd2f7xbaf6lmTpxQV7PnT
	 vLmDv6eNnluF+5GUIIrEQNgn0PgNfgyHi53bW3LxucYj3s6XXDQ4OF3ciPijNgHfNAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ht2JDtg9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711A2606A326
	for <linux-usb@vger.kernel.org>; Sat,  7 Nov 2026 10:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ht2JDtg9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307CE1F008A1;
	Sat,  7 Nov 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794046395;
	bh=dQkwdYzCFfL5kPztMJyPZlZF6FsfwJ4i3aNlD3Jx8WI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ht2JDtg9w6WmSdM/oGUJleYfuF7kmC+nWf/JjWJR5s0JcYcgsf8Q31fGzmU1cg7FV
	 4bYak3jAiVF+9mA496rRTuDSYdxj4ovrk6JpLrd3GPG2iyBQ37Oz0qrdrAT0BpyOmF
	 k92ZG1Hca7W1/leQDU+BPwSmGpOAcUPT5HExMcbJ8XlH9oBMqC0VX7LUj4fnKehZOV
	 VuOPONsIDgTzRkom7iyqczlBYYToP+rD92k4khnVhEksiAbnZ37N/iiCKWBORI4LAS
	 qKYVicrr41tOjvotIx0llozX55UA8gXL3Pu+j78BHjPbQOMrfuCv0YBAFPh/9weEah
	 qGpvDw15em8wQ==
Message-ID: <sashiko-outbox-202812@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: typec: tipd: assign partner identity to persistent
 memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michael Reeves" <michael.reeves077@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261107-tipd-stack-uaf-fix-v1-1-efcb517924ec@gmail.com>
References: <20261107-tipd-stack-uaf-fix-v1-1-efcb517924ec@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 10:13:14 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Michael Reeves <michael.reeves077@gmail.com>
>=20
> cd321x_update_work() passes a pointer to a local stack variable
> (&st.partner_identity) to typec_register_partner(). The Type-C core
> caches this pointer, leading to a stack-use-after-free and a kernel
> Oops when accessed later (e.g., via get_pd_product_type()).
>=20
> Fix this by copying the identity to the heap-allocated cd321x struct
> and passing a pointer to that persistent memory instead. Move up
> the assignment to cd321x->cur_partner_identity, so this works.
>=20
> Reported-by: Nicole Mazzuca <nicole@streganil.no>
> Closes: https://github.com/AsahiLinux/linux/issues/668
> Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321=
x")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-tipd-stack=
-uaf-fix-v1-1-efcb517924ec@gmail.com?part=3D1

