Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A741611D
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790852032; cv=pass; b=RlzFrxRXvCpXGyBl0qzUe6JjtZDlao7F4FPfsb9ZYLxaH9lM05VufA+GepVdQ0ktyg6NGE+Txe38Tf8hLYnd7rZALetpZL3se3mkRxxBWDTBAfDy9carkNCkrU3zUCorkrNsLp+Toc3EBBJT61tjhyQ+ealZdX84/ws1EeLPNag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790852032; c=relaxed/simple;
	bh=Fs1edfuHx1in4X4WdK3upBMt8kh7e3INqc862LZOi+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIcptElLpMaimJsswJqWUTtF1EdwAoRNS9JgB233HUSeRPJDBbY/5RPkiUUR6pY1QkBFdv0O92+0vrBpP2m6ihITNndviafhGscx3E6SBgVNOYKSQIWiR1ZnQgntGJN/zIfIMyxGDZd2nbw/THAUutRCrvRAOkvw607Nmj/8e+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FAbj7CJM; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FAbj7CJM"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67568357b63so2486216d50.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 03:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790852028; cv=none;
        d=google.com; s=arc-20260327;
        b=Sl+eQZrVJae5motlc1K1BY9QOHm/M14tvzAcDfCh7V0ftDQxjrLh53faodXEbkFbZz
         yAoxqLID9RSDmSXeL7fEMLwcUY5AWQFBxxFdJ5LHx9GyJ5GrGEeB9P8Bpx8rcpK7A7PI
         xXJZ1ljMW2juRgY3ZAVslkv+0dDXPkP9YfXM9VlrCHEU4lJttuRdZPDfIoe1hw1JyMb1
         Yo32aU/6FMwRpYYULAGBBVwXodT3Qa8It7lzgWzzJ7aZGNMcvfWBVa0LvIBQVJMmJOwd
         excgOyUFsGM/JMaAjVjDqh6/11k0/98nU5/eV4V5VoFj462lgXlyvkh7zPWmZHaz55gB
         8/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        fh=IDBQDc24NcMFZH4HJm9C7RqQIxv9Go1lGLUMMnf1xfw=;
        b=YC7k6kH+J5eYPZEpSV03qBq+uJjQnwFliu5Xn+ZqEXWZmdrl5RvImjyLgsW+LMUn02
         lZ6Ekk0WYdD4nL+sPwIOZbuxFqey/HBB9ufYpzZ0ScpBqHhLfLUsQMovjWPMWSYeMgho
         02tTbcvG/HF71cJi2WmsjagzUlodNd+pWjVw1IXxIfLZPdx7NzEjtvT2myKMpiQT5NCM
         lTchbb85laOfF+qkLN1b8DiBu0i9LRsMom9NQobd3Ln0z7TU4HkAaEWJ1jPeEpdOXBwU
         3m3fYUl4Uo1pBFpcMnM/41uV7xp/U/MZhevBPoAOmAX7R15QynQD4oih22ftI25iRoG2
         lENg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790852028; x=1791456828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=FAbj7CJMgab72MHHmfF2iW2O3xqNR2anisVVFAtjFiL8Qh2Pe5qy3EyOrrPogoYZG0
         bHFeHvcH710U1lLtLuR3jI9u641NZFI/ayhqFd8MJYamxB6t0hvhIGtP6038fE2n9VNh
         aGUR74pT+Qqo5mbpidnVPdUTQ8clM7IBi2Ymc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852028; x=1791456828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEbjjiBAb1Gv1/q3JktK2vYVX0s4JpnfBYopaxaaLpw=;
        b=PwChg7oGIIBzAvxPZGmG/POXHXkqFORqicQqoil1ElSPKeZoD+bj+E/k89XAE0wVTT
         /15azqlN7yWxyILq5x8sdZlKa5J6b837p45bkP2+iJg1bsGN7Zb60cR37CaCBExjwoQo
         iazvHrgkoB2m87XWs0HTLL/eMyzGbrHp/a6NUYFmHVgxF2EgqTfWW5CDXkYEoDYABIbM
         oyUBkQN+FUEPFE6pqxZY17htPdez83kDSMKTeQf3aEyW1mLdQWkSwTf7Vb1zxXSg51i6
         KJb2wwrP7kD0/KgxQgBae0P28oYcIs3Et6ehuOT36zIiIyyxdhZGeGXlqwQ5gzDWpMEw
         pKSg==
X-Forwarded-Encrypted: i=1; AKwUvBzOiK7QPbhq75MPQxKOT0L4md0XaKZA6jf3gWVmu68U2LIPmo4vqUwwth3bzawzZVuNiqHZq87Qa+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHX8I9Ef+s0UzAn6/7CWQghCHvL0PyoSpX+JQkfM9A4i8Swgtj
	X//zxRgzETaPDQhzAGQj0YEHPxpYq/TfjYrsp7wRXqiLd4RCh1SmWXJ2FQSNN1XlmzWx+5bMeO2
	5j+JqnHiijP4bZ5K+lF8ucEuMjaLm+ZSCYLRcM573
X-Gm-Gg: AYBFou10OVwrIiuQoNo9deOHXHzDEYMA1WcUwzv5JXmT72uEN6Reg25CcIiN+45TImO
	UW30L16RRcIZyLz0oSKeKZgrydEgU9xXcvA71l2Y3ZGxC1FP70DluzJL1rdAQrN6OhwwvJOukj5
	ycYkxUan9PVQ5rJmcdQ1qr6wZyp37LJnVFLDrG+AIYzS5OyTAL1ozE4eKnOvzOyjPxEhBayzMSb
	JjfsgbKSd+q1PhC1S6Qn8fDyiwZiPGV8uEdUsxDYJ9gixchjtLPtbhhPQW6UiLSkoyIub/XEqR1
	LJwUOSnJu70e29eBKX60gpHBYYsw7phybJxe9oYYy4dL2VjV79osbGRX8oZcThSxjbtDw/nXeWL
	7A3dxyLq07Q==
X-Received: by 2002:a05:690e:4105:b0:676:9954:81ef with SMTP id
 956f58d0204a3-676995489a9mr323421d50.14.1790852028003; Thu, 01 Oct 2026
 03:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916075745.3549953-1-wenst@chromium.org> <20260916075745.3549953-7-wenst@chromium.org>
In-Reply-To: <20260916075745.3549953-7-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Oct 2026 18:53:36 +0800
X-Gm-Features: AclHuK_wafiRDk696txMZ3q8q7Qaz4NsP-wYkipLMPcHq1r5tW6zotnKrD-_NRc
Message-ID: <CAGXv+5GdBUafk6niG-UMDx=z6LJQ6iHAWhDpm1Ly2ce6CQDaxg@mail.gmail.com>
Subject: Re: [PATCH v9 06/15] usb: hub: Associate port@ fwnode with USB port device
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
>
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
>
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v5:
> - Added extra |struct fwnode_handle *| local variables to shorten lines
>   (Andy)
> - Added comment about passing fwnode_graph_get_port_by_id() return value
>   directly to device_set_node() (Andy)
>
> Changes since v4:
> - Dropped unused |hdev| variable
> - Added flags for fwnode_graph_get_port_by_id() with
>   FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
>   ports can be connected
>
> Changes since v3:
> - Added missing fwnode_handle_put()
>
> Changes since v2:
> - Skip assignment if hub firmware node is ACPI node
> ---
>  drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> index b4452b665f59..c0a51d9b06a6 100644
> --- a/drivers/usb/core/port.c
> +++ b/drivers/usb/core/port.c
> @@ -7,6 +7,7 @@
>   * Author: Lan Tianyu <tianyu.lan@intel.com>
>   */
>
> +#include <linux/acpi.h>
>  #include <linux/kstrtox.h>
>  #include <linux/slab.h>
>  #include <linux/string_choices.h>
> @@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *d=
ev)
>  {
>         struct usb_port *port_dev =3D to_usb_port(dev);
>
> +       /*
> +        * At this point ACPI nodes and swnodes have been removed by
> +        * device_platform_notify_remove() in device_del().
> +        */
> +       fwnode_handle_put(dev_fwnode(dev));
>         kfree(port_dev->req);
>         kfree(port_dev);
>  }
> @@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, i=
nt port1)
>  {
>         struct usb_port *port_dev;
>         struct usb_device *hdev =3D hub->hdev;
> +       struct fwnode_handle *fwnode =3D dev_fwnode(&hdev->dev);
>         int retval;
>
>         port_dev =3D kzalloc_obj(*port_dev);
> @@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, =
int port1)
>         port_dev->dev.driver =3D &usb_port_driver;
>         dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->de=
v),
>                         port1);
> +
> +       /*
> +        * ACPI FW nodes are associated later when device_register() happ=
ens.
> +        * Skip assigning one here to avoid potential conflicts.
> +        */
> +       if (!is_acpi_node(fwnode)) {
> +               struct fwnode_handle *port;
> +
> +               /*
> +                * fwnode_graph_get_port_by_id() returns either a valid f=
wnode handle
> +                * or NULL. Passing NULL to device_set_node() clears any =
associated
> +                * fwnode. It is effectively a no-op here, since no fwnod=
e has been
> +                * assigned to the newly created device yet.
> +                */
> +               port =3D fwnode_graph_get_port_by_id(fwnode, port1, FWNOD=
E_GRAPH_DEVICE_DISABLED);

After AI hinted, I found some dwc3 hardware to test this on.

"port1" needs to be remapped using usb_hcd_find_raw_port_number() when the
hub is the root hub. Otherwise both HS and SS ports end up getting the
same port node, which is incorrect.

Same needs to be done for "usb_of_get_connect_type(hdev, port1)" some
lines above the diff context.

This mapping is currently only done in usb_acpi_get_companion_for_port()
and usb_alloc_dev().


> +               device_set_node(&port_dev->dev, port);
> +       }
> +
>         mutex_init(&port_dev->status_lock);
>         retval =3D device_register(&port_dev->dev);
>         if (retval) {
> --
> 2.55.0.1032.g73a4cd73de-goog
>
