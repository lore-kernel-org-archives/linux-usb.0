Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543397;
	b=rwNqsv6yLhcKPkJakUfaC1q+5rOEdqL87rdwNG+p7rMEPjz+f+oSIoQTe+jGhiHv4Ct1
	 hZW2vQW+nNFPw4JzdwD5dY+XZ0d2rt1cgDlMBMNgnW87yv9bW6+Rut8otLQlbG9qGZk+s
	 au0sMnbW97N4rg9uYPSNUcn01buj3Nms0dgPTQWgR3jy0DDkcTysDQcTnMrUai9T0mA6y
	 o6FI6BGlL3IIi4zEXbXzUUBhIEI/uTxkwpXsJpuBKJQfiSV8p1DHgnPdp3s80vBNRZHkV
	 h0RvYSm/oinMrliwWtGHToonxpSr/sKZFaZ93U+NoE84uj97hC5qMF8iAyj8g05l3PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=I7zaI/jgZdLyQ4Rqa8hW9Xuc+6JfihxG46zUSoU/xeI=;
	b=cFr/QJGxCPr6QSyAMGtvPGoQxd+0i8uNabH0UKAR5VDGDyYlIJFYvV7oy7mPx+BTrJzJ
	 JxrP8+XQSjX/YSerSMWqMe91KcxH/LAe0/71tx7KVmiyuphCaFvHV8SikwFiWCgopoe5e
	 0REqIbDBfxuf9oIEwLrYbvvoglDcTkhvgTIiYQDykIwZHkdgVP+5Y+JCO6am1JZJyyS5I
	 rQ+BuhspyVzQOKddwckN+47hhm8UleHoUtsyQSZE8/Pk480mtD9KYgnf3X5KBBttbT9lg
	 cmomHkIJwgBgHKiFgiaH2faGNi+auGIhjbrsCiKgZ+7KU38/GOB2KKVHg736I+0KV5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0DbpJJM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0B8606A319
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 00:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W0DbpJJM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CD71F000C9;
	Wed, 21 Oct 2026 00:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792543396;
	bh=I7zaI/jgZdLyQ4Rqa8hW9Xuc+6JfihxG46zUSoU/xeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0DbpJJMyWU2zuHaAGq3wAV1fnS/OK1lvFqxnfzQmO0gpAJ+E+i1ryV3nZdM4lSmP
	 hkVYoulilkRlRWIYgIYUa0K0uymQyRHN7gwwKfxEOdtCwsRsqD/fclaJRzDgsEzOK3
	 5A0WX3hFrSVHRvEDrDSWjJ39KOl5e1BSGpAPwxkGZu8tzUj9Yb3KJ+Isi/WFL3W90e
	 gcHKQBqhENXlEcF/tK3E7eIaJmyOigg/KPp/W/RQly9KIgzj8oPaoD+ZglaOwSd9f6
	 5RIUVv8QF1gTC4LBVqFJj8ar5u5vNeFjZj/d2kc2JF4W2L+NXGNXt3208oRBOcx+Jw
	 qqFwxkNzxw2gA==
Message-ID: <sashiko-outbox-179645@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/7] usb: dwc3: gadget: Track a timed out End Transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: =?utf-8?b?bGludXgtdXNiQHZnZXIua2VybmVsLm9yZw==?= <linux-usb@vger.kernel.org>
In-Reply-To: <5815c41a7e7923edb114741f29697cf0161f523c.1792542945.git.Thinh.Nguyen@synopsys.com>
References: <cover.1792542945.git.Thinh.Nguyen@synopsys.com>
 <5815c41a7e7923edb114741f29697cf0161f523c.1792542945.git.Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 00:43:16 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> If an End Transfer command with CMDIOC times out, the driver clears the
> resource index but keeps DWC3_EP_TRANSFER_STARTED without setting
> DWC3_EP_END_TRANSFER_PENDING. The command is still outstanding, but a
> later stop issues another End Transfer with resource index 0, and the
> next Start Transfer fails with "No Resource".
>=20
> Mark the timed out End Transfer as pending so that no other command is
> issued to the endpoint until it completes. For any other failure, there
> is no outstanding command, so clear DWC3_EP_TRANSFER_STARTED.
>=20
> Fixes: e192cc7b5239 ("usb: dwc3: gadget: move cmd_endtransfer to extra fu=
nction")
> Cc: stable@vger.kernel.org
> Reported-by: Selvarasu Ganesan <selvarasu.g@samsung.com>
> Closes: https://lore.kernel.org/linux-usb/3fdda532-8181-48e9-b58d-cad7289=
408e7@samsung.com/
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792542945.gi=
t.Thinh.Nguyen@synopsys.com?part=3D2

