Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715791;
	b=M3R/PE+L8qiAyymn8m5jjUJQvIPferH3E4UQwjAGk7QoUczOx5bKYDXPf1ycmusLjatD
	 zmTLUACz6cGd36ZdfUAqjQ8w2mZkyO5sDEfMF0mYXISCLhoo3lvloFPJe86mv+X0XFj1B
	 OJcBas47KU9xijTNENxaOhEIxRR2NZowmUGz39mMOALkIFLu0/lDmkcuLlQ7X3mMU5UNL
	 60rbAG/R72dKXWMNWvah5ASn2GTfgvaJadVXTpJFpuWOfeABDxdzmOh2vqZSLa4A13msU
	 pn/ooYeh6pzHVBczPSmHaGei6HbK0sK+TpaMyR7vbU8PIFSozTRooMlHdB66hcURvXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715791;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jwEEmiPFz1WXzR7jKQM8iA3ryYmOo5RifuzhgHHLbDc=;
	b=mlIA0V3x4ZvYcTS6FsiokXKBoHNUGrTK2a6Xcjp3Fu6qArcbur/1wBYxY+r6AMfYQJ5X
	 ehzQ0TMO+2Ko+sYzBz2LSvpjTERVf8TXmiwSsPJ6xeQHSqAnjRJKRFagKEcjCCAOO6L2A
	 /l48UdZCyVMcC58lJII3j4SVvf4dKEMOit/VclPB6RdGWwaEfwb956aTzGlIU+NkcK6D4
	 hICDwuCsurfZBvdsMGzRZHQCaWI36s7IgcI/JOu9wqEO6T7+na1reT70lmC2mHBPzIxea
	 jEO2Ke/KkeFzXhPTLEihi+0jwZ23zIYvhOuAnIM9YB6mEZYObJm/UM5pD0Ute50kRpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J413p73p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E09606D818
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J413p73p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFEA1F000C1;
	Tue,  3 Nov 2026 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793715790;
	bh=jwEEmiPFz1WXzR7jKQM8iA3ryYmOo5RifuzhgHHLbDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J413p73pEOAtFVaMwThphT5c42Bon4z8hScjRl1ykRKeaPPHyq5dYMInO2B+2GQjc
	 gyQMUTkS7aK4KjtQUlFIabYx6GiTtpHDzJdMA4g0+NG98DPrVvD9Ln2WdTB/GTDjSG
	 wON6VMwOkwA4DQIj3WxPtCxFgmqac2vS0Y4QWFDHsSoUhHUYdFUJTuUewyo5P8uSop
	 ApgpDWqUoG3omgCUtg4lHzCG7MGOMfBMit5dPDSl5CTstespbQYpNeBes1yWuWvbHY
	 CTefsRkrt8IYA1wA8RXOCmd84Srtx1l3vra4uwzNOmIbn/KuMYfz5GqIeO/QSeh4Cr
	 FkMHs/ofYpiPw==
Message-ID: <sashiko-outbox-195442@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-tipd-ace3-v8-1-770f42421753@chaosmail.tech>
References: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
 <20261103-tipd-ace3-v8-1-770f42421753@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:23:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A variant of tps6598x that is attached to a SPMI bus and is found on
> Apple devices starting from the M3 series
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-tipd-ace3-=
v8-0-770f42421753@chaosmail.tech?part=3D1

