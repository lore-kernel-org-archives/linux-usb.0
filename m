Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795127432;
	b=o8TlSM1cEUO9zyFSfRbQYSbkklwst4+srjb9V0m5kjY31j4P8QcQh76TCJ663cDK6ZJD
	 IHOWGjp1hIQ+YA14ZDcBDHX/wVKSSwYu5Qb1HhuAEIi+VVUS7qSlerpXvvkx+fwMgOdGu
	 N8WMLTRp0FU0w5AWUEZVFvoMYLriqlmGLuVyN0vlNeJTyFTObkgfXn6ZRWK01Tf9zu+7E
	 A/sHoZtXweNxQturNtpMlPphPdflqvUltqy9+LB/AV6KABDuusW/nmY5AtAvGsjp72pfF
	 b0HTRubp1WnHbOwrsjrA7FeJ/c3SPeXWqTKtz6aEMHZV/ooObDpUCxRMEMzaQ0U3k7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795127432;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ne5tftpEpopVSWS1xFjcecqchdo4/Y9wq6Yt9fKruco=;
	b=3iy8Qr9eG8M0UQdDiF1uYuy3dTa1jyHvZtTk4Jlhu7UMcAx0WmppKq6dIjWUxYwPfA0q
	 kRnMTJQE81DXJFtMhAVG5tEAR5W9MCAV82ImqlmUzTa+ACRw9iL4EDDbSs3a/17evfWEY
	 K3wyf9WidjnQC0dyQyRri5RDFYl6mW/qQ5JmOebcZq64P2NQuqIbK6VvRHGksukuXkE46
	 cjXaXhbSWubZd82ujq81FYmptbz7vzQyRyJ114ibclO/d24vh5PfAqwB9WjY0tFxYESCm
	 guLPWqqQ4/W7qJnUCkBoXQrDia9Jv+LHnhXnDJG8+nRGb4Y5k9/kiDTHvpXnnAppeZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="enazl/pK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A8606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 22:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enazl/pK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11E51F000CF;
	Thu, 19 Nov 2026 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795127432;
	bh=ne5tftpEpopVSWS1xFjcecqchdo4/Y9wq6Yt9fKruco=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=enazl/pKlPA1w/ndstgEvJzmKRwku+S5d0cHqPVNvmcRhatR6JDjP/4t8sW/MzhvJ
	 3GGDjyjFz/pT3oHGdL/F6HMybVTOMshAVaqKHnvhRbxzxF8AuwoloKUmEEUETb6iSp
	 jur8Ov4JWdhSkKIKQcWk4jmp+0teyZUMpxhjoa2xuhkYM5dorMHJBediQUoHh409dM
	 pFD6yKYBtFPk2xqUMzWjW0fScLXxVaYPI6ETfIld+YzMAEbjT1eIHXEVcBHXM582FE
	 wf8uRyrYzYRDp4htoKkjQP4kO6ETSL/4IXQBfPM/wQqmHIFCyd75PbFxhrCebRpnAU
	 DuH5hSg73+fPQ==
Message-ID: <sashiko-outbox-224133@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] USB: core: Add USB_QUIRK_DISCONNECT_PARENT_SUSPEND
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleh Kurudz" <admin@or1k.net>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120-quadcast-s-suspend-v1-1-add8ccf12c8f@or1k.net>
References: <20261120-quadcast-s-suspend-v1-0-add8ccf12c8f@or1k.net>
 <20261120-quadcast-s-suspend-v1-1-add8ccf12c8f@or1k.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 22:30:31 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Oleh Kurudz <admin@or1k.net>
>=20
> Some USB products are several functions behind a small hub inside the
> same enclosure. On the HyperX QuadCast S microphone one of these
> functions drops off the bus while the system is suspending, and the
> built-in hub then reports the connect change upstream and wakes the
> system, even though remote wakeup is disabled for the hub and for
> everything behind it. On s2idle systems the suspend bounces back within
> about a second.
>=20
> USB_QUIRK_DISCONNECT_SUSPEND does not help here. Set on the function
> that drops off, it disables that function's port on the built-in hub,
> but the hub itself still signals the wakeup. Set on the hub, it would
> affect every product that uses the same generic hub chip (a Huasheng
> 214b:7250 in this case), including ones with a keyboard behind it that
> [ ... ]
> This patch and its changelog were written with the help of an AI
> coding assistant (Claude, claude-opus-5-5). I reviewed the result and
> tested it on my hardware, see the next patch.
>=20
> Signed-off-by: Oleh Kurudz <admin@or1k.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-quadcast-s=
-suspend-v1-0-add8ccf12c8f@or1k.net?part=3D1

