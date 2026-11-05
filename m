Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881080;
	b=1lBF7HVEzyYleshvOE19iCGVbXzOMSZhaCl4wwylg+K8O3nQOyw21K0vKY2m2uTSgmGx
	 grQme7I9Ohax36giKGk5Z6OPIz5eMPqaVdOpGzzDBIP/LmcMzWr3/RMRV/dI3sgwJgiLi
	 NVzQkxR+ZsgDkH6BlOP03eWmn4C9ykGmfpdyNxmoiRUuvehV95Hpzte41mj7mPwJcNTVT
	 4j0OV5cPi2/DLgnIUSe3DNE33EBX1PUIHZVU7NMASEdjxP+ylbPCuytwD/2oqTvHUTtd/
	 dWmTZht4q/RX7tcbR8/kibpsxXtLpibdY1xqDT21dMqPPB8xfq8q9AyE6Ug+2+azuNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881080;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=aPDBC9Ajm2uTz01qbVye8+Si1plbjcHqGLzoakPUN8s=;
	b=isY+gHAsrLQtyfxB+xN9NBySJMzmxqh6qdvAJ9Ek2w/9BXR7+t8IIeVsGewBSeeRFaT+
	 75O1wGU2Wa9bNjJdxQALBW1TsCg2FjuGeXV9Mg2M7yOTyyOiagxc3LxAmBVTosDz0MFyg
	 ZusB4OteAY6wi4CVXXhgnSusMSc0t2R8omG/d+aii/tVQHDwIChCyWC/JPaBh6f/+phty
	 z0h/ekgeyTAgKwMHqu/XzPH9aOa1AL0CVjxHjSHNFXTaI2KUKt2jYyGzzICrMbSqNGdx8
	 76dYbXxlWo8yMbbwYWlXheEK9biBFLt19h6FYKvd9agiYtM0oWivRZslS86/Kq8Uf9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=myeeynet;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290E606D818
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=myeeynet
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB2F1F000C1;
	Thu,  5 Nov 2026 12:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881080;
	bh=aPDBC9Ajm2uTz01qbVye8+Si1plbjcHqGLzoakPUN8s=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=myeeynetJeWwKEzavDVN9teU92hXIi4QgNyFqpZ0QkXhs1SJnrzdNCkiTHtJlIhNp
	 yeIQJFc8EWYBXGcvpbAJSAF1dqS2UGut6Lh/xcS4XqVz+ieH1pDOSnBqmmB/hWGiDv
	 b5jjYWPw82Cwlq6Outavgzp0oRjcLVivimiDIlcliz6SvIoS1zMMGBFn1+5scjMebY
	 b0DtAUhMYfUqI4Yk1b2bGb8QlJGayKGNOx6iobAh56/X7dULJ6No3+yWWD3iljyiR/
	 Qr40joiW8jLwTWJvfbHv6lZYG9FsovQDpEICXYItz3XpaakcbP2KQxagc8usarq9rK
	 9cqnTXz0BFVJw==
Message-ID: <sashiko-outbox-199011@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: usb: Add Samsung Exynos8855 DWC3
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvarasu Ganesan" <selvarasu.g@samsung.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261105121401.1661711-2-selvarasu.g@samsung.com>
References: <20261105121401.1661711-1-selvarasu.g@samsung.com>
 <CGME20261105121429epcas5p39d2113969a054d297cda76a67f309c14@epcas5p3.samsung.com>
 <20261105121401.1661711-2-selvarasu.g@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 12:17:59 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add the Samsung Exynos8855 DWC3 binding using a flattened node
> representation, where the DWC3 controller is directly addressable
> rather than nested as a child node of a glue layer.
>=20
> This is the first Samsung Exynos binding using the flattened
> representation.
>=20
> Co-developed-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Muhammed Ali <muhammed.ali@samsung.com>
> Signed-off-by: Selvarasu Ganesan <selvarasu.g@samsung.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105121401.1661=
711-1-selvarasu.g@samsung.com?part=3D1

