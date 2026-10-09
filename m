Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565F640E8D7;
	Fri,  9 Oct 2026 07:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791531276; cv=none; b=P2rKTiXEuQK7Qt/OK9SB2eXWAtbufvBcL7bqKNejQgLOdLT+kA/PFYUvdBnZj7sVZQDVpz8gnA4avuNX9AUUkn0RuBSBsCNgghpwUuQLIAmvt5/qz/C8vHJNSSFYtjBoy0njOplxOZR1EM6s9VK3jANjiT0c0WiQQe3wCXCLlc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791531276; c=relaxed/simple;
	bh=xOFrB18wKYAregbwazbSEzYg2p2Jp7LCDm5NuETpx/Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=J8J+vbeSxxrrlRgP7SLbOVrMbavSYafAHsfu/9Z6U0n/TQt00UHR4jSwfWxw6iu6bJMdASQrHlYDYJ7e3yV099kUuTwNmPurS2STCYO7O+L9M74ynFymlKZFL3SRszsITH75dlVVnm0WOcz4ujZ+inxh8sb0bPcn7zLePMy8BGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDaQ1vfa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDaQ1vfa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4991F00898;
	Fri,  9 Oct 2026 07:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791531275;
	bh=xOFrB18wKYAregbwazbSEzYg2p2Jp7LCDm5NuETpx/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hDaQ1vfaL82B4Ri7mnBO1jEj2Vz7qSw4qEFWLDYAcofNidCFHea76z9xm1p0+cMa2
	 RDZ5C+BVtEMdVOyeLnWUIVNwh4V5rmF4Ek+UQb13N3jfI2dfoQNn/XPCtstEeuuiuo
	 GMykJe3W7fmJiRNq+MyGply3JVygH3LWBjaaJl5eiUC7xePyz/qRtslnALNQmGy6We
	 C34dobtOddWblAPvKrYJ+0rmutAaTCTKNjHKDl9j4tqwtxNckoWAmKqlK7kuA1040s
	 okM7gE0678ZHvaTLd9P+JJoDdhSvkSL3UnHciJHYEhBa55plkRbiCgW20T66CE0XGE
	 TNlvErcuDardg==
Message-ID: <sashiko-outbox-165009@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/8] usb: chipidea: usb2: add SpacemiT K1 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junzhong Pan" <panjunzhong@linux.spacemit.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
In-Reply-To: <20261009-b4-spacemit-k1-usb2-v4-4-2d98e5324d9a@linux.spacemit.com>
References: <20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com>
 <20261009-b4-spacemit-k1-usb2-v4-4-2d98e5324d9a@linux.spacemit.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 07:34:34 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Add a compatible for SpacemiT K1, and add platform data with correct
> flag since the hardware doesn't have internal otg register support.
>=20
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Tested-by: Ze Huang <huang.ze@linux.dev>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-b4-spacemi=
t-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com?part=3D4

