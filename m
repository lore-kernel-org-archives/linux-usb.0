Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A628C478E38;
	Fri,  9 Oct 2026 07:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531395; cv=none; b=D57/1Z9rhcUkaAf4q3QskPoQTZ5StHSy5eSl4ieRXebIBWJNCv4BYqd354LRsLxHBo/ca2tDrN/6kvY46LXNVWk6Vv9uVxqoyZxtuMd3wquCW7XcfbKtSnu1rmxJl1ZFc1COHq8PnOekDVSYRIWbqeHdwjTtZTF29HQvknCGaDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531395; c=relaxed/simple;
	bh=iuuDtlOoWPZREw5SHG3SHgk1UdjcuurYumnbOJPhpC0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gBtE3NhjGKaUey/5yBRS+bUXCqjDkTYbA996vKbe/rO1GWmqnpdu/cBcgTPISd1LRepXUspkauSy6XwBNEVlBIwJm92kwV/Kjlc7oLIYwgBERSguv5EJqnAJk6aU0mAGgdoffQrl9tFlK3XWjkVB7yQUgb8eMaF5o0GDqe0m8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv2JzT+T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv2JzT+T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293911F000FF;
	Fri,  9 Oct 2026 07:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531394;
	bh=iuuDtlOoWPZREw5SHG3SHgk1UdjcuurYumnbOJPhpC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dv2JzT+TNKAyRpV0IdzfOge3RtTLiEIzY8j1QS5CuVWYtStfX+NNWuCnBWywR0AED
	 Zty+LokzMRl4fnMZBPoQ8PQ//Z0s26cfNN9Vv1kPmuiTEdlrwngVPThYmTwuDR50jF
	 icQpv7d5zIFLnIIpWXUwE+RA+P2v3yGhwAbFu+rnbnimFtJyv86Q7xq3aa8PveYHx6
	 ljQPZqlxC7nuk025AuF8LRAa6FOYzlSMd+kvkW2Tt8WzYY6ltQTElcfO8bOQ1wp9O9
	 I3a/JkqlLG/ZdIy+rP+FMFRX8gnng/KXYUEGZAklFMVuSEl4sSVB06UPR4yjlUacR1
	 Eh8lZQUDRCP4A==
Message-ID: <sashiko-outbox-165016@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] usb: chipidea: usb2: add optional reset support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-usb@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-3-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-3-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:36:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> The USB2 controller of SpacemiT K1 SoC requires reset support, to keep
> compatibility, add optional reset support.
>=20
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D3

