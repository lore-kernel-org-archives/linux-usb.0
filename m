Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F23644C4
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924871; cv=pass; b=kkhUrlA6sW4uafhxB2PwY+V3LBcB51Oj7hFCA4ez1PkT4P5D2OAabyDeJAAvdmeQqFDggLhVgg5EQ+zl1Ukcr+FRVfFj3LiCJc6QSbEpF1OlOkeogCj1kqpFSmaeMwv3MR3A25tHJr12omkQECtjH+xVGeNZx7PcKr9qy3oFI/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924871; c=relaxed/simple;
	bh=SoNHDrWROasgfui4FF2PQ43gjyBa3I1JHB7dBso0fYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b82g2zLOrX2Q5D+bAPWQ6UWohZCKNkfrwXO6mJHLvkAPstPyMuF6uYzSSObbdzm1eTo8htTCVIQNNALu7Ina58R7JfyoEbEFceWSK/5DQzmxPyrz3lC/YEvoLkpZV3Z60vUUkIxvrxwspWiYdTknxqpNwag6b7nqNnFLCdbhLxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dp5fV1eQ; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dp5fV1eQ"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664d530fcfdso5009656d50.2
        for <linux-usb@vger.kernel.org>; Sun, 12 Jul 2026 23:41:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783924868; cv=none;
        d=google.com; s=arc-20260327;
        b=dqTd1n/R5z0efKz5ols5TrOgVLQnwTmB/tvPY1b0QaRvufabM5mL3W0RmSXhyAXx/d
         CbFqXi7FW68//rAWptAtb4pf6PCHMQNmrsTZl6u0zLhK8/KPIfciTmm/qTuL2yf+2W01
         nnr6p0augIKumL5VcyaDM1gihlhypQOcCQwWONYDd4qDLTob7J55puybA7lBVrhzFK/F
         7uFgQypV8k5oWtQgi/wKPJZz84Mi2Dv+uLv9PLj0ucH/abe8cQFzdArxwFD4Otpy6FPR
         3zpTH4VKSsn9h01UrLi8RT2fTMFVFn3LgUK2KdHT6ZUTW4mhQKvRuenIEZpLZDAb3WY4
         eXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        fh=/w2J2xaJDB415sW52E3lKbrnyk+AeBcLlGATUpfOXTw=;
        b=ORB8NpeEb+QfBCDqkt4Wm7bwly6N1IQGrLengjOCtVGuMGQURTFGaCdCJu3sjFlxZm
         LaPbCKv0MM7bjG018LbNPhoCr0XIJNajPtgthWEK4JS6BaCPeOWK5VChivkHe+omwrrl
         R3ibV93CJ+FQeVthQJu7yOgtsEz3L7pwBHsaEn+3Zd99zLv7I+NyQsKeYzxpoyxXXupv
         wdjhz0fULJrHBKH0VEDvPFytu/H5iWUZDX74e0KXFvuLJ5lZZVGWbX2SgaHQ0AC7JN+w
         qfeYd4xZNqZjHjR0/n+NefW4MZwBBJiaGqvLPL+n5Xgo3JDh9QuE7PCO2DjvNNz7uJ9f
         Q2EA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783924868; x=1784529668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=dp5fV1eQzI+Q9ABLpMoytSwVqvJkNnm2q+8k2+hUF9hHSoTetIdx8MaKR92N+gi9S7
         Kx7MDUrv2AEYWY1uVHPwlc3LFMd1lwKnjDoiReY9JfjSvl2GMjvxVMFaEZr0v14r1lfw
         b1XdoUkbRVAIP9uqCn18sKtv4fqDOJRWOinkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924868; x=1784529668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALHFFl4QIG5q5cwsXiSsf9xTcJ7Y7YxsHiqneCAHa/Y=;
        b=pOkKHDLgyigEme9CDRqseIDOPg9BenTlScmmBsdTsE3QVAYGivQD+EmU7tNPES9GZp
         LQjDzB1OCrVXAnFRBPXKbGeUpJc9AVm0gooZ10kd9MjwJp/+cGKt+saEumhwCdUsvNHE
         xd0Kn3gZcDN7AH4FslllG8Rlh41ikdZowhfmVsLn20XrjQQos6wUf5OWH8nj0ximwqW8
         qG1VfxKtGJVKV4Y/Sa+HqgkPeY/3yvAQ9O+qLkNSmltQO2x0Y/So/glv5dbPkA758yL+
         mEq5lLwhrxMt6DQbcTm7U5ycW2F5WsfG1kgXB0D347nO1fu7B+jJpHZtRJnhsOOoJL4Y
         2lpA==
X-Forwarded-Encrypted: i=1; AHgh+RpQAKeAie6dsg5BBNKIGFCuHh4DhVzyLF77B+/EPGDgViFTrQS8zfBNNHRPrl9L/sIsrbr0D3NuL0o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/ot5wQLz/9XTREOlg6a+djHxx9JtoLvVgD3f7nLLi5jsc8Ly
	YgABETZYUUf69JRzGrlOZAynLNULOVh+YxyfGz2mMXRWCMCvCN/0qGhBq2ZhVUb0qYnL5SdfFoF
	nT2YsxIVG86R3C/V29S+4TGa4JbgHFKDqleqFgaly
X-Gm-Gg: AfdE7cnVVjRp/NJlNZycmzeJjo4xTKqF2kzGbe/sbqKtaW/IenJsy9NpCb7+tJiQ8KF
	dC8cZnydLV9s18iEHWN6Fr2HRx+pm9cjdb4CGBUYo19+8Y2I3coptHpCZCXSy5mk0oGgxnR+6Si
	l/Iza8wRG2U0fHL7wAjojC5nByy78Vcfe0qSrPPE8UvyrUjazSU855OMeu+xUJbd4zdmc0+WDFm
	XNVObuIC3quo6NwoKl8RG5UWfNkkkBTr2Ft1pj8PpFrhWExY6tMnd0yYz2duUOzRoKTePlNFqD5
	HQ6MdpK2T0qRDrT0O9/EbBljSTu42mK6WsLF
X-Received: by 2002:a05:690e:138f:b0:667:db66:eb59 with SMTP id
 956f58d0204a3-667db66f471mr5286970d50.22.1783924867897; Sun, 12 Jul 2026
 23:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095726.704448-1-wenst@chromium.org> <20260709095726.704448-6-wenst@chromium.org>
 <2026071025-diffused-jersey-0d94@gregkh>
In-Reply-To: <2026071025-diffused-jersey-0d94@gregkh>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 13 Jul 2026 14:40:56 +0800
X-Gm-Features: AVVi8CffSvw8dKrdOHbSnASMEsx0puSGrR918doi02cLaaF9gK20T18TFDW9zpc
Message-ID: <CAGXv+5EyJ3WewkWfEy=XNA=VoU4Fuhi2K6evkvFanWhVe8J=ag@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 8:08=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 09, 2026 at 05:57:10PM +0800, Chen-Yu Tsai wrote:
> > When a USB hub port is connected to a connector in a firmware node
> > graph, the port itself has a node in the graph.
> >
> > Associate the port's firmware node with the USB port's device,
> > usb_port::dev. This is used in later changes for the M.2 slot power
> > sequencing provider to match against the requesting port.
> >
> > To avoid potential conflicts with ACPI firmware nodes and then causing
> > power management issues, only assign the firmware node if the hub's
> > firmware node is not an ACPI firmware node.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v3:
> > - Added missing fwnode_handle_put()
> >
> > Changes since v2:
> > - Skip assignment if hub firmware node is ACPI node
> > ---
> >  drivers/usb/core/port.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index b1364f0c384c..e8fb2acd77be 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -7,6 +7,7 @@
> >   * Author: Lan Tianyu <tianyu.lan@intel.com>
> >   */
> >
> > +#include <linux/acpi.h>
> >  #include <linux/kstrtox.h>
> >  #include <linux/slab.h>
> >  #include <linux/string_choices.h>
> > @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device =
*dev)
> >  {
> >       struct usb_port *port_dev =3D to_usb_port(dev);
> >
> > +     /*
> > +      * At this point ACPI nodes and swnodes have been removed by
> > +      * device_platform_notify_remove() in device_del().
> > +      */
> > +     fwnode_handle_put(dev_fwnode(dev));
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
> > @@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub=
, int port1)
> >       port_dev->dev.driver =3D &usb_port_driver;
> >       dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
> >                       port1);
> > +     /*
> > +      * ACPI FW nodes are associated later when device_register() happ=
ens.
> > +      * Skip assigning one here to avoid potential conflicts.
> > +      */
> > +     if (!is_acpi_node(dev_fwnode(&hdev->dev)))
> > +             device_set_node(&port_dev->dev,
> > +                             fwnode_graph_get_port_by_id(dev_fwnode(&h=
dev->dev), port1));
> >       mutex_init(&port_dev->status_lock);
> >       retval =3D device_register(&port_dev->dev);
> >       if (retval) {
> > @@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub,=
 int port1)
> >
> >  void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
> >  {
> > +     struct usb_device *hdev =3D hub->hdev;
> >       struct usb_port *port_dev =3D hub->ports[port1 - 1];
> >       struct usb_port *peer;
>
> Is this last variable addition not needed here?  It's not used.

Indeed it is not used. It was left over from me figuring out how to release
the fwnode handle. Will drop it in the next version.

I still have some other comments to cover. And I want to go through the
code one more time to check Sashiko's concerns on the main patch
"usb: hub: Power on connected M.2 E-key connectors with power sequencing AP=
I".


ChenYu
