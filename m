Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425760;
	b=hV4DTTJfEhkhJJ+7HIssQL740E0ung8D6lPeiggvzPV2PNcCq6RMwb7VcwztaLkZUJcT
	 NWUkCLd2TJVQJPsSVLygw7EB5FJ2ZGikYeV3ScH4S8/1RuyvMq+Cd/ZIhhX9q9PJGN9IK
	 B+XMcj4kFdGi0Y/F7ABRpit4S7RMcgPF4ToapqQLlQ3yy1dZhIWuG2xtbD3S4RVDOaoDM
	 /iY2LkQORI4iLYp+j0liovbrYwzOxxxXoYtnkl4VJwxY62BEsvVs/SA3HjSd5v6uZIwit
	 KxLx7//XdvpIAoZ9h3hoKBx+2EU2swrm+s7+GnLdOHodJHScuwY2EKSkC0swCD8pUCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425760;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1NrXZ8mJrCHO2i6rYqFBaXUUOt8Zrci/NScdvydnKUE=;
	b=sVzFf7TZDJDlVX7Zy0XugJQoYyylgHDaGNEpAp/vGW8nU7v5z+zsZmuLyG3o4ZyyN9i8
	 gSA+Jg+DJAGWonbyYq8xZ68PkMl3r/dkMNjTLwSzhHddxRMU/yrmoHzrpRh/wjTymEeg2
	 582PIG6liRSIsaTvIgrkKTkUiE5AswKzrsp0n6Y4Ij8K7cM1BX6VywvRKMrAy/9IE69nT
	 mzTddSmqgK4/sso1KkFvEu8v+UBfWtyTH4ORrqqYzY2gT6VlRx/skQ1brIu/gKRl6Ei9y
	 H6dtxserGdIJcvewcQY/hZTObCd8ohoAITON43Z8NmmNBcgdZ7BrONxCyYmVufENWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moGoVk20;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932D606A31E;
	Mon, 23 Nov 2026 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=moGoVk20
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1081F000D3;
	Mon, 23 Nov 2026 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795425759;
	bh=1NrXZ8mJrCHO2i6rYqFBaXUUOt8Zrci/NScdvydnKUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=moGoVk20KdJ2bZXWIShIkGYdM4dF4cN8M4DlgQedVfKjY3V5aNJG8mxhVxip3lzaO
	 GgC2GRUQIgrs50bB4fWaZjz1tUN+dwNQ6UfJKML/bzQ3ECebhfDyRy/zTK0n1XK4/w
	 feJIHRtC+t+swMSg1plaxmc8X/TqnKU7zPcVVvSO2vropVLpXINaUa5CyFf6kb85ZG
	 4frEof9bUxmygaA2VXzXfMtaCNYJRXbGFC8bmtCRlNNZ4nvUtZFGpjiAfUQ+WPZhfE
	 AyOGDeW7ooldP+Qr9Sag6BBYPUMmB9baBjs6EM/NBX3BvgNI/wZwwy821Ow/nkfJ4O
	 yHq4VJhI8Z3Cw==
Message-ID: <sashiko-outbox-228962@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: ucsi_ccg: Add CC orientation sensing
 via GPIO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akash Kumar" <akash.kumar@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123091024.2214918-3-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
 <20261123091024.2214918-3-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 09:22:38 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] usb: typec: ucsi_ccg: invalid %pOFn format for fwnode in
  ucsi_ccg_probe()
--

commit 0ee9b6d78660aaf0655e001e14913cd7b0e55e8e
Author: Akash Kumar <akash.kumar@oss.qualcomm.com>

usb: typec: ucsi_ccg: Add CC orientation sensing via GPIO

This commit adds optional per-connector CC orientation sensing via the
orientation-gpios property in ucsi_ccg_probe() and reports connector
orientation through update_connector and connector_status callbacks.

> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/u=
csi_ccg.c
> index c560d45393024..06c536d876940 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c

[ ... ]

> @@ -1506,6 +1553,34 @@ static int ucsi_ccg_probe(struct i2c_client *clien=
t)
>  	if (uc->info.mode & CCG_DEVINFO_PDPORTS_MASK)
>  		uc->port_num++;
> =20
> +	device_for_each_child_node_scoped(dev, fwnode) {
> +		struct gpio_desc *desc;
> +		u32 port;
> +
> +		status =3D fwnode_property_read_u32(fwnode, "reg", &port);
> +		if (status < 0) {
> +			dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> +			return status;
> +		}

[Severity: Medium]
Should this format string use %pfwP instead of %pOFn for fwnode?

device_for_each_child_node_scoped() yields a struct fwnode_handle *, whereas
%pOFn expects a struct device_node * and applies of_fwnode_handle() to the
argument in device_node_string(), shifting the pointer by
offsetof(struct device_node, fwnode) and causing an invalid pointer
dereference if a child node lacks a reg property.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123091024.2214=
918-1-akash.kumar@oss.qualcomm.com?part=3D2
