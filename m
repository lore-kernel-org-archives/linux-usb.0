Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592882;
	b=BjaK4goUwESlWGFsXJHVfq/KQDY3Qga2PLO82f4AWgYnOcnqFZmWYIflTP3lrijPIi/L
	 4PyWlRdhctMu37kaF2JNItCBFhKbWjnw6+pbhHzwb8u4erNv+aeKrlF+kKxVuZ9akNPHV
	 cu6tYbIs056OADwyhQulOsOqnF2nqUfHxFIJA/OC2RLeCPI5QaCmC8+neguLFh11WgFXr
	 8ulB560Zx8xv2hkpEVuwIc/BzmQ73Xnur2S+PX7/q2iyjKXyn7cLC7TLvxjioCDq9txw7
	 4GzHIhVo4z+NCTNOslFQHt/5XCsMprrukyVR7DBzYt55589hS73/pD378GM2hRsYf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592882;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=08P1WuRjlwv8UtATY8/gyk/oXy3jLivU8JS/P5ryJyQ=;
	b=2+tY66E7MFK4C/1A81zvUt+730HKURosWEVadarPlskT8APsPGMImVk7oe/V6eie9/Sa
	 qaysbkIfyYXFW2pIc2hdNNxk28GJAd31tAyGKALgs4PvHHbhiBPRS4GBof5WH2duZz6Ql
	 WqvuYx6ISkDdxj/omJVIJ9aJofLP6TadEBM3yfSRdI4yRE/JWZyWy68VXE1tBGmHTgryO
	 OT8axD/9eCZzN7/HYRaMxnQ0V22Re5zaOgt/vrb8ayM1LZ5aSzoZnQ0H/jiZ1YGzfe8d2
	 bnT6YTgwUtcqAHz5+fI2tgIK8qMcKDgHwlHTwxlHghMMZyGoPSsDmRpfQoPTuCrkvHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuYR1DZM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2FC606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UuYR1DZM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B941F000C6;
	Wed, 21 Oct 2026 14:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592882;
	bh=08P1WuRjlwv8UtATY8/gyk/oXy3jLivU8JS/P5ryJyQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UuYR1DZMeuZROJX0lNUzs6t395yBAFo5wn2o3Ai7GSptTbQW6Sy9rocS/NBpb+dSC
	 pfHRSAeJMGnT444yrBxeTRhwWePGGbnHxKVJt7bYxjQVj/lwAOYbFjEYC66Ek7yYQb
	 3dOLvURpB+VTwOhRwmd1CLjfA+ARC6/APyZ/FCWx/Ae+ZzIED8gmJXX8GRBlqD4MWp
	 hEiIG1zhSYYgOG1eiyJQDVDsNIbpAkGjwe6v4mZmAZmE1VUjhs8q7Qr1kkyEWRbwSR
	 RjhmFS9lvQbKKv4/QzTDZfSLsqeGrPaaRUPX21Q6yObnDRam4DDrp6zRziusT0cHf6
	 wWmb+g0x7hqMw==
Message-ID: <sashiko-outbox-180373@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/11] USB: serial: io_edgeport: fix potential
 NULL-deref at open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-5-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-5-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:28:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Do not mark the port as open until after the write FIFO has been
> allocated and initialised to prevent a racing interrupt completion from
> attempting to send stale data and dereferencing the FIFO buffer pointer.
>=20
> Note that the open flag defaults to false and is cleared on close() so
> there is no need to reinitialise it on every open().
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D4

