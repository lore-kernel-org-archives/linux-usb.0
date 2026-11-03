Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706193;
	b=KBdyLvZ1sG7HJONMZQpGoHAQKi12OYlwAF03wkFdZocjOWz4eE6/A0abtVUHolwT3Tgk
	 e1XiAMgnOwxwXSSITjP7URLkN7RBrFaHr+UCAZJ3GP84VKQMH/PzkaromVj9co3DUxc9D
	 J0jy6wOAHEBM3hWlZxF8gsrow7XnN/G3IObk15U3Tkgkhw1c3/+xIUOwM5XJjqW0O+IB/
	 Af78VeqvTa8xL7kPCerE7Ae33W3ePFJFybvnD/nRlNbgMTkHZufuo4acs6bwNir/0V6Dm
	 LvlsNqh1ACABf6n/j8d3Z5VfcuxPotAL/0vA7pcP1v274DhjpmpTAvKksjJEuSCQT+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706193;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B4R3qgipT5790FdlRr+HUPIiB+HTbFrgabZgTgZkN2s=;
	b=qCSn0A7oEvr7vE9izzPUX5FOj5D9FbBkl02MCxGldtFwH+8hg9mjd9qTWoXX7WtVsSoG
	 KF9CGPbEDImojYwUphAfPzkbLUW9gZTvpWvOasqBBHHB27HwmUK8Pf3OrXdsCWfzCU85s
	 Zd5Lx1pCYsmfUeW7ERMA3VqzdP3vV48HrcDIKIA3u0gZBF/kmLgSQIqry+An4kKiFCgcL
	 bqNzkpbC4tfzcNU/BjEolfcpHShViip8gk5OjOxF00VBOXEcyreZFBfIEdb8LyK6xIaWK
	 SnfogQwCrYGhwQgBwntzqlG/C5O4kfoscbPQHR0eptVDIb0hW8XHv4SJjBg/UMAQM4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KdvqAIv2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D1606A33B
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 11:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KdvqAIv2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D3F1F000C1;
	Tue,  3 Nov 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706192;
	bh=B4R3qgipT5790FdlRr+HUPIiB+HTbFrgabZgTgZkN2s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KdvqAIv2S7F1v8HP+hYGkU4rY7o6RN+fAQRs3NZAdRmQzcZAFvByOcVub+OnWGxZ0
	 0/Wx8WhxZ/NUzPuXCfC9Zj1Jpn4nBJaKGYslr3O9Gj4+FHNpDoTGmoZigCFdwf609f
	 Gk+ZOvb6Zv/Az+mSVx6AvAkwujBuo4Me6TNHiIiQu5gRmWh6vSA4XQuqNDqdQmuBVp
	 Qwf+w9Jj2yH4KVH4FLBpE28hhayI06Ev/u2Ft9VfxgKNj61MCM5W1x+E0JPomB15wm
	 zApX7etZoNWG65x0Khe58zkblbeN2jlSg9By82ABXnt0oFSLwzhAOg46Mt7at6NNVq
	 vd90Y9iF1lq7g==
Message-ID: <sashiko-outbox-195172@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] usb: typec: tcpci_rt1711h: Enable SOP'
 communication
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
References: <20261103-husb311-cable-comm-v1-0-6217dabc1a85@flipper.net>
 <20261103-husb311-cable-comm-v1-3-6217dabc1a85@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:43:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> These TCPCs transmit and receive SOP' as the TCPCI specification
> defines, so let TCPM discover e-marked cables through them and learn
> their current and speed ratings.
>=20
> Tested on a HUSB311 with an e-marked 5A EPR cable.
>=20
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-husb311-ca=
ble-comm-v1-0-6217dabc1a85@flipper.net?part=3D3

