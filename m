Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C4C49BD79
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827363; cv=none; b=br8nvb9XohoYrjfWWjG2Ew01AONiJP4mp6VA34FRfN6DGbZXCpWRJhRe5Y2xsAl3gU35MDi0C1r/Zxl79w05Ap6ZAO3/gH+K8a4bQ/UlcRPQgUMFSgA4rF58LHXRr+3TfttEON/xHQYWOHWkawLZKruFpc4HZNuFl58Uk5l9sqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827363; c=relaxed/simple;
	bh=FQkotq19PUJZTbUCKYinotJMgX07MNKak/ASIy4oG7g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WHy+fuxqoe/R8wdF1FlBSiRHzT9EvMAFZ933Pyb4X2Aqmpa/bSWZw8kH8Q6NSo2KhskC4GCh0ZfcY7EIY58ysYkkcXXzvSB2/1gj9RbiuKYIgBEVhWqrVYm9PK80BlNIm+sM0Jwyn+riZdXxCv917LvtTN6Q85zVuGN3yBvqjFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=db7UDh3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="db7UDh3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE081F0089B;
	Mon, 12 Oct 2026 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827361;
	bh=FQkotq19PUJZTbUCKYinotJMgX07MNKak/ASIy4oG7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=db7UDh3n6kpBdtNDZ+v5nEQ/OcRkvXA4/3ljJ/KcwvEUQFf3z6qyrjXZ9opLYHhVe
	 V2ZFKT51EIkOkDFDWIzNJJfgRarjtVAYBdh8UU1YTQT+QD6FhYGSrtG/MZpXu5DPT7
	 92OeZ/JNZYYk+n/Dr8FGkJlKlsA4vbHBX++nXGxx+2+LbRaP5vbgyA2zSXfg9CJuqK
	 EHZxwtCSrLDFL3sH88Z9irzEsNklbEEW+9vf3e7Gas7yB8tGJagqkDQG9sW0uzwNXB
	 KqZsbRhs7TGSutjRdIjsaUwojH7Fqs+vVchIEji8lb/se1xv2WLzJFb5C+FqXZDF0y
	 IS5CmokpVA70A==
Message-ID: <sashiko-outbox-168494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] i2c: Add NVIDIA LSTP I2C driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adrian Ambrozewicz" <aambrozewicz@nvidia.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012-lstp-usb-adapter-v1-8-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
 <20261012-lstp-usb-adapter-v1-8-aambrozewicz@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 17:49:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add a driver for the I2C controller channels of NVIDIA LSTP USB
> adapters. Each channel is registered as an I2C adapter; devices behind
> it can be described by device tree or ACPI, or instantiated from
> userspace. The device sets the bus speed. A transfer that fails on
> arbitration loss or a busy bus is re-issued up to nvidia,retries times
> (default 3), unless the device reports that it retries itself.
>=20
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-lstp-usb-a=
dapter-v1-0-aambrozewicz@nvidia.com?part=3D8

