Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793269704;
	b=X0PHchKw+sigPsHm8EeAYVWo/Z3yT1e2Z77gnnUMLI9HvUhhAosqgdewhiPjrZIjPg79
	 SkOIl4S5pvHhwVc5LPwqstFydiyXCr7TTuQyFYkPk4PkmOLRkkQRbKrzinZ/RGu8X8jMi
	 oFPuQopgCV/Smy6yyM+b3UnRU/LbGE9exp5CrwMoR5KWbZowbijxY2GqchsjLUQ2gkFWQ
	 Nk8slOqhxAp/YPuhQuebJSJqMURQv4x/tVsYjPgPPnoSgydrN52wYPtWyIGRktY3c7K3d
	 TPz2ruQVBDUQ7/gmOO77a2M8U8Aa1b/DAa24ITQVLJkSCd5PD46RdunbiOXI3tWTTrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793269704;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/K8piVJM1M/GynlN4qf+dORoJbCoBYcKzdZLcUFqZBM=;
	b=gAY5a0X41dGOl6jdrEaAOsOGWZFUQ9GN35V+Fy113OGr5ZkC+8po9xt9RIMUp3AQNKQ+
	 WLSPuoz7A5ERj7HqMsOwkM9wPA83WLQnDUd4zodm12BqKnHbTRtTctbT+WXgk37h5jmVA
	 G97dEf8c7QLfxYAHk6N9d8b24Au/B26C1E71lHlktbhLAIpkaZ/cxvBI4bQt4di1hlVH9
	 qR/+nDfG43f+Vqy33s4JjoUxeovopxJpi/+Q7yF08g9XAtj302XMvjr/fj8Ari0FBcYc/
	 7aYiDJcuR/g3ATQHfZicA/puunRjrDIUCVgAMEoQGkFQkSE5DqrpfYBTsQEqdlYEkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJdGjYDF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5121606A31D
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aJdGjYDF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67471F01825;
	Thu, 29 Oct 2026 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793269703;
	bh=/K8piVJM1M/GynlN4qf+dORoJbCoBYcKzdZLcUFqZBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJdGjYDF/dgcFwOhzmMeCoaX2T+b6bMMiHuttbhHMY+m7RGzacBPle3palH7vhJ+m
	 EQj3SsyGz1josf3B9hBLqUCcpPVLL6ip0XtF1u5nFP+qhP0YVtqdmVu+ZP0ltuuyN+
	 SO7rSIsy0Mww0lXo3dG6JCmhJZhIZlpQSt7ZcVc9csp7LIV4XdrI71Fr6zO8xXJ8jp
	 E0ZANFy2AXeeALDxXSDaqqn3HrxuAC/X8b9WbRVzZhSNzE43lsoy93IfPHvJSRZzt0
	 wQQ8Mx7+9HWUvODEVLT0MagNMpY3tLSWiGGxPGbTDCyiICocVAwrBDbTmjaiUmp0d7
	 Mhmh5HsC6/SpA==
Message-ID: <sashiko-outbox-189131@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] USB: serial: garmin_gps: fix deadlock on reset request
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261029101828.865915-1-johan@kernel.org>
References: <20261029101828.865915-1-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:28:23 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> The garmin_gps driver has a reset feature that is supposed to reset the
> device when writing a private reset request packet. The reset is however
> done synchronously from the write() callback (and without holding the
> required device lock) which leads to a deadlock in the line discipline
> when hanging up the port as part of disconnect.
>=20
> Switch to using the asynchronous reset interface while dropping the
> redundant and synchronous stopping of the interrupt urb (write()
> callbacks are supposed to be atomic and USB core, USB serial core and
> the driver itself will unlink and kill all URBs during disconnect).
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Josef Bacik <josef@toxicpanda.com>
> Link: https://lore.kernel.org/2026102733-prayer-drainer-56f3@gregkh
> Cc: stable@vger.kernel.org
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029101828.8659=
15-1-johan@kernel.org?part=3D1

