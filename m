Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899285;
	b=X/G2hnFYGfYn7y9L8EGGqmxFnNWSpBxWiSEXoHLz9KgJkyfgOuib5qcikIGUptc+V4mB
	 no9yKCinSecW+u/eQpXXQqtwFk6Rugpiu+hdzlAUbRbZwJ24vm9GP16KZxrBIYLIfybxr
	 UY9K56Jnlt01EwANZojidkB8HlrTS5gE7b9DYxh8KmqA45CmT0AZsGFhTwBGv1uzk01xP
	 9x9JwnX7tHH0rh/5spSxe4sbOtwsTOR7od7+9J1rYERgZm1fnh0R6qYY0iNbs8OZhFKCW
	 X0Z79XsjPZVNvbKEO+DHS5eBPdVQOlUSaZJ/jj2kp2x/iQZ9+7tbUpGg5Gf501bFZeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899285;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3DZjJrgrpTzMN4BhvidbJO4Fhfd8BoxX596ZKX+66m4=;
	b=uoCciBKGQKh0v8Gqh8WVOmGZKMZRsFmcbK8h9lkgzrWQGoW7UPmTpZ+EFxDbcqfPUGAY
	 m8ip0H/JjWMO55FW/Ai58po7PCZ29RQCckrBy48ldWt9QA9fkv14zE7Vo5GBwRi5mhLSg
	 vhdfpa9uU1apFegy7ULBg0nU/I8gpheNg8MXYBw3zm0PQ+lQA+DjBMUnyp7UdfXAkfA3x
	 STd5+agsXO1Ls2MC4zZNS3GhxAnNtvkPBDjgqdoI77PT9pgBRk6j9Cyjx4b7we7STYM2+
	 FK7v05/8Dq48qhMJI3CsTMiRiPXFbvuh7Mrud+NbT5oT5m4k0uEhdwNO/K5VZCx4R1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgZOMYTi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197860703C6
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bgZOMYTi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C7A1F000C1;
	Thu,  5 Nov 2026 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793899284;
	bh=3DZjJrgrpTzMN4BhvidbJO4Fhfd8BoxX596ZKX+66m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bgZOMYTi7YBBxRr5kenE9iBjBENAMDUTOUJQu1EWLi0AP3AJK2pWJzxdbPHLCB0YD
	 ZEBBh98kS7c36kekqMAD1CmbFHiMZtHd/cUjN1r5PvazWcFWLbOCZUR4MvG6D5XDAm
	 IpgKSXtr+PGkJDKMgI0q2wUT5a3krWy1tmy80sofg9TpPLt9LTSpBF8ABckEz5e3sT
	 7uysaLvZVSb7hSK9+AmpT12+rNx+r2Hk8DBGaCbezw+DEZZDHITZKKcYa0lxOaXeI0
	 Ps9GpIXxKHvDQ6ollu7rfJQddkmXZvKcpI+PP/2q6drdPO8PtgJvSu3E+qv7xjaDjf
	 Bee+cFCw+p/AA==
Message-ID: <sashiko-outbox-199601@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 8/8] Documentation: sound: add the Babyface Pro
 proprietary-mode design doc
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-9-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-9-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 17:21:24 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> A big-picture companion to the patch series, for human reviewers:
> why the proprietary mode needs a standalone driver instead of a
> snd-usb-audio quirk, the vendor protocol's write-only/no-readback
> shape and what that forces onto the driver, the stream session
> model, why the mixer state has to be cached and replayed, and why
> the driver has to emulate TotalMix's own role for the front panel.
>=20
> Requested by Takashi Iwai's v4 review: documentation for reviewers,
> not restating what the code comments already say inline.
>=20
> Signed-off-by: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D8

