Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647220;
	b=zxe13LS3sXy9q/OneKUx4Rc9aw8yDxZ5xT4RWYKRcKHTh/rfUwTIQhOG9w5QTGzdm2K6
	 bgOcRht9Aox3a6m/x59muZbU1plMRUbqornuvE+Y9Nwi/GlAl3YH4u2+BCmq+EFoOleDa
	 GU+Cjm7Y4Yi5WB51EWp/CHtR6SVnAV53PuEgfjRXC5gBDJyDYYxt0jfiwEZqW3IVpa22s
	 lRUrTDXS/h/Z/VtjO+aC2nPFWTR+5oAI9HXJz/w6l8w9FjIslUzBc8xXv3zBBNLFnyvW6
	 tSgy+nt38VwfFnBuCr96n4Q14W0ASDY/dtCGzTQ/4dBcC83qfaXBqWki/ecCmUZ7NOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647220;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+NAlUm3VCUxlGbF5lHx0Rid2SbOG5uUCL8vSpYL5HdA=;
	b=sArkZoHlnvZl3Vse31ov31C8rxAzftDSt9vRzi7mr5nO06uT/iPevcwJkv1Iq6v5plRn
	 rbXTbsMoFc0XbZ66PrF8lCZCmc7TnDtD7NDXOh74BjtbTiOfZe1c4MdXY3KZ0kx88oyLI
	 K2+9nfSoWndtN6pCrbnjd54UdZkpBo384RtC0ZntsK+2VJ3ZqMj8fCTuj7vTdSj8hWMTQ
	 KglSVT232/DJPmaVWo862bKlj7zTxQMW374WlFOCNyZd51Mrrud4zC7EcozLF6Wg5QtYn
	 DyqT3PaYuRrLY3nwAryuI7ERGawUVxzXiCR/iEYZQV2lpQdHVbjBpIPZ2iH/ZoQF6Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6vDsxPh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72058606A688
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6vDsxPh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35F81F000C4;
	Wed, 25 Nov 2026 22:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647220;
	bh=+NAlUm3VCUxlGbF5lHx0Rid2SbOG5uUCL8vSpYL5HdA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f6vDsxPhophd4koMgttyE/fjpKYqboFS2Izy8SB5Io7FStsBF9OU6zYGUflFmpVLw
	 wuwltiRXgWddv9zXVb0mWZ/FcANVC8qN1oCqAs7tM7CAIUoDjrqO7/jLHV+ihlzNmh
	 xju6Imij+LhYgW2H7Iof+A5avKN9AklmlvG3w2mOU/xv7M+3M76P3zXQYgOHCuvfsF
	 6XSO4CJfuD1V2xd0lnuxFYZkM2tiyr9oOOjTymImSmtZklLTUphS6L1y7CHdsuYN/U
	 INBCZSEFk1bxUZCKbLBV0R3gouzkn58tC4kQ3C8VVn8GkCQWukZ7ckgbRskXJGWyhv
	 XTiI4IF8J4zxg==
Message-ID: <sashiko-outbox-234310@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 0/2] usb: misc: usbio: fix fatal URB resubmission and
 probe maxpacket bounds
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elkin Cruz" <elkin@google.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261125222828.1452483-1-elkin@google.com>
References: <20261125222828.1452483-1-elkin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:53:39 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125222828.1452=
483-1-elkin@google.com
