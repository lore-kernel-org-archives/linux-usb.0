Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759200;
	b=hPNTtMIcSlzjZkEf+PFvwlAeJ/q6K1FZWGMpeGuf040nPbbN+TN9e5hMusMj9CGZzGn0
	 l5qEUKAYqIKSjqs/eMCDQSr864y6oBnX/1jBIuy9favMK+zK8m+gqTJDJheJBSrmFmA6o
	 SiXZHBx4KRRO4SNS9MyAdfZZwfRdx84mkDEjc9JY4Tzd3qAeqKKXRee1hdrN9zZAjb4KI
	 7kHXvzXx7iDb+rjk0KZFMsdBGIyk4Zow3m3BGuMLiFjYZu9ep0BgtASMAUWZCzwOofX2c
	 kuRbSyTEztwd8ZbGAy+uF2j68LgD8MMMNbawlMTkZVhlu7CR/dlsuBMRlA4jAGsnn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759200;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FjwJVPyDDEGIPKHuCdwTLoFIGPSQJ35GoGFxYkOMyDw=;
	b=4IQ8prIpJRZ60qy8MU3NaolusibVifrXOmiaHWa9KFCHy0By12l490JtAef5+es3Aqy8
	 N7hYZ50iYJg4PmOPh9/AwKM/QKFDR8NQf/bbY11f6H/Y1DOMnVKyuggJZTj3p5uAVVYQQ
	 tq/cw1MzTXeCvXqVZ22m8sSGbJNKi2+fJfGZazDFfvTimxij9tbDhhXD8PAF1mD3nTMS4
	 0raQ2bX7bEkZuhnvtdF2QYZ4EtatTl82Rzab5mc2aAXlG/L2JOY0OjK9GUYVD/8OQO0Lt
	 jpldMbB8bwwBQ5Zwu/42ZX6Cg3k+/o01HIrqtjVU7ZH3HhDF2MJcL5FWSvro331FTbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfBTJh8V;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCD5606A32E
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HfBTJh8V
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2ED1F000C1;
	Wed,  4 Nov 2026 02:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793759200;
	bh=FjwJVPyDDEGIPKHuCdwTLoFIGPSQJ35GoGFxYkOMyDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HfBTJh8VWvd65M2DaPcuA7AyCib+zE2AAXggYTFn/+EekdQ8yJ3JGsLa9hBwl3MT2
	 w2zO2ZWaPgzhakOu4cyhX7Qo3+rVKMcozQfz4nLSdPFmbI0udGj/sPUX3e0RqVDbuT
	 jvaduAgMDe40le9Tu3U28Zz6JpsluravRwMWOMWmJt4BcZVZMaNzztx5Vagx6KRs14
	 s/aHCc820yl2Tg7T4U5q2hcgGLLXaNzmVyxEQskO6D2JiLj4qvarEshtg2Ne4YNA9V
	 bYT0KbHkxN51yaYFMVJfpXIq6kJPDrbQNwu/lilO13nN53zoVqw68s66HkEI89KfgH
	 whAT6xMAuWQMA==
Message-ID: <sashiko-outbox-196461@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: cdns3: drop the second function reference after
 use
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261104021453.1468443-1-vulab@iscas.ac.cn>
References: <20261104021453.1468443-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 02:26:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> cdns3_get_second_fun() returns a struct pci_dev obtained with
> pci_get_device(), which takes a reference on the device, and both
> cdns3_pci_probe() and cdns3_pci_remove() keep that reference until they
> return without ever dropping it.  Probing or removing either function of
> the USBSS controller therefore pins the sibling PCI device and its
> driver's module forever.  cdns3_get_second_fun() also leaks the
> reference itself when the device it finds is not one of the two expected
> functions.
>=20
> Release the reference on every path that gives up ownership: in the
> error return of cdns3_get_second_fun(), and at the end of the probe and
> remove callbacks.
>=20
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104021453.1468=
443-1-vulab@iscas.ac.cn?part=3D1

