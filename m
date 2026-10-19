Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0F851E432
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419470; cv=none; b=kMGFT6NRrIDXbDollGnSvQ3gpeuuM8RPma2braIPg5O8LHD/CZ6bt6NIV7RwNuXccVaAwkTfujeOUtQj5nmTuyCePmKChW1xZagL1rAI16g50BHqJg7l0JuHc9BomBoNnfd16qAbRk1a0eJK/lE6fYh2KGe7OgkKhXGUGSD6qCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419470; c=relaxed/simple;
	bh=XsLFOhX+/MzKlUetD2QAYlYfjsyYV9iSR5jfgtC7864=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Z2anPo42FQROGCRD8XxVTnEdgy9srely64DnFpK5U12e0Qtz90JWeAPZmkR16cF+C8E08yCP5Fk/GcHkN0sBp4m1Yk1y7wv4v3Aw7bzLGNE8T4XSe/k9GTGr/yKguJz96qpPli0ey9p3KGIJBNnKNfIO9QBnQzZ/OVuCJpDEUX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4J0jTAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4J0jTAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9231F000C4;
	Mon, 19 Oct 2026 14:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792419468;
	bh=+dCW2DNvZYeHLjKQE9UEtyl/lAIb3gr4lOGa84o7m/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F4J0jTAfXT4a8hj0fIZ2d2iCSOup8/3y4wZwAYvPC8TmRa7Nyjq2N7x2cA5+mvcjT
	 SSVCEt6dc9Iup+Axew5gnjQTftCbXAtTDStLvGzuBusEWrzmppK9qXVhDiciipM64U
	 9pGJpNpGTcDuuVxh4vBDqC9JD81iUEZ9Nf6vtukzVQ/3DC07xxExwEz5Lct3ueu66L
	 1msR026bhZGjeIXibBjzmRyZ15a6ScgOXg7CYmBD+WDLDrUj1pfxWG0elOanx/nmtS
	 O40zPtOeXjXvVvJBw3EnfgG8DmgVytJvHwJAXuKcBSpx6Rk1hYhqOdOhbQT9yd3Cho
	 N4IP0/3wSNcKA==
Message-ID: <sashiko-outbox-177341@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18-6.1] thunderbolt: xdomain: Notify peers
 after enumeration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261019135441.1420968-81-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-81-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 14:17:48 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] thunderbolt: xdomain: infinite ping-pong loop in tb_xdomain_stat=
e_work()
--

commit e5f041d5682183591ea61bde27f0a9936f3beac3
Author: Milo Chen <cmh79479@gmail.com>

thunderbolt: xdomain: Notify peers after enumeration

This commit queues a properties-changed notification when the XDomain state
machine reaches XDOMAIN_STATE_ENUMERATED so that the peer re-reads any local
properties registered while discovery was in progress.

> diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
> index 9d220ba544ecc..fca78540c9de6 100644
> --- a/drivers/thunderbolt/xdomain.c
> +++ b/drivers/thunderbolt/xdomain.c
> @@ -1661,6 +1661,7 @@ static void tb_xdomain_state_work(struct work_struc=
t *work)
>  			tb_xdomain_failed(xd);
>  		} else {
>  			xd->state =3D XDOMAIN_STATE_ENUMERATED;
> +			tb_xdomain_queue_properties_changed(xd);
>  		}
>  		break;
> =20

[Severity: Medium]
Won't unconditionally queuing a properties-changed notification on every
transition from XDOMAIN_STATE_PROPERTIES to XDOMAIN_STATE_ENUMERATED cause =
an
infinite protocol ping-pong loop between two connected peers running this
code?

When the peer is already enumerated (so device_is_registered(&xd->dev) is
true) and receives PROPERTIES_CHANGED_REQUEST, tb_xdp_handle_request()
schedules xd->state_work:

drivers/thunderbolt/xdomain.c:tb_xdp_handle_request() {
	...
	case PROPERTIES_CHANGED_REQUEST:
		tb_dbg(tb, "%llx: received XDomain properties changed request\n",
		       route);

		ret =3D tb_xdp_properties_changed_response(ctl, route, sequence);

		/*
		 * Since the properties have been changed, let's update
		 * the xdomain related to this connection as well in
		 * case there is a change in services it offers.
		 */
		if (xd && device_is_registered(&xd->dev))
			queue_delayed_work(tb->wq, &xd->state_work,
					   msecs_to_jiffies(XDOMAIN_SHORT_TIMEOUT));
		break;
	...
}

When tb_xdomain_state_work() runs in XDOMAIN_STATE_ENUMERATED, it calls
tb_xdomain_queue_properties(xd), transitioning xd->state back to
XDOMAIN_STATE_PROPERTIES and re-queuing xd->state_work:

drivers/thunderbolt/xdomain.c:tb_xdomain_state_work() {
	...
	case XDOMAIN_STATE_PROPERTIES:
		ret =3D tb_xdomain_get_properties(xd);
		if (ret) {
			if (ret =3D=3D -EAGAIN)
				goto retry_state;
			tb_xdomain_failed(xd);
		} else {
			xd->state =3D XDOMAIN_STATE_ENUMERATED;
			tb_xdomain_queue_properties_changed(xd);
		}
		break;

	case XDOMAIN_STATE_ENUMERATED:
		tb_xdomain_queue_properties(xd);
		break;
	...
}

Then in XDOMAIN_STATE_PROPERTIES, tb_xdomain_get_properties() returns 0 even
when the remote property block generation has not changed:

drivers/thunderbolt/xdomain.c:tb_xdomain_get_properties() {
	...
	/* Only accept newer generation properties */
	if (xd->remote_properties && gen <=3D xd->remote_property_block_gen) {
		ret =3D 0;
		goto err_free_block;
	}
	...
}

Because ret is 0, XDOMAIN_STATE_PROPERTIES transitions back to
XDOMAIN_STATE_ENUMERATED and calls tb_xdomain_queue_properties_changed(xd)
again, sending a new PROPERTIES_CHANGED_REQUEST back to the first peer and
repeating the cycle indefinitely.

Could this notification be sent only on the initial enumeration (or when lo=
cal
properties actually changed during discovery), rather than on every
re-enumeration pass triggered by PROPERTIES_CHANGED_REQUEST?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-81-sashal@kernel.org?part=3D1
