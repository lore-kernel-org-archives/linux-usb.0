Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919547;
	b=xtLZBDrrzdKZkBf5qjH79RRVJKLwL9L2WXR4x/nh9PFyGmbjnVGDIz4Kx3+WH1vj9Pie
	 rKG6JESaoAbK7K+l6yMCxTjQ74fRPgiEgwu9vmsNo8oBIU6M5zWSL5j12cRkO6GI6QU8G
	 LoT7RQK4njs8Wmo/IoYQsjCpBHJ2iwJ6HdGLqwE/kWn94l47x+Q05gDSSuvnTn1lbZT97
	 gokjSMQTcgAo5XpiqZ2kKAegbj/2DPmXc+FsQug9B/YrJIuDx6hkDjrToYOhPG1kxDhcI
	 RC67ORvVH1WVQB53ePwcdMFawZWzi/rtW9FnEw9y3pdwe/uu6j7Cw28AKlp8ZtYaybw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919547;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fTg9cJLZ2dSbzUIgi9wTBBj5F7C94g7qS6R1bEWKaUI=;
	b=nWkAgWB5IVof0bAhjK4oruTA0Rqxt85g3pPYDc0qUbrwEmfd4NCNqQpJ//2FxjkCcRYa
	 9mjv4WIQwBhEW3IPX7I6ZJcq/W6c1WTJudl+MDU9yOW4XyAMUWFDEN4A2wk6xq4BrT7MW
	 0tZ6IXBNSLkCTUXkMz8V0URXEazWReJIeILHVLqCgf35YOoumqMHG6mq8SLji0yDpteJG
	 hbcJtJIdxJomkLrE0h+0GRR+EzzZEX61Xjy+oqFCLZo++ptDIJ8HHEKh+sFEXc2cdNZey
	 HkHRxYLKYnI7EXo0Rt9Egn3INRZ4MIJ+etuL+HkbMORv7sPSs3Ky8tJnGBJxnU3Be2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5DxuYVs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF01C606A31C
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5DxuYVs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DAF61F000C4;
	Tue, 17 Nov 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919547;
	bh=fTg9cJLZ2dSbzUIgi9wTBBj5F7C94g7qS6R1bEWKaUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n5DxuYVsUnCMNx4DGv+iG8Ra3zMCcmXp0NtKMlFNEJQ4IWhltxb3DP2R/wnfRaP1n
	 87qYXWRyCKFre94uvYH4oMKZD4evJww2TqDzzUQTZNhF5+tV7hJXIHHMDc6DZB3L2w
	 BruCL+t+AYy9ubifYIT/ZA3ZAQCyJ1L9ZROQ6/kYfLi6D0GuExD2oUcQB4svmS7Wsv
	 Fvlu0pkNnqmJkPsOHjZYy4NFrMUOHejkp3lrOeWLIw9m/FE7v/wXdo6tt0LYirEIQr
	 USM4Zji3XV59I4AvwvFtRES1qroclpYolsM6f4azDqp+lcAyfT1PnSw+mS8gpDs02l
	 7TyrtJMFDIAEA==
Message-ID: <sashiko-outbox-218786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] usb: chipidea: usb2: add SpacemiT K1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117-b4-spacemit-k1-usb2-v5-5-52c3829cca69@linux.spacemit.com>
References: <20261117-b4-spacemit-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com>
 <20261117-b4-spacemit-k1-usb2-v5-5-52c3829cca69@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 12:45:46 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
>=20
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-b4-spacemi=
t-k1-usb2-v5-0-52c3829cca69@linux.spacemit.com?part=3D5

