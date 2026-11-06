Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988530;
	b=4kFi3FU0+k/MNRw1tEh0vId+Bkp/JEEFCL1GcqaI1pvZkeZslZU26hqYz55LDDNgORw4
	 w+KAxDla0cqKlYbHGDFNl2aASILqdec40YL0OmnopSLkiSR1ncUyQSxs8kewh4KL3monQ
	 k3Le51Wk5+VvPVzKZbiA4tqDUp1Wr1uns0g6Jk78jfIS3s6b0WMZhmjR5T3abgVVRWMuS
	 1QhPUfO2OWgQYwjjQabANChXM6YcM/Pjyv4Q6oSkAjsKC4Cp6ogXMOZQ1D28fdUI7Aehz
	 4kTfoVsLWdvpTiIhjK6n79s6IBuj67HzOhzkjiH2j59WIgspwGhWQ0hecivEEVg+qsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y4l4xbNoVH6t7bxDqWZVYlrakKbi7ENmwQ6uml3O9j4=;
	b=EN4Fl7FG0MCQ2Wj4CelQCohc8tjzWlRX2H1aidrTjaq7cwAyrGsY1kYnZhCtTNBiQfhn
	 FngflSpZ1/AqK2TsU4lg5c6bLpQM2dsLNTaQ9r7/GD0GlM2fJTqzovdD5yiSFjjEkzffJ
	 ZvzU40mhwZ70nOD0w4mCjAt4nMIlnP3jbbBDto09Ur3XfkVNfSpKv5ukbGWzoqjk7cUJF
	 o1+iNxq1v3ClmXwuetqdxnJQ8saxB4SJB6QdB1jcna8o3e9RziTkaYCTBZobn2vRldnQ9
	 n9ndb/AKHeHrNhpeHZ5jqC/ksneJ+Wl9dgmSPbzZ2Odqi7P4DpGejGet7IQwZIQKFtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezkbLqie;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52457606A32D
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 18:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ezkbLqie
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEA11F0089F;
	Fri,  6 Nov 2026 18:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793988529;
	bh=Y4l4xbNoVH6t7bxDqWZVYlrakKbi7ENmwQ6uml3O9j4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ezkbLqiepsxeY2GNna/VuZnh/4ms4Ea2Sc3PrXN3Pt+KaKrrly9bMPIR5e45/37i0
	 /ICbMnC0Mw6RhRpAMnq5gzmEfUSCGlCMK5+ucoKJ2PH/Zz+A+sz1h+rkB2RmP9N+kI
	 liO+WF1BPb50+v85K5dCwL2NZZejHjbuD186c/m+59kXUh15C4qcgw9qOIV6GA9dHG
	 PsOuN59EX1k0x/ll+rb19aT68FQCpip6L8j/7Uz5edDRFarGfSIkZg5SRYujC+BABb
	 9BGHW2FwAi1HWtXdfUkrGwdQ3kB4nLbzNDuFOJk7n0KiBuXqGkh1XGsTF1eesH1OWt
	 WdY0o9oP/TUfA==
Message-ID: <sashiko-outbox-201993@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] usb: dwc2: hcd: fix possible successive vbus
 supply enables
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261106-dwc2-low-power-fixes-stm32-v3-4-68d2a0e9bab6@foss.st.com>
References: <20261106-dwc2-low-power-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com>
 <20261106-dwc2-low-power-fixes-stm32-v3-4-68d2a0e9bab6@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 18:08:49 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> External VBUS supply may have already been enabled, before entering
> dwc2_hcd_reinit (e.g. the controller is in host mode, without any device
> plugged).
> This results in vbus enable count to increase every time this occurs.
> As consequence, dwc2_vbus_supply_exit won't disable vbus upon suspend
> request.
> Fix this by reading PWR bit before and after dwc2_hcd_reinit() call.
>=20
> Fixes: cd7cd0e6cedf ("usb: dwc2: fix unbalanced use of external vbus-supp=
ly")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-dwc2-low-p=
ower-fixes-stm32-v3-0-68d2a0e9bab6@foss.st.com?part=3D4

