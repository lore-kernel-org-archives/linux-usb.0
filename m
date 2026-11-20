Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795166995;
	b=gyocdY2QlM4qp/DBsWW4Ba1cQzyY+nCV328B4Q/bl64rD78uRBlnqi9FTogVvvE5EMDx
	 6qJX/mXthv43j69smpi/BxMG2aTS8J6/XIkCX4mUsrcgL6WsiWeOPBoQA1foalEZKsWnn
	 R7J3HoSnllMc0rAEbNXfwKK+ChN7SM12hbpon1UD+EffJCldzbeF7uuOeFAuMBcLgvqBC
	 9FOnGFVVu7R6wu3sPwYutxoodAeAlPZCogqC/2lRfhdxxcqFRJkTxr1vv6n7Htld4l51A
	 dV3hfbh3sdF/Fo2xk+Y725Ftov4Omr2zLBGaD1kGNOxkojhn6efE9if9BJGLnY7a6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795166995;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kM4tC8isa0FgF+GLfzidWGHZ1iL2SL+jcnyHN0WDar0=;
	b=q7qVmG45am/5mbktUHuZ3dDwXRyuexd5z5MFDBhEa2YVXbW0TDYqRAI6gP4U9My/AzSR
	 liN2lGCGBKQezMsIq5ybhna2VcG+9NetwWrLT6NgrWG+2qH//PXeERCNVa8fP7dBfBT6R
	 N66s+pViJZOKLFizR8R4nRxog4V6bFae61olX3EYLEPXuaZnmhFg37+5j3erf5Y6iNDeC
	 z+OGrUpB8jhxm6hQ3Ny2JVH1kngVLqIeSOWOsrdrWCorsQo0mDKduAVM0oqiO0aKM0vCp
	 V9kgSe5LwqfiwZOyGsLCZdrX2KvOaSkjADJo+4xpG4M3fC4UUC3aS7QY61VwEBl2+ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXTKtqel;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60AD606A32A
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXTKtqel
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6698B1F000D4;
	Fri, 20 Nov 2026 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795166994;
	bh=kM4tC8isa0FgF+GLfzidWGHZ1iL2SL+jcnyHN0WDar0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXTKtqelnSqAZiNr5yCvpK9o3w/D+yc5+V97WNt7GGQqoQC+vApjKTHtp3kKhvgoG
	 rW920MjsWiVWFbf8t1b9Z9nOjikYcIImLu4gxH4k1FZ0213fhNd8M2OOQRQ7TXQ7Qe
	 k8K+tRbCNe7loHr7emPCWiFgRv7XMQzdIHFNCLJqSLFkk66h5AOAcjawtWiFhxUvG2
	 a3Qbu9quzQR41ne5qtjUi1xkZKWCUeWvk7FY9786Qit2WDeAHoNd8BjWR757X1nBh8
	 mCgHIpozkwM0XbY2cvyPNPB9NHehsAg29yNAs9McEJ09ZWYkiCzHHDE1EJJo8fUrCD
	 IMaG7WaCzWuUQ==
Message-ID: <sashiko-outbox-224849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_midi2: disable endpoints before
 freeing descriptors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoli Zhang" <26031212468@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120092129.1388279-1-26031212468@stu.xidian.edu.cn>
References: <20261120042607.1347854-1-26031212468@stu.xidian.edu.cn>
 <20261120092129.1388279-1-26031212468@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:29:53 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The dummy_hcd driver keeps pointers to endpoint descriptors while endpoin=
ts
> are enabled. Its timer dereferences these pointers in find_endpoint().
> However, f_midi2_unbind() frees the function descriptors, while
> f_midi2_disable() currently only resets operation_mode. Disable the
> endpoints before the unbind callback releases their descriptors.
>=20
> Disable the MIDI 1.0 endpoints and all MIDI 2.0 endpoints from
> f_midi2_disable(). Check each endpoint pointer because the configured
> direction can leave an endpoint unallocated. Keep f_midi2_stop_eps()
> unchanged so altsetting transitions retain their existing request cleanup
> behavior.
>=20
> Fixes: 8b645922b223 ("usb: gadget: Add support for USB MIDI 2.0 function =
driver")
> Reported-by: syzbot+599d4e8994a656eafe15@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D599d4e8994a656eafe15
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120092129.1388=
279-1-26031212468@stu.xidian.edu.cn?part=3D1

