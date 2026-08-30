Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B075474F
	for <linux-usb@vger.kernel.org>; Sun, 30 Aug 2026 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071025; cv=pass; b=Xtf0uyPuka3CEN3yg+i6oBhyBbqGUYB1GwOKoQK/UA1d4/LFGxgAj8wWE5HOs9xWfSQ7WZ3qMpxJQOdHTX+E12pv/RhUOTmGlu9BMaO6spoAF9IR7NljYlDjVPeNoywMKNtGt8gNHXxLuzzPjdJSvprsJs/EoWWg2IBTEeJiGDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071025; c=relaxed/simple;
	bh=b+fewOHD1nhlDDxXl2qWt/qPrDWUHxUGTo/ZmLJqn30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnT5KHmjdsUNBt4E55dyKR2/Gy7SZhNKowELx5RJMJJF6jPC79RLZRvLgsbjEDQ0yL2JYZ5SMbsdahumdgAJdWGU7hYMLbNS/C9YGUyLHJTUYQyan2MVVNbu8MsCNNQJcmeoyBFNqpk9x1JpfF3WMMsjjlD8zq/Sgqv00RlCKHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHW9bwE6; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHW9bwE6"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66e611e7c05so441869d50.2
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2026 23:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788071023; cv=none;
        d=google.com; s=arc-20260327;
        b=hxbVlgCJcQjzbHyasW3JSf7W4x5HV719brYe1OPOm+iIS59Gne7oTx4OqWjdtnNWrM
         vSQWsRdy+QQSEEToXInn5CUGu5Sj0XYApfwIQZ+oxZrqL0gce2l2zcktvRDh0naH0p1Z
         nUwmQF8OQmwXOPqXpsAN+Das1ttLb5dkNEVaRReIM3BdRTFGmbaDKlQNFJIAqSDJH/z4
         /xQeS9PSUa7eiU8DLWQPqz7vttwKrFwLqruhTzuH2dU8E4jCme2XpKK0g7xWS9hXoKrD
         lS3Nvm8GKwJgmx+Sa53NxmxrJ+M0H219YXMRUcsJLEPvs+TXa5Lx8dRV0oswleFgc3CX
         dqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LnFU9aEGPR459zfIAZO8MceogtXnikwgHGOr/uxA35w=;
        fh=dKzoFOY07FQNg6Txjorrwhe0iiBd6OPPnAbKv4Qo64Y=;
        b=bswTmf25BD91QahdAgoZ+82GhX2Q+U1Fp1uZPKzdxrozVSNEcO9lTIroWOUvGrQpAR
         E27nkIF/w0KE/fwKDfCM6dfhkWF6CsOAfsks+hZOl2zbyRo2HiSOS2N/sSVGBFU1SCIp
         BjTrjZ9uJLvttWInTnugmhjrQYaGRjNASGcN0eADq+6+ayO9PDV3NJiMX8GAoP5nJRUi
         hneSDrTbxnl57uFF9GpJVlM3QZnIG1FCCuJfeX0Vm19nMHQw4PN00iIylR3X5fLQN0FU
         0ANpvAfOCyF90PdyzufipYLbGkOuwMtRc/I/mhtikTuOvnFVDeqq3io6Dnf2Pak8Ux95
         rocg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788071023; x=1788675823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LnFU9aEGPR459zfIAZO8MceogtXnikwgHGOr/uxA35w=;
        b=tHW9bwE6tK9qzVW8HXM9uBUs2YoBtlsCS9jnxDTwvg0YZpVGxufcJI/6O5TaagWfKo
         Fcz1azZVlvoiUzAzpEz8gSb1t6OKdATwugQcDvvvL2DzkdWF/zC96tRRRRZS1WIwJG55
         OAwm5SkXvzCOhHdqWxE7qhws4DWGAP0CU2Qkb75pu9UenPkDiookqekpfxPt7Kt3dVry
         T753MY6Lw7LcPCUnFaYbwqomtUhPOMXHTTru/ZZYytGrIB0NbmMrbkkaoIRsSr2frm1Y
         CuXCr3QaIGBKJaIYVpPvi1xqJDCF21+pKNNJyCGJpcAUU+03DS8erjYZ8JNJKjfBr4to
         71cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788071023; x=1788675823;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LnFU9aEGPR459zfIAZO8MceogtXnikwgHGOr/uxA35w=;
        b=XuIbNTNmOALTOw+30ZLD8lB+lyKthQBQ5kj7WLrQtX+lW45rzDSK2keueYrJGewCH9
         PbT7LHtBTdU/84ggx9n2DG+5P3mzaW/4nKsDusplvUPwRt2zZjN+Bq3MGAVcw0WQoYIv
         heKgegOKSp0MeYGwwavtsrzZ3iefmxkrlG94FzDRZoRJYB0Qnh3NE38J6YB/twS7Udjt
         TSuWdjFA5Mpy07uiFPH2QFqWv1v99xJ2GLlkSmAVXbvEGbaGFT0JyBSLVfoIAaLAVTgJ
         xdM9l1wLGtfvKTUb1pKFjgSkcAPCIfkzyDSDV8FjjZh4BX1Iinybz1528kuS6dC41Q0O
         YwtA==
X-Forwarded-Encrypted: i=1; AKwUvBxp5wYuRFJsiAnd+j9W8p3MhdBqBS4Q8V+xhbnjiyrjoPov1/oQKPE85PBwqc8OspIw5o9xkF2+iKU=@vger.kernel.org
X-Gm-Message-State: AFuF++kErhNzJI4V2IPQaDs/RyZJE44lmFHHYI0C+iNCZvGZikoXTfZa
	BA/zvOoF9xnRKcX/++ZwpGODhnDKDAZ+2qqxTQvB0nN/Z6etRwKhheFau9NRDpdHMtLTu7xsssf
	lbDTDZ/8bPetYeoXXcFPCKLaY+FjnOoI=
X-Gm-Gg: AYBFou1Vjz6vCr6OLDwFBQK64cbEd5+SjG7SaBUOVZthIQNiKkMB9YVm8uxx4rQR/IE
	4OjCe92FQTBdo275k7+7b/FAmCxIeN3/HIOgD+QWLKrFEcAJoVXAR4yWz9GBcetQvWHJp2+RHdz
	udpVFDFVy+VexJTrgLtRBGLNWzoiefsIcWTWkvZ9O12iFK1swdNO2VSu/5jumevtgqiR67QKlKV
	9fh+/Pk+zln5Ky61tA54dCczE89RDBPilsDynQ1S8l0oObCoauUd/E3hD8m2m+IjuSj05ejxhFV
	yL+3JznCl5LoYHSfXqOyuFrq7r5WZbFVLqlWKZxVjPouL027j+zyEtgKOAXCm2Pv8Xki1MyObbi
	cOC0+I0ZfkAWnK0swgbV3MztViHjq9qjYwoHIwVl2LYxP
X-Received: by 2002:a05:690e:138b:b0:66d:fa2:63d0 with SMTP id
 956f58d0204a3-66e4c5caf40mr5388150d50.50.1788071022968; Sat, 29 Aug 2026
 23:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816061034.17769-1-kartikey406@gmail.com>
In-Reply-To: <20260816061034.17769-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Sun, 30 Aug 2026 11:53:30 +0530
X-Gm-Features: AcwNN1WNG8AZl9DA6veIf-pEmnHIwTsmwhtMxP_gUJ4Lo6nlw0HveVzdofm4SR4
Message-ID: <CADhLXY50-2NMU2P3-htxfh8d6cQZ7VQ1C93aGm+HBXFz=6uB=w@mail.gmail.com>
Subject: Re: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026 at 11:40=E2=80=AFAM Deepanshu Kartikey
<kartikey406@gmail.com> wrote:
>
> The vhci attribute group is created in vhci_start() and removed in
> vhci_stop(), guarded by usb_hcd_is_primary_hcd(). Both run from
> usb_add_hcd()/usb_remove_hcd(), which are called once per hcd, so the
> attach attribute is live while only one of the two hcds exists: it is
> created during the first usb_add_hcd() before vhci_hcd_ss is set, and it
> survives the first usb_put_hcd() on removal. A concurrent write to attach
> can therefore reach a NULL or freed vhci_hcd_ss.
>
> Register the group as dev_groups on the platform driver instead, so the
> driver core creates the files before probe and removes them after remove
> returns, and drop the sysfs_create_group()/sysfs_remove_group() calls fro=
m
> the driver. The attributes have always been created only on vhci_hcd.0;
> an is_visible() callback keeps them there.
>
> vhci_init_attr_group() is moved into vhci_hcd_init() ahead of
> platform_driver_register() so the group is populated before the core
> reads it. The attribute array is still built at runtime because the
> number of status attributes comes from CONFIG_USBIP_VHCI_NR_HCS and the
> preprocessor cannot emit a variable number of __ATTR() declarations.
>
> Fixes: 1c9de5bf4286 ("usbip: vhci-hcd: Add USB3 SuperSpeed support")
> Reported-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D8753715f05759f1a10de
> Tested-by: syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/all/20260815143427.19066-1-kartikey406@gmai=
l.com/T/ [v1]
> Link: https://lore.kernel.org/all/20260816015051.13184-1-kartikey406@gmai=
l.com/T/ [v2]
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
> v3:
>  - make vhci_attr_group static, drop its extern from vhci.h (Greg)
>  - drop stray blank line in vhci_hcd_init()
>  - fix indentation in vhci_sysfs.c
>
> v2:
>  - use dev_groups instead of moving sysfs_create_group() into probe (Greg=
)
>  - add is_visible() to keep the attributes on vhci_hcd.0 only
>  - move vhci_init_attr_group() into vhci_hcd_init()
>
>  drivers/usb/usbip/vhci.h       |  2 +-
>  drivers/usb/usbip/vhci_hcd.c   | 36 ++++++++++------------------------
>  drivers/usb/usbip/vhci_sysfs.c | 21 +++++++++++++++++++-
>  3 files changed, 31 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/usb/usbip/vhci.h b/drivers/usb/usbip/vhci.h
> index 5659dce1526e..f3993238f91d 100644
> --- a/drivers/usb/usbip/vhci.h
> +++ b/drivers/usb/usbip/vhci.h
> @@ -120,7 +120,7 @@ struct vhci_hcd {
>
>  extern int vhci_num_controllers;
>  extern struct vhci *vhcis;
> -extern struct attribute_group vhci_attr_group;
> +extern const struct attribute_group *vhci_groups[];
>
>  /* vhci_hcd.c */
>  void rh_port_connect(struct vhci_device *vdev, enum usb_device_speed spe=
ed);
> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
> index 39e8faf4c18c..22b9bad7ca31 100644
> --- a/drivers/usb/usbip/vhci_hcd.c
> +++ b/drivers/usb/usbip/vhci_hcd.c
> @@ -1199,7 +1199,6 @@ static int vhci_start(struct usb_hcd *hcd)
>  {
>         struct vhci_hcd *vhci_hcd =3D hcd_to_vhci_hcd(hcd);
>         int id, rhport;
> -       int err;
>
>         usbip_dbg_vhci_hc("enter vhci_start\n");
>
> @@ -1230,40 +1229,17 @@ static int vhci_start(struct usb_hcd *hcd)
>                 return -EINVAL;
>         }
>
> -       /* vhci_hcd is now ready to be controlled through sysfs */
> -       if (id =3D=3D 0 && usb_hcd_is_primary_hcd(hcd)) {
> -               err =3D vhci_init_attr_group();
> -               if (err) {
> -                       dev_err(hcd_dev(hcd), "init attr group failed, er=
r =3D %d\n", err);
> -                       return err;
> -               }
> -               err =3D sysfs_create_group(&hcd_dev(hcd)->kobj, &vhci_att=
r_group);
> -               if (err) {
> -                       dev_err(hcd_dev(hcd), "create sysfs files failed,=
 err =3D %d\n", err);
> -                       vhci_finish_attr_group();
> -                       return err;
> -               }
> -               dev_info(hcd_dev(hcd), "created sysfs %s\n", hcd_name(hcd=
));
> -       }
> -
>         return 0;
>  }
>
>  static void vhci_stop(struct usb_hcd *hcd)
>  {
>         struct vhci_hcd *vhci_hcd =3D hcd_to_vhci_hcd(hcd);
> -       int id, rhport;
> +       int rhport;
>
>         usbip_dbg_vhci_hc("stop VHCI controller\n");
>
> -       /* 1. remove the userland interface of vhci_hcd */
> -       id =3D hcd_name_to_id(hcd_name(hcd));
> -       if (id =3D=3D 0 && usb_hcd_is_primary_hcd(hcd)) {
> -               sysfs_remove_group(&hcd_dev(hcd)->kobj, &vhci_attr_group)=
;
> -               vhci_finish_attr_group();
> -       }
> -
> -       /* 2. shutdown all the ports of vhci_hcd */
> +       /* shutdown all the ports of vhci_hcd */
>         for (rhport =3D 0; rhport < VHCI_HC_PORTS; rhport++) {
>                 struct vhci_device *vdev =3D &vhci_hcd->vdev[rhport];
>
> @@ -1513,6 +1489,7 @@ static struct platform_driver vhci_driver =3D {
>         .resume =3D vhci_hcd_resume,
>         .driver =3D {
>                 .name =3D driver_name,
> +               .dev_groups =3D vhci_groups,
>         },
>  };
>
> @@ -1541,6 +1518,10 @@ static int __init vhci_hcd_init(void)
>         if (vhcis =3D=3D NULL)
>                 return -ENOMEM;
>
> +       ret =3D vhci_init_attr_group();
> +       if (ret)
> +               goto err_init_attr_group;
> +
>         ret =3D platform_driver_register(&vhci_driver);
>         if (ret)
>                 goto err_driver_register;
> @@ -1568,6 +1549,8 @@ static int __init vhci_hcd_init(void)
>  err_add_hcd:
>         platform_driver_unregister(&vhci_driver);
>  err_driver_register:
> +       vhci_finish_attr_group();
> +err_init_attr_group:
>         kfree(vhcis);
>         return ret;
>  }
> @@ -1576,6 +1559,7 @@ static void __exit vhci_hcd_exit(void)
>  {
>         del_platform_devices();
>         platform_driver_unregister(&vhci_driver);
> +       vhci_finish_attr_group();
>         kfree(vhcis);
>  }
>
> diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysf=
s.c
> index a7ede6fb3da9..d87d9e449d72 100644
> --- a/drivers/usb/usbip/vhci_sysfs.c
> +++ b/drivers/usb/usbip/vhci_sysfs.c
> @@ -497,8 +497,27 @@ static void finish_status_attrs(void)
>         kfree(status_attrs);
>  }
>
> -struct attribute_group vhci_attr_group =3D {
> +static umode_t vhci_attr_is_visible(struct kobject *kobj,
> +                                   struct attribute *attr, int n)
> +{
> +       struct platform_device *pdev =3D to_platform_device(kobj_to_dev(k=
obj));
> +
> +       /*
> +        * The attributes control every controller and have always lived =
on
> +        * vhci_hcd.0 only.  Keep them there now that the driver core cre=
ates
> +        * the group for each device.
> +        */
> +       return pdev->id =3D=3D 0 ? attr->mode : 0;
> +}
> +
> +static struct attribute_group vhci_attr_group =3D {
>         .attrs =3D NULL,
> +       .is_visible =3D vhci_attr_is_visible,
> +};
> +
> +const struct attribute_group *vhci_groups[] =3D {
> +       &vhci_attr_group,
> +       NULL,
>  };
>
>  int vhci_init_attr_group(void)
> --
> 2.43.0
>

Hi Greg,

Please let me know the status of this patch

Thanks

Deepanshu
