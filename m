Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592358;
	b=ZJ5AOf6zPmdeL2/8YkBlxqVCUfAJtMAiOwQVl2htGHLbO9zrgqhwVn4a/e2L7wQPkP3f
	 ZNR+jfKPg804dFsnQdN0Id7POT5ye6xH0wCDn/81x9KjmGCK7QU49U6/KAdA1ki9hv7vD
	 1b5d9ZmaEQQJ6usWRiBc/6vg89qVw94MGqyYmgIqaGWLG7WRZg0CB0muAp/OuH0WqMUCb
	 osE9YY6XyIejblEclPfZQrHMw7L2Le6hwXbNybLJQAVoEiKPLkw1rZr8WmvDEH9VIEjMC
	 e5NTnXhlH9rCBpt9AB87Iwg4UTG6cfxI3StnzdaxRRMO0ntWNnpI6uhO0hRyQ/ewpxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592358;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5twXW0UnYjhuxMyvx7A6ERdfZBt6SQxL0jZsM0FxaAI=;
	b=g3ql5JtGjW0/x/DKrqqAIkaS2yvGWP28m6ci73K9u6sM/C/0jhqAPaZMx4jXckO5BknR
	 revQTNepNRkvBzDn24maTfE6vKTRB5c9cxPtAPOidpUUrPm1yDthTnLtm+pPCZR+xYEZK
	 U+bUuiL+FhVjWLAmh/roR2aZ75uZTv9JDZ2rTonRSbDDVliIJTS7OvRWLqhTW5G4fMgef
	 t2MlQEL3xC/Od968M9Bm8V/Ni7A0HmgRg9jhlnKk+y/xAHr2q8vPPX/Pkf07Y+xdXiHYv
	 46v1ylgr8Ogp5tLJE8KvQn8vCJswNH5DeNNmZtCTABWvqlVsdZA1H6AcQrK4G85ln3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpIdJbrh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93562606A31B
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpIdJbrh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117881F000C4;
	Wed, 21 Oct 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592358;
	bh=5twXW0UnYjhuxMyvx7A6ERdfZBt6SQxL0jZsM0FxaAI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cpIdJbrhItdDJkVz55XSd33nRuU0v62tgarxZIYSLtvqHygRX/ZJs+4homugeO3U9
	 pJL0AUXXvwZBwuw/H/2V8x/LHLQiRVsZaN3DLVunE6h4khMLfb57L/lT9Nt4rmBcfY
	 FWQjgoG6YrG6wANUTeuMhn403QEN7LDWEN8uBJ7M+1yIXMn8xeVRcghZf8PxSeGjNW
	 lQkhVChyLQrhSRn8WAPBZWjuz8mP7B5wzE5WNdj7NVjbGGcBtmSXIEgheXNHcfySUz
	 2wpEOcGcc7RyXIyfsZknZVE5qGcwbwgOtwA9znvqxWAhOyZx0MqDVM1UhjAyn4P/dK
	 SFwHrEOm8FBOg==
Message-ID: <sashiko-outbox-180357@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] USB: serial: io_edgeport: replace atomic command
 allocations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Johan Hovold" <johan@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261021141154.2324793-11-johan@kernel.org>
References: <20261021141154.2324793-1-johan@kernel.org>
 <20261021141154.2324793-11-johan@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:19:17 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> With the line settings no longer being updated from the interrupt
> completion handler there is no need for command URBs and buffers to be
> allocated atomically.
>=20
> Signed-off-by: Johan Hovold <johan@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021141154.2324=
793-1-johan@kernel.org?part=3D10

