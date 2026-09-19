Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4217B50F
	for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789845069; cv=pass; b=sIMzQY4qx3l4Q4I5RDp7eDMY/Ufuj5XZpRps1aBtWHgG4GfpNqeqt1Nm6S6dD+OuDVWPifV3qxsaOi60zzOE6lqYNAn4cmYF4JoaKvJJoKZvsN1i9g6Vv2fijLguzjaeQN6ZzbQRK4p7sbZuK6K2BNU8bL0hsBZot1jc9Wz31zk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789845069; c=relaxed/simple;
	bh=v4xQIeOd5BKT9J38i/WMv3K57/9eNbzDLCno8SBPAO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+2ivCOV4IysZkR6/263YyZljGHM1pWxuBGNiCsUnDe283VUznCc2eYwt1eJ24AAqKVGaEcGb1dps8ps/gdOlcw/5qyzcjKsw/f2azOCPa4yXCDs/r5MQLCyy4eJTBVYU0+ngp+UnHjprJynNu16eLKXk8te73ZNbaQVOjADe4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfLrc8Jf; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfLrc8Jf"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a64c7cdb46so2713698a12.3
        for <linux-usb@vger.kernel.org>; Sat, 19 Sep 2026 12:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789845066; cv=none;
        d=google.com; s=arc-20260327;
        b=SoemG0WgEy3GdEp8z1xrzf4Dj0mTtruEdFR3wU1BzBXl7lBwi4KVyBsc2QZ4RSl329
         305dS1RYbqq0nxQboNzPKLVIwAqlis/URepXqpf2DYOXoa7eE7tG64SHU2SOlL8aAVHm
         bXPqr5iAQyMhxXgFJowseH81xMQmGpyoyyltw7Q5fRWEcSDHnY33rXHbTKFWEo451w1G
         ouJ4VA+pfXil7dYXiLakdyh90Idh4c2LKO0fqOAjSFph4tOtHLoFeXjduxvZjUMgSQm3
         zBX1r3CvPgnnwTS3ZAUfxPuO5Q8h1HmeejlM0ulnecdCjyIN4Zk6LhWk6tbqof7iMVkb
         xsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        fh=upCJMNgh2ndPsm0Fx7P4TYxzZ1lEXavDreVOJ/HIljQ=;
        b=CPiBjFy9bJZsAEsw1mj5IybPnOWF73Y7hnSgMbSMqW45aaorH3KjoxtYOAu1kBvbt/
         FuJJ2r4v6BRnDctm/2BjjOJwdqeUHnwBkJAN5HlD9ovumCFzy2+w8xEmlE2g6HA8qywh
         rketX6faZPPkPFWwwCZmJmuFmawb7aSvwi9HfOoTZTekjcSDi10p1zUmTkyf4+ab3lJL
         YUL5eNRe2zl6n3/dkhea3ujj0l0HO5oxqlvjg6kYOj0Q9pQXivcvmONYH84KrqS/eeYS
         GWVmc3u05LKgSIMS0f9SgnSyZ/pgdGK0O6ZLpNl5KwqWjXsvkO0us+LMQciwyB4e4ljF
         Q4CQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789845066; x=1790449866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        b=mfLrc8Jfx98OudiL0ETS7JI5VmUwVzv6oZ4y8J+i2pvl+MZCf+4TCmxQ8NQhCTGSIn
         5f4zAm2+JL8AaUMSvjHCiaWPz7kUCrgzGeOFh7DTdAXFKlZhA+kECFnfR1y1cOMhCura
         XAgPB9j8HJVAgq0S3QbfT6ywZwREzokWcQzjVOLxThm1fZEBFcsICeCxo9GGGy1ymner
         /n5E3bBcal1dp8Qd6tJLTcBNQtDeGiHFkVzWnRy5SA9So/srfOQWeJg8WENzbmmt6e2q
         v8VbH3hNZDG9OhGL5MiNAxv4KnlikliV+9+2V4f8xIJH8Xe4S2Su4Mdf7fq8GwdzOnBO
         9WMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789845066; x=1790449866;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5LLCEhWQzt+Jsb6k9Ld83aaf5FvLTdmT7qnYRMWkDfM=;
        b=bhUsQ1uIw7odL6nRQPg228MTOLrrk/ef+OVuysZVvasbh97mkJoSnZmLOBQfZ77Dd9
         llNS8hj4Ve9z2zZBAp6XeaD5hUfcMRFmMA3qD57LBfFb4zXR0CV3hLMa9g/EF8Ky0LL+
         v9RcAn2XjvxVp2G6m4fGDxfA9ui52PGXH+is2UTPLzixL5nILg7NtvqVQeQQCyb5AzMM
         5xZvchdGfWnM8zHQF6YKRHiC63SknZZlEjr95HUmZa7O276GUcrqPmzogKRuvo3hQv18
         asKWtvZEI5NNwCVCIbLd/nT/LVfnntOAyCVcsZUMmSQQHhpKwPCQpu5EB4hLWbRDUFEB
         8Mvw==
X-Forwarded-Encrypted: i=1; AKwUvBwx8FswiiTJ9W0ADrwTl1QCrY1eqc2s8h5VDwCnN1Eq0vsqjiOBIslD5ok9QibqSfpgKRZsrugzdSM=@vger.kernel.org
X-Gm-Message-State: AFuF++meF/XvyxB7iOVjr9HOy5iw1I0+ELFIHgc6inSK2YeDV9iq1C7b
	V6RZGd+x2fyx6BHTGZ6RQQfXz2oviIO5oGEQB8eVS0eXZFLhzRin1TURjB4+4xuSHzknz6GhKfZ
	v3btCfP/ptQqwnunJokakyN+XrX8d338=
X-Gm-Gg: AYBFou3VZofqHdo8bx9QMdK8AcNqDF2sTbQJ8Nf/V4OEUz+oMe/ydFNeN+AUhIPWSca
	Jk9ocQ/JI1lrsY0rlfDgPwi+e+cPdT2bvpUGmOV368Fy01epKCp70fsa6YJ6unGOk0mfoPLlgp8
	Zwo/zdmRvNrTao9aLSgxwl4lj10BKK8wmMbP+jLHqPVd6XnhNPI55PS1X0DtPpvjQhtYJrE6Xcn
	0AVIajmVcrENH24T8ot52rjmLQfTDK3mnUrMsCvF5rTBmjG+g+Q5YDjvc4tdqpLhf51pBolt35B
	8N6T7QXMOt4YW0rsh+hzd5GrIipWPw5YaiONoLd2+J9ihhSLNPYQycH9umZIUUyxkf09Q/aR
X-Received: by 2002:a05:6402:3819:b0:6a9:b203:f410 with SMTP id
 4fb4d7f45d1cf-6aa5686e2a6mr4942408a12.21.1789845066121; Sat, 19 Sep 2026
 12:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907074308.109603-1-ayush37735@gmail.com> <CAPgWTUSK8B5hk1+TXEkxhxX2WH8p67gE9-z2MLGc-xqdWzKnHQ@mail.gmail.com>
In-Reply-To: <CAPgWTUSK8B5hk1+TXEkxhxX2WH8p67gE9-z2MLGc-xqdWzKnHQ@mail.gmail.com>
From: Ayush Yaduvanshi <ayush37735@gmail.com>
Date: Sun, 20 Sep 2026 00:40:29 +0530
X-Gm-Features: AcwNN1WSH6gP9mfLlIpVpWYhi0RDSUyRuAlpJmo0mGf6EOYqlbeRzhfuSndIlEg
Message-ID: <CAPgWTUSjN6DJzJDWVGt34XmTc4S01PWNo_8Nd6QoV2=-PRVHvg@mail.gmail.com>
Subject: Re: [PATCH v2] USB: sisusbvga: avoid prolonged initialization on failure
To: michal.pecio@gmail.com
Cc: thomas@winischhofer.net, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Just a quick follow-up on v2.

Syzbot tested the exact v2 patch with the reported reproducer and reported =
that
the reproducer did not trigger the reported hang.

Please let me know if any further changes or testing are needed.

Thanks,
Ayush Yaduvanshi

On Sun, Sep 20, 2026 at 12:00=E2=80=AFAM Ayush Yaduvanshi <ayush37735@gmail=
.com> wrote:
>
> Hi Michal,
>
> Just a quick follow-up on v2.
>
> Syzbot tested the exact v2 patch with the reported reproducer and reporte=
d that
> the reproducer did not trigger the reported hang.
>
> Please let me know if any further changes or testing are needed.
>
> Thanks,
> Ayush Yaduvanshi
>
> On Mon, Sep 7, 2026 at 1:13=E2=80=AFPM Ayush Yaduvanshi <ayush37735@gmail=
.com> wrote:
>>
>> The USB core holds minor_rwsem while invoking a USB character
>> device's open callback. Avoid retrying graphics-device initialization
>> from open() and fail probe when early initialization fails.
>>
>> Also stop sisusb_do_init_gfxdevice() after the first failed request.
>> Continuing initialization after a failed USB request causes additional
>> synchronous transfers and their retries against an unresponsive device.
>>
>> v2:
>> Stop sisusb_do_init_gfxdevice() after the first failed USB request and
>> treat early initialization failure in probe() as a probe failure.
>> Remove the initialization retry from sisusb_open().
>>
>> The exact v2 patch was tested by syzbot using the reported reproducer,
>> and the reproducer did not trigger the reported hang.
>>
>> Reported-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=3D3bc656a9271e7c8a5c6b
>> Tested-by: syzbot+3bc656a9271e7c8a5c6b@syzkaller.appspotmail.com
>> Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
>> ---
>> Thanks for the review.
>>
>> v2:
>> - Stop sisusb_do_init_gfxdevice() after the first failed USB request
>>   instead of continuing with further synchronous requests and their
>>   timeout/retry cost on an unresponsive device.
>> - Treat failure of the early graphics-device initialization in probe()
>>   as a probe failure, so a device which failed initialization is not
>>   left for a later initialization attempt from open().
>> - Remove the graphics-device initialization retry from sisusb_open().
>> - The exact v2 patch was tested by syzbot using the reported reproducer;
>>   syzbot reports that the reproducer did not trigger the reported hang.
>>
>>  drivers/usb/misc/sisusbvga/sisusbvga.c | 133 +++++++++++++++++--------
>>  1 file changed, 89 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/usb/misc/sisusbvga/sisusbvga.c b/drivers/usb/misc/s=
isusbvga/sisusbvga.c
>> index 3e75a7c24828..e0b1111c1f53 100644
>> --- a/drivers/usb/misc/sisusbvga/sisusbvga.c
>> +++ b/drivers/usb/misc/sisusbvga/sisusbvga.c
>> @@ -2075,66 +2075,114 @@ static int sisusb_do_init_gfxdevice(struct sisu=
sb_usb_data *sisusb)
>>         packet.address =3D 0x00000324;
>>         packet.data    =3D 0x00000004;
>>         ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000364;
>>         packet.data    =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000384;
>>         packet.data    =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x001f;
>>         packet.address =3D 0x00000100;
>>         packet.data    =3D 0x00000700;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         packet.header  =3D 0x000f;
>>         packet.address =3D 0x00000004;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 6, &packet, 0);
>> +       if (ret)
>> +               return ret;
>> +
>>         packet.data |=3D 0x17;
>> -       ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       ret =3D sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 0 (VRAM) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x10, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x10, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_MEMBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x10, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x10, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 1 (MMIO) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x14, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x14, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_MMIOBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x14, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x14, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Init BAR 2 (i/o ports) */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x18, 0xfffffff0);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x18, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 &=3D 0x0f;
>>         tmp32 |=3D SISUSB_PCI_IOPORTBASE;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x18, tmp32);
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x18, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>>         /* Enable memory and i/o access */
>> -       ret |=3D sisusb_read_pci_config(sisusb, 0x04, &tmp32);
>> +       ret =3D sisusb_read_pci_config(sisusb, 0x04, &tmp32);
>> +       if (ret)
>> +               return ret;
>> +
>>         tmp32 |=3D 0x3;
>> -       ret |=3D sisusb_write_pci_config(sisusb, 0x04, tmp32);
>> -
>> -       if (ret =3D=3D 0) {
>> -               /* Some further magic */
>> -               packet.header  =3D 0x001f;
>> -               packet.address =3D 0x00000050;
>> -               packet.data    =3D 0x000000ff;
>> -               ret |=3D sisusb_send_bridge_packet(sisusb, 10, &packet, =
0);
>> -       }
>> +       ret =3D sisusb_write_pci_config(sisusb, 0x04, tmp32);
>> +       if (ret)
>> +               return ret;
>>
>> -       return ret;
>> +       /* Some further magic */
>> +       packet.header  =3D 0x001f;
>> +       packet.address =3D 0x00000050;
>> +       packet.data    =3D 0x000000ff;
>> +
>> +       return sisusb_send_bridge_packet(sisusb, 10, &packet, 0);
>>  }
>>
>>  /* Initialize the graphics device (return 0 on success)
>> @@ -2223,20 +2271,10 @@ static int sisusb_open(struct inode *inode, stru=
ct file *file)
>>         }
>>
>>         if (!sisusb->devinit) {
>> -               if (sisusb->sisusb_dev->speed =3D=3D USB_SPEED_HIGH ||
>> -                               sisusb->sisusb_dev->speed >=3D USB_SPEED=
_SUPER) {
>> -                       if (sisusb_init_gfxdevice(sisusb, 0)) {
>> -                               mutex_unlock(&sisusb->lock);
>> -                               dev_err(&sisusb->sisusb_dev->dev,
>> -                                               "Failed to initialize de=
vice\n");
>> -                               return -EIO;
>> -                       }
>> -               } else {
>> -                       mutex_unlock(&sisusb->lock);
>> -                       dev_err(&sisusb->sisusb_dev->dev,
>> -                                       "Device not attached to USB 2.0 =
hub\n");
>> -                       return -EIO;
>> -               }
>> +               mutex_unlock(&sisusb->lock);
>> +               dev_err(&sisusb->sisusb_dev->dev,
>> +                       "Device not initialized\n");
>> +               return -EIO;
>>         }
>>
>>         /* Increment usage count for our sisusb */
>> @@ -2880,9 +2918,16 @@ static int sisusb_probe(struct usb_interface *int=
f,
>>
>>         if (dev->speed =3D=3D USB_SPEED_HIGH || dev->speed >=3D USB_SPEE=
D_SUPER) {
>>                 int initscreen =3D 1;
>> -               if (sisusb_init_gfxdevice(sisusb, initscreen))
>> +
>> +               if (sisusb_init_gfxdevice(sisusb, initscreen)) {
>>                         dev_err(&sisusb->sisusb_dev->dev,
>> -                                       "Failed to early initialize devi=
ce\n");
>> +                               "Failed to early initialize device\n");
>> +                       sisusb->present =3D 0;
>> +                       usb_set_intfdata(intf, NULL);
>> +                       usb_put_dev(sisusb->sisusb_dev);
>> +                       retval =3D -EIO;
>> +                       goto error_4;
>> +               }
>>
>>         } else
>>                 dev_info(&sisusb->sisusb_dev->dev,
>> --
>> 2.53.0
>>
