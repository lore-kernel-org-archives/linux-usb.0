Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184948;
	b=Kwda44ayLBHcTPC0abcSPtOugrmIc7rsZxSr4MMREQ+wNMeK95Sqkhisxh5v1lB3Y+zM
	 C3SU8OtGzxYtYaMv2L+SBpzpNhsaOwGWPTJFB8Srk0jaOzYsDSC7xdr03ahvUnqoPAI4w
	 J3lrj3v3ErnmyxfLb9TOmAldPDnL4oKPkGFF9uON/7ZnwOZPc7swZfGs4bUgccnktKm1W
	 6qZnP6Ca/Nn7W5LGllwVnW4N832eS/swCdoCrEOmCMI1TbbPbjaTOKdflWvlz3T7prUq1
	 IUYclYHwOvrUwtl4b7xzVCeilzDXlM+eAHdqDAgmYIkLcitsvgokHh591Rtz3iZMYBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184948;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=34gF0cNPpY2383eWIJliMbnb9k/LHL5qQeS0Ls2RclU=;
	b=oB8aO3Qo4H/fz9nLsHDXYlFTePCt0oZseT4ioUWnqAoStOb80v9NyX7p+9cUebvkdNEU
	 TpyXKSIrUSQ5oQrk49nap+CmzvvfZCxhjZnFbjgSTjhuiUravmV9UZwEbXJ12SDZMM+ii
	 aKpOiXGA7EaEshh9QfBRg9KN7R0KsnEXvKo6F9AR66N3WfIlkjsF7CmQ0iodjeX76Ix1Z
	 4lNvednMEcH4D/CxVo/1jbHCZ2VBmI9zYpQ6xvAuSZpo+3EQCrnUS58VYZNpV8DxKvbXh
	 psAKk1d4Rryaj1qFOPKIfCUHUTMZsoxrFWB92BvDZ9O/WHabxlkC/KPx7LRpF4Y4U4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aeEa1/aw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874C606A322;
	Mon,  9 Nov 2026 00:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeEa1/aw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0821F008A1;
	Mon,  9 Nov 2026 00:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184948;
	bh=34gF0cNPpY2383eWIJliMbnb9k/LHL5qQeS0Ls2RclU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aeEa1/awhC1ohK0TlVfN6/C3I1dpAij33Jo9UdG2dQ243paRqK2G2zLPdVcnf3qx9
	 Mt/M0IgaQDMy32yw07gMq1tUh/bYFh4jcNq93tQv4+DmluelhyuB8kMcfP5rDoaaME
	 c+6KITnQwn9pfIIdy/jbvWRorvsLxKSqbX/Ww/5XpbyOEZIgC8+IvVJ6ArK28csPu7
	 LFKkIJetzKQY4WQJmgltUi7uHQDecS22+7m2Bv9ux2olle5wwHTU1H9gyslbul3RJ7
	 PuDjUsr8TLT+KIngWrhQeY8Ge0ie+gRj3//xhMKjR2B1NIFUH2qQF00/wDG/zEyULD
	 NbmObPbXNDgEA==
Message-ID: <sashiko-outbox-204244@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/17] dt-bindings: usb: qcom,snps-dwc3: Add Halliday
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-7-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:42:27 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the DWC3 USB controller on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D7

