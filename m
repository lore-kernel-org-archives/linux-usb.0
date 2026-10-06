Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09286455194
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791305275; cv=none; b=qDc8o3jj6FdCRjbpu/KN/K9xtDz1sqf7+/M0o6+L/7U5MS1Fk0nndCn5Aeo5x7CAPZRlIhP6w8NYMngW5k/fwefHLlkkBVdwE3yekQ3JdnH0Piqv3tW73ZbFv4NEJ7bsfPJrFUj7VRh+sOnIVs5BTWsP6Tt/TV7ftEJ/R2lDzbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791305275; c=relaxed/simple;
	bh=CqBd9jrCficHPPuxInPpsClamiopxK98AzX7qGhyOiI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Ml65kSUZf7prjmh+MCpgaF0d0bOdBu3S4X7H70hxHpcr1QLFd2niCIgelUZEZMeThLG0Y4G7lbDR3CouaveXI/RBF/a0GPQAj9A3G7FBIHiyvw/jPhEAy9QdeuakWEUlR9LKa+hAwSyFfko0KD6ySuNcjctlo7jiz6H1Wdl/99E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHrFXZMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHrFXZMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967121F0089B;
	Tue,  6 Oct 2026 16:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791305273;
	bh=CqBd9jrCficHPPuxInPpsClamiopxK98AzX7qGhyOiI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fHrFXZMlEXK9KjQsyB9U88hY+CW2+XrLRpFx9DOVDf5/yrJq+CmNTPwHwKeJFiK2/
	 Ltgf0npUGSw9UrUaVhkmtvkjAhEdBDd0sZG4UYyQ7bpACrubLDyeL8BVMBhIrgq/nQ
	 toFaObC3tKx5vsbDDV+k9RAiIeGcfYEdsuN+9jymlSYMX5lXbOU2cg85c7NMrAGWLl
	 i9QDsgz0JtuVL0Wwzs2lYtSa8TzDZZh6ZkW5L4YO8y3ayXjvKzvAgWekY0cpc/QRd/
	 /5kYod/BiKwW11W6oV+EzfG3t7KkIenmuiV9ove9R5WhVUE7jtTV1zC9gtkax155yn
	 IFe2ZicdYajMA==
Message-ID: <sashiko-outbox-162269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/5] usb: xhci: remove unused structs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Niklas Neronin" <niklas.neronin@linux.intel.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261006152427.3735383-6-niklas.neronin@linux.intel.com>
References: <20261006152427.3735383-1-niklas.neronin@linux.intel.com>
 <20261006152427.3735383-6-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 16:47:53 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> Neither structure has any remaining users in the xHCI driver, so
> remove them as dead code.
>=20
> Last time 'xhci_cd' was used [1] in 2014.
> Last time 'dev_info' was used [2] in 2013.
>=20
> Link: https://git.kernel.org/torvalds/c/c311e391a7ef [1]
> Link: https://git.kernel.org/torvalds/c/de68bab4fa96 [2]
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006152427.3735=
383-1-niklas.neronin@linux.intel.com?part=3D5

