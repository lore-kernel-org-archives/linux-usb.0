Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184724;
	b=T10jOnowYkebqWClaCfSqPMmD6gzw/+HLI3Lhug5ml98dwqLjuLijtDLojxSg0A1oZi3
	 mIE+W4uXkgm16976MMhTrlgxl1xyltiIEhKdaz7G0rj+wi9KfkjtRBklOxczI4oHu7uzf
	 jzzGbsqD7RiqtJXd/8b1Msf2OIN3PB5VY9AFuIeGqeVo6FJcmpFA+7KCJlUup0GVMzCi8
	 Yv5yteKXHgKzS7u3QIWxBX7EwbEwhA9SO5K8mLTgF1IBso6301CRQ4OCOQ11UsxIHC2WQ
	 N4NS6U73EaRNZZXj5X0QS3ww4w6zXSl3dHTJ/RbbNg8vDVbCkR9uAGSvpfwbbv7hshg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184724;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PzMpwpqjP6Yzpm4EvqxX2mRpNG3U3ROlP4/YH1p4MiI=;
	b=zXFQ3wZdVIHRSw2zaPYrdrtVDE8NQh2AW+Rx/g9VvwYYVQi7o3lrw+DO+BFf/bAMa01V
	 WR42ut711a2ZBzQv/DghYipEg27Vh0aWQihgp1yhA1rm80EGpNrzdFBS8M5CfK8N9iD1g
	 34twQAWkeP8lN1zPRPsyEwheGmQrJsSeZmOVIZq4jtKFrOg16bQ3fE0LRxO0l3Q55saKn
	 UR50Xuff+smh47EdoiT2YQk65m6le8EYKACLdZzvoGaI5xAeVfF2+4OYS7hBD5ZgCZtfO
	 IK7kB07zz38d2srG5wIi2a+SHl3d7P/WrIcz9LVg1094ullVXqkAWb/KMsvnPWZbUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aheFwjX0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8328C606A31C;
	Mon,  9 Nov 2026 00:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aheFwjX0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B961F0089F;
	Mon,  9 Nov 2026 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794184724;
	bh=PzMpwpqjP6Yzpm4EvqxX2mRpNG3U3ROlP4/YH1p4MiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aheFwjX08HuIzlodMiheOPBtdWnCIWLQ17d7HxdPKLc+27wBtii6VMvkmU24vyWQ/
	 IqSUSFoCbAEpjJ1DhOP4ZhpS2idKMblF8LHE/E8TlGPeSfkRUZurzJJ4fAxs2nNuFd
	 Y977MNGnhzk6l4tOFS0T5LOb9bSsptf7bI7NlPR7j4cq5Ibnw1LtnVTBzIeUfPsY3S
	 wDMXZkmzW2ICGqAfiLpAucSWVFXPn85/7+7N2yyv7DpQCSDL/PEwZe2bysx1DF9VQF
	 wwtX3LSMajWxpPpuZxdIv/u42sp5NGWNRFo1GhmejW3Fm7KeETfhTzZZhqBTN1f2L+
	 HnFn/Ccq8m97Q==
Message-ID: <sashiko-outbox-204228@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/17] dt-bindings: arm-smmu: Add Halliday SMMU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-6-289114ab8197@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:38:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the SMMU-500 on the Qualcomm Halliday SoC.
>=20
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-halliday-d=
ts-v1-0-289114ab8197@gmail.com?part=3D6

