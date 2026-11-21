Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245944;
	b=Bi/r6gdTn9tYSK6CKLMEPybj5f8ufPPO7yVbpzZedsHJYeh/HXvpC5HH/bibOVBVCubw
	 APnaNbr9kP5VCmhC+BfK0Sjyl+c4R7zB5UoPUkbEJ3n+y+d5FCDb7TheIUmrViv3FE9kO
	 OV1VYRz0wOAzFildDbx6hiid9Jtfc25sO+vhyBKppPLHYE++Xcr1Zj2VgNYUFkKTEdATS
	 f8JSLPGoHURyBH6hhOyLqpyewTYW/4bo12eQOTouCeQ1prGheMWdgUPghhkLnK3dXovJK
	 LoNHuqVjWED6BnunvffRGRS3IhRUvEV2B+2AexjehmKVgmYAN6RwR5uwn8XHsfGVPaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245944;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kCXwoPOX1SduQhXpYPPpqcnP9osXZIYJtTKSFmyIm70=;
	b=OfpfIhRu+J5OBju+gCARGAYayJlQav8wBStDNhFWUxoykvtXVE4O9J+pyQh9H+3i512m
	 ZuiZ209+xMQHk/tn+YU2T1fm/AIWee8yZFuDax8W2UV9d5i6TnLrqZvmqs83oFooVMQgn
	 qkitPllZ11y1gDDUUxjhalcSrwSDvAyPWomLifXtgiXiQa5yi42l3F0+/8DJ1HXyGoPif
	 unap6eO/TkfYbO616v4XerlNEYYARiIvQHUHf14CZfGJzI1+KPRkOkDazYFMWI4kzLZiL
	 D6ygOhG3ay49LxjbCdG8K3T0XfwqZFxYFJtG7ujMGivkOytnRTE1W+tEdLofzC+GC0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c0+D4/qH";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18EF606A325
	for <linux-usb@vger.kernel.org>; Sat, 21 Nov 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c0+D4/qH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 651371F000C6;
	Sat, 21 Nov 2026 07:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795245943;
	bh=kCXwoPOX1SduQhXpYPPpqcnP9osXZIYJtTKSFmyIm70=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c0+D4/qHDD3B8RIWZUjNDBUrevPhF1qoLwCT+mGUddpRxXZobZGlk7Z0sLZ75DUEP
	 RvbFA4e30BFJQCtAqyVFcyhhcXcf9upkMvL+HDZ4gKc15azxtyTvYrd5Q5JCHGwWn1
	 0cMdusnE/AfFsVW6GCuK9tzqynvLeIqW0zsSPySmy/1nnzoxLgEDivrw2fk8Cbl3f7
	 nO2mesyx+F7kxLwP4K9yxRP1TYdqtyY1UBx4nfORS8D0uCRms+JVAI6TPICn3IEKBi
	 GIPGsrF38k525qXQ5VxMTvQCjiaL+9Hm0tOhgIDnjESOfNMTPUXu3dZ+yjsUMcGnxU
	 2BQhuo20VQCeg==
Message-ID: <sashiko-outbox-226770@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] thunderbolt: Re-add host router DP IN adapters after
 DPRX failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alfonso Villalobos Ulate" <alfonsocvu@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261121070804.26185-1-alfonsocvu@gmail.com>
References: <20261121070804.26185-1-alfonsocvu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 07:25:42 +0000
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
- [Medium] thunderbolt: missing tb_exit_redrive() in
  tb_add_dp_resources() leaks RPM ref
- [Medium] thunderbolt: list_add_tail() in tb_dp_resource_available()
  breaks DP IN order
--

commit 4eedd8886dc180b45204d935f18725051dd0e6a0
Author: Alfonso Villalobos Ulate <alfonsocvu@gmail.com>

thunderbolt: Re-add host router DP IN adapters after DPRX failure

This commit re-checks host router DP IN adapters when a new DP OUT adapter
becomes available or a device router is scanned, keeping host DP IN
adapters ordered by adapter number on tcm->dp_resources.

> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 418ad0a61a5de..1f3dea836067e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -109,6 +109,29 @@ static void tb_queue_hotplug(struct tb *tb, u64 rout=
e, u8 port, bool unplug)
> =20
>  /* enumeration & hot plug handling */
> =20
> +/*
> + * Insert a host router DP IN adapter so that host DP IN adapters stay
> + * in adapter number order. A DP IN that is re-added after it was
> + * dropped (for example because DPRX negotiation failed) then gets
> + * paired with the same DP OUT as before, instead of swapping DP OUT
> + * adapters (and therefore monitors) with the other host DP IN.
> + */
> +static void tb_add_host_dp_in(struct tb_cm *tcm, struct tb_port *port)
> +{
> +	struct tb_port *p;
> +
> +	list_for_each_entry(p, &tcm->dp_resources, list) {
> +		if (tb_port_is_dpin(p) && !tb_route(p->sw) &&
> +		    p->port > port->port) {
> +			/* Insert before the first higher numbered one */
> +			list_add_tail(&port->list, &p->list);
> +			return;
> +		}
> +	}
> +
> +	list_add_tail(&port->list, &tcm->dp_resources);
> +}
> +
>  static void tb_add_dp_resources(struct tb_switch *sw)
>  {
>  	struct tb_cm *tcm =3D tb_priv(sw->tb);
> @@ -118,6 +141,9 @@ static void tb_add_dp_resources(struct tb_switch *sw)
>  		if (!tb_port_is_dpin(port))
>  			continue;
> =20
> +		if (!list_empty(&port->list))
> +			continue;
> +
>  		if (!tb_switch_query_dp_resource(sw, port))
>  			continue;
> =20
> @@ -130,7 +156,7 @@ static void tb_add_dp_resources(struct tb_switch *sw)
>  		if (tb_route(sw))
>  			list_add(&port->list, &tcm->dp_resources);
>  		else
> -			list_add_tail(&port->list, &tcm->dp_resources);
> +			tb_add_host_dp_in(tcm, port);
> =20
>  		tb_port_dbg(port, "DP IN resource available\n");
>  	}

[Severity: Medium]
Does re-adding a host router DP IN port through tb_add_dp_resources() leak
the runtime PM reference on sw->dev when the port was in redrive mode?

On host routers with QUIRK_KEEP_POWER_IN_DP_REDRIVE, tb_enter_redrive()
sets port->redrive and calls pm_runtime_get(&sw->dev).  When
tb_add_dp_resources(tb->root_switch) now runs at runtime from
tb_scan_port() or tb_dp_resource_available(), it adds the host DP IN port
to tcm->dp_resources without calling tb_exit_redrive(port).  Any later
tb_dp_resource_available() call for that DP IN port then returns early
because the port is already on tcm->dp_resources (or already enabled by
tb_tunnel_dp()), leaving port->redrive set and preventing the host router
from suspending.

[ ... ]

> @@ -2234,6 +2272,14 @@ static void tb_dp_resource_available(struct tb *tb=
, struct tb_port *port)
>  	list_add_tail(&port->list, &tcm->dp_resources);
>  	tb_exit_redrive(port);
> =20
> +	/*
> +	 * Host router DP IN adapters removed because DPRX negotiation
> +	 * failed never get a hotplug event of their own. Give them
> +	 * another chance now that a DP OUT became available.
> +	 */
> +	if (tb_port_is_dpout(port))
> +		tb_add_dp_resources(tb->root_switch);
> +
>  	/* Look for suitable DP IN <-> DP OUT pairs now */
>  	tb_tunnel_dp(tb);
>  }

[Severity: Medium]
Should tb_dp_resource_available() also use tb_add_host_dp_in() when adding
a host router DP IN port?

When a lower-numbered host DP IN port becomes available via hotplug in
tb_dp_resource_available() (such as when exiting redrive mode or after
resume) while a higher-numbered host DP IN port is already on
tcm->dp_resources, list_add_tail() places the lower-numbered port after
the higher-numbered one, breaking the adapter ordering that
tb_add_host_dp_in() maintains.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121070804.2618=
5-1-alfonsocvu@gmail.com?part=3D1
