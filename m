Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114010;
	b=07P/gWoG3EK/RJ4UyoXDM/q/cmcJoUYjzdvJpqkkwTwnRM7IHyIN7+f76F9z6utkzkwD
	 bfLLW2c/WC3YnEjUKn6cfZ6g0XIbuhC5Ii0FlxIPt21jhDkkobuhYcm/rvpLCsO9ngGhf
	 jO9PfCIAyBdLdTE5Kjt4aG6NvzkDctaAfq5BbOgSgOy3A2vheWfXIPa4qNnrx9mr61sXn
	 AwTf1ai8QpPLjvVl4sp6l13GxHntUq43YgitOMBn2+kHUSGuN9Wd89dBKtyJW1nRfOesD
	 6Ne3MsaXixgkxsPvrzuxv3IPlYiw+DEqxopgHch6b0Fxa9K/OJK0OBHXlja8zYwXrTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114010;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hWVhlFQsY9P7tUbDv75NJxCr27bjY+2csVF8Jp6XR0M=;
	b=BJNZmBlW8jQDzQqSmUKwrrgzcnshpa20gA4ieo4x5Tb3KFNIxGjVWfh0tCg0C1entme5
	 PUq66geAGwjOyIiOQVGXIC6fF6GfPMOoWXCFebLlssUXx9MiwnecMK/mU+TZHXDAf0EYo
	 TWNxpCze1qSxuS7MI2EOdW2tc+Syhzqw2UbMS8+juzgbFjNSWvrg61/7zSHnvQsTETK0Q
	 Ung4KCbyzeazglgkmmJ3J+KxAaVsiA3gtl8XhYVR3GuH7K95jR9ZrNHCYDFHMj7UxzQnY
	 egiobKqM9c9qQsx5oFcCMk77KuY9fNT/Yygr3d3mMqUAAqZQVaF2Tg0Cmc+Ekpv0KTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eved7G45;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0B606A31A
	for <linux-usb@vger.kernel.org>; Tue, 27 Oct 2026 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eved7G45
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DAB1F01825;
	Tue, 27 Oct 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114010;
	bh=hWVhlFQsY9P7tUbDv75NJxCr27bjY+2csVF8Jp6XR0M=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Eved7G45/r0TbF/CjSe0MdcNIyXjWhmWzeEPcZktTBjPySyVMpR1yNDoi9wIAExe1
	 lrSy2wllU+gqNJkmjkA5M5wJqZI8X+QUvNwTZrIDPu5tWWPuT9SEGiqIZInCiOQfwj
	 VWwvSws0ez/ija96ThYzOlBMftq0ZnDHZ5V5F+pXoc+gGk2hUv12AByiurKKG7Q2Lz
	 2ZlnaXgUfBy2eFmDhpKxaNLeiMKCSGY4mDE+8+EvirA1l3kMzSIqqzDbdBcJKiRUj9
	 SsOB8Gx7TGshn4QuDyi/v9/wE1M/r6pKo8qXbPALAUVYy/lzThxEab9fpIroCb1lts
	 Mh1/RjKykWHRQ==
Message-ID: <sashiko-outbox-186814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/19] usb: typec: mux: it5205: fix oops on accessory
 modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
In-Reply-To: <20261027-llm-usb-v1-14-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
 <20261027-llm-usb-v1-14-b9751ddb9c7c@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:13:29 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

> From: Josef Bacik <josef@toxicpanda.com>
>=20
> typec_set_mode() passes a state without an alternate mode, and the USB
> and accessory modes (TYPEC_MODE_USB2 ... TYPEC_MODE_DEBUG) start at
> TYPEC_STATE_MODAL like the states of the alternate modes. TCPM and UCSI
> set TYPEC_MODE_AUDIO or TYPEC_MODE_DEBUG when such an accessory is
> attached. it5205_mux_set() then reads state->alt->svid: plugging in an
> analog audio adapter is a NULL pointer dereference.
>=20
> The numbers must not reach the switch either: TYPEC_MODE_AUDIO has the
> value of TYPEC_DP_STATE_D. Without an alternate mode connect the
> SuperSpeed lanes for TYPEC_MODE_USB3 and disconnect them for the rest.
>=20
> Fixes: 41fe9ea1696c ("usb: typec: mux: Add ITE IT5205 Alternate Mode Pass=
ive MUX driver")
> Cc: stable <stable@kernel.org>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-llm-usb-v1=
-0-b9751ddb9c7c@linuxfoundation.org?part=3D14

