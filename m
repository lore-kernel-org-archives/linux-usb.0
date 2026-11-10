Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293165;
	b=dTb0MNjDMbKNtYcMwOQT4g0qONd44bmL08Vms7CLnv6TipHwc+eSVXfQjs2q6TlyHVhx
	 BSGJI58NtLw6CenR+rBSAKQLEJgH41t1FGzfUC+De5ihVX/ewFT27G1VyvUu7d9JVJFV3
	 AmtQWc5GzRjSNyNHYzSNLe5VpuX3oer/CFEvbI+k+oRtr7E4dtP09ZOw8wq/imirDGZmB
	 0RmUZIhPr+E3jJRhZXJTDd1BEVWXGbtyecmzJGLgRsQ/RTvM3GCb7OY31VAHE916f8/sC
	 hc2CLo7NoFMjM35oB/wLj7ZRSMNqNVh4szVsqJ5VNhdnjE9C6832YDAk/nBQQe9dKXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293165;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pSIZsPnu+yoH5Uc/ZTe8fp6LYs2YQqLvdk8qwy8Deoc=;
	b=wHH1vU8afau4NVD/kVT/lJNh24M5XQKX1uMSVNu+PhHG+FQd5ypeEb9iDYfO25q5lDYc
	 UfmDLkL7ldyVc3P0066uDRf3XUgVacbNa/aE4WDF/XAZWA72ZaYMwihGVKSW8xaI9Y7Ii
	 VuDvgUHoFIhERT9yJzMgiX5LMOlkp0uJdokvt2x0jCHNw1hs4ONkEqMwI6cXtaqE5bMq4
	 pSLp/9Sv0pWjiH6NZd4lcXDsRTKlRRKeffxV8EUfYzT2wtD8Neg+IH7gf6kgUxssIrNlW
	 hCbxgVJXlKj4riCXawwaHXqcDm74DJEd988pz1fMp+PfcoX79DojkW6cRWiYBmb7zvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mh4XtUC1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D0606A33A
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 06:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mh4XtUC1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6D21F008A1;
	Tue, 10 Nov 2026 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794293164;
	bh=pSIZsPnu+yoH5Uc/ZTe8fp6LYs2YQqLvdk8qwy8Deoc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mh4XtUC108SeGdlneiXQB/hgxRvksLiHdRPu97cqgLBM/OXwD7q+dXScJxVpE9935
	 Up1ujwwlExDTYIpIg6KuMO20NaH13fdhM/vSt7ns/BG01YPpW/LNZVobH/ATB6O6mh
	 Gi/7VTBZ4on5ImE06TkiQ+rS9Ilc5QEMcAWGxmZ1nPOMsAaebSjb0DdCrS7XlMBQS8
	 9B4sbbhdfFREE7Kb1WUuilb/2Z4InmaIF7wqec41JjO1RVok09rD7yRFdUgtnU4gy4
	 vNq/5XAd4EuHBqE+ZUY2o+nSN9YgL4FgQQA+Zx5BPjTfA5aP+yg1jAu873TiHN+Lu3
	 HSLe4Bu8R0HYQ==
Message-ID: <sashiko-outbox-206444@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/22] usb: typec: fix a few spelling mistakes in
 comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110064105.20335-22-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110064105.20335-22-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 06:46:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> No functional changes.
>=20
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110064105.2033=
5-1-shishunbo@cmss.chinamobile.com?part=3D21

