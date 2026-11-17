Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921711;
	b=nPyNZDR8H7QqhtXerdEvfDyXUsQyuZhh13DxUQandaT2AcuiVWr1l+U2HpKIoh2zsIFE
	 nF1GKETFSrqJOOU7wyfMYRkSxO1yP0HIeSF7+v03SXp6LC4p/xtaNlBznEu04f8hZbno/
	 7FO7pSseHFmUqr85Pz1aDDjwaJYFAQE0bMWhP2mUfhK/eVNZ9Q41+WJ4YvavV7+kNXMu6
	 bGu1nZqNGANWqc1xuSiDKZS9OSiW6kFHcpgOyzgxxR4VmV97jE9flYv8ykgoiHtmmE8fn
	 4RCsz5Qw0Q/Fs8dDOKbjRNx9KLtKLt5UNCMp8BcKLRgKb4YmVj/Id8upTAzE2fIar4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921711;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=++lSBBYYfpmwFz+ReZ8Td24HxOutw7KykOy1Cbb41yk=;
	b=yZ2vvpwN5vIW8bPTvoePPWQqRmGiqIgHTUf+4JfiUo//yKwFaUrGqhBTIRqovyXbp7ob
	 ApGZdMmyxntylQ2sjeqChQBOV0Ck8vwD0z5lfcp7rWOyzOazExvLLSvwbv9lU0cGltadk
	 M3ZKlLrxImY18mZ3fiDz30UhCC0ZNJWSBks7GvOP/ns79KSmZJnPXrJRnKNX4mfG5jsEG
	 bxkKSwtVbg1gXTY0RA4NwKoajToGs0zFnsh50jsQaUv1HjJJgqNojZSmGgd/KjlwLcc+e
	 FxBNSUOsVc50rKtVo4YzyqhvmIdj2FA3gErJG4jIWED31bs/FCz+nGjgL/WGQ+/hEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZYsOs8Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97438606A32A
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DZYsOs8Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E971F000C4;
	Tue, 17 Nov 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794921711;
	bh=++lSBBYYfpmwFz+ReZ8Td24HxOutw7KykOy1Cbb41yk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DZYsOs8Q9Sy/1v2UnpW2AjYFk4pmLmJilMiamIxxy/Cc+PsVc+xdgMmyonOxT+f4o
	 TWVZzyLd1p4QZkpytV8BgQ0rtP5g07kDpTZqplNPXZvmAM2GEtOoy2TVDIt2LjlrxJ
	 JTLMRQvEh/U6cE6Mc0p493BqwbkZtTjmCRSFtaYZqXCbh78D4K3VmzvoqB6OlQCRhU
	 MKPJ2E9aobLAgWUtyIVPkTteioHksfMIRkKklRQJVxTDxvB5pnaY2bj/3NXqxCj1hc
	 RsxEtn94P/Dj5gd1y4cp0QWCQ4nzlUBTTJe5E1gY4RA75ECgMu1LiyVfQU/n2J1lS0
	 x7RvVPlb/L9+Q==
Message-ID: <sashiko-outbox-218866@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] usb: gadget: f_hid: fix get_req leak when
 usb_gstrings_attach() fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261117125051.5646-4-shishunbo@cmss.chinamobile.com>
References: <179486710796.2938203.13522037990167268712.b4-review@b4>
 <20261117125051.5646-1-shishunbo@cmss.chinamobile.com>
 <20261117125051.5646-4-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 13:21:50 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> In hidg_bind(), hidg->get_req is allocated early; if
> usb_gstrings_attach() subsequently fails, the function returns
> directly without freeing the request, leaking it.  Unwind through
> the fail path instead.
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117125051.5646=
-1-shishunbo@cmss.chinamobile.com?part=3D3

