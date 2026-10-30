Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348474;
	b=2l4XFTx3dR1l9DHmhI38qXmpBe2dkWuaEEYF0zQHQeCvuiXNrk0UJ0SxeB0L7SFcNUHj
	 fbzC53gB7j6cImEEvIn6cgPB3Lum5q8aWy8FExcnZEFA0vWxQ5ZsrSC5Xgz3LoWy1M1Uh
	 KnyX1huerNU4Gcj68sjuLtndonNnWthfyrQ1Zvai+2K+wxRfkGXkfExCtjORJNIVIEpns
	 NG/V8Znzr8WJwJIy9RzS6L7GZ6/WJo8v9tr4CzXXlAgep7eM9F4SMtj+GEdyIFXQUoV4U
	 yLZ/Qf1PESspy1nfKHO5wWWSk4hHG+KPGJtuT7wxA2sg4C09VfERt6balyoEmBaf4DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348474;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=J5nrD7I26naDH01zbhI+mhWfVa7NQ2q7KM3BI0hTkcE=;
	b=kAlrpt8nBuu3sxmhzUkM4csm/jfO9q0JDhPXZxjFY2OhM/YOiqfgs4M78XBG+LhPtIgA
	 fE+w9tD1xQ8wtVUCvhs+TQX3Kee7IkJycJrZJrm9s2HkCgyz/cBfsBq54gqKPFX8NxDlN
	 cGQYp9OwhcRLBTbQAbzisxZ08HMWlGeBdVxCObczAJLUbYVtwVYQkTD+5iplcZRAba0Mg
	 G3Mwd+hoOZYJZQRobJSXppmLyMeNEy+2w7qzJiZ+TnExnDb54XoK/yQEXdpliz06OcWcc
	 a2TVpOeziqq13GrW/wFGzuGXMKUhF3Sfg3E7HuipL6CHSTfjQ+xrnzmShXtDVMVTDFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5m9Kd99;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3430F606A323
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 08:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h5m9Kd99
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C23E1F0093A;
	Fri, 30 Oct 2026 08:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793348473;
	bh=J5nrD7I26naDH01zbhI+mhWfVa7NQ2q7KM3BI0hTkcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5m9Kd994KZsMDbLjtmvE1CVJSaCLHCjO5JZMvkH2M2fAqZNRGI94rG/tlSYl4KAT
	 hVQY00Py5bP/FVtQ8ePoYR2VrEu+sbdk8SN3ZEM6IEwtslgia4yTWbFxD8Ao2tRYm3
	 oXUlLtByfxQHdSf8TYUQ4xtqPQX1yWCIT4Rw9ekt5cexHlAHyGbQcgxLQTZ+95qw+k
	 cegd/DQilziBsGATJYbSI9UwUc3yGAgNuSnD3OJfPhVh6l/DXZ2HtKijglcEpA7ihU
	 FgFLUH8b9Z5sPBjY9aN3l+WqvNxTicZYk5QDeawln/U7erN+/CfEBoPd4jf8I9A6tX
	 /RTxCTo00XKLQ==
Message-ID: <sashiko-outbox-190680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/6] usb: gadget: udc: crg: Add hardware definitions
 and structs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-2-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
 <20261030-axiado-ax3000-usb-device-controller-v4-2-c5267b36a777@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 08:21:13 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> This patch introduces the hardware definitions, register offsets, and
> fundamental data structures for the Axiado AX3000/AX3005 USB Device
> Controller driver.
>=20
> Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
> Co-developed-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Krutik Shah <krutikshah@axiado.com>
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-axiado-ax3=
000-usb-device-controller-v4-0-c5267b36a777@axiado.com?part=3D2

