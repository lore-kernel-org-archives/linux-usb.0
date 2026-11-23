Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437536;
	b=Zv9QPzVktQ0q2Fwb5OpmlHzrGvUIKSbFXaLrpLPsy8pPwFGlRdhIc1jDAKY3e4VJfknl
	 zzov3hSKLAYRN0EZ23y3/sYZnvprCVIW35S6+TohC4zUv1DPdPtUZaYOz1rfZU84l1RkL
	 oB6REiM9leECvfoGvYOt1q678/AlCO1IRTvs+Y0XueboijoihPlIfO+PpBVDVcrl5a3xO
	 +gVSZ/x4josm7Eg98Q5J3k2Ghf+bq99rPNuqJ2e9R7fw6sqAhQT+Wvh9qLv1CmbpZdCty
	 rjPAXB6/EhhXXtrKFtOC4vLw7Muq/XQGdhX0re7ZLm1sNf0TjrgE8ezI1olg0/JHwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0iRhY/cffjFrBT/Pej2HZLcBsrHpTC2RVGdSrk8MRlU=;
	b=p2TOmv99dpBUAbRI6mKyhCCs1SFvL7q6GFBHZNk4bJlkwq0futhD02xHdAq2kDq7shhR
	 5PnsmgGfMZToq3spAV4O3Nkolkxy0K0+L3T9Vw+Qmq5yKH3e2nh4tH64Z9d6G2sZa26SH
	 hGJARX3pR9MlBsitKGAoSIpAEZcMJYEbpKLpno1QwUo2XXFRark7+ekAJI2b3AHGEupCD
	 w7tKiT2VUjHvc+r9X3qlgZZQaN4iOcmuqzrZw90Uk/LCzJZkQ+p7Px+kSQ/KvwKprsWvV
	 gAd09hE/nIO84GuuSGw8BfnrOAC7W5eqjDo1S9FQ4vqDshUeoTVFl2NvUkOsQi+3KPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIl5ejKK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5D6606A339
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 12:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PIl5ejKK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034AF1F000D0;
	Mon, 23 Nov 2026 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437536;
	bh=0iRhY/cffjFrBT/Pej2HZLcBsrHpTC2RVGdSrk8MRlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PIl5ejKKOoOa/V4rXJ6JM7n6uI6DMD/AIFzvvKAcqlsnVOO1ZuzUmzClLPOqxcA6z
	 js6ycEmDkiUbUCbeMAothTpuNg9ZcOpe5KWercCV28f1LNq5VDYawYtFriMjgEGg8L
	 TtqfmcZxli0eaCNwvxI69KTHtgp46A/1+Uo5ECtM0P9q131FMxlpIGw7y11bflvCI0
	 /uogfWLoB6KQF5L2j+nJoT6coaxPQt8HcZVeFlS1VQRWGIvztyKvBefuMOK3isoeC6
	 Ki64ORbEjDUjhooqWI+q2jHq9gJ7VRZut7u+cRhFwZMf+V/afDM8qawN0W8o8Y55m7
	 ct/Z+Rf1elRDg==
Message-ID: <sashiko-outbox-229238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] r8152: do not (un)register the PM notifier under
 RTNL
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hsin-Te Yuan" <yuanhsinte@chromium.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
References: <20261123-r8152-pm-notifier-rtnl-v1-1-31e011a2ee51@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:38:55 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> If an r8152 Ethernet adapter is plugged or unplugged as a device goes to
> sleep, the suspend attempt and every task waiting on RTNL can deadlock,
> leaving the device unable to wake up.
>=20
> In commit 5ee3c60c8d3b ("r8152: fix the wake event"),
> register_pm_notifier() and unregister_pm_notifier() were added to
> rtl8152_open() and rtl8152_close(), the .ndo_open and .ndo_stop handlers,
> which run under RTNL and take the PM notifier chain rwsem
> (pm_chain_head.rwsem) for writing. During suspend or hibernation, the PM
> core holds that rwsem for reading while calling wg_pm_notification()
> (registered in wg_device_init()), which takes rtnl_lock() unless
> CONFIG_PM_AUTOSLEEP or CONFIG_PM_USERSPACE_AUTOSLEEP is enabled:
>=20
>   Task A (open or close)            Task B (suspend or hibernate)
>   rtnl_lock()                       down_read(&pm_chain_head.rwsem)
> [ ... ]
> also resumes an autosuspended adapter whose interface is down, which
> rtl8152_runtime_resume() handles.
>=20
> Fixes: 5ee3c60c8d3b ("r8152: fix the wake event")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-r8152-pm-n=
otifier-rtnl-v1-1-31e011a2ee51@google.com?part=3D1
