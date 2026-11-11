Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365556;
	b=UgTY8Xz1NLaVsQMA1/PW/yerd5uwSiOCx4cj9wGKb91+8b9T8dUHYtRa3uLGwOFh00Ni
	 4yNIDhTAtupDcZgNpRSZM23n6fvqQSq9s/aHPjsu/6jhZbHi9kPfdsCBVFVqagc7WhNA+
	 MD+Lz+gRNQrQpFZ1eFpOQ8Hqne1wej7Oe95MYW9vlfKt/xEkCovpl8k6BJd8DwZas69nw
	 Dxf9Vp0gWsEv2n/guGf70aUvjXKLLtzkysAA05shrkf7CIr356gBJkOCrLss+TJDusC0x
	 SyV6dFcwmDsXxuiY3tNTlc5LoqS8Jej33j7+O3zdgbeqhzbUOUFX6+GrhkGj9zxZvJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365556;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=X79ly+Uh6q05PH6EE1OdB84wP1NrkI+3btb0HDkbYSc=;
	b=c0a8cfO6Aofd/SSDBSvnKajtN01chfbeTEOYoQmDZvbaW58NZoOYGfuJM1po7i9EHLH1
	 slk3Bzm7l7EwyNXJFsseSfvHkxaEpBayZJMAMTLlK+CvNamF5BewYNKBT0FW+lflnjfj+
	 c28EsWhTMoPBVxLSxZWGbrWrXBniryooovz2p7WDpynp4pJCiIEjP6X+ZEp3EIeNezyLu
	 tv7r2q/lP89e9u8A0g1glifAmHUmL3pmN1NIi3G5lD0ktsuACKfGkZqU98LAAAOyuj3in
	 QIkuK5QuXX7SR9oHIa19fjnU790sEuFqM2jhvylJwXpDo6Zp5Tw2BcYWYyA/wTz65Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTAZxTTd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF90606A320
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 02:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTAZxTTd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2088F1F0089F;
	Wed, 11 Nov 2026 02:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365556;
	bh=X79ly+Uh6q05PH6EE1OdB84wP1NrkI+3btb0HDkbYSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BTAZxTTdnMaQMgv47oFQLYSMKCv/c4X0tqiQx2Us4iogEB6Wpb9xgv/Pe4Ew4ASJv
	 8ZjaJbm8if3I1546rJM6eKzxA6uUCcCTz+Rsrvs5/vhJCnk8IKxEcm4Um5IhBp5RwI
	 YJoccnWhnBJ9GG/Elh0zUSzBypv9dtAZ1ISkz6+Y5m+rADNE0NiFJy3jCgT+ZDA04A
	 /Om/EOhQyzijsqShYRGcDaQjSXw5DErXwzMzgRzcRGBr2aIL2HxAp0Vb0Gan6HPSw0
	 Vnk3ne2V/K7skZzxvYCcqmu6x98WsjvP3akgVF5i+ee+QjB2BEMVWbhNSnINPT474V
	 uaW5Ng57ywLMg==
Message-ID: <sashiko-outbox-208124@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_hid: fix report_list entries leak
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shunbo Shi" <shishunbo@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111021655.37851-3-shishunbo@cmss.chinamobile.com>
References: <20261111021655.37851-1-shishunbo@cmss.chinamobile.com>
 <20261111021655.37851-3-shishunbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:52:35 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111021655.3785=
1-1-shishunbo@cmss.chinamobile.com?part=3D2

