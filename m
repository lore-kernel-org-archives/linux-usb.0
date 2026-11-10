Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794285297;
	b=Cqrao/MjibpkSF2PnMQSjZft/ufqzR4Oph6utNnNzEC4zOe6ntqoonYIExKTN4xS38/Y
	 ON8aKvSerSZ5DNzPGl6SYlG6aT4hDV2E7JtgQafzPH3v2JIwZIO9afTWLlH0gGXM1B9c1
	 cJjJRuwzXFcsYNkZJOYAYp0habvK/Ve3WOQ9Qc/C2a/4PCyjuKzhAGIUezGOMAxFn7GDa
	 2VwMD6W27j9R2hVE0RAOQipy5tkt9xHMzsozKaloLtx4oK9kBTOoB+zy8parVCPnpoLzX
	 uIrY20koytz9FSwcDF7BfeRJOOaWHvtf0HHb3EzBCr7TAsL3I+yE/F4oPXFiR5Ilf9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285297;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NHs2WDzb3ifdWnx7d0lb6Qi6Qf9XDZqTSKCecG3Pu9E=;
	b=p1bsN8gm6rus9fFW19FZAbL1rXo6DSQhzky2pJ3tjoP8EXK5MgbWqIFmjRmeHXR8JoIj
	 fWfH38nlRgLFHUdUcTUkfJ5gg66dkkXOHi0vYc1a6jSVmlvGejc10hKT6vM4omsQvBX6h
	 IntkoQRLNQGIhZFO21W459WUNW5RaCyj5JuW/E67iiD/PnuKaNrj8/a4Sw8bkhJ7NsBEK
	 rEwxLAHVmSrcRoQvY4M9XnT4TYsztFGeP0Qn7hbSxMO8yNFeWJCrBnKlaXOPslSiUyvyd
	 DEJzvjUnNQya83RL+aHOFC12NAZtUef5F+JZbB7DVe6Hu9RY3ECsJlv3s5K8yPeVUUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBJ+X9Uw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9FA606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 04:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gBJ+X9Uw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B83E1F0089F;
	Tue, 10 Nov 2026 04:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285297;
	bh=NHs2WDzb3ifdWnx7d0lb6Qi6Qf9XDZqTSKCecG3Pu9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gBJ+X9UwS6zCAyLHEm/U7muUHisE/TntdbwQ1uRtafX5XMjJq8pWthzEpX8o7BSwB
	 6o+ZFJu8OMfAkKWJ5fjT/IvGP9SHrWyl+uITGJCNIzkjwnGz9wnXKCEEtT/G5d3WX0
	 8rJo9r4FazuJDqKvXQiEHzQBGoyz5/T/xB7OxFrIsAy/ON0emnlP/65hYwOFHuSkha
	 E63xPGH6kwZwI59li96elE5CPeZTXxsrKwUD4oNnKXTRZS+ET9M1RjgyZXCaIr6cav
	 EoZhyYE94DgdyupE66lQKRkedOMz1j8Gwiy/s/TlL98UxexwGvhXcvZMbrCduRkIhe
	 wEJ+Y2Eu65KbQ==
Message-ID: <sashiko-outbox-206213@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/4] usb: gadget: gadgetfs: prevent ep0 event counter
 underflow
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jing Lin" <kayano050408@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
 <20261110-gadgetfs-ep0-v8-v8-3-8f90434574fe@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:34:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Jing Lin <kayano050408@gmail.com>
>=20
> ep0_read() snapshots dev->ev_next, drops dev->lock while copy_to_user()
> runs directly from dev->event[], and subtracts the snapshot afterwards.
> A concurrent disconnect, connect, setup, or another reader can reset,
> deduplicate, or consume the queue in that window.  This races on
> dev->event[], can drop newly arrived GADGETFS_SETUP events, and wraps
> dev->ev_next if the queue shrinks below the snapshot.
>=20
> Dequeue the events into the local buffer and update dev->ev_next before
> dropping dev->lock for copy_to_user().
>=20
> Fixes: 1da177e4c3f41 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jing Lin <kayano050408@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-gadgetfs-e=
p0-v8-v8-0-8f90434574fe@gmail.com?part=3D3

