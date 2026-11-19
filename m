Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109307;
	b=Yenz6KirdGYQ/Yt3O02XT3ZlcZ9DHUMqGtHgRElNATDOrC6QPvlZk0ReBxtGXyT66dPm
	 zMyWNUDQQr5RoqW1E3R6fVLwgAqktxu5RN9kELzQDsCH74DfB70T+BKBcSgqWwmBwoTrR
	 TlFXXOj7duYh8zEI8zOEM5MhunSxqPDGYV9heei/wlDc6nF3UQewDbUdmemvciYO17K6O
	 rnfxvg5OvsuHpwlPSD9OYdHeIEWQMLjZ8vzxFah6iP821RlxOD9gEpBmMPwyRRDAm9anx
	 eG9aO+3U7LdFRBUj+Ole6QSUvZZV8RQC+qqfZOwiNkzN90noHA6VJxCPAXLbFkVxMXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109307;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g3ZYuDDloOwmLmeR8VPjdzMntpdg+kyUxXeVwD6MEOI=;
	b=Jcwn3KnpZTsKvaVpejApMUgQj6iRlsDbh1vnHNGf1N+G2XPzN01JKbgfWO6RUyUzqlYo
	 rmVBG7cpn9nqx5lXwHuorFk5MPmgP93mh8kEzdwWX2xBrX6N1i8xP+FAJdPoo96gsjmtC
	 6u6110ykvw+I+8OS0AWWWXDy0SzfuyN/qj61IoExZPMYCbo+Pa06auogE86mZwW8ASTUy
	 vRaPXHJIx4PG9YA/xqbhDk+8PyNlTqEXSMNuWxbZ/aKkgHF+foNOu2X8Dq+dNMTP9y/jN
	 R85c9ftWkqnuvRqrvow/Dxs+KPftizprbrdo/PjLY6xUqy2CpZineJxTu9y02lWifjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKqiEFgg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFA3606A324
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKqiEFgg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC351F000C6;
	Thu, 19 Nov 2026 17:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795109307;
	bh=g3ZYuDDloOwmLmeR8VPjdzMntpdg+kyUxXeVwD6MEOI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DKqiEFggwofAPROJRZP1/alyBqgy4sTs6A38g8N2mtjUB5WzUTelhvZOo9s/Gixfa
	 udt8QqGUqOIm2ZxFw77owOBKAtgFcliZnnaHrrdvgWkYUQidq2fwRh5NQR8qad0cz7
	 oNDBQb3vvsZqA5HUJVRRXSZl1T02zcUA263SOwBhOCxVY12mcZzjckJm97CkMue7kk
	 Hoc/4jWq6vjoMW+1mbUxsjWTFP3nbMEMtgdQGuWtxDoHiBCkoN26Ws39bUx307xG0t
	 /p9CyTRmYLZNxnZu4xzWfDsyteTsWBdzNa1vBPJm2H2y9pXOIVZsU2npcCpV9mII3e
	 Xy4FfTRKPfSAQ==
Message-ID: <sashiko-outbox-223694@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/18] thunderbolt: Call DP tunnel activation callback
 with tb->lock held
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-5-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-5-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:28:26 +0000
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
> tb_dp_dprx_work() decides the outcome of the DPRX read under tb->lock
> but then releases the lock and calls the callback which takes it again.
> Between the two something else can grab the lock and change the domain
> state, for example stop the control channel, and the callback then acts
> on a decision that is no longer valid.
>=20
> Fix this by calling the callback in the same tb->lock critical section
> that decided the DPRX result.
>=20
> Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation a=
synchronously")
> Signed-off-by: Mika Westerberg (Intel) <westeri@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D4

