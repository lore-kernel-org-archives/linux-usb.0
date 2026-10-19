Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F84973B0;
	Mon, 19 Oct 2026 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416393; cv=none; b=nC6xTQ6qHILZMZ0SE89sRcrvE9C1/gtiC39uLy4y27N3au1e44rrnxp9NOHwujrpriMJOm/eQcTqqPZQC0A3zkmQcRCPEqG5fSQLpC+S6WiQ0J8/OMlt1N4wM7DmpUOGAjr9wstXVtSbS+uPJuN6a2RXAR2vNgtZxYv9fYTrzXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416393; c=relaxed/simple;
	bh=Sfbhe7MPng0xstukU3X+v28Tjpapp+4uv24ANaGfhsg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=VSXxLibF15YET0y1WgKS1jysDJ26DJ6TlgchcxECvSvbGvBQnYaaoxMgTj6MGU2Z6O/wwbtkiEqFFtwjyq/7OM7tKSGUx14AhWGe7P/XsCj/hpKqVbdUO6/4u9m2e00BhWPzHDXaIRw63UAL2d9EhPzg+RRWQgf9mOlbIACgZJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YphP6uCy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YphP6uCy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C8F1F000C4;
	Mon, 19 Oct 2026 13:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792416392;
	bh=i9/MqPCNtyl2QkWjflayZa+jVAdO3YS98r1IJtZm/34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YphP6uCyx335hpkBWIkCMrDxTEAW+kgkLHzC3YXWQgLaiKsonEvYFRk+JYhOyB0nN
	 Q4LQ8BqmPcU9PjfUrpL/AQalWhVDiBBY21JJZrPrYJVujsjbJeYOWsxoW8z/d8gF7Y
	 QZj3NLatlMpPWbKqeTK6egzxK23IOfL+BYfmPUL+gR8uWCR91p4nek/2zguGFwlY9Y
	 2EfOIMtTnE/ScIryDrrZfqxfRec+Vnwyi9YIrc2J7VfwEkDea/ViMtntrdvvJwdxDu
	 FTS1kMjLlvvo1DEN+F3qmjIMy2lmLF05bg14yz1M6ZbuQ1WSGtiM4PgO/IBwcgwEdM
	 TuejNSFt8bCjQ==
Message-ID: <sashiko-outbox-177142@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 2/2] usb: roles: look up role switches attached
 to a graph endpoint
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianhui Xu" <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019131848.344689-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-3-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 13:26:31 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: roles: usb_role_switch_at_endpoint() drops -EPROBE_DEFER
--

commit ed41e724f9aec8ba70adffc81a77e04c561b9932
Author: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>

usb: roles: look up role switches attached to a graph endpoint

This patch adds usb_role_switch_at_endpoint() to look up USB role switches
registered on remote OF graph endpoints and calls it from
usb_role_switch_get() and fwnode_usb_role_switch_get().

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
What happens in usb_role_switch_at_endpoint() if the consumer probes before
the provider has registered the role switch on the remote endpoint?

Looking at usb_role_switch_match() in drivers/usb/roles/class.c:

    if (id && !fwnode_property_present(fwnode, id))
            return NULL;

    dev =3D class_find_device_by_fwnode(&role_class, fwnode);

    return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);

it already returns NULL when the "usb-role-switch" property is absent on the
remote endpoint, and returns ERR_PTR(-EPROBE_DEFER) when the property is
present but the switch device has not been registered yet.

Because usb_role_switch_at_endpoint() checks !IS_ERR_OR_NULL(sw) instead of
if (sw), ERR_PTR(-EPROBE_DEFER) is ignored and the function returns NULL.

In usb_role_switch_get() and fwnode_usb_role_switch_get(), if (!sw) then
falls through to device_connection_find_match() and
fwnode_connection_find_match(), which also return NULL because the remote
port parent and phandle properties do not carry "usb-role-switch". Callers
treat a NULL return as having no role switch configured rather than
deferring probe.

Should this check be if (sw) so that ERR_PTR(-EPROBE_DEFER) is returned to
the caller, matching fwnode_graph_devcon_matches() and
usb_role_switch_is_parent()?

> +	}
> +
> +	return NULL;
> +}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019131848.3446=
89-1-xiaqinghuan@mail.ustc.edu.cn?part=3D2
