Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6D627E1DC
	for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2026 04:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788322512; cv=pass; b=u3W0rEbYbU5kUMd+h0emvNa3mWufvXUTdryb5i1Q+7BwV4mUSUL7m9b30kZkw94pNCp2eclfPiPZf/uToXbESxH3iDhlOiSTYrLT3ZCCP+UAjzvxgWkF0Mpe/mMTPmWEwNXFcYtxL6PhGf71lvkq8KmI8nrVGcArumwb5oBrLlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788322512; c=relaxed/simple;
	bh=GYrLpPXSr+wpw5uA9ENTksY4R3RpGrsVmCMNlh9NRZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vbk70PPJ0/kR1rkOqv8zyfigPfY/tS6mw7vgdK5krFCcLANEwMoPZOf+dPddfY7oDGFISy8/pJkE92p9GlGGcISeMf54JEEI/fxFXcAfhwIn3VxUlG6GihBxSQM0sbVtalk9YjS49/5gWshI8re1ySpDSEFZ/dNyxxOla0XvlAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbn6EHOy; arc=pass smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbn6EHOy"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e55b62640so58639485a.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Sep 2026 21:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788322509; cv=none;
        d=google.com; s=arc-20260327;
        b=si76Jv1hQfTIdw2ShIuxl/3jsrIIJR/8h4Uzrxp8XcEfpo42nlw3AGSM6xwvBAVwra
         Q3tpHWbfP98uKGM7ToIYAAuAKWIFAp9v9kksXZ69NgP1z308VllpOjjUVpj6Hx8LN7og
         kZG3uwtNDyaHl6ss4aysYYAnikjnKozvFM/uIfrynLXANVihHvj40nb0q0J8ov+0rSNs
         8vKomf7cL28rww7F/qN69H0uPXkBvky5L1sJ7fa5VH1TQDaouTKMEDHGA1Qi8LCXDqud
         5qnsFyNKiRj4adHfJ9aeA6Ddz69n8QfZx88o6A1VWdeaUESdeD3iog3tJA1/sUZyjuZ9
         +nDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8zLcTNB8D6Av53uE6bMjzR5QHWvUxA2Hm598w4QvsTU=;
        fh=iH3fMI4zzTA99Fu+b7ePGhLHbIIhHiul3judwrG7dG4=;
        b=r+dkisCAmL0Y83DQhzNPwEulzZhKVtST/5HoD0Lrl95Vh/nX6AspGqgfDEUrwpkAlD
         YuQP2rC2TCi/VCnLG9UDjiGbRzjL45l2P/HBwa2Q/CDvHZXBQdjXTBVfvruiVMxAv7WC
         rJdWuUby09nzoyOfZGBYFWTdjmPJCXgF0Ld/TGX5Gd4sL0u7a8AzxTvKOPyEZ0hCyMfX
         dJ1Qw1O+9uaLnf1V23uROcVV3f006e2q4lBNsM/GgtHaHK9t20SnFlUPh2jZlSUFN9gq
         ll/EV3rj5+a0AmTXuf3bLZsgnSgfIUhDWYMMgz08Q+83IunmRKjxVgbeLHc6bS1t8wm5
         xaiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788322509; x=1788927309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zLcTNB8D6Av53uE6bMjzR5QHWvUxA2Hm598w4QvsTU=;
        b=rbn6EHOyuXFF9YZvTA02CxvzdPDJZ0AERZ/mntG8XnoZ0GIxk0kUCIZ+YveXqUDbIC
         3kCqkDGGhiHDxOhOZxO31/G7R1kVBmv8yrkPAnebc7CXM4gjnOgu499tczeLHXUhRE4x
         PZiFGCTbB0eyCp8bqyFHpRILPkL0J79YXl/Lm3QcSqUOg5VHgokhqHyHcOQQo1LSu6Q/
         UZKDNZwqaGGsPDu0fDIStO4ZnOCgFnzy1N/SO1lYb2JKm+0xEceesoOM1EqWVqyDd3kk
         KgsGYWmkGFIkfh1HY5yW97JSolG7OjE50AggYhcpDdZ1Ou27KFqDil52cbrFSdOcXB5J
         uc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788322509; x=1788927309;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zLcTNB8D6Av53uE6bMjzR5QHWvUxA2Hm598w4QvsTU=;
        b=Wf3W18PMlcBLbPx41WVYkH9hrB8XIBqBI31bZCst+9xGCIohLnoosCpiRxv88FWa6+
         BYU6imTHVj+Of/v2/mtQ9jZDUWvdUZsZcFLkEl6+JFf5y3P7iOQcLngs9tmQAUovALMa
         OBmDCzepe3vVp6y9Mtzk4GXUniR88vPGuio1JpjnfZL13p2cq4QsQoJ6fgwVbuI2tsjv
         GCSxc5Ff7kqv90p5dh/fHe+FeuSpyM1CPlp1WPTjUzfm9UVNrcJonOTqOG31igDctdx7
         Xa0LBi8rgCnF/BJTU8AL0nWbaTfvzoRjOrm0w07rO1ekbPjCGB6waBpfokC2LQ6hrsC5
         /bTg==
X-Forwarded-Encrypted: i=1; AHgh+RooDzY7gIhyxNM+4fu5waC/PgllocNgHysAo6QISeasgQJK9Yi+mw3wto//yh6jBueayiUSAeDR9Qo=@vger.kernel.org
X-Gm-Message-State: AFuF++kKKVwLQuFoY/QKfvZG3LojCHHbeZIBlGTzguBYy1nutpgqS2ZJ
	cuG1IeqflVKp94Q5Bqvwz5LCbhgA9ej52RG3m8vXroURo9+2jXlziQX/oaYdQfAEdPzSqksai92
	8d8dtA12IQYDtmqZ8Uzy/QBBrt9PtL1Y=
X-Gm-Gg: AR+sD12DkVg0Me5aQTCPZQ5ORe0gxaOMlaZoSW+2jPwLXDDhKCXpEEJz7eS4BUH+wmY
	vDCKrYxRC7OxePMgiCfcNl5d1crDvtWmX8wu8hPGsGK32P/I55AcgFXRzH8RopiCBGxp2YsCrSh
	yEzhseU+BkPXLxNvoonweE0T/fN5v8ygYnLJ6+CvYuIp93BWZ327ijjwzRvmirtc7XbeUbVfTeN
	rHsG5icBqgTKVaVoGmoCo/HsKdpKp3pXm54AxWHY6vJR+dgT9A5C3uwXSkRJhhafQbK7bI084bt
	NQwyd/6ZElDO/yWtcti8CkMANyTkiTIVcVfP2eNWhghAzAai7FbvoreF1hNFiy945nhIHMyNPeH
	8Vf5+zWYPHDCVb4v64P1VzMKb
X-Received: by 2002:a05:620a:72cc:20b0:939:32cf:641c with SMTP id
 af79cd13be357-93960cbcc17mr192773485a.9.1788322508992; Tue, 01 Sep 2026
 21:15:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727092258.1121-1-liujiazi@amazon.com> <20260812082127.79610-1-liujiazi@amazon.com>
 <apDmBeD8UQIvtfR4@vbox> <CAAcjFgh-f2=cK09BLGN-kPVu2usjN7pWOxCWb31hSePB2nLVEA@mail.gmail.com>
 <apIe9XE5_lFJWyg_@vbox>
In-Reply-To: <apIe9XE5_lFJWyg_@vbox>
From: Liu Jiazi <jiazi.liu1984@gmail.com>
Date: Wed, 2 Sep 2026 12:14:57 +0800
X-Gm-Features: AcwNN1VXmGHCkNH8FtWDhHqlwDvUE-1fS4RzWF171H-D6YyMHcp7U0t0pNMrg6g
Message-ID: <CAAcjFgiCF0tC-REwzHmBTKew9LT9gmWsF==LUZ-htSTD2+s7+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] usb: dwc3: gadget: fix IRQ storm on invalid event
 buffer count
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, "lkp@intel.com" <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, Jiazi Liu <liujiazi@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Thinh Nguyen

Tested on our device with the patch you provided.
Trigger the error by writing a bogus value to GEVNTCOUNT and the
controller recovers successfully
USB re-enumrates and ADB comes back. No kernel panic observed.

uart print:
[ 1892.781261][    C0] dwc3 b1800000.usb: invalid count(61436) >
evt->length(4096)
[ 1892.834341][ T6793] dwc3 b1800000.usb: request ffffff81475856c0 was
not queued to ep0out
[ 1895.042752][ T9114] ffs_data_put(): freeing
[ 1896.206669][ T9142] read descriptors
[ 1896.207465][ T9142] bcdVersion must be 0x0100, stored in Little
Endian order. Userspace driver should be
fixed, accepting 0x0001 for compatibility.
[ 1896.209638][ T9142] bcdVersion must be 0x0100, stored in Little
Endian order. Userspace driver should be
fixed, accepting 0x0001 for compatibility.
[ 1896.211754][ T9142] read strings
[ 1897.244130][ T9123] FFS endpoints ready, proceeding with UDC bind
[ 1897.258493][ T9123] bcdVersion must be 0x0100, stored in Little
Endian order. Userspace driver should be
fixed, accepting 0x0001 for compatibility.
[ 1897.260970][ T9123] bcdVersion must be 0x0100, stored in Little
Endian order. Userspace driver should be
fixed, accepting 0x0001 for compatibility.

Brs
Jiazi

Thinh Nguyen <Thinh.Nguyen@synopsys.com> =E4=BA=8E2026=E5=B9=B48=E6=9C=8829=
=E6=97=A5=E5=91=A8=E5=85=AD 08:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Liu,
>
> On Fri, Aug 28, 2026, Liu Jiazi wrote:
> > Hi @Thinh.Nguyen@synopsys.com , Krishna,
> >
> > Thanks for the detailed review.
> > For the gadget ops protection, I propose adding the check only in
> > dwc3_gadget_ep_queue.
> > This covers two scenarios:
> > 1. The window between error detection and soft_disconnect completing.
> > 2. After soft_disconnect, existing checks on
> > connected/pullups_connected/endpoint.desc naturally block all ops.
> > This is also consistent with how other gadget handles it.
> >
>
> Looking at the change more closely, especially the gadget_ops and
> ep_ops. We need to consider the followings:
>
> 1) We need a mutex to prevent a race against dwc3_gadget_pullup()
> 2) ep_enable, ep_queue, ep_set_halt/wedge, wakeup, and function_wakeup
>    need to be guarded. The other ones are for cleanup and should be
>    left alone.
> 3) We shouldn't use disable_irq_nosync() as suggested previously because
>    we need the event interrupt to drain the GEVENTCOUNT to allow the
>    controller to halt after clearing the DCTL.RUN_STOP bit. But we
>    should move the synchronize_irq() before the soft_connect.
>
> Can you try the change below (not tested).
>
> Thanks,
> Thinh
>
>
>
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index 608daeb7ef10..f3dabb37f806 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -49,6 +49,7 @@
>  #define DWC3_ENDPOINTS_NUM     32
>  #define DWC3_XHCI_RESOURCES_NUM        2
>  #define DWC3_ISOC_MAX_RETRIES  5
> +#define DWC3_ERR_RECOVERY_MAX  3
>
>  #define DWC3_SCRATCHBUF_SIZE   4096    /* each buffer is assumed to be 4=
KiB */
>  #define DWC3_EVENT_BUFFERS_SIZE        4096
> @@ -841,6 +842,12 @@ enum dwc3_link_state {
>         DWC3_LINK_STATE_MASK            =3D 0x0f,
>  };
>
> +enum dwc3_err_state {
> +       DWC3_ERR_NONE =3D 0,
> +       DWC3_ERR_RECOVERY,
> +       DWC3_ERR_UNRECOVERABLE,
> +};
> +
>  /* TRB Length, PCM and Status */
>  #define DWC3_TRB_SIZE_MASK     (0x00ffffff)
>  #define DWC3_TRB_SIZE_LENGTH(n)        ((n) & DWC3_TRB_SIZE_MASK)
> @@ -1004,6 +1011,7 @@ struct dwc3_glue_ops {
>  /**
>   * struct dwc3 - representation of our controller
>   * @drd_work: workqueue used for role swapping
> + * @err_recovery_work: workqueue used for controller error recovery
>   * @ep0_trb: trb which is used for the ctrl_req
>   * @bounce: address of bounce buffer
>   * @setup_buf: used while precessing STD USB requests
> @@ -1013,6 +1021,7 @@ struct dwc3_glue_ops {
>   * @ep0_in_setup: one control transfer is completed and enter setup phas=
e
>   * @lock: for synchronizing
>   * @mutex: for mode switching
> + * @connect_mutex: for the pull-up and err_recovery_work
>   * @dev: pointer to our struct device
>   * @sysdev: pointer to the DMA-capable device
>   * @xhci: pointer to our xHCI child
> @@ -1079,6 +1088,9 @@ struct dwc3_glue_ops {
>   * @ep0_next_event: hold the next expected event
>   * @ep0state: state of endpoint zero
>   * @link_state: link state
> + * @err_state: current error recovery state.
> + * @err_recovery_count: number of consecutive error recovery attempts un=
til
> + *             confirmed healthy and reset to 0 on reset event.
>   * @speed: device speed (super, high, full, low)
>   * @hwparams: copy of hwparams registers
>   * @regset: debugfs pointer to regdump file
> @@ -1189,6 +1201,7 @@ struct dwc3_glue_ops {
>   */
>  struct dwc3 {
>         struct work_struct      drd_work;
> +       struct work_struct      err_recovery_work;
>         struct dwc3_trb         *ep0_trb;
>         void                    *bounce;
>         u8                      *setup_buf;
> @@ -1203,6 +1216,9 @@ struct dwc3 {
>         /* mode switching lock */
>         struct mutex            mutex;
>
> +       /* serializes pull-up run/stop vs error recovery */
> +       struct mutex            connect_mutex;
> +
>         struct device           *dev;
>         struct device           *sysdev;
>
> @@ -1332,6 +1348,9 @@ struct dwc3 {
>         enum dwc3_ep0_next      ep0_next_event;
>         enum dwc3_ep0_state     ep0state;
>         enum dwc3_link_state    link_state;
> +       enum dwc3_err_state     err_state;
> +
> +       u32                     err_recovery_count;
>
>         u16                     u2sel;
>         u16                     u2pel;
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index bfe616194dfa..fa3d8b9f6f8e 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -200,6 +200,11 @@ int dwc3_gadget_ep0_queue(struct usb_ep *ep, struct =
usb_request *request,
>         int                             ret;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               ret =3D -ESHUTDOWN;
> +               goto out;
> +       }
> +
>         if (!dep->endpoint.desc || !dwc->pullups_connected || !dwc->conne=
cted) {
>                 dev_err(dwc->dev, "%s: can't queue to disabled endpoint\n=
",
>                                 dep->name);
> @@ -271,6 +276,10 @@ int dwc3_gadget_ep0_set_halt(struct usb_ep *ep, int =
value)
>         int                             ret;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         ret =3D __dwc3_gadget_ep0_set_halt(ep, value);
>         spin_unlock_irqrestore(&dwc->lock, flags);
>
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index fa944856f956..87b535fb9443 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1149,6 +1149,10 @@ static int dwc3_gadget_ep_enable(struct usb_ep *ep=
,
>                 return 0;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         ret =3D __dwc3_gadget_ep_enable(dep, DWC3_DEPCFG_ACTION_INIT);
>         spin_unlock_irqrestore(&dwc->lock, flags);
>
> @@ -2055,6 +2059,10 @@ static int dwc3_gadget_ep_queue(struct usb_ep *ep,=
 struct usb_request *request,
>         int                             ret;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         ret =3D __dwc3_gadget_ep_queue(dep, req);
>         spin_unlock_irqrestore(&dwc->lock, flags);
>
> @@ -2287,6 +2295,10 @@ static int dwc3_gadget_ep_set_halt(struct usb_ep *=
ep, int value)
>         int                             ret;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         ret =3D __dwc3_gadget_ep_set_halt(dep, value, false);
>         spin_unlock_irqrestore(&dwc->lock, flags);
>
> @@ -2301,6 +2313,10 @@ static int dwc3_gadget_ep_set_wedge(struct usb_ep =
*ep)
>         int                             ret;
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         dep->flags |=3D DWC3_EP_WEDGE;
>
>         if (dep->number =3D=3D 0 || dep->number =3D=3D 1)
> @@ -2432,6 +2448,10 @@ static int dwc3_gadget_wakeup(struct usb_gadget *g=
)
>         }
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         if (!dwc->gadget->wakeup_armed) {
>                 dev_err(dwc->dev, "not armed for remote wakeup\n");
>                 spin_unlock_irqrestore(&dwc->lock, flags);
> @@ -2459,6 +2479,10 @@ static int dwc3_gadget_func_wakeup(struct usb_gadg=
et *g, int intf_id)
>         }
>
>         spin_lock_irqsave(&dwc->lock, flags);
> +       if (dwc->err_state !=3D DWC3_ERR_NONE) {
> +               spin_unlock_irqrestore(&dwc->lock, flags);
> +               return -ESHUTDOWN;
> +       }
>         /*
>          * If the link is in U3, signal for remote wakeup and wait for th=
e
>          * link to transition to U0 before sending device notification.
> @@ -2828,10 +2852,13 @@ static int dwc3_gadget_pullup(struct usb_gadget *=
g, int is_on)
>
>         synchronize_irq(dwc->irq_gadget);
>
> +       /* Serialize against dwc3_err_recovery_work() */
> +       mutex_lock(&dwc->connect_mutex);
>         if (!is_on)
>                 ret =3D dwc3_gadget_soft_disconnect(dwc);
>         else
>                 ret =3D dwc3_gadget_soft_connect(dwc);
> +       mutex_unlock(&dwc->connect_mutex);
>
>         pm_runtime_put(dwc->dev);
>
> @@ -4148,6 +4175,10 @@ static void dwc3_gadget_reset_interrupt(struct dwc=
3 *dwc)
>
>         dwc->suspended =3D false;
>
> +       /* The controller is recovered. */
> +       if (dwc->err_state =3D=3D DWC3_ERR_NONE)
> +               dwc->err_recovery_count =3D 0;
> +
>         /*
>          * Ideally, dwc3_reset_gadget() would trigger the function
>          * drivers to stop any active transfers through ep disable.
> @@ -4635,6 +4666,12 @@ static irqreturn_t dwc3_thread_interrupt(int irq, =
void *_evt)
>         return ret;
>  }
>
> +static void dwc3_schedule_err_recovery(struct dwc3 *dwc)
> +{
> +       dwc->err_state =3D DWC3_ERR_RECOVERY;
> +       schedule_work(&dwc->err_recovery_work);
> +}
> +
>  static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
>  {
>         struct dwc3 *dwc =3D evt->dwc;
> @@ -4668,9 +4705,21 @@ static irqreturn_t dwc3_check_event_buf(struct dwc=
3_event_buffer *evt)
>                 return IRQ_NONE;
>
>         if (count > evt->length) {
> -               dev_err_ratelimited(dwc->dev, "invalid count(%u) > evt->l=
ength(%u)\n",
> +               dev_err(dwc->dev, "invalid count(%u) > evt->length(%u)\n"=
,
>                         count, evt->length);
> -               return IRQ_NONE;
> +               /*
> +                * This is a fatal error - the driver and controller are =
out of
> +                * sync on which event has been consumed. Reinitializing =
the
> +                * controller is required to recover. Write the bogus cou=
nt back
> +                * to GEVNTCOUNT to clear the IRQ source, consistent with=
 the
> +                * stale event clearing in dwc3_event_buffers_setup(), th=
en
> +                * schedule error recovery.
> +                */
> +               spin_lock(&dwc->lock);
> +               dwc3_schedule_err_recovery(dwc);
> +               spin_unlock(&dwc->lock);
> +               dwc3_writel(dwc, DWC3_GEVNTCOUNT(0), count);
> +               return IRQ_HANDLED;
>         }
>
>         evt->count =3D count;
> @@ -4730,6 +4779,53 @@ static void dwc_gadget_release(struct device *dev)
>         kfree(gadget);
>  }
>
> +static void dwc3_err_recovery_work(struct work_struct *work)
> +{
> +       struct dwc3 *dwc =3D container_of(work, struct dwc3, err_recovery=
_work);
> +       unsigned long flags;
> +       int ret;
> +
> +       dwc->err_recovery_count++;
> +
> +       /* serializes against dwc3_gadget_pullup() */
> +       mutex_lock(&dwc->connect_mutex);
> +
> +       ret =3D dwc3_gadget_soft_disconnect(dwc);
> +       if (ret)
> +               goto err_unrecoverable;
> +
> +       dwc3_disconnect_gadget_sleepable(dwc);
> +
> +       if (dwc->err_recovery_count > DWC3_ERR_RECOVERY_MAX)
> +               goto err_unrecoverable;
> +
> +       if (dwc->softconnect) {
> +               /*
> +                * Wait irq to finish before soft_connect resets evt->lpo=
s and
> +                * the event buffer registers to avoid racing with
> +                * dwc3_process_event_buf().
> +                */
> +               synchronize_irq(dwc->irq_gadget);
> +
> +               ret =3D dwc3_gadget_soft_connect(dwc);
> +               if (ret)
> +                       goto err_unrecoverable;
> +       }
> +       mutex_unlock(&dwc->connect_mutex);
> +
> +       spin_lock_irqsave(&dwc->lock, flags);
> +       dwc->err_state =3D DWC3_ERR_NONE;
> +       spin_unlock_irqrestore(&dwc->lock, flags);
> +       return;
> +
> +err_unrecoverable:
> +       dev_err(dwc->dev, "Unable to recover the controller\n");
> +       mutex_unlock(&dwc->connect_mutex);
> +       spin_lock_irqsave(&dwc->lock, flags);
> +       dwc->err_state =3D DWC3_ERR_UNRECOVERABLE;
> +       spin_unlock_irqrestore(&dwc->lock, flags);
> +}
> +
>  /**
>   * dwc3_gadget_init - initializes gadget related registers
>   * @dwc: pointer to our controller context structure
> @@ -4773,6 +4869,8 @@ int dwc3_gadget_init(struct dwc3 *dwc)
>         }
>
>         init_completion(&dwc->ep0_in_setup);
> +       INIT_WORK(&dwc->err_recovery_work, dwc3_err_recovery_work);
> +       mutex_init(&dwc->connect_mutex);
>         dwc->gadget =3D kzalloc_obj(struct usb_gadget);
>         if (!dwc->gadget) {
>                 ret =3D -ENOMEM;
> @@ -4869,6 +4967,8 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
>         if (!dwc->gadget)
>                 return;
>
> +       cancel_work_sync(&dwc->err_recovery_work);
> +       mutex_destroy(&dwc->connect_mutex);
>         dwc3_enable_susphy(dwc, true);
>         usb_del_gadget(dwc->gadget);
>         dwc3_gadget_free_endpoints(dwc);
