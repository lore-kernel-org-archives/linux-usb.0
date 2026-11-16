Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864597;
	b=IrZ8JO/x52kfgA1cliym86d6tzLOBetJWaicCFFdK9q4aalJoWAvW/kmRLaJz5oOng7h
	 265hHpMN9wmEko7zEowHZr9QCW1/2sZUlnkiWWNCLWkqWxyMEaEn5CHVWDNOnOhjT9u7H
	 lqZLLuS8p/MLfU2W+WmKwD5TdBXFtMtRndNDKhcXfwhCZHCs0jBtSxpop7acfvO7cnYRU
	 8R++EDuSrKKxRhpJh+t+9CReUaQ5gBQ1iimEBNEILBo7FPbLE7XoUnSoyNkiE3GmNfyLy
	 a40HTDki/U8zbLT4I/l6vhHh371nnMHGocFzdvl3xnkgOl0qaco9vm4+wwjbeOix0Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864597;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=L6ZgF7OZ9DyF9+QSAkLBGVj/SRMdy1WxXnBe+0xIAm4=;
	b=fK+uPT5ytveUqjQ8sDFukxcC+OOar1sUviPcWUGE3d98iKeKt4DJHwaX3foV2+XkZJU3
	 3HCrhF/Z61Ey2vhnBJEI52n7mJIwo50aXZZJTvs06qo6x05p7iKzTxZZWt4st+ghGptyQ
	 qJBWCglJiZB1eYHcPt7x12PiTGke3OtSv9unuyTiRv/S4eeqqxswv/uOYQkxlhQgk8Mr0
	 WGfNYeCrgGBHxClrQbPWCbosLZbVm0ADBkJ24hXJD8OmGarFmF8RgJZBgQxAX4VuGCZby
	 3gDB4uOkmqr80khyMxqYBumxTv0hzjexH5V8jDGn7Z+dRXt1PhYHL63j33JRra3tB/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrNSYdCK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84271606A335;
	Mon, 16 Nov 2026 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hrNSYdCK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FFE1F000C4;
	Mon, 16 Nov 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794864597;
	bh=L6ZgF7OZ9DyF9+QSAkLBGVj/SRMdy1WxXnBe+0xIAm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hrNSYdCK3EGeOrtpVChe5U5ogC3jFZYL9TpKIG9yQ+hL1FpG1VmRJrlNkx7h/ddAV
	 Qqjgi520wjFkbvcfNJKm+tYSjydUdiOzT6UjUncWM6nl5ZYZwXAbE4bc3tS5AxBDJ8
	 fugiL0BBmmi1A+fMC3ahsDpCniQhHsfO4mH5BfETx21Sz3nsqcK8ChWh+wb2s7JpN4
	 kxcBq6paDJxWlajXlOZD0nxj8DWfuUVYwBD66cSTnt8XbGMvCI5QdFlfCgL8xHqil+
	 AGPgUGf0L4PQPevVIE66OE3VZzn1pp7stwp/nD6Rwnyia6yEsT9l4qrLf7e52wPM1L
	 yDZ9+Q1050NQQ==
Message-ID: <sashiko-outbox-217717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/16] dt-bindings: interrupt-controller: qcom,pdc:
 Document Halliday PDC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stanislav Aleksandrov" <lightofmysoul@gmail.com>
Cc: mfd@lists.linux.dev, linux-usb@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
 <20261116-halliday-dts-v2-1-2c92438c6c46@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 21:29:56 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Document the Power Domain Controller on the Qualcomm Halliday SoC.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-halliday-d=
ts-v2-0-2c92438c6c46@gmail.com?part=3D1

