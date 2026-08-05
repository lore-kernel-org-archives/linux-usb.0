Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB0630648C
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 04:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785905305; cv=none; b=iAjsqXy+nS79j17Y45k6c5roUjjdGQNt2aaRXnr2jKFc5IohnWewz7pItPj/RVdX7Re1lDFYMnuiBFJYA0g8+rap1fiyX9dcAFSOMhc7DeZ7tg4EUCXXYnNtL3qmIgR28I1/Gl5rV3n/qy+LCGuYzDRxImK2aix7r5zomScfbBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785905305; c=relaxed/simple;
	bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iB/3MW9Af0UzyQ/TeQTX00n/VyeFcPp3qeNYvixNcyAM7O3rZ/peJa7CYQz+lETjXJCU4uK17f5YGyOs6VF5hL78+JNyFO6uiWfosKMhD/pB8oKU46EFk9aVyEYAlZNIEdt2JiVxB1SpxX20uiCL0KH0ES1R83yPJ4cLgXQHiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGbZOdPD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGbZOdPD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso2212505e9.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Aug 2026 21:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785905303; x=1786510103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
        b=nGbZOdPDfjaqLBPa2edV/rnBGVIfVJJj3RK+G98GwlXBfhhDSI65UmKAEADoKLspen
         49IL2eRmfmU37CO8obw21IeIXfVtDzAdAw8qfy02626Rd90e4BXklFxuHSlm4xwJuP2C
         wwIHNiIjQ+7c793hIGFEYJOClQ7k2tGgiaJzI9AZnVyMMxpktA269OQDlwQNw+erwvRo
         77st0Yl6Rep2ujE0/XzjTdwWgJpNBF2pM0lLM4p9wxJ8A+h+Noa8BKtrrlAGQpaW5wvo
         92BtretSXkW2sSVe9i2uP7Tf0lermBG1bXyL2YEhZsVmLKT9ZY9V8jKksgGEUTkxc+Za
         +f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785905303; x=1786510103;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Dja9uktIHlytGxQ4Mfy9LyhfBwiNIxQgC7eDqSetaI=;
        b=QWZoVBE51WxLkqDqXVRWlEOZDwLowY2gb3u10HLBBAvokFPJjO5lHIq8GnKvaNYe0h
         FrG48XeVh4o3qolsnN4RNjhntqcTb9aGKz6WbbfhG0LOfZr1G3UxtY4i2r8GQtQ/Jc68
         wF+rwJeTWm9ebgZu4ujQHWE4WQi5lEqTfu5U2tNCLiWT0bHwwOET0LiTacnXnx6XiF8y
         aVlGWz35RVLXcWofy4FqN1Th9p8x9nxYsK1/L6h7MFdF9Kr8nnPqkHHCnnVqZIJDIV2T
         urB7VqHSJyt3jH44ULBDoJ2BWUVIvnc6aS0ttlYxHWRPI3B4ZNlNZ1qlyWd1b/U+bQVS
         tgGQ==
X-Forwarded-Encrypted: i=1; AHgh+RqCIGPXxbm+owNA7Za61gQ212WXxinNYR+Vduz3gU6bFP6hhALsKI7OPjK1CqOcT4v5tmpqClYdusw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw08f+u5CiWcpvCvLBOAro2uySHFcQndj+r9eV56TULLP/ZMYTP
	6O0HmZdQvJPWzAk/xfJYxcJEspIBWMejEtqSBirTfTBzAZNUd4m1ukVJ
X-Gm-Gg: AR+sD13cRvDHw+Nb7Bfdg7dMVtJYk9DNefe8e64YEMx0npsK47oS8BLqDP1mTt5GcjO
	c+iiOu2YMuPwP0K4gyIWwG+QG7MLTdUC5j1tIVhSoTcwNB8NNk1RY6GnqfzKmmCVRgXzqtNhOib
	WHK5swDywkhsPbz4Khu6tzAsDLvu1HIdGlHPv+4/bBzloQFpRBVPiqvHSozQQtSmiqcbZD1e1ap
	RpFW1NGhXEfKKrZLx8MUzhiskNFshE/2es7W08XWmtPluvKG9EtXkK68U0fhPOfQyWluzA7zEue
	Q9an0d5LtlTbDvxv2rd5AdXG3Gug5O7CC/95emDPjSz7eRENGoZu+FhT+sDV5QpgmgIIYybkYbE
	xkaEd7xJFhrbGxW69Y5mvTlCOFEtNOuejmcZT5MAC6VZSTWJkLsTDdxK00UnlasDRzMA6y0pcgo
	KpNmI0IaZGYD0b9niWeR0hBc8jZOIWf4/a4XOu0hT/EHHAswAUFT18JOu/gvTjgADh0vUbQFru
X-Received: by 2002:a05:600c:5251:b0:499:4dd6:3cc6 with SMTP id 5b1f17b1804b1-4994e73207amr32358695e9.5.1785905302689;
        Tue, 04 Aug 2026 21:48:22 -0700 (PDT)
Received: from foxbook (bgt135.neoplus.adsl.tpnet.pl. [83.28.83.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994f124135sm10989415e9.2.2026.08.04.21.48.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 04 Aug 2026 21:48:22 -0700 (PDT)
Date: Wed, 5 Aug 2026 06:48:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Jamie Stephens <jamie.stephens@gmail.com>
Cc: jikos@kernel.org, bentiss@kernel.org, regressions@lists.linux.dev,
 gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [REGRESSION] CyberPower LE1000DG (0764:0501) USB HID regression
 on x86
Message-ID: <20260805064818.542210d6.michal.pecio@gmail.com>
In-Reply-To: <CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
References: <CABWMpWQiSEKMkROgKZJ6nV8GXYgr7E=-SmsatQie4eK8b3F9Xw@mail.gmail.com>
	<CABWMpWR7Law_vHdeAMsOcY28VBcvX2jYSqq2SpksJSiLFcXhuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 30 Jul 2026 15:28:02 -0400, Jamie Stephens wrote:
> Hi,
>=20
> Per the recommendation on Proxmox Bugzilla #7850, I=E2=80=99m reporting w=
hat
> appears to be a Linux USB/HID regression affecting a CyberPower
> LE1000DG UPS.
>
> Proxmox Bugzilla #7850: https://bugzilla.proxmox.com/show_bug.cgi?id=3D78=
50

So apparently you are running some Ubuntu-based distribution and
"The UPS works correctly with kernel 7.0.2-6-pve, but fails with kernels
7.0.14-5-pve and 7.0.14-6-pve". Also with "Ubuntu mainline 7.1.5".

If your distribution supplies such kernel packages, I would suggest
starting with narrowing it down to a single exact release, e.g.
"7.0.8-3-pve is the first broken one".

This will make bisecting faster, or maybe there will be few enough USB
and HID changes in this release that something will become obvious.

Regards,
Michal
