Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109102;
	b=ySqVfi2QGiKb6Bqk9b17zgPTLfBuf3UFRwYRXg8f5M1NNbAHpTdzI3LUtgEN2J0N9zw+
	 ijwqNNzGy35bQij89fUrJULutnAjLwEsORIlMda397sRJUNRlExtihuw4Ay3xAihWLZtT
	 qaq17GAxacltecb9CRVB6/ZwoCJMSwLyfIpuTb6VgXVtZsZ1V13PXb10gUdp15wmCXMuQ
	 GX9gXkmM7WTZoHBXVxJWGvAm/nTVX0THtpXovrBcwZZy5iy2icctWuPkkD8gqikZo81lz
	 0Igu2Ev/2xxqzjScH4ONKD37cxBU3VUiLZ7s+4eLJ+ZK23ecaAiJdXqhLJZZhIb1EvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109102;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ck5h+6SiXmy5OdWgn+5jioYk78rRvyCGb1exzDxn7So=;
	b=FKFE6J2JpZt1094/FbPvnZgHATzbgTK3We2j7ShDHgrjoShT8ReNGVvqZA7KI950NhJp
	 oQPA2J7pIIU/bQfIIre87MSOyJSR+y2UpvApuucfYRfGKpwyyLSj9EmL1EF6DzhbC4/92
	 F787xcT46BIY2M9OCl/n2NllK305IwocPla5fkjlQpBxO0Mbl1vw7gDJPLJgg/C5RQ/9K
	 /ghSIkqAY+VxgsHFpLwFM69wzqXvoAdAt0SFWfPI3BpOBlL/O0irD1nmwCiA7WXodOmSu
	 Of9ysb7FAtnbwptU7Lq7qyWNoIe3TbCyNu7/S/D2vtGseGU9TxKOVyXpsuTe27rOT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="H/v4uKjs";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF73606A326
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H/v4uKjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE601F000C4;
	Thu, 19 Nov 2026 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109102;
	bh=Ck5h+6SiXmy5OdWgn+5jioYk78rRvyCGb1exzDxn7So=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=H/v4uKjsfa4rRr0nBoYCm6cCaLb3/qLWta0bV8UPGC7bPPLsOCAVszQ1o1YvMbD7v
	 ZJphAL16YAgUSgXwwJ5fCteVFKDgvGpv7L4oo8UG40LyewgbY+U/LCKCxX+LKKq9iq
	 9QMO8DFwMOKRWXhxat/07MCHuYxd4wLmDHmJ9fCfBiB2rfMY5uoQhrlr0etooPlNuy
	 L+L5IiCgnHRK3qVXvkboKCQd0euD8hg8hQufoqk+uyfSG3/wTF6SKV2LEINURjBUgP
	 J3kzDRp2ze5miPCs6kn5x0Ur4VzAqT3VkwhrY//Kv9ZMHgC3rJHgu3g3Jj2UhW/Q/j
	 a7ePNVUy+whPA==
Message-ID: <sashiko-outbox-223689@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/18] thunderbolt: Return -ESHUTDOWN when control
 channel is not running
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-7-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-7-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:25:01 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: "Mika Westerberg (Intel)" <westeri@kernel.org>
>=20
> Use -ESHUTDOWN like the ring layer does when the control channel is not
> running, and drop the WARN(). On buses like Thunderbolt/USB4 user can
> unplug a device any time so it is expected that control channel reads
> and writes fail and the callers are supposed to handle that.
>=20
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D6

