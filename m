Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890BD4CDA36
	for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2026 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055651; cv=none; b=bz1/0GDdMpegqrzTk9FYOiP1hi8n7gbi3UrWW97hlAUjFymReKG0XwrlmXoZDzsHeIscTiRUJS6jB2I9ZRU4aU+x/U2KgpItT8NRIGmz6Y2Gw4HIxVAu+IR/RnYD18ax8aUDROixtoOy9Q1eFzz3L2ePcUQl75JwNOkuZSwPFvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055651; c=relaxed/simple;
	bh=M7Q7aPwYvhvotgP1a+jBRiYAGowCT1WvTutAAUuMszc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mA83TDuz21yJmdQvbZexq6gdNw74FsVSajQ4BxpLWFbXWU+4evQAQDw8e868L2HUHzlt/IgUwmjnN7wZg3CiXeSZdL5rPIyD6ZdFymOsyq34cvoBHOVfJbNvGa35MZAnvESDb2CGTNkCIMzLlJUNTrOwfvUWwoh4fNrXDDYIlTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn3m1QWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn3m1QWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD01F000C4;
	Thu, 15 Oct 2026 09:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792055650;
	bh=NWwRwJmc9Y8b0Vz9hbKwJIyaTGdRk5MHsDWk6fl/OGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rn3m1QWBCXolU/PD7hT1cNH8rfDR64zKNMnJcAgZ/UqovycAzT1xkhvJ1lC12hndx
	 54MJVPbM9JAV1ONY3R/x6i9ML86SdWVRds8CURVAObm42amhSlYvuKeXxMoagb4da+
	 Q8Dihtu2ueFmRE19mT4sKZSk2YT3lIuTVKHfEUzuzSnS3HZG0gWkZiIiVC4F9zDxt2
	 rBNBAnucCrME9mbftN38sSMAjkefSpQDlfIoTngLp0EHn18oPFl+ELNo8Dyn1nIrzD
	 Um77tCVa43WjaZQHIOfaIQOU5MXlNsoQ3E7oQZqqkVoZSWqaDuJ8w8AZPnQGb7oU14
	 axir8ZVxGYpHw==
Message-ID: <sashiko-outbox-172550@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_printer: fix pnp_string use-after-free
 on reconfigure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261015084658.70918-1-yuz08559@gmail.com>
References: <20261015084658.70918-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:14:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

> f_printer_opts_pnp_string_store() replaces opts->pnp_string with
> kfree(old) + kstrndup(new) under opts->lock only, with no opts->refcnt
> guard, so the IEEE-1284 ID string can be changed while the function is
> bound and the gadget is enumerated.
>=20
> printer_func_setup() answers the host GET_DEVICE_ID class request from
> (soft)irq context and reads the string with no lock:
>=20
> 	value =3D strlen(*dev->pnp_string);
> 	...
> 	memcpy(buf + 2, *dev->pnp_string, value);
>=20
> dev->pnp_string points at &opts->pnp_string, so a concurrent configfs
> write that frees the old string races the setup read -> use-after-free.
>=20
> [ ... ]
> function is not linked into a gadget.
>=20
> Fixes: 24b7ba2f88e0 ("usb: gadget: function: fix dangling pnp_string in f=
_printer.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yu Zhang <yuz08559@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015084658.7091=
8-1-yuz08559@gmail.com?part=3D1

