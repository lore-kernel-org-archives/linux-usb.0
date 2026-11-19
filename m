Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109641;
	b=rwiJE216yRGNE/PtS0twtukhPsOtDRjkfYBAclOin/MaPbeGyT69wcVKtz1jkSA2/XDn
	 /a6ZlGI9693xMfp6Z3INxWW3ZQbygG+x0/5gwwOWgWlNm3oMm3CxY7Q60zc7Cd+uVaVwu
	 cITV6E4D3cC92fM31VGopUh4Jq6SEpDT42Sr0bCWAHJWPht8LM2wDuFggEnfSM/FkujOb
	 dlrtVxgIRJGfCxKaXOgtvUUxFDa9oEjN6yrhW8nas1ZcP+4bhtg8eCNgSywl8D6XYbtWZ
	 gQu/9/Pr6FV+9WiLs5o2nyCAFFvQPU4+lT6MgGXsE6k7yRYPKTl+uo47OGLC46e40UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109641;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cM2QEYF6spcLkOOsXQRbs6vrtjR9b8rA+/QSZ/WNeeQ=;
	b=h9gopplMTGE/W3krVrjpC7VC7UpdyzfC3R3W7GmG6+5aH9JQO51nX9K35JVveQ6dnhMd
	 U/iEFYG5NH9WQ2x1Xx9JTfHipTDffcfP8i1lR7g6EWaJvqc0Lp8IbVFo7DnjlJeESrMG9
	 lG4bjLPrXSh0vQ9DEocPOdPEOPhqvH87ML0n7comvvkH/Qp4ZbZWFp7S3Yjp37g9awX9J
	 VDPEUDhnWvKaoLEfpOKnoPEtNvp/wn43HVDWfLL5d09ca1IjDDlJB9/sHGc/e8RMYUPO9
	 UCzZyQK7+uokPRM746UbLZUh0DZ5DBRREeyhN0P968UT5i4t92lMODXuThjshJE3H8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWZgPjhn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030E606A325
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QWZgPjhn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5F61F000C4;
	Thu, 19 Nov 2026 17:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109641;
	bh=cM2QEYF6spcLkOOsXQRbs6vrtjR9b8rA+/QSZ/WNeeQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QWZgPjhnJrU0nGAGapZ+4rQEdkUSMdg69HAltjpwJ5pL13xg9yLIztXLjFo/JV0y2
	 6gzUISgSgFnBdvqWjfzbqO7RwUE3DC3+X7xKe6wBU+AoBem0SQ352SUTTFOvy/YvZ0
	 aGzVns7ojCKRatgCG3z4lwA8/gMeiG1AT/PhbDm9r4JzuCKjDXyl1VJuxvKaOLVyNU
	 6gLvXeOpLYj0nRksWZDucVnmlx4glbwQ95T5OKASl4udpfUBtjlVoB8tMyTaJZj655
	 T6CWGjouQYO7+Apyi0WE4cUv+Sb/AuCDgnmzqAVpjMpXHQ/mhZZgv/oeqtzyFK1myi
	 yYdz4qsauO3EA==
Message-ID: <sashiko-outbox-223703@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/18] thunderbolt: Add support for shared flow control
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-17-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-17-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:34:00 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Gil Fine <gil.fine@linux.intel.com>
>=20
> It is possible to make several paths share the ingress adapter buffers.
> There are two possible configurations: shared flow control and
> restricted shared flow control where the former shares all the
> configured buffers and the latter shares specified amount of the
> configured buffers for the paths going through an ingress adapter.
>=20
> This adds support for both methods.
>=20
> While there fix the rollback of NFC credits to start from correct index.
>=20
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D16

