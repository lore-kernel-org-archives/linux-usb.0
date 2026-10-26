Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019549;
	b=L+8eqxxfQ0vH8H5XmozTOpXg+NGfwo93CkUSnhVgVK4H8Q1bbJlRyPdquA8/YeCzJzGe
	 hg/jlF7NVn9W6hDV+dAQz4hN+Ohb07z6dj6Obn8t97TIT85TR8V/FaCBzUScj8tmwR+qF
	 II28Ce/jjowzufxM29Y51ZD9BmOpOFedpiWm2J/mGGfPcdh1DipygSjXZ5Jq7vQOUznJ3
	 YWu6LFgg7ShBdYxrDf5vOnoVh1ysy11jwe8kPipCp3HIgxUWdgdANbjnVz2p1C+wXrOVL
	 4By1rPqvalYt1UQ/f81FcppnehaNNKkqJ/BA1xBAaL9woVY+M/O5Jbhfox6G+WLcSrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019549;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RxdJsiGUp2+MC0H1iRKTMGstxdyFmil3ZjavLIJvLjI=;
	b=O6jDyp9kfiweBewYiXkvwbW7WV41DmHjEMY3sITAu1325ICgwWqqznS1xWynS2RQagmx
	 zLlVDEdoPkbbeUNAVzsEukMMxPm452+66Nt5EvEgHRzBeusdO7Uur413u23ECWcng6ca3
	 eDajh9Kx8Yes5t612yorusp42IlKEDryrgsGcEz3Ym60Vttvux/gulFiWoddZNDsVWuAz
	 v8RHo2l4wurKBJpjz46eQUFVBAnQlkH7Gm5iLhVM7KS1FJAKFCTBOzaISoh5pk+y8BDnY
	 gSE0xWP5z2l9a0MF6HkS9wpCoAEdLPSl+KC7TXT6Of7TA1IJrfRnWJYT4WCfk2MjrXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fG7AWW8j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FD0606A31A;
	Mon, 26 Oct 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fG7AWW8j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24681F01825;
	Mon, 26 Oct 2026 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793019549;
	bh=RxdJsiGUp2+MC0H1iRKTMGstxdyFmil3ZjavLIJvLjI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fG7AWW8jQQJ+cfLZVQvFwTBnqGz0e5qmaQ2jXCEyce+WCjV+QDJIXFPBFyVvYGr4I
	 LfNcX0sOCX1q+CKVovKEzuDUqH158ad4WEEEpRME67MkXpT9dgkTQ+lHBMrtcyCx92
	 ULeU9zLobpsbBq6V0IXgZJcCLENK53atadcOw8MoaMzzilTwKTWwldIhjLaZTiK3Kg
	 pBAtWOqQUQg2wcUugPGpLalloZ5+d1WsqDQ/PVZ/fX6Q2+WXmZYIsOhikWgr1qT5hE
	 zsatQV5ZYmC8SH5scKhOlbJA2o6dr9hb/5876xOHqnPB+EL38coGZso3e6T/HqvJxO
	 x48JKg3QyH3aA==
Message-ID: <sashiko-outbox-185254@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] usb: roles: look up role switches attached to a
 graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026123211.243224-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261026123211.243224-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 12:59:08 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: roles: propagate -EPROBE_DEFER from usb_role_switch_at_endpoi=
nt()
--

commit 9ff4dd8101d254581dbf9332fc352de1c83d6e87
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: roles: look up role switches attached to a graph endpoint

This patch adds usb_role_switch_at_endpoint() to look up a USB role switch
registered on a remote OF graph endpoint and calls it from
usb_role_switch_get() and fwnode_usb_role_switch_get() after checking the
caller's parent node.

> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index edec139b68b52..fc739fd61f033 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -157,6 +157,42 @@ usb_role_switch_is_parent(struct fwnode_handle *fwno=
de)
>  	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
>  }
> =20
> +/*
> + * Look up a role switch registered against the remote endpoint of one o=
f the
> + * caller's OF graph endpoints.  This is how a connector endpoint that s=
hares a
> + * USB data bus with another connector (for example two Type-C receptacl=
es on a
> + * single DWC3 controller, selected by a GPIO mux) finds its own role sw=
itch.
> + */
> +static struct usb_role_switch *
> +usb_role_switch_at_endpoint(struct fwnode_handle *fwnode)
> +{
> +	struct fwnode_handle *ep, *remote, *parent;
> +	struct usb_role_switch *sw;
> +	bool available;
> +
> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
> +		parent =3D fwnode_graph_get_remote_port_parent(ep);
> +		if (!parent)
> +			continue;
> +		available =3D fwnode_device_is_available(parent);
> +		fwnode_handle_put(parent);
> +		if (!available)
> +			continue;
> +
> +		remote =3D fwnode_graph_get_remote_endpoint(ep);
> +		if (!remote)
> +			continue;
> +		sw =3D usb_role_switch_match(remote, "usb-role-switch", NULL);
> +		fwnode_handle_put(remote);
> +		if (!IS_ERR_OR_NULL(sw)) {
> +			fwnode_handle_put(ep);
> +			return sw;
> +		}

[Severity: High]
Should this check be if (sw) instead of if (!IS_ERR_OR_NULL(sw)) so that
probe deferral is propagated to the caller?

In drivers/usb/roles/class.c, usb_role_switch_match() returns NULL when the
remote endpoint does not have the "usb-role-switch" property, and returns
ERR_PTR(-EPROBE_DEFER) when the property is present on the endpoint node
but the role switch device has not been registered yet:

drivers/usb/roles/class.c:usb_role_switch_match() {
	if (id && !fwnode_property_present(fwnode, id))
		return NULL;

	dev =3D class_find_device_by_fwnode(&role_class, fwnode);

	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
}

Because usb_role_switch_at_endpoint() checks !IS_ERR_OR_NULL(sw),
ERR_PTR(-EPROBE_DEFER) is ignored when a connector consumer calls
usb_role_switch_get() or fwnode_usb_role_switch_get() before the USB
controller driver registers the endpoint role switch.

usb_role_switch_at_endpoint() then returns NULL, and both
usb_role_switch_get() and fwnode_usb_role_switch_get() fall through to
connection matching (which checks the remote port parent node rather than
the endpoint node) and ultimately return NULL instead of
ERR_PTR(-EPROBE_DEFER), causing consumer drivers to treat the role switch
as absent rather than deferring probe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026123211.2432=
24-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
