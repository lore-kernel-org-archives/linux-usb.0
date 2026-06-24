Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528E3876C7
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782282499; cv=pass; b=cdY+9l8JzFMiqTm6oSXJ/eR/f0ky6GImjLUFeQRe8gmVsPyGZH1htJbwbjVquUi3pwsp3YZDz9drPak+l0vtg3B4FWskzG3zWc/usmznNjCSuxNUNOrbeRMVkeEqRdiLfuW+NSX5DPZjIHIZTP2lfn/FDTSfaRGia0T0xsMvmz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782282499; c=relaxed/simple;
	bh=eR2B67/G6AOoWJ9lQu0Zc18QHTjQ8LgZfbuCTozo5/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmXBztYbZx/MP7DgQKWFicg9g6UPCpTFavJo1GujOT+IaLDxI1VxJXoAanm4JjKViqe+oZNaKL13y3cOeTBahw2EBKO4O4d9Ly9fKhy13amwU8qLezXpXPlMc5E6ZFfZJNjZc4fH0t0NQShf95yw36juF2duxI69ZOP65INjzaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmsOrKE8; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmsOrKE8"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9674d727c0aso134178241.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 23:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782282497; cv=none;
        d=google.com; s=arc-20240605;
        b=TSyZLYru2Yrb2hM1Dlhfywz45CKnvDZ7xOatFWj4ocZYuQ8YLj5tUjefgd8kYv4Upi
         TXRZafyOCompd8FywOmNjFBjT5Sg3FJzqSOoO2yRbG//nsBPR3W8LFLwCA2xpbiGk0It
         fJf4zDubSBMopGBtQAceY7uD21e8CNSsrggcIg8HdCZ1R2mhP/FXCbl5pj3x3OhRz1jr
         ++RrXjN+mDFO5UoDMq3oA8MEZ/Gq9azyGQIqNFslK4XEacBX6YwNNJIV4CeunQGxNncl
         xRn8B6TFGm0f9OFhAPF8InHI8ytTIHNsN5JmbaQJayiR7OuIrFC6nxqVLGiLuv5x0bZg
         ft7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S5unesQUe5rTREkewLr25lSG9HOlhQ4R566MbFqIp8M=;
        fh=t/bwV4yiK4Icmsv1/wjyZDqfbkhaVr6/nma6ev4v7dU=;
        b=dLOguCT2KDzxa1E/5w6TFEk4YbX+BnDh1ars5Zrk0BZbWhatd3fA9FgdgmvwlySDk4
         1bUutvbWVB4UgoiwLgp3WTWJ37/qxP08/tsnVk1gHSAWFT9xM8vSYgq/R0sOw5Sf+ONF
         OB2Y6PMobza3l9XAx9rRRqpRK5NObssaeVSpuNBv+FRlxe91v0mB8exSjSpwlMqZD6l9
         kdiqLoc1K09FcJyAi12SrVIFfIkdkHikof4V1y1FgoC0k7rfo6h+xaOjvmPEEbrL3spg
         xf61Dtn64mGwo774R0hQeUCSK6D1IX16EJ1wWVvTq+f/l3Uvp5TjOEe2u/a3QSY86odX
         YGMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782282497; x=1782887297; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5unesQUe5rTREkewLr25lSG9HOlhQ4R566MbFqIp8M=;
        b=AmsOrKE8VcygbqUqMtVL60rlt9vBr8hDf0O5jdc1oROcwce276DsP+buV054Jl95+H
         O8TvwOumsQeuAqHRJFVgaWpV3xFc1DjCo3VPRV7eZ6i285ZMQQIxOPJISB0ztxEJAc2v
         cPDA8Sznz8d9s7j2ox9XPbs75THSVTgoghAp7GnyshOhEOyyCK4VJI/MJT0tsVqbAqYk
         GxdOzhrNQ0soP1ze5/9ArWx6ozTr58grPXuQZ7F04M/gm+ceK269+I0M6CHPgilX3ax/
         nckRcPA/6GG54frCyWfAu7foneypn5/A1BoW+cGX0y1Lnzs7mjfv7RQ9/A27NrMA2+5/
         qQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782282497; x=1782887297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S5unesQUe5rTREkewLr25lSG9HOlhQ4R566MbFqIp8M=;
        b=IZ+mC5lbCYqOhkjzptxCqAso/DOQ7ojio6Surc7nE3KyulN0GhHb0z8lRKMunPNEI9
         2eNnp5/MMa09OJZR1U3qHC/sX70VnY5KucfRMPCHUhf1mV6RlfUoR70xfWDRaXa1U+Qt
         rGnZss/2SXdNG7B+dbS6OWES3p6dbRufLcoPetEYsMAejpmqZnaIQWSrfD/vr595cvin
         wAmiwhK3hNcTn9IsY9YksFzGGnWpovkhzXbSg8+WduyQXXoMSFz3zCaCXW6QkhBHxk1k
         nZYBAT2Xvvqg9JtU2SHLlv3nXv2UJVew5GEQupwtYQB7u9biWiizGkyhn5Q1kkMMoqdJ
         ryGg==
X-Gm-Message-State: AOJu0YyRvsma3N/NBF3JKHzuomc5BmQp+hwaXgmrdXJsNOH+0GCH8SD1
	0VktHaNBImv79xZVK2kbI9DFdV0zXP0HXTpDyDMBjOdcbfdBzJzJpHPKVlV4LMyxigR8cPXH8Pp
	WW3Y9ljTZ2CW4IIge5mjnDwC9FJZPjN4=
X-Gm-Gg: AfdE7cmBsydFB+/1rJZnmCtiO/P62l+33IezXIDijtcoOYM+YZ+mcOWC+COon5CxPZr
	tG9V+DyXoON8XRmH4tx4TMxsHaN/1LfztOkKJwLfngDbXtia4pUHi39hkzhyvzyTSETcjbMei+m
	gEpyjsD/bK4VA4vbp5sheEiOVS9sFZnZZrkLQvjPvR1/eEHQ4pIASWYkPEU95mc9skjSEFRtd6i
	FGoOf6YXCAQTJ2fVbtrZ6MQDt3xpkAaQJg+f/W6A0ZUIH/UOQrnDN5oS4eNi1lhjuopxmW6liDq
	2Oi8/SPz
X-Received: by 2002:a05:6102:8381:20b0:634:6b98:c37 with SMTP id
 ada2fe7eead31-72f83af0663mr2240478137.7.1782282497290; Tue, 23 Jun 2026
 23:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624061734.28479-1-andrem.33333@gmail.com>
In-Reply-To: <20260624061734.28479-1-andrem.33333@gmail.com>
From: Andre Moreira <andrem.33333@gmail.com>
Date: Wed, 24 Jun 2026 03:28:04 -0300
X-Gm-Features: AVVi8CcTiluNzpvQInZI5RS--tNzULrLv-a-6D51AoJqVdZLMNEom9yOvaN4eq0
Message-ID: <CACO0qFKHuQgvqyUL-K6pRrjWDwNWJSPUcg7N9FVXokQHZ==ahg@mail.gmail.com>
Subject: Re: [PATCH] usb: core: hub: fix coding style and prefer unsigned int
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg and all,

*Please disregard this patch. I am new to kernel development and was
just trying to clear checkpatch.pl warnings on drivers/usb/core/hub.c.
*

I realize now that style-only cleanups in mature/core drivers cause
unnecessary noise in git blame and overhead for maintainers. Sorry for
the noise, I will look into drivers/staging/ for this kind of
contribution instead.

Best regards,
Andr=C3=A9

Em qua., 24 de jun. de 2026 =C3=A0s 03:18, Andr=C3=A9 Moreira
<andrem.33333@gmail.com> escreveu:
>
> Fix indentation issues and clear checkpatch warnings by replacing
> bare uses of 'unsigned' with 'unsigned int' throughout the file.
>
> Signed-off-by: Andr=C3=A9 Moreira <andrem.33333@gmail.com>
> ---
>  drivers/usb/core/hub.c | 52 +++++++++++++++++++++---------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 24960ba9caa91..a75db12506388 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -410,7 +410,7 @@ static int get_hub_descriptor(struct usb_device *hdev=
,
>                 struct usb_hub_descriptor *desc)
>  {
>         int i, ret, size;
> -       unsigned dtype;
> +       unsigned int dtype;
>
>         if (hub_is_superspeed(hdev)) {
>                 dtype =3D USB_DT_SS_HUB;
> @@ -506,15 +506,15 @@ static void led_work(struct work_struct *work)
>         struct usb_hub          *hub =3D
>                 container_of(work, struct usb_hub, leds.work);
>         struct usb_device       *hdev =3D hub->hdev;
> -       unsigned                i;
> -       unsigned                changed =3D 0;
> +       unsigned int            i;
> +       unsigned int            changed =3D 0;
>         int                     cursor =3D -1;
>
>         if (hdev->state !=3D USB_STATE_CONFIGURED || hub->quiescing)
>                 return;
>
>         for (i =3D 0; i < hdev->maxchild; i++) {
> -               unsigned        selector, mode;
> +               unsigned int    selector, mode;
>
>                 /* 30%-50% duty cycle */
>
> @@ -774,7 +774,7 @@ static void hub_irq(struct urb *urb)
>  {
>         struct usb_hub *hub =3D urb->context;
>         int status =3D urb->status;
> -       unsigned i;
> +       unsigned int i;
>         unsigned long bits;
>
>         switch (status) {
> @@ -1084,7 +1084,7 @@ static void hub_activate(struct usb_hub *hub, enum =
hub_activation_type type)
>         int port1;
>         int status;
>         bool need_debounce_delay =3D false;
> -       unsigned delay;
> +       unsigned int delay;
>
>         /* Continue a partial initialization */
>         if (type =3D=3D HUB_INIT2 || type =3D=3D HUB_INIT3) {
> @@ -1457,9 +1457,9 @@ static int hub_configure(struct usb_hub *hub,
>         unsigned int pipe;
>         int maxp, ret, i;
>         char *message =3D "out of memory";
> -       unsigned unit_load;
> -       unsigned full_load;
> -       unsigned maxchild;
> +       unsigned int unit_load;
> +       unsigned int full_load;
> +       unsigned int maxchild;
>
>         hub->buffer =3D kmalloc_obj(*hub->buffer);
>         if (!hub->buffer) {
> @@ -1792,7 +1792,7 @@ void hub_put(struct usb_hub *hub)
>         kref_put(&hub->kref, hub_release);
>  }
>
> -static unsigned highspeed_hubs;
> +static unsigned int highspeed_hubs;
>
>  static void hub_disconnect(struct usb_interface *intf)
>  {
> @@ -1859,7 +1859,7 @@ static bool hub_descriptor_is_sane(struct usb_host_=
interface *desc)
>         if (!usb_endpoint_is_int_in(&desc->endpoint[0].desc))
>                 return false;
>
> -        return true;
> +       return true;
>  }
>
>  static int hub_probe(struct usb_interface *intf, const struct usb_device=
_id *id)
> @@ -2047,7 +2047,7 @@ hub_ioctl(struct usb_interface *intf, unsigned int =
code, void *user_data)
>   * Allow user programs to claim ports on a hub.  When a device is attach=
ed
>   * to one of these "claimed" ports, the program will "own" the device.
>   */
> -static int find_port_owner(struct usb_device *hdev, unsigned port1,
> +static int find_port_owner(struct usb_device *hdev, unsigned int port1,
>                 struct usb_dev_state ***ppowner)
>  {
>         struct usb_hub *hub =3D usb_hub_to_struct_hub(hdev);
> @@ -3263,7 +3263,7 @@ static void usb_unlock_port(struct usb_port *port_d=
ev)
>  #ifdef CONFIG_PM
>
>  /* Check if a port is suspended(USB2.0 port) or in U3 state(USB3.0 port)=
 */
> -static int port_is_suspended(struct usb_hub *hub, unsigned portstatus)
> +static int port_is_suspended(struct usb_hub *hub, unsigned int portstatu=
s)
>  {
>         int ret =3D 0;
>
> @@ -3441,7 +3441,7 @@ static int usb_disable_remote_wakeup(struct usb_dev=
ice *udev)
>  }
>
>  /* Count of wakeup-enabled devices at or below udev */
> -unsigned usb_wakeup_enabled_descendants(struct usb_device *udev)
> +unsigned int usb_wakeup_enabled_descendants(struct usb_device *udev)
>  {
>         struct usb_hub *hub =3D usb_hub_to_struct_hub(udev);
>
> @@ -3959,7 +3959,7 @@ static int hub_suspend(struct usb_interface *intf, =
pm_message_t msg)
>  {
>         struct usb_hub          *hub =3D usb_get_intfdata(intf);
>         struct usb_device       *hdev =3D hub->hdev;
> -       unsigned                port1;
> +       unsigned int            port1;
>
>         /*
>          * Warn if children aren't already suspended.
> @@ -4697,7 +4697,7 @@ int hub_port_debounce(struct usb_hub *hub, int port=
1, bool must_be_connected)
>  {
>         int ret;
>         u16 portchange, portstatus;
> -       unsigned connection =3D 0xffff;
> +       unsigned int connection =3D 0xffff;
>         int total_time, stable_time =3D 0;
>         struct usb_port *port_dev =3D hub->ports[port1 - 1];
>
> @@ -4906,7 +4906,7 @@ hub_port_init(struct usb_hub *hub, struct usb_devic=
e *udev, int port1,
>         struct usb_hcd          *hcd =3D bus_to_hcd(hdev->bus);
>         struct usb_port         *port_dev =3D hub->ports[port1 - 1];
>         int                     retries, operations, retval, i;
> -       unsigned                delay =3D HUB_SHORT_RESET_TIME;
> +       unsigned int            delay =3D HUB_SHORT_RESET_TIME;
>         enum usb_device_speed   oldspeed =3D udev->speed;
>         const char              *speed;
>         int                     devnum =3D udev->devnum;
> @@ -5269,7 +5269,7 @@ hub_power_remaining(struct usb_hub *hub)
>         for (port1 =3D 1; port1 <=3D hdev->maxchild; ++port1) {
>                 struct usb_port *port_dev =3D hub->ports[port1 - 1];
>                 struct usb_device *udev =3D port_dev->child;
> -               unsigned unit_load;
> +               unsigned int unit_load;
>                 int delta;
>
>                 if (!udev)
> @@ -5308,10 +5308,10 @@ static int descriptors_changed(struct usb_device =
*udev,
>                 struct usb_host_bos *old_bos)
>  {
>         int             changed =3D 0;
> -       unsigned        index;
> -       unsigned        serial_len =3D 0;
> -       unsigned        len;
> -       unsigned        old_length;
> +       unsigned int    index;
> +       unsigned int    serial_len =3D 0;
> +       unsigned int    len;
> +       unsigned int    old_length;
>         int             length;
>         char            *buf;
>
> @@ -5392,7 +5392,7 @@ static void hub_port_connect(struct usb_hub *hub, i=
nt port1, u16 portstatus,
>  {
>         int status =3D -ENODEV;
>         int i;
> -       unsigned unit_load;
> +       unsigned int unit_load;
>         struct usb_device *hdev =3D hub->hdev;
>         struct usb_hcd *hcd =3D bus_to_hcd(hdev->bus);
>         struct usb_port *port_dev =3D hub->ports[port1 - 1];
> @@ -6000,14 +6000,14 @@ static void hub_event(struct work_struct *work)
>
>  static const struct usb_device_id hub_id_table[] =3D {
>      { .match_flags =3D USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT
> -                   | USB_DEVICE_ID_MATCH_INT_CLASS,
> +                       | USB_DEVICE_ID_MATCH_PRODUCT
> +                       | USB_DEVICE_ID_MATCH_INT_CLASS,
>        .idVendor =3D USB_VENDOR_SMSC,
>        .idProduct =3D USB_PRODUCT_USB5534B,
>        .bInterfaceClass =3D USB_CLASS_HUB,
>        .driver_info =3D HUB_QUIRK_DISABLE_AUTOSUSPEND},
>      { .match_flags =3D USB_DEVICE_ID_MATCH_VENDOR
> -                   | USB_DEVICE_ID_MATCH_PRODUCT,
> +                       | USB_DEVICE_ID_MATCH_PRODUCT,
>        .idVendor =3D USB_VENDOR_CYPRESS,
>        .idProduct =3D USB_PRODUCT_CY7C65632,
>        .driver_info =3D HUB_QUIRK_DISABLE_AUTOSUSPEND},
> --
> 2.43.0
>
