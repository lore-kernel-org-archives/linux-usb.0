Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078168;
	b=DsBha2qQQekHj9/NzlJ2Pc3IQv9saJalXO2zwRBfWmqBJPZTEqN/g1d0TIDBgfURrI/5
	 gYNjjvFnL8uRdR5vIqVWtXi8/BgCejnIGyL74VKYyIq7K8IXIObRw+ByF/KeC6HRaLOBz
	 pmAO0YeDU5gcMW570Lv/ehlXT4v/UzF0BI/XHG6v1TEZs9Kbuoq0rO9GIRgAQa7NI4xfs
	 ArCjWK6gkRMDWHYSEzxIAqSLnZjt39AGJ6BNAQcHdzWJpA06oMzs0WX5ydm3DqcIJz1RB
	 xn3VgDSqe3X5H+yrsk4j4Htj1SJll6EApcdo/oE/SOqnR7aCa/BXWpbGq5VJC98IamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078168;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=j+Z68kNHBvMtSMK38bJbdxksWplhtnYLBDhJIrtGVOc=;
	b=p4Yerq1c+5hktAB2H0Sda2lB3I8b3/ESxwiQq0nwyE2vl+TarKxrgiyRVfEvI7MSxNoC
	 545K7mqmmi1nuijhDzebDJZOzau6a+miKp8RYo4jzGBOMxoDHoQabH8xYtWNZ3Q6I/jSz
	 eRPD0n7dOfP/14bM7vwQYbseZbmdvPCsgkmFYJ35iZ8Y3MD3aBzp4IZ8t+NhVvug2Giyc
	 ZPSp+/m9iFqPJ4ZdRuYrgdANk/5lcRCFFh5JyA9hSmVprwGeA74U0cJsvljyiYmkz5hP4
	 ZXfxYj+8+Ari5Xf6ptHkXxHAQvOkWUKa5agoxJ4HHkQENN0wKM2iRE/yStr1Kediu7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlqwDPVb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8F606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 08:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XlqwDPVb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 195C71F000C5;
	Thu, 19 Nov 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795078168;
	bh=j+Z68kNHBvMtSMK38bJbdxksWplhtnYLBDhJIrtGVOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XlqwDPVbiysC6/khjRTbNAgCzDzzd67/VZSKa2mJ+LN/2WdZiiV7kXELQHYSIb7OC
	 5OFabAcsYzlsbu3JiWzpgCgaQ4YJ+weYmJiLZlKKUls3jfuI5tfxv7emQkLPCwmNGg
	 UrthtZgzR5ckTahyntqLlXJMOuoK04tUuwiCYz+iDj4RsnpW4kaLMdmD3mdeNxCi0X
	 vkRaCWxp/13PQN2Z9drucYPAlj+2Ci/RbabSauGPyME5T3ti/Bgk306wgeonEPdkVx
	 axZ0H+rF/iGaJVexwQCjdXZY3ceKry00zQUp9h3dK0QUafnQ7KmZ4z+F4ozsVEtx0/
	 exzVJu7yN64ow==
Message-ID: <sashiko-outbox-222720@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: image: microtek: don't receive REQUEST SENSE data
 into sense_buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Becholey" <alex@becholey.ch>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261119084526.535901-1-alex@becholey.ch>
References: <20261119084526.535901-1-alex@becholey.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 08:49:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> mts_command_done() receives the data phase of a REQUEST SENSE into
> srb->sense_buffer (SCSI_SENSE_BUFFERSIZE, 96 bytes), but with the
> length of the command's own data buffer. A REQUEST SENSE sent through
> SG_IO, allowed on a read-only /dev/sgN without any capability, can have
> a much larger buffer (252 bytes with sg_requests), and a device that
> returns that much writes past the end of the sense buffer.
>=20
> The special case is not needed: for the error handler's own REQUEST
> SENSE, scsi_eh_prep_cmnd() already points the data buffer at
> sense_buffer with at most SCSI_SENSE_BUFFERSIZE. Handle REQUEST SENSE
> like every other data-in command.
>=20
> The bug was found, and the reproducer and this fix were written, by AI
> agents (Claude Mythos and Claude Opus models). The analysis and the
> patch were reviewed by a human.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandre Becholey <alex@becholey.ch>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119084526.5359=
01-1-alex@becholey.ch?part=3D1

