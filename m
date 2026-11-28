Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853581;
	b=jAkaCLVrID6ISmGvqjrQg0uurxp+94mbs61Wsn9ct6DICaQUuugtogdXEZ1I2Za06nay
	 5H3uhnejfaZKo0h7+vql6eNd9fxn7EL0RjVDj9oWcOJ9mB3FWYNBOskGNMf4G/HHBn+jd
	 LRe9rWqb863hCrTXrT17j1a32ik/sjfKYIrh/aAp56jjtAAu9OlDsoflKhkHSfkm5e9F6
	 9orBp2GLgS5cLuBDITGNcVzrrAu3V7SpQqDtXQ5ToMmzFLznZwlGeMxB4VAOufAYwFmMr
	 tQATTtBFzfbH8qPGxKgrCWifsgdASBjZYASPBFA0ZxLcoPLnBUNyGYsCe7vzAlq4/7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853581;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=VJHA4tc+K3oCHaoVJyDDT5hFwtwIFCiC0UsbuWK+t04=;
	b=4zCxxW+jw6JxdCP/8CZYQmYoIbszqPcu6qepAhuLyMiahcKp8UwQDHVwrSpqAoa8nZPj
	 M/neBSjkksQFv/6lZxwnelvb/K9EXLVhFj92YRllb5G8unSreYW/NskgrKcsFugZm1GTf
	 XjfmGWqomZJijRggITPFD3O0WYok5UYA/AxfDrzpfqFu49SasvTIhGGUV0nrWBQzqMzPx
	 JF1n0BgsfTr0EetgPXVUcaxAAsVtpYFZ14ZhGY1DUy1RSF6nkZEUCz16zoFjcFOl3/aH+
	 duSQAFycKvVjacDhuV9HZ8i6avp2ffe6x3mJAav+b/sS1v5l7hWqQ/XfUzF52WW1+NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dypscScL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26648606A31C
	for <linux-usb@vger.kernel.org>; Sat, 28 Nov 2026 08:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dypscScL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E060D1F000C1;
	Sat, 28 Nov 2026 08:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795853581;
	bh=VJHA4tc+K3oCHaoVJyDDT5hFwtwIFCiC0UsbuWK+t04=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dypscScLYBS2ILO9HQmRuIJNIvN+NMEm2ZIa7xbkB9QNGkd4aWAvvfJ+roWkiL0fx
	 04Z5dhOk9fnH7PdPF5AtgeGbjAqInXdg6qsOs3VVn5C8ArLHrLD3EPXycN4bourvoN
	 VxLmT6oIGRFqaNxFtuX0bYa9s3QtZMp/pKImr8GQZHVUqnUynlgwwkSCIRcRzNuqyi
	 P7p/5LmBZq+EqzOzDI6zZLKYf+2M252tGVrvbQ70+fmY+rlnApSH4TmDTrKwIvnJnl
	 iKpia0YxJo6Wfskw1sLfQvY+oI1JRaNcJANtgV+4+D2ALxMHUPe4fX3hOn22pzD7nI
	 hDMGKvzE8Yn/w==
Message-ID: <sashiko-outbox-238535@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 0/2] usb: gadget: u_ether: fix out-of-bounds read in
 get_ether_addr
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Chao" <liuc63@xiaopeng.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261128080722.1469508-1-liuc63@xiaopeng.com>
References: <20261128080722.1469508-1-liuc63@xiaopeng.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 08:13:00 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128080722.1469=
508-1-liuc63@xiaopeng.com
