Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095873;
	b=ybnyX1HYnec6+sVUDXlOPrp0Pg52k8IrqmQR88lx49lD97FynPoHppCIfYlhkfA/PcaX
	 eNgdHbFi0N87Tw7uX1j/TpgtlDWA+dgawPCdU/EMz4WnY6lWxEDDgEjG50BZtpwAWTIPb
	 HLk8qIcw04GKnuQQcXz0nsMB/uf6yKRmP2wHd4/Noh+sbSBAXIC4u/ZEfzf2ZIiwpT401
	 q3gsc0z1Dr4i1LSZTgOL8RBgBbCtXf4Kob/vBcoebl74J60FbaoxoIO858tM18lZ5tr8J
	 uoMw5tJBC8Em9d9cg5gFxTCBozoRdFJB9fEtPrV8nvQgoCzAlg3dwYQI25xuD9E8NPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095873;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3TK5GwzkWFEyxM5+V3Tk1usO++nG1pLa2jp7pvpXdRc=;
	b=RH6AD+0Ui/4T8jsBQyJvml4gZZn2NgW9M+Hd6SY2HOOSB+vAybohEpc3TqFXiJep6yUH
	 s/AByATe7Ib76F8pqLad3aaSkO5Pr/oHvsf/y+XffGSdfhnVtdz4q1J8j4TDimWiMcsmm
	 dRQNxoaQ9Wfqp1cuFCPHk8D7QGCUl42pHm2tgPKImhfM9EhLTjtUTWKQ7MjWdNVmL6r3R
	 ezf+GBUCAYhbrh1Af22MU7hH79tuYD3PYvkEI7EPvDiVCBQwWSTXt+Ondmoyh+FWx4aTM
	 /Pp9anNscuIBv4p4j13/FIDeY7OLpvl12t6h5PZ1V+usyac1CwRdjnH9zPrEJMIqP/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWo7qxfE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF1606A333
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BWo7qxfE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE3E1F000C6;
	Thu, 19 Nov 2026 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095872;
	bh=3TK5GwzkWFEyxM5+V3Tk1usO++nG1pLa2jp7pvpXdRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BWo7qxfEB0hb2RVh+fwvDY81D+BgWFdulcql0tHJFDxaUqg5T0iV4yHigu2xRU5Pf
	 5WiZ7S6C1MQJvzR1eLjX68yB31qCJeTjH4lwZs6lYPdvgNgQ4SjmRA9sFklnlwQXNI
	 V/qbdqqWWcW+ww6erau2vfo/8tOTk7aG4rZGhcj8Oc/ZqOwhfrhSRAz7VA38c68cuV
	 Smax/VQT3JT4ITMTdvMHGCzUH5Ab4B61nWwXbDv8xJjoL1oVlVroOyCO61gsBztmnb
	 /jWBHNUGxyUiS3nqU6A0CXvm5U0HdkBjvvUnTDoXDm2FZa75I6Q6fj5MeOrSXP9v0w
	 ZcR/EjWotGsHA==
Message-ID: <sashiko-outbox-223198@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: usb: ci-hdrc-usb2: add
 spacemit,k1-usb2 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
References: <20261119-b4-spacemit-k1-usb2-v6-0-4a9add848728@linux.spacemit.com>
 <20261119-b4-spacemit-k1-usb2-v6-1-4a9add848728@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:44:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The USB2.0 controller on the SpacemiT K1 SoC is dual-role capable but
> has no internal OTG registers, this requires flags which disable
> related features set in platform data. Add a compatible string to match
> the platform data.
>=20
> Chipidea USB2 Controller on SpacemiT K1 requires 1 clock and 1 reset to
> work, add constraints for it.
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-b4-spacemi=
t-k1-usb2-v6-0-4a9add848728@linux.spacemit.com?part=3D1

