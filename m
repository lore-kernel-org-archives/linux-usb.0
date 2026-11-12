Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446058;
	b=dhuO/Y8KVL5E5zW2tMPS6jlht9iQmqcDQIK9/dIB3celS/rhSAAsn/FcC0GPuGHaZqCl
	 leKgUaPP99Rzqt0nkzCHrybAxnWs6ukNhTolViUalQNm0Jm/e4klilNPZFQN6OI4sHTCV
	 CM37M8+KJr/6zLrgtmOQVEUabiGn1Fpg674tXEwzdVC1DN1WWC+jv9C4IZnXID6r+TAE4
	 MoYGm/gFfifiOR9OWh0erznG+OxZQprKYJ+6ryn4aLvnG3WUkR5WYcmEv2Ayia0DZCe2E
	 CasFyBepQXMhweelTaWgpSxIeRBgoUw40As4K2afEPLNtdKXRYaDZWvWxjvD01Z4PUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446058;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iyotdh4Y4TCZ5V0IulbAjA50HhCMZuGQ+c5k37TX/Gg=;
	b=NMFBGjTu/EPbHvhnKm8aD76GJNAVyzjRCvZSD3JL7fdjszcpatz1qbpxZPC1A3bmXN0r
	 vdzeRYMpc3vk8EAmDXzrb1VLz/0+t1cbFTIdEaRjGlxCmYWPoIGZMo/5xHrO4Zqjb9KRL
	 glsOY1PpY5Wudjim50dDgelZGCWfWGXfdRNzEuvg+dHLFq+oOjg2ehNZoX3lRSsYDm2H0
	 zWJzdVy0BwaHk0TrWgGd1L677dCHAFnJuotD8X6tMna3KOzJ31ezN9MfmEwqSoDES9tMr
	 gpNfFnqh0coGWjzqlaLGjKzCv0vtJVAONw0T0xTlN5da5ahEb8Qhdz7H5G9QoOmzG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VK1/NsPy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF67C606A324
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 01:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VK1/NsPy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797A11F00A06;
	Thu, 12 Nov 2026 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794446058;
	bh=iyotdh4Y4TCZ5V0IulbAjA50HhCMZuGQ+c5k37TX/Gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VK1/NsPyRfi1oZbveQbcsoHWg0d6D78KvYm6k150bhRBozESAMEL9Vy57lo4o70L4
	 Wv8fruNmPRPrXQe0924waHkk4/m7VnDewVS7lEi6gqp+Qn1Oox3Y/9GYRobFsfaQgu
	 zMwOSMWAfpgckav7ANbwdahFPmQ6sCQSD87E6QT/v1iXJLrCCL5u0MeWG5FtlFV4+3
	 /0xONv82q72YQ3r+N8yOl4Rr3qdGCG7QYSJ9UD2XsAA3U5IzDB35ES90UZmRXyJSLm
	 h2/Mx56aSS4e+xQBT4ilBquCZSC1gyI4FlZkDD/0aAPVFwte0PBX/zOh2ZP/BEjaqd
	 7z/197CB4WeIQ==
Message-ID: <sashiko-outbox-210049@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] usb: gadget: f_hid: fix report_list entries leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261112010928.23716-3-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-1-shishunbo@cmss.chinamobile.com>
 <20261112010928.23716-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:14:18 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> Each GADGET_HID_WRITE_GET_REPORT ioctl for a report ID that is not
> yet in hidg->report_list allocates a report_entry and adds it to
> the list.  hidg_release() frees report_desc and set_report_buf, but
> never walks report_list, so every accumulated entry leaks on
> function destroy (e.g. when the HID gadget is unbound and the
> device is removed).
>=20
> Free the entries in hidg_release().  This is safe without extra
> locking: at release time the function is unbound (the workqueue is
> already destroyed and userspace has no way to reach the ioctl).
>=20
> Fixes: a139c98f760e ("USB: gadget: f_hid: Add GET_REPORT via userspace IO=
CTL")
> Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112010928.2371=
6-1-shishunbo@cmss.chinamobile.com?part=3D2

