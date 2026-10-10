Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B4A37F738;
	Sat, 10 Oct 2026 01:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596443; cv=none; b=lG1yf7wAIEnjjcrMd7dxmB4ehV4fU4UuUxCqbE4GZUi/U0QO9z6ZRWWMf+KsDUY4u/dAg1VBM+PVhIfNRLHU/QlwAr3mKQ0aPryMG0/Hj19FywF/WRq1KqDTz9kT5knpwKYO5nNt93gi8h/BUB8f/zdzrO2yuKO4PS+qQCoqMZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596443; c=relaxed/simple;
	bh=P+dc3o0BWUvg4dbbYs44Nz1N8y3UxiJsmhiXKdk7FAw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MYu4FL9jgUS/XsvKx/2/Zm2Jn8ej/t/ATwodLlCsNdqZPKIh4iMkTi1OX7MxY9qNX/dH+UyK+oRFZFCk+vzs3TPZ6wpRCuT1EStarIMimlBoQCqgK793XgL9QJEQGEt16vnp8N52M05lT23Da66NuKGdngVLRy1/IuP0ObRxAZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0W+i5HX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0W+i5HX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA711F000FF;
	Sat, 10 Oct 2026 01:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791596442;
	bh=6NPOt1shkcS4iVwEgyzjbYmgsmSNvyNIr2DozCp971c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W0W+i5HXfNA9ZVtYo8CjV431qeU3FU8KcmgPrU5OqzgQ6Pwc2H1VA/fIhgnLsWRSX
	 IBxeF0K7KapC8ePj5PULpQwm4Hhlh+6Ojx1N9K4rlZAcMfFyJOfm9jdw1QPElMCluY
	 xpaTOFF1BRCFcgKGbpfQKQi0sSZP0coGG+bMo7mfv54sGmC9KnomRO9TbEOnn5ZqqV
	 B7+2QyEAIssvaca6BnzUREjga9+6iur/Fwxphvonz/DY4bEiO4ciXrt2FXZxBi3GQB
	 zeCULnzoXsjCUXACl7/im3yKs4or4cMFTlnmDcTzbZGcVT/qS5IuuH45MEnAx4nZBJ
	 yqCO2bfZEDzSg==
Message-ID: <sashiko-outbox-166207@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
Reply-To: sashiko-reviews@lists.linux.dev
To: "Amit Sunil Dhamne" <amitsd@google.com>
Cc: linux-usb@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261010-tcpm-sender-response-time-v2-1-67ea364a21d7@google.com>
References: <20261010-tcpm-sender-response-time-v2-0-67ea364a21d7@google.com>
 <20261010-tcpm-sender-response-time-v2-1-67ea364a21d7@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 01:40:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add the sender-response-time-ms property to allow platforms to specify
> the tSenderResponse timer value, i.e. the max time a port waits for the
> port partner to respond to a message that requires a response.
>=20
> As per the PD specifications, the tSenderResponse values are:
>=20
> +--------+----------+----------+
> | Spec   | Min (ms) | Max (ms) |
> +--------+----------+----------+
> | PD 2.0 | 24       | 30       |
> | PD 3.2 | 27       | 33       |
> +--------+----------+----------+
>=20
> Set the minimum value to 24 ms (the lowest minimum across the PD
> specifications). Both the default and maximum values are intentionally
> relaxed to 60 ms to maintain interoperability with slower port partners,
> while allowing platforms to configure stricter spec-compliant timeouts.
>=20
> Also update the max33359 example to showcase the new property.
>=20
> Assisted-by: LLM
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-tcpm-sende=
r-response-time-v2-0-67ea364a21d7@google.com?part=3D1

