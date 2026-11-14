Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618322;
	b=AZgKMxVvb7pIOfdk8XCCqflIhlRCZFbODAwwdgfGpJW/nF7aSJjCUXmfV7M7l4iRNmUb
	 oFPdFHurxx1PT/67im9Ewh+8ht9Ytn9eIXNMImkFPfz477GtQpFPw+SrAbmO63nEes4Fo
	 DUmKmPWoyNsFmIOr7fkpEcP8fHmPITVN7vT2/L/py5h7ivUtpraeI3Bhi9a2al9sRey2+
	 sKDZZYifDVcARS9Gc2+BqUnl3mRXoB6HQbWnTQPucWhLOdqqs9qgLDr2Y2jVPaXKtUakh
	 MwRQRg4OvOViQOnIc36MNqn5a2LxlbU2HJZmHZIELGjHGRgEgNugUXMONXdD0TbhWjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618322;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Agr2N/t0iPyulz5rXfaQ78m2/Ol0GCvzIU7d4AdGGsU=;
	b=pwMcdTAbc/k+tnC07HCFgiNqPJWlcu+pnJkZ4hso6D7Y2IwbXlu75fiGtbzdEpiLfzja
	 EHmLCKAGNh5HuhYFnEw+M+3do1KyI8/2vrr14c4Kle2fjj/QCjheZK8ZobjPLN6RspvcX
	 Y/mvpbbxP68fwwF0her3Lfuqn72tO3dwoRjQhmxAJAyWV4lKgPvhb56AjpD2aYi4Y5IQD
	 1X6U57DDqKDXjnmFmwj3pQzZHk/WRmeKS8w7n8PBDh4yBJUjqFgCWHTRupdyvWtoQ8Sf0
	 J2AotV/PtnB4sjzZVLxppRxPsuILXLt+QQ0lkd3MQA0IgQiAZZGDFs84FUIeJ2THNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt5yJezV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08522606A886
	for <linux-usb@vger.kernel.org>; Sat, 14 Nov 2026 01:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt5yJezV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF501F000C8;
	Sat, 14 Nov 2026 01:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794618321;
	bh=Agr2N/t0iPyulz5rXfaQ78m2/Ol0GCvzIU7d4AdGGsU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bt5yJezVZQJUJGyvdioZRNoCVmqGbp4kNaeLC9w21OZMJu5aFA/WtScEN0xrkVlhw
	 xkvKSDoaNDtTKVwCkYKC5qsWK8ghHE0xC1lZDb/KSrEL/+rN7eqWe7xGmf8gZaGGHq
	 bMt0N/iC5Ibo2/DNtEFdb4K6uLoE/bKmWL2XLRO2T+l7bqhf1RmVIOharM5BfkMa7s
	 m4xuwxMhGpkaSi1k0JP1zlbfluf6PIjSwTXKSVvaCKy+98GOuw8OFjhvkQ8lV5VnpB
	 C1pDdVGM0OfuUDZxfRMqt5Ib2sj8QQ3emWvr1EzAaKWoq97YE/SnIEmeg2Zayjv/XR
	 9xXgYG1fosBAw==
Message-ID: <sashiko-outbox-213977@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 4/6] usb: dwc3: core: add post PHY registration hook
 for platform glue
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sebastian Reichel" <sebastian.reichel@collabora.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-4-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
 <20261114-b4-rockchip-dwc3-rockchip-glue-v19-4-b79fb5f4b42a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 01:05:21 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Add support for custom PHY handling steps in platform glue code
> by adding a post registration hook. This will be used for handling
> PHY reset notifications on the Rockchip platform.
>=20
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-b4-rockchi=
p-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com?part=3D4

