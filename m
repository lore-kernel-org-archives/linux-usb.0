Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850785;
	b=TUmLBUo+rKnyAGNPX5bKFTnyyTbazwBonJ24rGx185jKEo0CarxgJ7GNfcut5GUsjrox
	 JUCQj4Akm8omRaT4wQlMbkpfgEqP2jkVlqFDIqtpUXUhmz4xZkaX0Mb2Hs8aR//5ZDbEc
	 UE9OOv3Vsx2rJTlmYH8eDu9SvVMLUSHae6/ZSwVJvlPtrN7D6plDTuchXoKX35LjwjgHl
	 UkJX50x68isHPan7vkOkyd63MbiPmvmB2rAIQtwZAECOxuV7+5hQJ42ZM+FjVnARaqT70
	 EFblfPXJn6/4wQnZYw9I8Vf9pE6VfOp4goBjtVBMDHz4kVzg94ZiKEDtjGQmgGIihLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850785;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=z+OLjO14UOItE+BLGzYTTJwm/xUx3IgId4Clo2LkUHc=;
	b=K8jy0NBc4op34DkEPuu7zBAJTKq2C5pFqTTOXpbX4fgXmVLUEjiukp2BYBcMEqj/QsxC
	 cdeDi5B7BJiyszF1hTD7uo3DOgcGxQdySr+OlccsR+UfpYEdZ+9TWmUu7RFRQn2+r++zc
	 DhP0tMor5s52IPNAPlMOEtMbfQS2FqRJc9Ervo3CRRY8Pk7oBscBRPykgHsnhe2/T5Gdb
	 0l6v/mfVfBynY+hAPKkwP/6LeA2xPhtVEDtN3hMCmyYsGgf0vGNS7HvfMOvaH7mDMU1Gv
	 xc0oet/uB1PYbQ250YVJTeySHTPXuouC+vxz20T+2hTNmWILCp3TNC680RZKjPnuXag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAaTMYjl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF522606A31B
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 03:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAaTMYjl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3DF1F000C1;
	Thu,  5 Nov 2026 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793850784;
	bh=z+OLjO14UOItE+BLGzYTTJwm/xUx3IgId4Clo2LkUHc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=kAaTMYjls0C99WRWQzlwsEifjnBThPJPDFbsp7GzhP7iutXvI7SeRNd1Kpx+DC8I6
	 TNcuWzX5Qn6BLt/0ODPgJ2zA2zyS8dRvx1AKMJLnQhOFWX2qcuAOCfsgmc+RmwP8Um
	 zdgXD/t/BNIcO+P2XepiZH1XjOBTbPzp3VajY/mCqgT8cP8mq/WvJ6+9LzZ4KQdpOi
	 9Yxqjm7hKw35pGI3/nyoW5oUBtqT46tx/jyv3HZ0qw5HJnxfzHrEr/wXBKp90YJGAU
	 fOx2m8fvHYmxf70RvScbeax1BCG1ku4HDVWQ6VezAViK2Zh/oGsVSGSxQGz60HZcp1
	 qZUGDKqk3MQXw==
Message-ID: <sashiko-outbox-198525@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: dwc2: gadget: fix off-by-one in ep_from_windex
 bounds check
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fang Xieyan" <fangxy@xiaopeng.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261105034946.20566-1-fangxy@xiaopeng.com>
References: <20261105034946.20566-1-fangxy@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 03:53:03 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ep_from_windex() checks whether idx is greater than
> hsotg->num_of_eps. However, num_of_eps includes EP0, so valid
> endpoint indices are in the range [0, num_of_eps - 1].
>=20
> When idx equals num_of_eps, index_to_ep() accesses the endpoint
> array beyond the configured range. This results in an out-of-bounds
> access when num_of_eps equals MAX_EPS_CHANNELS. Otherwise, the
> zero-initialized array entry is NULL and the request is rejected.
>=20
> Reject indices greater than or equal to num_of_eps.
>=20
> Fixes: c6f5c050e2a7 ("usb: dwc2: gadget: add bi-directional endpoint supp=
ort")
> Cc: stable@vger.kernel.org
> Reviewed-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> Signed-off-by: Fang Xieyan <fangxy@xiaopeng.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105034946.2056=
6-1-fangxy@xiaopeng.com?part=3D1

