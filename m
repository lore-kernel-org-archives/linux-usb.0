Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716331;
	b=0GPgjfS0quEOopdjJohr7Fe1juvUYhTIY94ZvzAQUSHyx3sq+rPGqkva0Pq7WNnzbdTM
	 prRY98opPU+g9GqT03Lxp78dsWB/P7nqUYFvT2hHXvvbK0jOE5ZA8Gbgsz/yBgYtqGvGD
	 bADLa0OPpka53jO07UjVGMtAePj402GW+YtytKV2zBbOE36fp7S/D6MwGP1tM/k6M7iUD
	 P3YjyL9HE6TeHRfstIT1bOAsGD+wuRHnIB+E/8UcfHY4+P5ldymID/EohIhaLMcevc1DD
	 k9TIY6sSS9P4RyFm37vZWBhVLL95lIQXtIrZtGIIBXvR19aNWb75atabmlXil4zJ1Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716331;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7F9vZFOtAs4tNwn+IMEQFHEj2HVk0NC0/wsnec4Q6E4=;
	b=cPqLE4QM4pjh4kw8ioviaDdnyN7ckK/4HizZA6YVs1mIZrZj5AhgmPor0TlLX5kx9wNR
	 HJ57W7kA5InpCKwX2tNpVF2E/Uj8JS8opYucFd8nz6u5bNsfPG1hMOD9BT/CXM9823wTp
	 eq8tSA+qAA4Akpc0ahMhtPIsZb5QjgrL5htgUqYreBTVf6gOq4QwqhyQ6i/1Nz792GfuP
	 8dWRKOEQ5vqiCrm/WrUYokyQRwJySyi5qOjqEU/3CYO3akqJsgR/NddX3NjQ1TcxkAN+3
	 rm/ylNcVEsrIt8eonXDwkZxkzp5ASmkHx/EeeiBZLMBzkYJHwq5AYvzHxRrS4gxr1NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ow87rU08;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E32606EE92
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ow87rU08
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7F6D1F000C1;
	Tue,  3 Nov 2026 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716331;
	bh=7F9vZFOtAs4tNwn+IMEQFHEj2HVk0NC0/wsnec4Q6E4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ow87rU08ZSzMfc8+LNkqad7Cq3NFAMmN8VKSA9V3A45o+FvDGxmOJ/wxHFTtwseNh
	 gqF13rwMp9EMF5VK42q1bucf1UFQLFxVm/igWK//2+4Aww2TRDNl2NwVI9bGZlJjKT
	 H4pRfWwlkKRJk7yMsFXtXIxuenjPQyZycq/jYNm3OUXjB3z5GZpaNHzgg3zYlA3jWO
	 1rCk5AklRrUGSE3toy0mV28/9vn8pgVt/fN0blywaFwtBFHjG3/Fz2GMNkMfyBVyD6
	 RiaNbcA61i1IuCCEKRaaMqJ928wi0i6aaLF5XeP1k30mQr5ntIjLLkzExd36DZXSk8
	 n9M5vM03b2OTw==
Message-ID: <sashiko-outbox-195450@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/3] usb: typec: tipd: Factor out i2c specifics
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Finkelstein" <k@chaosmail.tech>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261103-tipd-ace3-v8-2-770f42421753@chaosmail.tech>
References: <20261103-tipd-ace3-v8-0-770f42421753@chaosmail.tech>
 <20261103-tipd-ace3-v8-2-770f42421753@chaosmail.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 14:32:10 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Alyssa Milburn <amilburn@zall.org>
>=20
> Make the core driver more bus-agnostic to prepare for SPMI variants of
> the tipd chip
>=20
> Signed-off-by: Alyssa Milburn <amilburn@zall.org>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-tipd-ace3-=
v8-0-770f42421753@chaosmail.tech?part=3D2

