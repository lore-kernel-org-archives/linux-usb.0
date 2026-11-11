Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404672;
	b=mz8RNCJki8yDZE6vNJoFSknSwNpxzeDKjqTZY50YeXOw1CnL5b4ncoldu2TqyqCcuprG
	 e/wkqeUeq3oA9qMR0SePJlfR4EKz6AiBb9FmANuA5erbnALuVhH7SjkozNM03NCiCek/g
	 4LlwaNm+3wZuHzE7Oe5GQdjqPYt7my4Zl2ReTCeLZTUMh69DlSEZAHFOKV4y3WLFDR1ty
	 sD/MJPCjHiAIgMpzZlFEcVTyryZJ5/f4DvO6NajpXbSGzO7sfrWnKL1ebcd7z9A/zWJZ9
	 +N4z5aeb7JyZMBcpJhevt1L3e+xBK/Yb5ZwV6G62oS7Cr1cowdSDotWLws8IDBXS7Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404672;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+TBhAwKXawCIwwvzYW4YqyE1PZDfdZwtHJmYHJ8fFMY=;
	b=XEWr59PJjfhwTqEcntAooHlYcYfb7fzlmmv9AZ+tyon/3ZE3XvDAzlCYZGCtHVGfQb8l
	 fnfv+YMjjIhU3RN7yuDc8AI+SHMXkvuJTzlzEmQJmX7zJoajAOaG6QCp/UvE4VIlnjyak
	 Nfdy6dmsoMPOv6eTyvX4zP+6ad7Pi9bKp95xSE0gSfMTHEJAyzDggYN6e5Ay2bMC52PeE
	 C/2EmBMkuBTWq0x0JVkSpp4DNQVZd/Vib76kkZwMfWWxnjHHLPj6O2iyZQgurGlPlA/Tu
	 vMiajwnvPNSmxIyxViWW2780ifllqd+X+J/zkng9LFSkRsrv61NBtyxktjSf583ZVbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZuof2ox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C76606A330
	for <linux-usb@vger.kernel.org>; Wed, 11 Nov 2026 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SZuof2ox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 615031F00A05;
	Wed, 11 Nov 2026 13:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404672;
	bh=+TBhAwKXawCIwwvzYW4YqyE1PZDfdZwtHJmYHJ8fFMY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZuof2ox3ZzLmqhXOc1RuNdljLSUR/CXMe1fTe9UrwU7SjKesRPSwScvcK3oEGNr5
	 mo7xzpYIVZQf7sTH9a73TzcnjyEtAbU8A2NL3ZxKVTHkQLAH9YUAKKrR4KTL5PlI1s
	 oSsD7lX3E5MWBtf/hSqoJoXaLlbGGxdab4lVl6/F6JDE8ICLlFgXjfq9C5UqiIsXWQ
	 c8M9n3J7vPKwByj4NHGW+tmeLUdy+BSq0+v5ClXcgVfzicyuaxHWx1m5NEkr+QnXZC
	 PBSGgXDIrO7AUjyDmXFW2EFzk9xMpDXPYp7gQ1xDlPz56QKWpafP9Rsa2/7JMAxatQ
	 LxjDlxvsVPeHA==
Message-ID: <sashiko-outbox-209085@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Enable runtime PM for the Ice Lake router
 with the software CM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andre Eikmeyer" <dev@deq.rocks>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261111130851.62101-1-dev@deq.rocks>
References: <20261111130851.62101-1-dev@deq.rocks>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 13:44:32 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] thunderbolt: root switch skipped in tb_lc_set_wake() and lane
  init on ICL
- [High] thunderbolt: missing DL_FLAG_RPM_ACTIVE in add_link() suspends
  active PCIe
--

commit 7b8fe879e2da1e2a2041c441ee239114a6aec29b
Author: Andre Eikmeyer <dev@deq.rocks>

thunderbolt: Enable runtime PM for the Ice Lake router with the software CM

This commit adds tb_switch_is_ice_lake() and enables software connection
manager runtime PM on the Ice Lake host router.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a5de..139ef49b49e5c 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -3044,8 +3044,9 @@ static int tb_start(struct tb *tb, bool reset)
>  	 * implement the necessary router operations.
>  	 */
>  	tb->root_switch->no_nvm_upgrade =3D !tb_switch_is_usb4(tb->root_switch);
> -	/* All USB4 routers support runtime PM */
> -	tb->root_switch->rpm =3D tb_switch_is_usb4(tb->root_switch);
> +	/* All USB4 routers support runtime PM. Ice Lake also supports RTD3 */
> +	tb->root_switch->rpm =3D tb_switch_is_usb4(tb->root_switch) ||
> +			       tb_switch_is_ice_lake(tb->root_switch);

[Severity: High]
Does enabling runtime PM on the Ice Lake root switch put its link
controllers to sleep without configuring wakeups or restarting lane
initialization on resume?

Ice Lake is a generation 3 (non-USB4) router, so tb_switch_suspend() uses
the link controller path: it disables plug events, calls
tb_switch_set_wake() -> tb_lc_set_wake(), and then calls tb_lc_set_sleep()
to set TB_LC_SX_CTRL_SLP on each link controller.  However, tb_lc_set_wake()
bails out on the root switch:

drivers/thunderbolt/lc.c:tb_lc_set_wake() {
	if (sw->generation < 2)
		return 0;

	if (!tb_route(sw))
		return 0;
    ...
}

When a connected device is runtime-suspended, icl_nhi_suspend() keeps force
power on and leaves the root switch in link controller sleep with no wake
bits (WOC, WOD, WOU4, WOP, WODPC, WODPD) programmed.  On runtime resume,
tb_runtime_resume() -> tb_switch_resume() -> tb_port_resume() ->
tb_lc_start_lane_initialization() also returns early on !tb_route(sw)
instead of asserting TB_LC_SX_CTRL_SLI on disconnected downstream lane
adapters.

[Severity: High]
Can enabling runtime PM on Ice Lake allow nhi->dev and the root switch to
runtime-suspend while a tunneled PCIe root port is still active?

On Apple Ice Lake systems, nhi_select_cm() creates the runtime PM device
links to the tunneled PCIe root ports through icl_nhi_add_links() ->
add_link() rather than tb_acpi_add_links():

drivers/thunderbolt/pci.c:add_link() {
	link =3D device_link_add(&pdev->dev, nhi->dev,
			       DL_FLAG_AUTOREMOVE_SUPPLIER |
			       DL_FLAG_PM_RUNTIME);
    ...
}

Unlike tb_acpi_add_link(), which was updated in f3380cac0c0b ("thunderbolt:
Runtime PM activate both ends of the device link") to wrap device_link_add()
with pm_runtime_get_sync(&pdev->dev), DL_FLAG_RPM_ACTIVE, and
pm_runtime_put(&pdev->dev), add_link() does not pass DL_FLAG_RPM_ACTIVE.
When a PCIe tunnel is already up at boot and the consumer PCIe root port is
already runtime-active when add_link() runs, nhi->dev's runtime PM usage
count is not incremented, allowing the Thunderbolt domain and root switch to
autosuspend underneath the active PCIe tunnel.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111130851.6210=
1-1-dev@deq.rocks?part=3D1
