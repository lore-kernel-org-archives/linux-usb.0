Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1638478869;
	Fri,  9 Oct 2026 07:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531503; cv=none; b=S3vztGWxyhbvko7lJbKuwtKEYc5BvIH9fJ/uO1ZgqtC+0HVsmnqCfceTupxlwaOts/gVoBUUyFBBKnrVt51fsfxi6Zi7v0b2rqRLhM5ULDdBxuGA/mwvM1PcYgQdX3SZdGjAqeYAFr+bpxxB34PnhYhda0L9EuCKlszauhROJao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531503; c=relaxed/simple;
	bh=IrrIla3N9eJraEmnTxjAEXp/nif0MgJKRTVvJR5rIkg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tOzuldVdcQ0z2o7J+P4jPQROz6m5uP01JPoH1VE9tZrP09d1ywFamXqaN+z7LLlLqSJMZh6PqiVvNo7HEL13BJuY2yMtFVBFCNbGfgUBk4dqzfC2cT0esE7/WmHEkcoRdaqb8OpNdAN0SaopkqU1Ejc3m6HQLIAXns7bqxUDdUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwf/ONZv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwf/ONZv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C5931F00893;
	Fri,  9 Oct 2026 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531502;
	bh=IrrIla3N9eJraEmnTxjAEXp/nif0MgJKRTVvJR5rIkg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Fwf/ONZvqR4eIGf4U5iniVzsxfgXZME89f/6pA0eyA2cBORkItNk9gjtXCVDie63b
	 NH6OeoGeuhcGv2/ltx0WqRitjdZqWFw86y38eAdhVcFSuUcv7S8JEs52qOGG2Edlgb
	 uqhW0u+B/6EMDYgYwlehjmZo4RtIELj0dhv23uQWd+xeDC4guHFaPlxj3gH+UClCPM
	 xRD+++mo2SyCaqCUKtMLcfJOUIIMlKA64+P6JFNBUFEjY34I14BwWqGEx3b7i6sxPu
	 ZXtNZ3DCSS1c8bCMSaQa+ID2Dok1pYDpM8BLBD9wfaiL67fSJAw26tYTq0Q1qtVtoV
	 7tyN8MNEb8hEQ==
Message-ID: <sashiko-outbox-165020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] riscv: defconfig: enable ChipIdea USB controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: conor+dt@kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-8-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-8-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:38:21 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Enable the ChipIdea USB2 controller and SpacemiT K1 USB2 PHY
> as module to support USB2.0 controllers on the SpacemiT K1
> SoC. The _UDC and _HOST are bools that decide which roles are
> support.
>=20
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D8

