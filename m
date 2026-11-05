Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893637;
	b=LPXkRCPleI82BIeQ+Za80FaIwGgJ8N1JJTVvFTVuFZSE4B2H4mntQOA58zcOQRIKInqx
	 uBbO50Tj5Pp5gUat+OwScr0d4NM9Hq69Ic+IyhNiTozqcEsZpSiFmJ+i1RaSf0CkxVgA9
	 pyqN2nBoi492vbQ88PYqQVMNuq0AsTxWPP5J7qZbo0qTDBpmgXnLJaFvGxURFT5lRcNNE
	 p7owOx+bvF24N67kCCd2kforAbgPqFNhgluCOIdnzanymMyeYzdTdY6z70Cw6qGhoRrnf
	 YfgA3t3H30cUUzAFVpyFeE3JgnBl0Caz3t0wO1R/u3YQBf2Gz7LbADmGX4wUKwQ0kag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893637;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=brZ9LrBt0321u4GEIaMGAdfBr6oLK7fXMyjEKlYAAKM=;
	b=p/4lS1XYj3x94GWawdneq+J1gQGx38RSfFtGaRdXgPS7yN4cltKzsOa8GA6VRdMwU95z
	 kam7SyLLrwFvkVOFN4GzmutKRHYleNS4mwUuQDwwphK5HLm1STwn5ui7b70KEUEh86Yqu
	 Fe8U+7LMQ2O9oq3FYWF7+d5BICBLUZVn+dqKQQ0Psa/M6HjT40dRHlo0Dj6XDNFXgAUWa
	 9yVHni5LyXsVskoTMqnBUG5rxQ6t3UZ7SKSQW88K+dAnUxx8u5tTK/iaqXDs3kIXZ61pS
	 ystda0K0wxxtGU3K9RNRE54Jl6xEp7/sdE4gLbDk/TtPxLJhxyxJ7/zijzkVXtDiYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbCuPCDS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908756082BD7
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IbCuPCDS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537501F00A15;
	Thu,  5 Nov 2026 15:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793893637;
	bh=brZ9LrBt0321u4GEIaMGAdfBr6oLK7fXMyjEKlYAAKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IbCuPCDSP7elVxUi1a1pzKTcIbpMKFcsXVfrsQ/ocA3W+AoyJRu8rP24APJH5WuiD
	 IbIC4pbvgPbR8/k5SL/7cK8r42rzfTGAXGMKFooVn9cr2jvkDFbXI31EcEVyhDs6X8
	 Ft6a8RkdqIeHVnLb8OM1F9+MbYpCMDVqZ31biAz6MPHX8Yd8uVCcA5l+enbmFbT2cf
	 a5SYTE87J99R/GrwjGHCy14DYi+l+fdHS9QQcDm4vhltppBonoB2Q9lLKBSjI7mnSj
	 eTCAFCDIsvOsmVZ7KwT9pgSKY3iu7vwKPf2e9WgA7ZeCAnNAwH5MFPTWW6VYi/YoqD
	 Mo27m2zuGtdPg==
Message-ID: <sashiko-outbox-199345@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: usbtest: free the urb when unlink1() fails early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021532.1468741-1-vulab@iscas.ac.cn>
References: <20261104021532.1468741-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 15:47:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> unlink1() allocates the urb and its transfer buffer with
> simple_alloc_urb() and only frees them with simple_free_urb() after the
> completion has been waited for.  Two error returns skip that cleanup and
> leak both the urb and its coherent buffer, which also pins the device.
>=20
> usb_submit_urb() never frees the urb it was given, so the failure return
> has to free it.  The unexpected usb_unlink_urb() error return still
> leaves the urb submitted, so kill it first to be sure the completion
> callback has run before the urb and its buffer go away.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021532.1468=
741-1-vulab@iscas.ac.cn?part=3D1

