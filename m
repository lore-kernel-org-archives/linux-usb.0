Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B553A6EE9
	for <linux-usb@vger.kernel.org>; Wed, 23 Sep 2026 03:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134370; cv=pass; b=WhoJeFWz5t168zYA/vZYpu9U0VAQZrj0LFzkORHgS5M+sVYSNPo+rQEkwh5FHyzg1Un+0QEj/q7LlYGJdVXjRVQ6Stk9vLN1JacH200wDHXTGFcY/G65AXtKibUggpS7YykZPlngBXJl8PpvU6w/6gtaqBfkdkayFpvElEmQfPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134370; c=relaxed/simple;
	bh=K1qPM9hjnXJfPu3SDCcdpkpSeBMlGT3kyoPhf0UKiAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rp4LQkVBSbcDApjgIoPumg4w6zIhdwS2icI2Du/snyNBJiNB9zk1vx9o59rGEMNVDzzR5VAKUczbcFFvL4B0CDMd6lORNnGcsVN7Yf4eyQ8xCSEScC6UsO4dVhfPVtZs18tYfg+XPngmuOo8mBtCp2jBiY/lm0tavqSBPP33Htc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayyR/xfw; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayyR/xfw"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab201f9so436044d50.0
        for <linux-usb@vger.kernel.org>; Tue, 22 Sep 2026 20:32:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790134360; cv=none;
        d=google.com; s=arc-20260327;
        b=k9DBuRIBfKRy4D7RvyEnEBNyq+Eb26w8JzNiPHSWAxxELkXgJKXaDf2AacKP+5TAPz
         dXB+vQCxT4F9wd4a7V8tHJVGLbxFyf+SLXIsLL2KSOtlyD3ol5iBGx72N8tK7D3TMPvc
         1m2g/6yKBPa+2DQuAYuKEhX+RuliGDZzsJehUnAauGRXCGtp659lrpXugwU4EJLL9+KT
         9vGYraTEz5v/tJOayTlxO40vahYMr2pW1OeaUIKGnGBi+EZUaqLUbSZsm+maL9hqKLmT
         Z0hGrVHoBfaJKPCSf0lnyKGv/qp+PdlaLilVP12eI6osOmAb6JK3oDIZjq8KroVHFncF
         T5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        fh=RcW5TsJ6Q7jj/KQR/b12ccMZTWVYiJSLalvRLU9QWso=;
        b=d5bll6sn64b+8d7uRAgO+3PIpU5y5l4djzsta8chGutf//l3Va1dAq8yLov2b6xxI2
         65WI45j7k9dJDINAC80yAJI5TzIh55NJJ5mEpQFYuED/beH6wF7FSa/+Nfb7sVKB4COd
         k5AJegF6BW+2JzFMEwJi3I0tP/rMMWyhoNNSemkK5Y4iM9EQtG9r9xYt58UTPUbitaNY
         GimiM5EiAIMN07Uv/nThWkIRDY7PgSvXG/eQ9v8lnPGQK78cSsxEvhObOySKjslQIDND
         y8boUReguho/nk0mLY8qBsA0AGMyFb+2JhDytqPCYZqBuMWE/AJGbWIvD6CaM4bOPaZz
         zT5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790134360; x=1790739160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        b=ayyR/xfwfTkXREDEgdkBV66tDxqUAHyfxw+Lr8vc9w2vUxSqxkZTd/ZgPqbhHpu1w2
         QwwpJNhvy/gKKO3lGyqZJN2W4BBqOXP+i7iu88+5/PpWiopNhqZhxXrRoxzjYqwzAip2
         2+00Y7sIFCbRjxDW1XltU6+HIEkFK1+URjT/qUsy6sIHq1N3E8qWox6HkMouHs4xqfwk
         GBlfEbjPMp1quA7ACDeWUUZ6NY6e++fOxmtmrh+HowzNGfzmZX/2f/1BjQFjhVxTP+Fa
         bwS4XnaJZEh2VS6/vJVvmN4wBKHfPQBq+WYlCG1Itff3RSQvYQBoH9QadVARWAiLHpq7
         ZaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134360; x=1790739160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IADwZsna+z2G3DbifRLwGvdi1yVjeTXiluD0rHvc+iI=;
        b=k8omT+NdvL6+nqYRVzXxDlkrHcbSR0pz43WfvyTuM/D3W1HJ66eFAE1aKYOY04un9j
         K+7dqMmgNHwv7Oslj6XcvGve0CzVsMrtU2XzrRDj4/GD8FHV5Ch9Ckm45IFOoUxKUE1z
         wNwvo63kxWwol/9BcyQ3Y4BTMgcgy7x2XidOlTMGlKQnSJlkvDG/3A75gEoLKuZWcqHj
         oj+DaztxGxtv1AZdlL6I97td9jloaM06vizqlCJJ0QYffm5QX3cxK/HU4g3fEJGZxGi6
         E/NHV144sHM4GqqN3tO0uTuw5j1dR00CzCKAFC8O3lqiQKcFvcZ7zuiOa/0kaIYzmQ1h
         raTA==
X-Forwarded-Encrypted: i=1; AKwUvBwIxDd/Gb4jSNKk3NczhUYDICBgy6d53c7YSwo9sgZzA5z/dAKiFt0X3ziQfkho9hltYV9Y6zyjC0M=@vger.kernel.org
X-Gm-Message-State: AFuF++m3guRtcbzMKRgHIgyG/NZiEmo42y8BxAKK2q6k7cEe3AMM+Wlb
	iqzG9IygJTQGL1neZH9ew9hZSfwqVJa+p0GLa4o0M9zwC76VtwMPqOlRO4iu9yGhM3oe7owL8lz
	TG16+3cPu8giRXW4dgZld+WiQZQrid7M=
X-Gm-Gg: AYBFou2WYUk7wv1N0B1N3ja0Z3L9Pr79YeyOYmabCQRZ/B1EXFz+6gUMMdLx5E1jp8K
	8w6q2Dl3KEfn0lAK+Dp1tntjmkHmO4+6FBRpy8uF7X1nTDIKHEUuxcBlrTjX1praEAx103lUfsG
	lkpeQ/WJUmppX2nUjMsnZs9RXqeqQOQ1+1KduTb35uYVrPZWJ/RBuSpFZdicyJq/pQs+r8bgG+p
	B2zcMur6FepbtYUQWW+DxQTI+zg4U2TlGD5YaNVtTnJ1rDz76LAwDWLjeMVInh9JTWA/b4h0L14
	fPJjun/+YM1hpc4k0fQ9iGcNWilQlBjIScMczMrhgMrIPr6Lti3sO18hOkOAUZt7aBMJJEE0bqY
	7oC/LyhScejuoFkfnJMdNzVUjA63mHmBglnwP/qW1QmA0cooUep53WQ==
X-Received: by 2002:a05:690e:d46:b0:672:a314:f3b with SMTP id
 956f58d0204a3-672d599edb6mr531510d50.155.1790134359954; Tue, 22 Sep 2026
 20:32:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903121938.7661-1-kartikey406@gmail.com>
In-Reply-To: <20260903121938.7661-1-kartikey406@gmail.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Wed, 23 Sep 2026 09:02:28 +0530
X-Gm-Features: AcwNN1XLcCRqZ3dwAEcyeNO_SAQFBracNGZPqDQTPW2eXSCPoixNM1HuSvjNQAY
Message-ID: <CADhLXY4MpFNrutY7D=BD96yTOeT2TjUPzgT3v8q8yXhwvNWtFg@mail.gmail.com>
Subject: Re: [PATCH v4] usbip: vhci_hcd: let the driver core manage the sysfs attributes
To: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me, 
	gregkh@linuxfoundation.org
Cc: yuyang.du@intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:49=E2=80=AFPM Deepanshu Kartikey <kartikey406@gmai=
l.com> wrote:
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
> Link: https://lore.kernel.org/all/20260816061034.17769-1-kartikey406@gmai=
l.com/T/ [v3]
> Assisted-by: Claude (Anthropic)
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>
> v4:
>  - add Assisted-by: tag (Greg)
>
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

Gentle Reminder. Please let me know the status of this patch.

Thanks

Deepanshu
