Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC93BED46
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791304911; cv=none; b=ezX+FGx9/Tprap5W6PzqbLjq0xi7g8x6sq/aVa7QP7EdbQ0mRjLJ7DO2zPgHAc4AtcWXldQyYxzJN7pbb+blyF4pQ9CaRI22JU+DuyCjQ1J32yJglLFSupwkaMSotENqAtXM9zDl6LaKvhO30qHzasf+MUAFrQHuOpu+k0UFfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791304911; c=relaxed/simple;
	bh=RHjpP8iYzGMLz3XVrp0N/qQNZRmgtr40YBZKgK1NTVY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jGwgh17XoucYh8aZbH2Mx1j2WqOZJYGjoL7Sxt63w/U3V+9IrJV2Zm1uV5By26dWvAKhXcYFzqBazzkUxteEZEfgebEx0Tmy7iCsclvKLz2+t0upX+cclckko9pm9Pv61SRW8kaeeCwrt7fdsRSqnRjpLjq+KO1achEkIkRpLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNyoEuJM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNyoEuJM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D651F0089B;
	Tue,  6 Oct 2026 16:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791304909;
	bh=RHjpP8iYzGMLz3XVrp0N/qQNZRmgtr40YBZKgK1NTVY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZNyoEuJMjAMtwmwkP5W1u810AVHJ2Ry2CZIy2agR7804G0aIzb+KHG8Mc4QQqMG1H
	 8mnEQql7H+inNHWnZUsy4S4VMswZTMJaPoA6rC2fJAOGPwF2quCVBEqwF/CSPqcvBk
	 K9XLgR2j7WDnp0neSsqWaEPn4iwIZMCoezyH+du0woVc3lLt9jZsKNynTNzV/jVac2
	 urcTdZLNrhF1JOyf0gsimFGd+d3lLFhPXZPMHxVmb9RVO7KGSpsTUr/MtO/hougZlh
	 mQEO6O+Eyu3HEKsyBkL9aF6GKUaqQ9dQATokEgk9StIZOvSXRYC2UnSCwZIsS+BOEe
	 MND/yxl9HpUMA==
Message-ID: <sashiko-outbox-162264@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] usb: xhci: remove redundant TT active EP update
 from xhci_free_virt_device()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006152427.3735383-4-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-4-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:41:49 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Function xhci_free_virt_device() saves 'tt_info->active_eps' and later
> calls xhci_update_tt_active_eps().
>=20
> However, xhci_update_tt_active_eps() only updates TT accounting when the
> number of active endpoints changes. xhci_free_virt_device() does not add
> or remove endpoints and therefore leaves 'tt_info->active_eps' unchanged.
> As a result, the call to xhci_update_tt_active_eps() never modifies any
> state.
>=20
> Remove the unused active endpoint tracking and the redundant call.
>=20
> In cases where virtual devices are freed without first dropping their
> endpoints, xhci_rh_bw_cleanup() resets all bandwidth accounting data,
> making the update unnecessary.
>=20
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006152427.3735=
383-1-niklas.neronin@linux.intel.com?part=3D3

