Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187460;
	b=t1Z+kQjQjlND8Q9UyNYmlo5xedtK3lnZv864jZNmPdSXYRDyJTJMlAiaSEoyg6VCth7U
	 i006LSmlmWFpSOYyGT1bBeMO7H0UuD2BtdO1VJzLOIR3FOSO+E+1O5z70gd0/aQ4rK6CA
	 L/FR5oYS3kUlT4uSNcqX7wtQdCdLl5B9B/ZlmZmmQeP/IQ2QfBhXBe/X+VxVQ2nw5NOQW
	 ZceFcrYaK3I+JCnDGfeZM9cchqcmBHApgoTTaMThI2malujvGzD0RCt/EmMc5ic1snq4K
	 gqbPmfzcywEZUCK24fV4amJzxgUQoUKb+3txR1iCuZBO55GGPESw91cTUDZpqyPKdbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187460;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tUoZbq7Ax4869zM17ogX6rIy0lot8Agj+3rV/vorqiE=;
	b=k8sWO2IItrbY74KBNJZjsVDegI+qB3bt6hcA5amkwBsd0nQ9CxUo6833N1a3XUaWFTGo
	 GnVDFyGbCCNxt0TmQE50XvOs7eQ5BYaHEHNGgz4kIy2e0HZqCxC1z1IsoHewHKAKkSuPe
	 qNVdnJnAna0GfpPq1IEYNHTYwPV0SjfurN2jHJwQihqrrViRbFv/onWcVNxjImN6aOBpH
	 c9PGtw2EV3mW7QCGX4KfcfFHcfBnh3YRvhn/Gvhip2iyK6tSJGkXwwDn6QKBSACi7HG9+
	 wHNH8fdzMQvvgupHfwUgUup7xI52nvGvX5EMDxmh824a08dQwPb+gaDTVwKQFv1p1hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PXmpdDRj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00159606A326
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 15:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PXmpdDRj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE501F000C0;
	Fri, 20 Nov 2026 15:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187459;
	bh=tUoZbq7Ax4869zM17ogX6rIy0lot8Agj+3rV/vorqiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PXmpdDRjwQ+W+dLhMZ+lvtAo81QC42ssJaGSeNoy+4jWBSTSV4mAXiX4P1sq7Rd7j
	 6JhRoT9jzWR7CvV95rElIBuk2CotFXrvBfCDxBPWnW2hpePX5WW7SDG6W/OcaZDXgk
	 WgGdorlL0q0M5fnn3kvK/xJcBgsvtFDKJ0VdOo2gRue/b1gqfOp3C0jpYMtp3EHhPA
	 dn+EKBHBon0SURgeZe7WnKX3Ihu9FlGqos0V6J1JinaEUKTSsRivCim9KE4royHKjd
	 jJE8hz3WmkHU9JJiSXcrEAKzCVEi9mBktOUiqp+JMncpaQ80FCWJGyMgxWyU5IP3Uc
	 ahPFIKGvHjeVQ==
Message-ID: <sashiko-outbox-225439@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: ljca: fix NULL pointer dereference on events for
 callback-less clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261120150143.2591-1-25031212351@stu.xidian.edu.cn>
References: <20261120150143.2591-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 15:10:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> ljca_handle_event() dispatches an incoming event message to the first
> client whose type matches the message type and calls that client's event
> callback without checking that a callback is registered.  Only the GPIO
> client calls ljca_register_event_cb(); the I2C and SPI clients never do,
> so their event_cb stays NULL for as long as the adapter is bound, while
> they are present in adap->client_list.
>=20
> A device that sends a message without LJCA_ACK_FLAG and with the type of
> such a client therefore makes the driver call a NULL function pointer
> from the URB completion handler:
>=20
>   BUG: kernel NULL pointer dereference, address: 0000000000000000
>   #PF: supervisor instruction fetch in kernel mode
>   RIP: 0010:0x0
>   Call Trace:
> [ ... ]
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120150143.2591=
-1-25031212351@stu.xidian.edu.cn?part=3D1

